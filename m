Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9982667440D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:12:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcBX-00058M-Gz; Thu, 19 Jan 2023 16:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcBV-00057Q-Fv
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:10:57 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcBQ-0005X3-Jt
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:10:56 -0500
Received: by mail-pj1-x1031.google.com with SMTP id d8so3648675pjc.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=42tY+T9PvrxAnf1fJX5R4pjz86hy5EUfIq5pxa5Ru0Q=;
 b=fWaFbDCyOn0uz9KKCESBMC53b+f90qtnGjUFu2nUBP4kKYTF3nvaLrUoF/HYnxey3i
 l09TJbjj+CIWBAQYVoOVvRt8usfD5dL/8E6iLOmrSk2r/0nEB11vvjnBcO7OeeiRi+iN
 milsLtNQXrhSQEsZ/SzP6ZgkW/no0Rrj+MqM+27m3Z8wWl6VdtdjXgmnisO7w37ZOk8P
 dEvHD2VCxzsdcd8zcgFvVTMRwRKsIGaz+gbzwRXYNV53kt/ggg6zg12d5pvdYNojjl2n
 8xQFZfrU4FMDSCVRkiJIaXOTm5RfcV8UL9ihRzYxoD2SGR84Xrj1EG6sSwXbJeFcalYc
 enPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=42tY+T9PvrxAnf1fJX5R4pjz86hy5EUfIq5pxa5Ru0Q=;
 b=Xq7SnrLbsdyCrMBq7V+Ao5Pwb+Q7V9U8nJ3B9KjKUHWKYVZrqJ0p9x1zjSmIOLt3CC
 X+Am7JsKEDKiy/OXYMjFcNPax2zShuETuSUm9A7GEQg4/pj2DO04AmvJro/fF9dPqEvx
 Z/MlMN5sL+jZmmoKw3X9s97Fb3O8FQLDuXXbVTDbK9DFJVH9WEi9o5CtvR79FxSIBEKW
 kkyXDmP8aPX47EI1vO3VHV7wbMeX22qJXJ2sNPhl1RD8PvZIqL4ElX1EuBGFmjyslDm+
 rfQhyemCGOR1j+NWlnOMwN4i5WD0/W3mVB5Z+Taywg1sNCaIsH52vpLk1OjmJ6DU0pi+
 jqaA==
X-Gm-Message-State: AFqh2kp81YCHOePPchR09+0VMjRosRASdgEIVtvyWUEUsJ2QcJAPNW/F
 X/bvZdL3itXAITXsfuzG451qaQ==
X-Google-Smtp-Source: AMrXdXvgnnqe24rkCwnS9WkhxNR1DMwq1x85uSstwUaBtDLuAPFWEYIXImmuAdywfPSG8Cnv45BdBA==
X-Received: by 2002:a17:902:ec85:b0:194:dda4:4b5c with SMTP id
 x5-20020a170902ec8500b00194dda44b5cmr1262953plg.28.1674162649875; 
 Thu, 19 Jan 2023 13:10:49 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 21-20020a170902c11500b001869b988d93sm18722809pli.187.2023.01.19.13.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:10:49 -0800 (PST)
Message-ID: <ca41b949-e31e-ba69-7876-e6180ef52a3b@linaro.org>
Date: Thu, 19 Jan 2023 11:10:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/11] tests/qtest/migration-test: Build command line
 using GString API (1/4)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Part 1/4: Convert memory & machine options.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 6c3db95113..7aa323a7a7 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -582,6 +582,7 @@ typedef struct {
>   static int test_migrate_start(QTestState **from, QTestState **to,
>                                 const char *uri, MigrateStart *args)
>   {
> +    g_autoptr(GString) cmd_common = NULL;
>       g_autofree gchar *arch_source = NULL;
>       g_autofree gchar *arch_target = NULL;
>       g_autofree gchar *cmd_target = NULL;
> @@ -601,6 +602,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>       }
>   
>       got_stop = false;
> +
> +    cmd_common = g_string_new("");
> +
>       bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>           /* the assembled x86 boot sector should be exactly one sector large */
> @@ -644,6 +648,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>       } else {
>           g_assert_not_reached();
>       }
> +    if (machine_opts) {
> +        g_string_append_printf(cmd_common, " -machine %s ", machine_opts);
> +    }
> +    g_string_append_printf(cmd_common, "-m %s ", memory_size);
>   
>       if (!getenv("QTEST_LOG") && args->hide_stderr) {
>   #ifdef _WIN32
> @@ -674,33 +682,27 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>       if (!args->only_target) {
>           g_autofree gchar *cmd_source = NULL;
>   
> -        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> +        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s "
>                                        "-name source,debug-threads=on "
> -                                     "-m %s "
>                                        "-serial file:%s/src_serial "
>                                        "%s %s %s %s",
>                                        args->use_dirty_ring ?
>                                        ",dirty-ring-size=4096" : "",
> -                                     machine_opts ? " -machine " : "",
> -                                     machine_opts ? machine_opts : "",

You removed two strings here, but only one %s above.


r~

> -                                     memory_size, tmpfs,
> +                                     cmd_common->str, tmpfs,
>                                        arch_source, shmem_opts,
>                                        args->opts_source ? args->opts_source : "",
>                                        ignore_stderr);
>           *from = qtest_init(cmd_source);
>       }
>   
> -    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> +    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s "
>                                    "-name target,debug-threads=on "
> -                                 "-m %s "
>                                    "-serial file:%s/dest_serial "
>                                    "-incoming %s "
>                                    "%s %s %s %s",
>                                    args->use_dirty_ring ?
>                                    ",dirty-ring-size=4096" : "",
> -                                 machine_opts ? " -machine " : "",
> -                                 machine_opts ? machine_opts : "",
> -                                 memory_size, tmpfs, uri,
> +                                 cmd_common->str, tmpfs, uri,
>                                    arch_target, shmem_opts,
>                                    args->opts_target ? args->opts_target : "",
>                                    ignore_stderr);


