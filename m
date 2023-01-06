Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D4A660A72
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:57:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDwYu-0006LQ-58; Fri, 06 Jan 2023 18:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDwYp-0006LF-7O
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:55:43 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDwYm-0001Tn-SP
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:55:42 -0500
Received: by mail-pl1-x62f.google.com with SMTP id y1so3374736plb.2
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vQntkw4D7KQIAA/jl5SWgtaTmLy9BYpdzAP9zpGYxlc=;
 b=yqeRg40bktrLIyYTSUyfbJb3ryXqpYZmkvPYnXWMR0qqRQ0rTiU8O3ujk5MUqVI5sc
 T3t9j104nBYlWOtOZ3XsFA57SIVr2jN8REztJsi6MKJVfP9Os7wTCl9wKckncXXfErdq
 TgqE79RKInOU3LJFnG5EjguEbgrNt9CjuQ3AhtNX+YoYhvbhgvHkrMdsa4NOe777syw3
 uQuDQw3tF/4uZBU4EUkDk+mKuhlADBJ323vc1oKW+i/B4UjAeYHVkhMSBovMXKRiuniI
 HPmc4fOd8ssRa1rbFqnuiMdSuFqzN/W8yhCBeaowiAwB2SnFEzAfS3KL8v5schdnVgkW
 jG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vQntkw4D7KQIAA/jl5SWgtaTmLy9BYpdzAP9zpGYxlc=;
 b=iB2iuBpA8gRAG4z0/p4wvFd6sesedkHEDNvGS70pvoIicraO2FjAlRqrZf2Woz/5tD
 ycdDv4oVOj4OCqtSgH2AD7a1puKI79p6K6keLG1WKaQi90yd7rbm5tNY+sLGf8UAxpm/
 lGm0RAGIC9T4DM4mRVofV+AmO7DXCzigqHtQY1N7pqozeIUKsUDNzZhkj6+Ie7l0Er2X
 iF666g8jIrQsUwZUZJCXkambegHq6RU1JCXbJk0pJKoIAep+W3m9NBMnaFHqZWcO2Xq5
 O6x0H4G4OqbZQBzoUwzTatUevmFIK87/ggTaERNqAOnRW5FDC/qD7HtLjQSJ9ra6PRqk
 lZTg==
X-Gm-Message-State: AFqh2krSOtOGO3gqLDH7jEpgX5JRGoTBNmHUFy8tNHekv3B2AsG131Gu
 QzPaF75egu5ZvCjm+emVSBM8Kg==
X-Google-Smtp-Source: AMrXdXsYP/qHEO4ncFmLRjgx3gzZkCMRQwRCPnEZO9AbJZGGO9EZiyRalo+aF5R9GJIQZPmlBI0rfQ==
X-Received: by 2002:a17:902:8f92:b0:18f:a27c:fe with SMTP id
 z18-20020a1709028f9200b0018fa27c00femr61085953plo.55.1673049339428; 
 Fri, 06 Jan 2023 15:55:39 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b0019262dfa3ecsm1488018plw.112.2023.01.06.15.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:55:38 -0800 (PST)
Message-ID: <8a2f66c4-72d9-42cc-af65-0272c8829835@linaro.org>
Date: Fri, 6 Jan 2023 15:55:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 21/21] gdbstub: only compile gdbstub twice for whole
 build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/5/23 08:43, Alex Bennée wrote:
> Now we have removed any target specific bits from the core gdbstub
> code we only need to build it twice. We have to jump a few meson hoops
> to manually define the CONFIG_USER_ONLY symbol but it seems to work.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c     |  3 +--
>   gdbstub/user-target.c |  2 +-
>   gdbstub/meson.build   | 32 ++++++++++++++++++++++++++++----
>   3 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 57bbda3505..0dbb9f5338 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -39,7 +39,6 @@
>   
>   #include "sysemu/hw_accel.h"
>   #include "sysemu/runstate.h"
> -#include "exec/exec-all.h"
>   #include "exec/tb-flush.h"
>   #include "exec/hwaddr.h"
>   #include "sysemu/replay.h"
> @@ -1611,7 +1610,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
>           .cmd_startswith = 1,
>           .schema = "s:l,l0"
>       },
> -#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
> +#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
>       {
>           .handler = gdb_handle_query_xfer_auxv,
>           .cmd = "Xfer:auxv:read::",
> diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
> index 83e04e1c23..46f5729999 100644
> --- a/gdbstub/user-target.c
> +++ b/gdbstub/user-target.c
> @@ -235,7 +235,7 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
>   }
>   
>   
> -#if defined(CONFIG_LINUX_USER)
> +#if defined(CONFIG_LINUX)
>   void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx)
>   {
>       TaskState *ts;
> diff --git a/gdbstub/meson.build b/gdbstub/meson.build
> index 56c40c25ef..193c20203d 100644
> --- a/gdbstub/meson.build
> +++ b/gdbstub/meson.build
> @@ -4,13 +4,37 @@
>   # types such as hwaddr.
>   #
>   
> -specific_ss.add(files('gdbstub.c'))
> +# We need to build the core gdb code via a library to be able to tweak
> +# cflags so:
>   
> -# These have to built to the target ABI
> -specific_ss.add(files('syscalls.c'))
> +gdb_user_ss = ss.source_set()
> +gdb_softmmu_ss = ss.source_set()
>   
> -softmmu_ss.add(files('softmmu.c'))
> +# We build two versions of gdbstub, one for each mode
> +gdb_user_ss.add(files('gdbstub.c'))
> +gdb_softmmu_ss.add(files('gdbstub.c'))
> +
> +gdb_user_ss = gdb_user_ss.apply(config_host, strict: false)
> +gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
> +
> +libgdb_user = static_library('gdb_user', gdb_user_ss.sources(),
> +                             name_suffix: 'fa',
> +                             c_args: '-DCONFIG_USER_ONLY')
> +
> +libgdb_softmmu = static_library('gdb_softmmu', gdb_softmmu_ss.sources(),
> +                                name_suffix: 'fa')
> +
> +gdb_user = declare_dependency(link_whole: libgdb_user)
> +user_ss.add(gdb_user)
> +gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
> +softmmu_ss.add(gdb_softmmu)
> +
> +# The rest of the mode specific code can be added directly
>   user_ss.add(files('user.c'))
> +softmmu_ss.add(files('softmmu.c'))
> +
> +# These have to built to the target ABI
> +specific_ss.add(files('syscalls.c'))

It seems weird to put one file into a library and other files directly into the 
user/softmmu source sets.  Why not just put everything except user-target.c into the 
corresponding libraries?

>  # and BSD?
>  specific_ss.add(when: 'CONFIG_LINUX_USER', if_true: files('user-target.c'))

Definitely "and BSD".  I can't see how this will link at all, missing e.g. 
gdb_handle_query_offsets.


r~

