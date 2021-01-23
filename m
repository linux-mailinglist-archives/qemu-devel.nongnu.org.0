Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59284301523
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 13:20:39 +0100 (CET)
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Hu9-0002Sl-Ta
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 07:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l3Ht4-00023l-8P
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 07:19:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:57678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l3Ht2-0004lQ-MP
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 07:19:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0830AD17;
 Sat, 23 Jan 2021 12:19:25 +0000 (UTC)
Subject: Re: [PATCH v2 02/12] tests/meson: Only build softfloat objects if TCG
 is selected
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-3-philmd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b72566a6-0302-95c8-d470-7fc113122c79@suse.de>
Date: Sat, 23 Jan 2021 13:19:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210122204441.2145197-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 9:44 PM, Philippe Mathieu-Daudé wrote:
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Emilio G. Cota <cota@braap.org>
> ---
>  tests/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 29ebaba48d2..6f1ff926d26 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -276,7 +276,9 @@
>       workdir: meson.current_source_dir() / 'decode',
>       suite: 'decodetree')
>  
> -subdir('fp')
> +if 'CONFIG_TCG' in config_all
> +  subdir('fp')
> +endif
>  
>  if not get_option('tcg').disabled()
>    if 'CONFIG_PLUGIN' in config_host
> 

Hi Philippe,

just looking at the context of this hunk,
is there a reason why we have different ways to say "tcg disabled",

ie CONFIG_TCG
and "get_option('tcg').disabled()"?

otherwise appears ok,
I am just thinking about what the next steps should be,
ie how to encompass everything tcg-related in a loadable module,

but it's still too early I guess to worry about that.

Thanks,

Claudio

