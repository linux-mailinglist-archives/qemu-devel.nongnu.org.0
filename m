Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A483C6DEC22
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 08:56:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmUOK-00011l-3N; Wed, 12 Apr 2023 02:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmUOC-00011F-Kt
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:55:34 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmUO7-0006G3-IO
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:55:32 -0400
Received: by mail-wr1-x436.google.com with SMTP id v27so571892wra.13
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681282519; x=1683874519;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j1h4vYtnOl3Y6OuMtt26ai1aGGshaexK8uVHRiVmXYo=;
 b=GODFWr2aFniKvbl5gWukdcZWvb/4MNOaqS6pDr6w4SI/0DkQUncPqECBJhdx85kcuw
 FufzgcT8PheG6PU4uNdGLlJ5xbg5OSV0S9jPWG0etFtGoGBVqDS7jQhGxnbshGPo4J5d
 64QnS6Kir/aUxkCWJklnvf7bRGxyGhwstin0PRZE3EWF/Qbw4IQCcWXqb7hmoobBMH5J
 lfF7/wK7JVf4ryoqdgpxOy57fMnQwDcWqn3xlvtDofzkTuq7Ap5m7FRVZ7IWh66D11In
 C1nIL8pmFehdGGThQcoa34tVUFbsCjj6WjDdWikof6EWal5Or9oSoIK0g0yhWmYG/wWr
 Epaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681282519; x=1683874519;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j1h4vYtnOl3Y6OuMtt26ai1aGGshaexK8uVHRiVmXYo=;
 b=w4efzuzLHYloRPprSCflXOUPqYCs5u+yuOK1icslrdh8mKaxo1qAqt6nqbb8VdhznK
 FGP024+hKveYG6Q1dl+Br+6dN1+BdjAvFyGYTW689J5EAqKBSXlWK1wExCf3rv27l7eL
 w2VOI274iO3K4+1+oz/saFCt2H7wpVIEruQjENfTLf3FtSmmalNdYw89nQt9iTXy/GH5
 HSb8hVA7QZ3fvHEMF0PZ0aDaFwWYkYrHchfQ74dYpbFIveQ0dP4c+bWU6f8J8vBlH2Qj
 vakCrhWsUmC4YczBcgk2FUlhT8Tt+D3LSU/wJB4KInGwv8EiNf70Cns47cUU3JXiQ7I6
 Qmng==
X-Gm-Message-State: AAQBX9cDLAvrHu58TTpHUl4Nf9NWfFIwspQki+RFAjA4DdtZtER9SfFo
 jtBK+I7v0HWGPihWPIIsXy8lzQ==
X-Google-Smtp-Source: AKy350YrrHPdIWmxTPqjQAQSVKLvgOqy/mfeua9ghEmEUEfexS5BkUynnE9Q1Oif66/pCPI67jtd4Q==
X-Received: by 2002:adf:f107:0:b0:2cb:29eb:a35e with SMTP id
 r7-20020adff107000000b002cb29eba35emr1352432wro.11.1681282519089; 
 Tue, 11 Apr 2023 23:55:19 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 i3-20020adfdec3000000b002f24db41f50sm6250732wrn.69.2023.04.11.23.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 23:55:18 -0700 (PDT)
Message-ID: <502311f2-10af-9331-80b4-f3ef56b91f54@linaro.org>
Date: Wed, 12 Apr 2023 08:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/12] tcg/mips: Split out tcg_out_movi_one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
 <20230408030359.3368868-6-richard.henderson@linaro.org>
 <c0b5e268-080a-4262-84f4-e4a5f849bdfb@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c0b5e268-080a-4262-84f4-e4a5f849bdfb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 4/11/23 14:34, Philippe Mathieu-Daudé wrote:
>> +    if (tcg_out_movi_one(s, ret, arg)) {
>>           return;
>>       }
>> +
>>       if (TCG_TARGET_REG_BITS == 32 || arg == (int32_t)arg) {
>>           tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
> 
> Shouldn't this block be removed in this patch?

No, because it feeds into the lui+ori path.
It gets cleaned up in the next patch.


r~


