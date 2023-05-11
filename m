Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E5F6FEFC3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:16:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3Jc-0001BO-AS; Thu, 11 May 2023 06:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px3JY-0001BA-H5
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:14:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px3JW-00034l-Sj
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:14:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f42c865535so29571055e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683800059; x=1686392059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kmMx92dB0cIKCtMkekTbQccDY0lYngmYzw7wfITYnD4=;
 b=mStnGD116kGRZLL0UDOcFlRZ8elpM9WDSzF4oTaIvglea12lFAXiu3GPXxHQWt1I9A
 WQpmCWrSnIIOCX8oI7SOb5++I+lgu9/wWNy+gtx/ljRjZLTSVdsMdBPQlfj7Ea6r6jHJ
 rY5kbV4taKhF70f1TPkZESrWZobdwY/HdXbOJot6nog8DL801bI2znz9nSi+pShS1NpE
 kaqnA3jwZcC/ZsqxnM7OGSOlI+cBxNgFWCm+7xbAqw8BeeEi8kBwxRlhA+FrAVk5X86E
 8BKn1JK1nPy2okp13BJIp10xNTxgH6Re9eLZI9JlJ4uUmplRbvy5HgY+ZQ41AT4v5iAq
 Oy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683800059; x=1686392059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kmMx92dB0cIKCtMkekTbQccDY0lYngmYzw7wfITYnD4=;
 b=FfndBil6y1A6VCFAYxqxWfOA4XKL7yCsk9xFrcOqDlbuGyQkHp44/XisJhKJuPRJz9
 lz5ib8Ar4nobFj/qTk4AslUbe7/aBGJT9KQNz6K26PcdVlnL91P2wwGexK7Btlwbpz6Y
 BFoDL1+5QsOEHgFZOLutengywV8P1DYMYhzr/3C+207Mm6sNLbASr7HH31j+eFf5W6rH
 2VcYnnLbwdwEsEOkAgG35od9wcCYpf2g0Hn8TfdwYs1Xh9m5yIO92Ga8/pErrnUYvTPB
 7ZHUx10RU4+28y9r1Oq8M6qU4Bm43Gkxw04LnCnYJs9ICQ11oyUGDSBUJKnyPbYinQei
 S9lA==
X-Gm-Message-State: AC+VfDxOk2Ad+ArFs+wG9q+bPZc8hxeATeZEmk1mGSkMOmAm2zGHPkPy
 C28Mhq145weSABp/W71J5/dStw==
X-Google-Smtp-Source: ACHHUZ69wyXRlhfRNdz43nnsoi9rUhhCEMV7prrc1VnjTO8lYUqjcy8rFzwbgjxNEu7zQmODsKqB2Q==
X-Received: by 2002:a5d:4203:0:b0:307:8487:cb82 with SMTP id
 n3-20020a5d4203000000b003078487cb82mr12801361wrq.30.1683800059531; 
 Thu, 11 May 2023 03:14:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.161.78])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a1ce914000000b003edc4788fa0sm25096837wmc.2.2023.05.11.03.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 03:14:19 -0700 (PDT)
Message-ID: <2a5335fe-976e-2c4f-3a9f-ee25f0e3d852@linaro.org>
Date: Thu, 11 May 2023 12:14:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] ARM: Use normal types
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230511084505.13282-1-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230511084505.13282-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/23 10:45, Juan Quintela wrote:
> This is the only use of u_int32_t in the whole tree.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   bsd-user/arm/target_arch_reg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


