Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C4381709
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 10:57:46 +0200 (CEST)
Received: from localhost ([::1]:48818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhq7F-00085p-5X
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 04:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhq69-0006bi-H7
 for qemu-devel@nongnu.org; Sat, 15 May 2021 04:56:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhq67-0006lc-IG
 for qemu-devel@nongnu.org; Sat, 15 May 2021 04:56:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r12so1441937wrp.1
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 01:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lgkNL6rdHxwH7LSF1eYaRDWLxT703JfMm5MddtEK1KM=;
 b=Y9wMjU5z3Bb2+x57ZDwazYDVQD1OCJqOP6+NesBEr5T3wXp0isQc/e5lQVbhsk9HmK
 DpCjNGurCQMgeyEUMXh/+EAzzdZECAc4pb5KbIC4uMQJ4r+tloTbm8c0+tJLsZZRh0yM
 uLNDd8aCrVXM7hQNj7SqBcNz4OvwkOmIouKW+lmZBnVtvh4vbDa2+OvNB0fk2QQQMIAT
 PKBFzHto0Y/VKHgDFDGbuCwgGEZnmmQMoWKnvrTmqeQ57LMnQ0y3sjwHg1UBmlCkDAF7
 8auOOLtPF1QgZHB0iyphOWSuJIy7tGLPPNikn2fW2SmcyxewY4Mp05+BsoKa/u24Ux0V
 H3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lgkNL6rdHxwH7LSF1eYaRDWLxT703JfMm5MddtEK1KM=;
 b=KpnRsMtT0Rjs+7uuXMcULw7qyQ25/7kj9DsoicGcg6G8spmWX/JRHw54ilu3Y/gdUH
 +OjuxSsoYxlRBBiAs1oDZ5lTvRGOT1u0lMiEYvTa/+dKGDcXovZWyikVkGCZZe+gvnJi
 oSMzZizAYCw7XyDIN8AJtfvqc/zNr7qMlJzmU7WAe2D1NeCmDejcKCANzHV4U1TockkR
 +sz11gtACjN9n3S8B1heOlexUmKTso5e+9uDr9LJ7q9kugSE/JUVvxS1Hkf9Ut8VtKzf
 8n3EzJ4Wq9NkITbW9NPCoI3pmor8igG7Dftt3/DUa7+OZBzL33Hf0ssYCqVTG9hPYg11
 CgGA==
X-Gm-Message-State: AOAM531nTQVKv2MQzw97d27uJ5UfI+bEXJaBZdBUhH9mWWsoH1qgMlH5
 i34c5DnaEspkgvVdJQAmYwlJbPghcQ4qkw==
X-Google-Smtp-Source: ABdhPJzysxED5o/ABMusGNboNvidrkLLFDZii3+Akt7Y9F5ImcBJLv1XP0dOztZz4pwvDNG7tcGMzA==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr63305792wrw.166.1621068992704; 
 Sat, 15 May 2021 01:56:32 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id y17sm9765596wrw.90.2021.05.15.01.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 01:56:32 -0700 (PDT)
Subject: Re: [PATCH v6 23/26] tcg/tci: Split out tci_qemu_ld, tci_qemu_st
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c5fcdb62-47d2-1f18-cbc8-9920457d0774@amsat.org>
Date: Sat, 15 May 2021 10:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> Expand the single-use macros into the new functions.
> Use cpu_ldsb_mmuidx_ra and cpu_ldsw_le_mmuidx_ra so
> that the trace event receives the correct sign flag.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 215 +++++++++++++++++++-----------------------------------
>  1 file changed, 75 insertions(+), 140 deletions(-)

Nice simplification.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

