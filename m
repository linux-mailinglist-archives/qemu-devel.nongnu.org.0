Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EB6A4AD8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:28:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWj9B-0003RR-Qn; Mon, 27 Feb 2023 14:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWj99-0003PW-5v
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:26:51 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWj97-0002MP-Dl
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:26:50 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso6189531pjs.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qdFh2V6HSC2EckFK431m1XA1WOm4ejtC6mH3D4Snyzo=;
 b=O+Hl6IjA4/4z+AcwtfMVJ7ZC1wPBr/8pPs2eIzu9rp60w0hCPBFu8kOgAND7FhLEQP
 zX80nZge1jK2jgpw2Mqv5sJNLRRi+09Qdvn651hDX6S8Ofv3Z7Cq3OO9qnIwCjCNGWI8
 QskV7DmPU8eI3lI8mWrE5+lU6CdqE2ttKY7Iv49TICTinwmd3xJK1oKb+lWrWcZblwM1
 DllXHntxIabb+D4ltb0gfc2/WSpRgT4mmiVJlSiAdt1IPEnSfwAxFIAJTxN3anjrOrI2
 eUidT8MqyaMoIweEWl1MriA63D5NwmMB4o2kLiYZUUFABv9T/mYshIL1gTfD/alTKy69
 0pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qdFh2V6HSC2EckFK431m1XA1WOm4ejtC6mH3D4Snyzo=;
 b=MWQE/ThRMkmXxIO1ApsonMA1Uq68PSccFV+cjL178Ean0aEdVslIhZWnA4NYXNiqOU
 7EooXmBckjyRQHhisDhl4fQTK1CLGxcbB+Uaeh6IobuC1+z/nHv8I7Y8BSAS98F36UoN
 i4g1kRry0nwd/qxTM9u+rt1Fu9qHDR/OVyq1sfTe4FCTqxSdk3nE7y36W+y6XD2UCpNH
 JVPp2q1DJK/4ZRTXRBxO9ztkVwYkYblUXXRacI4N/usatv5jrVG+J4twyPGYE1JNuR24
 Nmyq+dtSIW7gyRKeEsIXb34sP5ODOEL5X9cJoza0+/RgvT/TMSLL9tYSCbZ6Ug3rn1+u
 OZLA==
X-Gm-Message-State: AO0yUKVlvEuZnVeTiQ5hvM+/K1MhcAj2l+tMvH4MNZYGN8UU6qxvpzYQ
 9SLB6JBb17cXsV1Cn4ELN6sdIA==
X-Google-Smtp-Source: AK7set/vw+/PocIwWlmegxUs78p1wB6e50xu6lZvPfwFhAms5H0fnjZ2v4LwBAkyGWeEd4h2Wy4/iw==
X-Received: by 2002:a17:902:d2cb:b0:19c:df25:53cc with SMTP id
 n11-20020a170902d2cb00b0019cdf2553ccmr513714plc.22.1677526007721; 
 Mon, 27 Feb 2023 11:26:47 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 y9-20020a1709027c8900b00186a2274382sm4943673pll.76.2023.02.27.11.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:26:47 -0800 (PST)
Message-ID: <dd842c9d-4e01-d256-70d2-892818cb133a@linaro.org>
Date: Mon, 27 Feb 2023 09:26:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 5/5] arm/virt: provide virtualization extensions to
 the guest
Content-Language: en-US
To: Miguel Luis <miguel.luis@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Marc Zyngier <maz@kernel.org>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-6-miguel.luis@oracle.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227163718.62003-6-miguel.luis@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/27/23 06:37, Miguel Luis wrote:
> -    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
> +    if (vms->virt && (kvm_enabled() || hvf_enabled())
> +        && !kvm_arm_el2_supported()) {

The ordering of the tests isn't right -- shouldn't test kvm_arm_* for hvf.

     virt && ((kvm && !kvm_el2) || hvf)


r~

