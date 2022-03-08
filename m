Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738DB4D2207
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:53:09 +0100 (CET)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRftM-0001Pu-1r
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:53:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfrb-0008PQ-G5
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:51:19 -0500
Received: from [2607:f8b0:4864:20::102f] (port=43711
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfra-0000wD-11
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:51:19 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so309710pju.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YO+JrsWcPWazsSGu4L0y+7vVoiuPWoR0tTT/E71Gje8=;
 b=jP58jfqnfKoRfaqsmkOZI0A0eq6bkysRt9FjwGgKPCxneY8ZQP5JO57TdOuge3I3sd
 EDvtotdYQHsGdrfc09zjzylQ1thXs1vl9qFQ6hK5bK1OY+j9E9SgRPe7TmesEPtIX3mD
 mzPQ5WW0vrpD0Mu878s+lueXtGn1pMUDhhhkod2xhogbEHQPG6+E0gMjXvjNpKx6TT1e
 fni/114RCCDqJ2Cfi8bW4RC/7IZoxiFroWSiM2ZtXu1jjfNQm5HIDDaaxUxnxap+gpZ7
 jw0PonI6gi1bQ1P+iPhrV7ON8lqP4olWApBOWleFQYJIhH5bW2ORQEO0XdLlGqUQF8ON
 ViJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YO+JrsWcPWazsSGu4L0y+7vVoiuPWoR0tTT/E71Gje8=;
 b=bPQNuP0tbwD1imUuVLmAjJ0AA23npoc4jv/A4q58zP1krEHYwz9be8JLVxJe7IB7AB
 xrzsorSDqjE+Lxy+F3PXPAw6MbXoECBEoECOG3Pm6WHGxpHOHNMrOHqBnROKRu5vrtBb
 2aDsgRY+ouvdEJzIwFwi62YLvCEwoKOTk5BBli95BITw6Y00nQfYR2xwgEYQf+Hvn5VK
 QfKSJVsWcQ/lqgtRmQnLIxTp2AuTNJUa/GRoJlI06fRJXtfLuyfNhUA/tl8/9Fia0BDS
 t0qtuAjoFYsBS9CR0Zd8xgSIttJLX2VyC8DI8PR9Hift1bn7ZXsRB5i3lZD2oi7KliiR
 gBzQ==
X-Gm-Message-State: AOAM5303wtJC8MjD38vvrkTke/nzc7QpuBCawcWnMYjsS1udBemNEgaP
 yZ+Q+4QJJdtzhhfsuDzhlclP8Q==
X-Google-Smtp-Source: ABdhPJxrIW19oXfR5PVdkMgIhXsm77voaUyPBWC2mW552EpBNEal/tIR3CcQcZv+zV58ikipECXFgg==
X-Received: by 2002:a17:903:2c5:b0:14f:4a29:1f64 with SMTP id
 s5-20020a17090302c500b0014f4a291f64mr19465881plk.90.1646769075262; 
 Tue, 08 Mar 2022 11:51:15 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 x9-20020aa79409000000b004f704d33ca0sm8032835pfo.136.2022.03.08.11.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:51:14 -0800 (PST)
Message-ID: <a93c2817-ec65-fe63-aa6a-90978a2ecaab@linaro.org>
Date: Tue, 8 Mar 2022 09:51:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 21/33] target/nios2: Use tcg_constant_tl
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-22-richard.henderson@linaro.org>
 <CAFEAcA99Bo0_xGZbpLbf1N09o2Wfv3CmoBqqkt=0+X9RnUqrfA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA99Bo0_xGZbpLbf1N09o2Wfv3CmoBqqkt=0+X9RnUqrfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 01:00, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 07:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Replace current uses of tcg_const_tl, and remove the frees.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> @@ -675,8 +663,8 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
>>
>>       TCGv t0 = tcg_temp_new();
>>       TCGv t1 = tcg_temp_new();
>> -    TCGv t2 = tcg_const_tl(0);
>> -    TCGv t3 = tcg_const_tl(1);
>> +    TCGv t2 = tcg_constant_tl(0);
>> +    TCGv t3 = tcg_constant_tl(1);
> 
> Maybe just use tcg_constant_tl(0) and (1) in-place at
> the only two uses of t2, t3 rather than retaining the TCGv
> local variables ?

Sure.


r~

