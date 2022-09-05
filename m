Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765535AD293
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:30:02 +0200 (CEST)
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBEn-00064E-AK
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAl8-0008Ou-Dk
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:59:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAl5-0006Tj-Mi
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:59:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id b16so11048040wru.7
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Jefos7hhxotdcVEfCIZ5/rZJUqH8noCcmleuNLcu6Zo=;
 b=sVadJ18wygK5esJj1bVQEkUCeKph5i13mrqIYhXRZFo4cWh0Nw0XPfIq4W8SrUD4C+
 Z2IAamI1VVVHSgE8fjfXQTDmn6tX1FBwhOoVa7gT9tPiPDpAV+S/kCdDUh2uU+NbEZxZ
 uhNUvS7xnZft4U0Uwh+gErN99htUWvlFHwplWdhgBITfFtQ5ytjFe6mH8CGxIMaY7Hra
 SPg5bHOXDAVh63b1U+pDYOBpbXpLdglIz+RG4JpLe47KdPfADlyLu5h2upzTFlEj9iYC
 I/lJq0yadwgNT/zwgDJFhnOGsNaBVoocaMCwZW/u3zVleXS7XtU94IyyO1RWOoM3uyQP
 iBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Jefos7hhxotdcVEfCIZ5/rZJUqH8noCcmleuNLcu6Zo=;
 b=cP+ofca5aZdYpuXmMDruGkaZrKB2lkFgBSX5RHZNsWH/kXcyEq1zRc6LE+2yfezLqz
 EyupZDgWw3CFEdH0R6Y+wTdgTT3WNB0xTBXQEgDShBQA5YPJ1vb6i1naW5EpdIxI7a6c
 S1N5VZfP8Rw1I7di/5d+3PW6gr2bs0HgLp5yufNOfHqk30huT3tEHZDQLkCFxsvC73K3
 o9jxMWWohdRYnJm7vgk84+2DBROeStnnzKW3aUJ6K+l2GnKwNsWaaUmMAkafTLEuv7q7
 tXhmc51X4aOMeEWvEcNztPB+/3llYOeTj7CVHUTJ7hweVXhSR+dyHL0A5kts+swFlIl5
 EI0A==
X-Gm-Message-State: ACgBeo0H+vSWTEHqpzbHOhkGEYJ0z9tgEEERSFvI9Br9I/Y18FxvMRkE
 D4Vgup4ERq7pP3v396sFre+U9Q==
X-Google-Smtp-Source: AA6agR46m3gTlhksHtXoMF4JuPKmfddq+fvMgEJRNmaF6XOQ2hLxrsL+Gw1VOlUHycaEFzw+CB2N9w==
X-Received: by 2002:adf:e78b:0:b0:228:614c:33a6 with SMTP id
 n11-20020adfe78b000000b00228614c33a6mr5033429wrm.504.1662379157372; 
 Mon, 05 Sep 2022 04:59:17 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c4e8e00b003a5dbdea6a8sm22869136wmq.27.2022.09.05.04.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:59:16 -0700 (PDT)
Message-ID: <73fa2718-909a-37c5-6b6c-8f62bfb49210@linaro.org>
Date: Mon, 5 Sep 2022 12:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 20/20] disas/nanomips: Rename nanomips.cpp to nanomips.c
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-21-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-21-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/22 10:55, Milica Lazarevic wrote:
> Now that everything is converted to the C code, nanomips.cpp file is
> renamed to "nanomips.c". Therefore, meson.build file is also changed.
> 
> The explicit cast after the call to g_malloc() is no longer needed
> because the file now compiles as a C code.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/meson.build                  | 2 +-
>   disas/{nanomips.cpp => nanomips.c} | 6 +-----
>   2 files changed, 2 insertions(+), 6 deletions(-)
>   rename disas/{nanomips.cpp => nanomips.c} (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -525,11 +525,7 @@ static const char *GPR(uint64 reg, struct Dis_info *info)
>   static char *save_restore_list(uint64 rt, uint64 count, uint64 gp,
>                                  struct Dis_info *info)
>   {
> -    /*
> -     * Currently, this file compiles as a cpp file, so the explicit cast here
> -     * is necessary. Later, the cast will be removed.
> -     */
> -    char *str = (char *)g_malloc(200);
> +    char *str = g_malloc(200);

... noting that this change is obviated by the use of g_strjoinv.


r~

