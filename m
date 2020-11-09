Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B032AB421
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 10:57:46 +0100 (CET)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc3vl-0006GP-8U
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 04:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kc3tv-000543-Ij
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 04:55:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:56766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kc3tt-0006dG-9l
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 04:55:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4D67ABCC;
 Mon,  9 Nov 2020 09:55:45 +0000 (UTC)
Subject: Re: [PATCH 1/3] accel: Only include TCG stubs in user-mode only builds
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201109094547.2456385-1-f4bug@amsat.org>
 <20201109094547.2456385-2-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e9837717-b010-077e-2d68-0f03300793c4@suse.de>
Date: Mon, 9 Nov 2020 10:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109094547.2456385-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 21:17:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 10:45 AM, Philippe Mathieu-Daudé wrote:
> We only require TCG stubs in user-mode emulation.
> Do not build stubs restricted to system-mode emulation
> in a user-mode only build.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  accel/meson.build | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/meson.build b/accel/meson.build
> index b26cca227a4..609772f129b 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -1,10 +1,12 @@
>  softmmu_ss.add(files('accel.c'))
>  
> -subdir('qtest')
> -subdir('kvm')
>  subdir('tcg')
> -subdir('xen')
> -subdir('stubs')
> +if have_system
> +  subdir('qtest')
> +  subdir('kvm')
> +  subdir('xen')
> +  subdir('stubs')
> +endif
>  
>  dummy_ss = ss.source_set()
>  dummy_ss.add(files(
> 

Ciao Philippe,

I thought that the pattern used by Paolo was, recurse always, and put the check inside the recursed dir meson.build .
Paolo did you indeed intend meson use this way?

Ciao,

Claudio

