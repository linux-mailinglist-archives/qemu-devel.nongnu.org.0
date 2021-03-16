Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DB733E1C3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:56:52 +0100 (CET)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIcN-0004ZR-Sj
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIb5-0003o2-ML
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:55:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIb4-000845-Am
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:55:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id b18so11317956wrn.6
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R7nRSWfKq1S9ttW5761c0e8uunKL6fgnVrJlfJGU+s4=;
 b=j0J3rAtcZCbaOq8OIWNtbtfQMu2SPQvNR8aMfppDzDnVOUfzA8+jnRUEjb7aXjLwUQ
 Ff7lewqCyaSJLhuJKuPGG1bqgI2ZDts3vyXfZR9MxkMm60d10nNeVPI7FHEEKZEWN+Aw
 /KIQ2mJxdUL9nfiQNSo1dzhcxU243rxMgV0L6hsn3LiZfZ8dqRcb2Mr37HEBqZnu4oXk
 QifrfsQXExzFPSxeW7TUcVAZMXn00en7TAZt+6b+uhkeOUpm7kaKHajNAufhgHn5UKfk
 CIxA8QWZkiuiAD3W1/qLpmLu5DATgAcN5cOKvONZnuzTXrl6L5HP2s54ZJUzNgjS/tb1
 fvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R7nRSWfKq1S9ttW5761c0e8uunKL6fgnVrJlfJGU+s4=;
 b=Qug8TInACQVaD0HLfxFQ06umTLsyZCqDbfcIHhNK34fYAJ1z7cnObDKM9b9yCdLckP
 YsxKj1oVTloUn0I16xAopjENNawQOgCG3dAtRVtx0vi4pRydHPot/l8SlvYK8jM71vYm
 WQ6yel2ay57105Zyt9Qlhi3xS34sSMIUE6ZlGRmiabY1bOhHWCOf7foZcHzf9rao1b75
 CLee1j7zKr6qxJJbpuM3UFKT0qdsWeHoU/9otgDtcm2li/zquGn5OC5kFIYa1SGIRoo6
 UFdjHGEvyorY/0WrNTnIQqM3mLJpLcVyuJCABDCakwjR4x/CQxpR1CWXyS4ebEvZtaE0
 uX7Q==
X-Gm-Message-State: AOAM530dMM8AcyhhQ1LHTzKyFvBXHa6BYPrv5MSnywRv9xpJd1V5Q3d5
 /kkIAZhJJ5CZfYwItYLrO3A=
X-Google-Smtp-Source: ABdhPJyOXopvhCaRke1aopNI0uTJ0HdXh8HOd7/9twbTPEzPZ85sqCw92wrlTmFvktz1BruGP4TSLA==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr1199442wrj.185.1615935329133; 
 Tue, 16 Mar 2021 15:55:29 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u15sm636954wmq.4.2021.03.16.15.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:55:28 -0700 (PDT)
Subject: Re: [PATCH v5 06/57] tcg/tci: Split out tci_args_rrrc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c6132273-59b2-fade-de02-0856b3eac03e@amsat.org>
Date: Tue, 16 Mar 2021 23:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 1c879a2536..bdd2127ec8 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -207,6 +207,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
>      *i2 = tci_read_s32(tb_ptr);
>  }
>  
> +static void tci_args_rrrc(const uint8_t **tb_ptr,
> +                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
> +{
> +    *r0 = tci_read_r(tb_ptr);
> +    *r1 = tci_read_r(tb_ptr);
> +    *r2 = tci_read_r(tb_ptr);
> +    *c3 = tci_read_b(tb_ptr);
> +}

Can you describe 'c -> cond' in the previous comment?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

