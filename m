Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39A63E34A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 23:19:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0VP6-0006Us-2I; Wed, 30 Nov 2022 17:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VP4-0006Ug-8q
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:18:06 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VP2-0003st-Et
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:18:05 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 82so37270pgc.0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 14:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9xgTq0rxBcf8kKglQixYN6drx5JNLynuD9ZUWAK5vXI=;
 b=GawUQpTLngomICY2yrej7wdE/ho6EJgHHdrgozv6qELcxqGrIX88GVOgO9WdGbhr9u
 5Nn4e2T1X7V33AwaC4ckPNzfGpb/APxyuQZ2ymHZPyxQCGDiJ8bPUvqKpK3fQZh94nK0
 T0F48S729IyyNCwvnlYZmUMibkG8ul+ww02fTQsa8AHtv+2VkwV5wypAMeluXAJaUqPp
 d3G/mrZNxMU/PSRh9MiOfLqDZyP5ozNd2ptjqecrZId7CntbkUbWmqI4cv8RQDm86jNE
 W8aC0KKIMrlyPzL2o+JjDTPrpMwa5kaRe4zZAcCstD9o5QY7dADfzjOJyrKwAX4QG6DS
 LMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9xgTq0rxBcf8kKglQixYN6drx5JNLynuD9ZUWAK5vXI=;
 b=Fyf2YFqtfGVYRf50TTnItUuVFAkNih4tUroJAsdD094q2eZdvDO3BbEPAHWsxhWzU+
 yrMKi1TZzAydmPhA8Acln3JzOAh8BgP0tDg5jurgBPVmOVTSyMvl9mTKTRI0KKGqD75l
 MTN4oX03EyPflKwc6y0KRw3y7RAwccalf/rq+f/oMyNX3IQkTHL51sV3GfnolL8AHnE+
 7u/5jzeKKNeeZQ9vFa8vihcgpCOCZSZ0yPHLniiE7qS9QPA0UKUpiFyfmr7lkB9/xHl6
 EOhtqr43qBxpNaubdxFjSjoY6Zwk/grpMzh1G3VPrHgVvmQsJUfbRNrg3Qh0sul+7McM
 6FWQ==
X-Gm-Message-State: ANoB5pn3Np1fQr6BNrJeDQxA+em6eJ3iDB8XTjjAq8h3/HauonVP5FPI
 oufIa3yLgkQkJrUqK/Lb+qdagg==
X-Google-Smtp-Source: AA0mqf5aT5XdXjK50Q7NH3spW4vhbKUCV7c/8kzqR6zFyXIU3veOQXf6csHJLRhu+toT7sMyCi4FFg==
X-Received: by 2002:a05:6a00:414e:b0:575:7968:f546 with SMTP id
 bv14-20020a056a00414e00b005757968f546mr9575029pfb.30.1669846682325; 
 Wed, 30 Nov 2022 14:18:02 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 i190-20020a6287c7000000b0056c704abca7sm1816198pfe.220.2022.11.30.14.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 14:18:01 -0800 (PST)
Message-ID: <dbdd478d-c492-62ae-0fe4-c01eaa5f23eb@linaro.org>
Date: Wed, 30 Nov 2022 14:17:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 2/5] cpu: Move cpu_class_init_props() to common
 code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221130135241.85060-1-philmd@linaro.org>
 <20221130135241.85060-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130135241.85060-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 11/30/22 05:52, Philippe Mathieu-Daudé wrote:
> This code is not target-specific.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu.c         | 53 ---------------------------------------------------
>   cpus-common.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/cpu.c b/cpu.c
> index 4a7d865427..d4b24ea39a 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -21,8 +21,6 @@
>   #include "qapi/error.h"
>   
>   #include "exec/target_page.h"
> -#include "hw/qdev-core.h"
> -#include "hw/qdev-properties.h"
>   #include "qemu/error-report.h"
>   #include "migration/vmstate.h"
>   #ifdef CONFIG_USER_ONLY
> @@ -183,57 +181,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>       cpu_list_remove(cpu);
>   }
>   
> -/*
> - * This can't go in hw/core/cpu.c because that file is compiled only
> - * once for both user-mode and system builds.
> - */
> -static Property cpu_common_props[] = {
> -#ifdef CONFIG_USER_ONLY

It is "target" specific in the general sense, in that CONFIG_USER_ONLY is either set or unset.


r~

