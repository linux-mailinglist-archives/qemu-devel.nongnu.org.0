Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4635848F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:24:09 +0200 (CEST)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUdk-0001YJ-45
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUUbw-0000lL-W5; Thu, 08 Apr 2021 09:22:17 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUUbo-0001oN-AM; Thu, 08 Apr 2021 09:22:16 -0400
Received: by mail-ej1-x631.google.com with SMTP id e14so2981516ejz.11;
 Thu, 08 Apr 2021 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JF2hSLjAY2xSm80HdC5NkwNPMt85sNS0qkjU9YTDDp0=;
 b=FbwV5NcgDqj6IcQaPtKViIhgSP0Va09gWQL9+lkNakL0mzB3kHj9Se78C/Tt8Yyc1h
 vol05Qd8BcX7GScAI1DvHbJM29NLWO/nLQG79xHdqZ+eewXZHvuu/kk88lD7riZ/vEad
 ogbqpwgIh1/9aGv03aJ59+PmU80r6nZN2LKmh8dX3pSpvxLyj1wd5euT2BdKMkKEJsv9
 Yxnfx40EJccyFPa77GeEKjgoQP7ZytL/afedwvQysJNBmWXFIkkZBcnfRExnWBU/ZB9C
 2/wC+tB8wqK7gSF0/eOnl4wVTUNzy7lzJ039j229Z7XfjJeDWc55pDJLwAgKWGfWjeIe
 7f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JF2hSLjAY2xSm80HdC5NkwNPMt85sNS0qkjU9YTDDp0=;
 b=ZTp7+F5YK/Hg5DqYt1Cyl0hQ9xbdiCTF48Z0FC7cvFrcj8OK9G88QrnTy7pN+IsXvY
 rcsDkqkCpa8pANm3UT6i5Itwz6NwVs5XqMwOpts1yYR2YGXM2xUMBjgzLqjDquP7sjxl
 LKqoJG50mGrQr1fLr+UiHY4BCJuBggO3gBccuylopKQlFp3apfxwAXhSb/S9kRXFl+cm
 E2QKAvMw6md6EkH4bgOGCR1VMO4weuh2cVyrxkJR977MFnY8M9WGW0K2VB0gcbAoiPYI
 2ljCaZ+TEKx6MmLJ8bVa8Hr8/urldKSbapFe30KMcMedkS3JixzA3mj6nT1TiSB+KyeU
 0gNw==
X-Gm-Message-State: AOAM53350a6VyzkEgt1dEi/5UjA630pT9Fjp23Gji+Fi/LqKTf0oBdBV
 7Zl1EOGe8g9Hh2oEqNFr6RE=
X-Google-Smtp-Source: ABdhPJxyC4rFvT/gEGo31lLUlLMs2UciAI0TOl2izUr2/gb36JLAL4Nt/W4EKffBcw77XZCRzxM/qQ==
X-Received: by 2002:a17:906:3487:: with SMTP id
 g7mr10112392ejb.222.1617888126132; 
 Thu, 08 Apr 2021 06:22:06 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id pj18sm7678999ejb.101.2021.04.08.06.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 06:22:05 -0700 (PDT)
Subject: Re: [PATCH 0/3] hw: Constify VMStateDescription
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org
References: <20210313171150.2122409-1-f4bug@amsat.org>
 <bd47e690-dab6-e8db-2d8c-aa729c41abad@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4b8eca8f-fad2-1adf-6997-686803dfa723@amsat.org>
Date: Thu, 8 Apr 2021 15:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bd47e690-dab6-e8db-2d8c-aa729c41abad@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Rob Herring <robh@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 10:05 AM, Keqian Zhu wrote:
> Hi Philippe,
> 
> It seems that vmstate_ecc_state and vmstate_x86_cpu can also be constified.
> Found by <git grep "VMStateDescription" | grep -v "const">.

Correct (I only searched for the static ones).

Do you mind sending a patch?

> 
> Thanks,
> Keqian
> 
> On 2021/3/14 1:11, Philippe Mathieu-Daudé wrote:
>> VMStateDescription isn't supposed to be modified.

