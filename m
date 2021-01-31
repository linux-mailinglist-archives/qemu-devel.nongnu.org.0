Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A4E309CA4
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:20:56 +0100 (CET)
Received: from localhost ([::1]:35086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Dax-0002J5-32
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l6DYN-0000yJ-UY; Sun, 31 Jan 2021 09:18:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:54196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l6DYM-0007aE-By; Sun, 31 Jan 2021 09:18:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0275ABDA;
 Sun, 31 Jan 2021 14:18:10 +0000 (UTC)
Subject: Re: [PATCH v6 01/11] sysemu/tcg: Introduce tcg_builtin() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-2-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <87d562ba-20e5-ee50-8793-59d77564f4da@suse.de>
Date: Sun, 31 Jan 2021 15:18:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.079,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
> Modules are registered early with type_register_static().
> 
> We would like to call tcg_enabled() when registering QOM types,


Hi Philippe,

could this not be controlled by meson at this stage?
On X86, I register the tcg-specific types in tcg/* in modules that are only built for TCG.

Maybe tcg_builtin() is useful anyway, thinking long term at loadable modules,
but there we are interested in whether tcg code is available or not, regardless of whether it's builtin,
or needs to be loaded via a .so plugin..

maybe tcg_available()?

Ciao,

Claudio

> but tcg_enabled() returns tcg_allowed which is a runtime property
> initialized later (See commit 2f181fbd5a9 which introduced the
> MachineInitPhase in "hw/qdev-core.h" representing the different
> phases of machine initialization and commit 0427b6257e2 which
> document the initialization order).
> 
> As we are only interested if the TCG accelerator is builtin,
> regardless of being enabled, introduce the tcg_builtin() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>  include/sysemu/tcg.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index 00349fb18a7..6ac5c2ca89d 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -13,8 +13,10 @@ void tcg_exec_init(unsigned long tb_size, int splitwx);
>  #ifdef CONFIG_TCG
>  extern bool tcg_allowed;
>  #define tcg_enabled() (tcg_allowed)
> +#define tcg_builtin() 1
>  #else
>  #define tcg_enabled() 0
> +#define tcg_builtin() 0
>  #endif
>  
>  #endif
> 


