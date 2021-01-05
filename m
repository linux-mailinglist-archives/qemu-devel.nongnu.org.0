Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59FE2EB2DC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:57:32 +0100 (CET)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwrWN-0000oS-92
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwrUr-0000DD-Ac
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:55:57 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwrUp-0003Qt-R9
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:55:57 -0500
Received: by mail-wm1-x32f.google.com with SMTP id r4so496193wmh.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 10:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4ehnnCNggqboultQ64p6PXXgZVO7qDXLnOeYMuacksY=;
 b=N3ZYBSBKoJq5cEPZEVYfpGf8q9Ir0zsC+ONS/cWZna6CNpNEj7CIqODX1/qcIOzz/F
 Dpvc+2RV5Y3XzvkTgZ4vpI4D0qko2gfWHt4aqB/TkScS3aSwyhgVQqm3aexkJJ7XPEbQ
 dir3qHRN9K3vCMvKy8Ft+EJAqBV7ArTUr47QMdkRj369EvdnGM5LbVHgJJbTBnSvezCZ
 NKcnZPPxnya7nrAYUm6YNxlTVoH46aIuFX5RYe4qt5XG+Sd7FAYYlrlXeGl2KT3kOC6k
 Eyr0+rYydDMGKYf2isYo2LDWA2VgcZ8fcA5d4H+OkcGNzPn7gfd7UeuNW9PEcnM1/M6X
 oUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ehnnCNggqboultQ64p6PXXgZVO7qDXLnOeYMuacksY=;
 b=VZ9CniIqOZ68dZjkGtRtPl2/fTW1KbKa9DIjtDOYwYPB+Y1Ctv8LSWssRB+X6Zelc0
 TyQi9rkxkpb+pKAG0Gu/jsLQDejodTQ7TaQJv0MN5O7EEBCcu6ICcIm58feNAFdNYECG
 26CZT5IzXKnmTTJ/RXsk6yVkqj6oyOALGSFzqQf+Kvy+GhqiwiNITd/+GmzT4j45JSZ+
 vpsjigS5AtHDLLPROP9+zohdOSS2lXSucyRawxmkBRrvc/d+/oWWJcw8kgYWxPWMOdS3
 pKvKpVe7WGugTN+zT23YvA2fbj2ugTmhaJ7MHWoInhLD34Dw5u3nQIIRPWdcq1K1PTOM
 oMfQ==
X-Gm-Message-State: AOAM532Yrd2pjzOUy5ASJxeSnMC0Ag66872HoCHsYASJgiWpMTDNvHBM
 zIm/Uc1cU3Tkx1WwkEQZ85k=
X-Google-Smtp-Source: ABdhPJz6/GdYmE0/ETT7d3EuxwMOOUOG2nj8jnkRlWyMxy4vaVGlAI2rUqSkT2MWMjraRXH//ghsYw==
X-Received: by 2002:a1c:bc88:: with SMTP id m130mr505087wmf.82.1609872954113; 
 Tue, 05 Jan 2021 10:55:54 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id f7sm5888569wmc.1.2021.01.05.10.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 10:55:53 -0800 (PST)
Subject: Re: [PATCH v5 16/43] tcg: Use Error with alloc_code_gen_buffer
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210105171950.415486-1-richard.henderson@linaro.org>
 <20210105171950.415486-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <27a7b4a1-280c-0c7e-3773-9b270f184895@amsat.org>
Date: Tue, 5 Jan 2021 19:55:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105171950.415486-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 6:19 PM, Richard Henderson wrote:
> Report better error messages than just "could not allocate".
> Let alloc_code_gen_buffer set ctx->code_gen_buffer_size
> and ctx->code_gen_buffer, and simply return bool.
> 
> Reviewed-by: Joelle van Dyne <j@getutm.app>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/translate-all.c | 60 ++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 26 deletions(-)
...

>  static bool tb_cmp(const void *ap, const void *bp)
>  {
>      const TranslationBlock *a = ap;
> @@ -1144,11 +1147,16 @@ static void tb_htable_init(void)
>     size. */
>  void tcg_exec_init(unsigned long tb_size)
>  {
> +    bool ok;
> +
>      tcg_allowed = true;
>      cpu_gen_init();
>      page_init();
>      tb_htable_init();
> -    code_gen_alloc(tb_size);
> +
> +    ok = alloc_code_gen_buffer(size_code_gen_buffer(tb_size), &error_fatal);
> +    assert(ok);

Pointless assert() due to &error_fatal, but harmless.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

