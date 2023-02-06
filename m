Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0078B68C9CA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:53:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPAL6-0004Tw-OY; Mon, 06 Feb 2023 17:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPAL5-0004TY-1w
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:51:55 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPAL3-0007Eg-GH
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:51:54 -0500
Received: by mail-pj1-x1031.google.com with SMTP id d2so9448679pjd.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GJrjy2s0yjMOXAWetmdDetDS3qzVo1eja11Qp8PyQaE=;
 b=MaRxdj7yFGOHIFIcId4CgBrj26voF8s2e296IBxMaBMl3UJcs8c+IEb9DvTubv2ab2
 DEywGmGEy9vZA0GdXeS3CmQd/deF6Vzo5pAAXaWo5NkoXGrNl9dMVb6r2WZpHesMKKar
 IkmcvQl14Y3Vd+gBLa8BLRx2DSWNg6ZxNf8uL+1ccRZEmPxWdOHJKHkIRQIVZ6cBrgYW
 NTHW82WLucg3lwajRtkaxVmbB+J5owAwHa2zqHBnhrJfCSxnwEcBToJ2yXL/LNJOpk5p
 dY54SoOrfNDsUZWcRB3ywhvC/cLvKb3WL3YE4QW306TB3natZ+nchNjAXUneBBIb8VQu
 FAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJrjy2s0yjMOXAWetmdDetDS3qzVo1eja11Qp8PyQaE=;
 b=ENjaK1geOkDhzSPoRO2hxvxMY0AC4y0qpWEOrUfI3nIH8AZH9JIRMqrHAc0nONLoW2
 fG2m8wwlDv2sE6IBSvLbd3GhE2tFSdn3QHUFRVQJk2o/IvmEMyH4HrEO7Hb0Fdk4C8tk
 vCwTff8WKHoYJC0KxmBGkFHefUOx+eV73oWfUvRuS9nAKEq8Wrc6V6/daxUvYSL0posO
 um3Hd/n/a6LDKug922vwFzo+aRAqNagR8eCB9/PDfcm8eeQ12aN1MA15viZXPC6Cmsl2
 gQzS8yKpkKm/Yh6BsA10I2yGEy8hXsxk7+IMX93qEsKPKpfIzCZt9UWT5zee2GrHsBzM
 CcbA==
X-Gm-Message-State: AO0yUKUzIE2I7x8mzTjnd4IeuSrGgyvfuvaSn56QClVIWbmkZsrmpUpr
 tmSHHOj7l/A05ARyekBpexyakQ==
X-Google-Smtp-Source: AK7set/BxnrNjr7LSqhZ89fOuN303ISUMDTll9Xxe0oRznIh/2E936A5/A8H97Vh2zHK5qFcFWbeMg==
X-Received: by 2002:a17:902:c40f:b0:196:e8e:cd28 with SMTP id
 k15-20020a170902c40f00b001960e8ecd28mr716377plk.15.1675723911912; 
 Mon, 06 Feb 2023 14:51:51 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 i13-20020a170902eb4d00b00186b7443082sm7429048pli.195.2023.02.06.14.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 14:51:51 -0800 (PST)
Message-ID: <1a98301c-2d5e-591f-76d4-4f4c4a0b25ba@linaro.org>
Date: Mon, 6 Feb 2023 12:51:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 01/16] hw/arm/smmuv3: Add missing fields for IDR0
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-2-smostafa@google.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230205094411.793816-2-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/4/23 23:43, Mostafa Saleh wrote:
> In preparation for adding stage-2 support.
> Add IDR0 fields related to stage-2.
> 
> VMID16: 16-bit VMID supported.
> S2P: Stage-2 translation supported.
> 
> They are described in 6.3.1 SMMU_IDR0.
> 
> No functional change intended.
> 
> Signed-off-by: Mostafa Saleh<smostafa@google.com>
> ---
>   hw/arm/smmuv3-internal.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

