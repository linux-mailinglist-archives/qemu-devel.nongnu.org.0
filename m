Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1856669354A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 00:35:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzOB-0000VS-JI; Sat, 11 Feb 2023 18:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzOA-0000U4-49
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:34:38 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzO8-0004d3-HL
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:34:37 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 nn4-20020a17090b38c400b00233a6f118d0so6660848pjb.2
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 15:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R0ksbUlvOsjub3ERkmM5ZHb8g1EY0/xIiYVsb57xGo0=;
 b=qWHN7L3etPS0+K3I8gnHDge/dp+vDWROe0npkyjvPHomv5RBsJp/c9E2IR+eF8loAd
 Q6X+Q5f51HJe0s/jpHOGLUT99/3cTItz1GRIgUxB0zqHQnpmdoj3bHkVWMnn3Zwl0KAl
 32Gl2pb2axzy69Ur5bwjqqCqDIrCHZhBsjd3hb8ib7nWpeDMUHaJVLJ61t0zPoTjhqd/
 SrVpqhIOFcJOOp3ysdYZkUNZJM13lNe+wOCh4qvHa8t1PEsDvchIlrZJsT0PwFaKa5xT
 /RBGXl1fawRk3I6PhJEfzmCygeacbQyJXG/lzkipmp1bkSsEmkCM8MKCw/cBfgHgKJ4K
 5i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R0ksbUlvOsjub3ERkmM5ZHb8g1EY0/xIiYVsb57xGo0=;
 b=SZGue7Vyy9k26qElltD+4729H76nwLkqXCJSbkxuZritaYdFkqPEpT4L0weK/WzEOZ
 Rhbn9l1oeREtdA3YGYa2e694OpUfGEIPbRUPbPy/BL0yhRICNOTH3ENb2KzicvT6Eoi7
 1R3/rx9IptIcueEgILkrt1ZhcqLrehjnY1rCnLVQ4AhwQu2/91RVgwdIktapeKNNMSpP
 HCGUsSCqqcRuXdYRTzQFY41OOJIfioOl7E0bslVeZbN0ck4lBuLkCreMRMyTsJzw8Yr3
 R31mJQzTghF6QxF67Le596GRTkWt1rmuHaiyCOYSAPXMydmiBcaKEPXLd9PWs0dRatQH
 Qctw==
X-Gm-Message-State: AO0yUKXQJGYvkYpEDDJl/1tdMElOf6JeMQKtBNKTo52Wsfl35dQRDW46
 mSubRaUf/WScC+3TVAAnNm4DoA==
X-Google-Smtp-Source: AK7set+G6v4fTd/VzInWr6SlEqXDuRj+KXNvioIJfnHjqM1MEY5B+GzJ2D+7/QwL78gL1OFFZQnTAQ==
X-Received: by 2002:a17:903:283:b0:19a:9641:d1ef with SMTP id
 j3-20020a170903028300b0019a9641d1efmr1214951plr.18.1676158475039; 
 Sat, 11 Feb 2023 15:34:35 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 6-20020a170902c10600b0019945535973sm5511251pli.63.2023.02.11.15.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:34:34 -0800 (PST)
Message-ID: <2de9abc0-8354-0cc1-dedd-5d4692afc54c@linaro.org>
Date: Sat, 11 Feb 2023 13:34:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230210221951.1298668-1-smostafa@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210221951.1298668-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 12:19, Mostafa Saleh wrote:
> +static bool smmuv3_gbpa_needed(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +
> +    /* Only migrate GBPA if it has different reset value. */
> +    if (s->gbpa != SMMU_GBPA_RESET_VAL) {
> +        return true;
> +    }
> +
> +    return false;

Just "return s->gbpa != SMMU_GBPA_RESET_VAL;".

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

