Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95586A13FE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLNA-0000Ly-LG; Thu, 23 Feb 2023 18:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLN4-0000LV-U1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:51:30 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLMz-0003HA-4h
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:51:30 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c1so15188155plg.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T2oSEWJ0nJNFG1blOlbq86nmA1HdKPAD0LPZLaz84U0=;
 b=aE1QTRKlVCAZ88f86tcasz8Sq29W4kazoALrPcEhW8SVha6Lcu1EdrM3lXrXEj+N6l
 ZLyPyuHdeSP9BqwUwMcjAYHDMGHcwBFw4wVQ18fQkRy0Bhyr7daN9SuRIDH3BVwcJiL5
 1+fvnTLAx11rRt/XYchP9qPdFDNKhOtSsIUU66r2N00W5whOCrxkU51TplnOgZ/EjX7D
 69iCIYT35BQZU+Ieka+oqfE1AEAyMu1xkrKGvBOEhYqElzZ+vaDqMt7tN/gFc+bYk/ea
 5NohDdz1zy1fZJ8X1ntSUD7SsezQrhz7ENxJEWVBzyxAX3m6TDWGGok0hcj4RPZBhn3b
 ZGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T2oSEWJ0nJNFG1blOlbq86nmA1HdKPAD0LPZLaz84U0=;
 b=k9exkBHoA4NlkGYCKEifVgoEgmpK36IaBVQHWe13CGSLOGdpktPu9FZtaMxWwnASGI
 +Jl7VmpZlUb+SLu94/8Xmqn6CyKE2KpTqZownENDXxrI6VBDMKrbwLJBk/J7zWQONhzg
 cqZ2FtnQpVkEc+CK4SzqdadONeqbymTBxpPnXL2KNg6pq6VsWK7iH41TpABL/bg3gUZJ
 aPwipIprLkKsbWr0g4ulo4FlA0+tEB1GDan1/xs8ApfaOXztbvzhYMe1QidlnTAu2NQZ
 7lvJgcv8uJa7xNdBioent2iLuenXr2N0HAFx0CzRM2QF2GyauKfp/fEEw13OBLDtacXw
 /viw==
X-Gm-Message-State: AO0yUKUF1e6M0ktyKgfZ+7b48FmHSkixULndT3GQYzFCfQ7dzUMflKQk
 sBxakkGwVUsZyhNVNbgxfyyF/A==
X-Google-Smtp-Source: AK7set/0jgX3KG/Lb0HjEKGgR5xJ5dr72JosA5OMABDIxqDxY/tu2bKiB3mB9e2XMVlvOj1dkLkseQ==
X-Received: by 2002:a17:903:280d:b0:19a:73fb:6183 with SMTP id
 kp13-20020a170903280d00b0019a73fb6183mr12100762plb.14.1677196283241; 
 Thu, 23 Feb 2023 15:51:23 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 iz3-20020a170902ef8300b0019b06263bcasm4764311plb.247.2023.02.23.15.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:51:22 -0800 (PST)
Message-ID: <13687ac8-a771-eddd-e1b0-5c348d2e141e@linaro.org>
Date: Thu, 23 Feb 2023 13:51:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 6/7] dump: Build once by adding stubs for non-x86
 targets
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223231755.81633-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:17, Philippe Mathieu-Daudé wrote:
> Extract non-x86 stubs to win_dump-stub.c. We can now
> build dump.o once for system emulation. Update meson.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/dump.c          | 14 --------------
>   dump/meson.build     |  6 ++++--
>   dump/win_dump-stub.c | 23 +++++++++++++++++++++++
>   3 files changed, 27 insertions(+), 16 deletions(-)
>   create mode 100644 dump/win_dump-stub.c
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index b33a613d45..7cde3e326e 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -32,20 +32,6 @@
>   #include "migration/blocker.h"
>   #include "win_dump.h"
>   
> -#ifndef TARGET_X86_64
> -bool win_dump_available(Error **errp)
> -{
> -    error_setg(errp, "Windows dump is only available for x86-64");
> -
> -    return false;
> -}
> -
> -void create_win_dump(DumpState *s, Error **errp)
> -{
> -    win_dump_available(errp);
> -}
> -#endif
> -
>   #include <zlib.h>
>   #ifdef CONFIG_LZO
>   #include <lzo/lzo1x.h>
> diff --git a/dump/meson.build b/dump/meson.build
> index 2eff29c3ea..6ae07e6fed 100644
> --- a/dump/meson.build
> +++ b/dump/meson.build
> @@ -1,4 +1,6 @@
>   softmmu_ss.add(files('dump-hmp-cmds.c'))
>   
> -specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
> -specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'], if_true: files('win_dump.c'))
> +softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
> +specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'],
> +                if_true: files('win_dump.c'),
> +                if_false: files('win_dump-stub.c'))

Doesn't this add win_dump-stub.c when !(SOFTMMU && X86_64), i.e. !SOFTMMU || !X86_64?

I trying to imagine how well this will scale with ARM64, for the ongoing Windows on ARM 
project.  Would it just be easier have the stubs in win_dump.c, using ifdefs?


r~

