Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694896F6826
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:16:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puV3c-0004rM-Hx; Thu, 04 May 2023 05:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1puV3Z-0004qW-1m; Thu, 04 May 2023 05:15:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1puV3X-0005hr-5d; Thu, 04 May 2023 05:15:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 69C14400F1;
 Thu,  4 May 2023 12:15:03 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D4EDF6D;
 Thu,  4 May 2023 12:15:02 +0300 (MSK)
Message-ID: <f46e0be2-51e3-09c3-5363-01059f5a2905@msgid.tls.msk.ru>
Date: Thu, 4 May 2023 12:15:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] meson: leave unnecessary modules out of the build
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20230504082130.210909-1-pbonzini@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230504082130.210909-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -111
X-Spam_score: -11.2
X-Spam_bar: -----------
X-Spam_report: (-11.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

04.05.2023 11:21, Paolo Bonzini wrote:
> meson.build files choose whether to build modules based on foo.found()
> expressions.  If a feature is enabled (e.g. --enable-gtk), these expressions
> are true even if the code is not used by any emulator, and this results
> in an unexpected difference between modular and non-modular builds.
> 
> For non-modular builds, the files are not included in any binary, and
> therefore the source files are never processed.  For modular builds,
> however, all .so files are unconditionally built by default, and therefore
> a normal "make" tries to build them.  However, the corresponding trace-*.h
> files are absent due to this conditional:
> 
> if have_system
>    trace_events_subdirs += [
>      ...
>      'ui',
>      ...
>    ]
> endif
> 
> which was added to avoid wasting time running tracetool on unused trace-events
> files.  This causes a compilation failure; fix it by skipping module builds
> entirely if (depending on the module directory) have_block or have_system
> are false.
> 
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   meson.build | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index c44d05a13f95..c7e486e0879a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3213,6 +3213,10 @@ modinfo_files = []
>   block_mods = []
>   softmmu_mods = []
>   foreach d, list : modules
> +  if not (d == 'block' ? have_block : have_system)
> +    continue
> +  endif
> +
>     foreach m, module_ss : list
>       if enable_modules and targetos != 'windows'
>         module_ss = module_ss.apply(config_all, strict: false)

Tested-by: Michael Tokarev <mjt@tls.msk.ru>

Thank you for the fix Paolo! Yes that looks like it was the case here.

/mjt

