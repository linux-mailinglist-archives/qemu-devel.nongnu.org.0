Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DD844C3E1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:03:03 +0100 (CET)
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkp7u-0006I0-9i
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:03:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkp6S-0005Cp-R4
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:01:34 -0500
Received: from [2a00:1450:4864:20::32b] (port=51079
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkp6O-0000mR-T5
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:01:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id 133so2506806wme.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6F9tyQWkl1DvdchY5fcBIazC71pRLDxvW7c1e/SgweE=;
 b=UbjaCH6UgHkqwOIsvoX9PXXe/h4XlaVjEacPg5tz3w61NYL8POOkZ/aeqoL7Yhkus3
 qOwnufrn1ONfQh0kgs2dX/xmx+iXCes9FFFBlFgcToDDnPXT6kbddj6J1wriznhuV14Z
 AD6luY6eBPy/nb/soP3QijF/M34DOOMVvB8McvDAJVonCHHGiJRltkORBg9qY9oQZu1n
 igkGgJQosq+Z2aatBbaCISOpAklBG8IE6L8NZbhiPkFezLPy4OpEE0SQDqPczySBSBav
 Xc+nLV2L3ToGlkZWV7FFrGjqAlGX9OIE8GE3EThqnYE+Z/TbkEZ7i/UHwbCwgkentUy4
 E2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6F9tyQWkl1DvdchY5fcBIazC71pRLDxvW7c1e/SgweE=;
 b=I8Cn0vOtlaJvLjwtKJx1IZGmtNVaSz6ithT4TUY/dAf5grEi/+Az1HB2nb4uB1VB3W
 eh/2oyelB8Dt62km60hnC9bsaGwtBiAOnBh4O8yi2jLb05lFUrLUXKo3MlcAsKVegZhU
 B1Yx3E8Lgoyo5nIITkrHict4tMdQ69NwF5BLAbvbnmTSgAiaIG6WzWjgkUVA1cvNL3Yj
 cVaeU0/bWjwzn19B8rIo3xZrjvyRP8NyA9/+v6gTJOwiBpQRTEwunE6QP4Tt5EIYnNbX
 7rcZ4jjmBKpUJpF6rXoK9cgSCGZoL5jNW3qS7ZSA0Ku8Iv7hUSVIZ6/Gf5xL3cIfA0w7
 WIJw==
X-Gm-Message-State: AOAM533ThtDLvgvZ19KJYsBg2KTBiV85BuG0Lk21TsL0fVJonH8sOrbk
 a/66dWRahwKrDvAwwtFNZ8BAzg==
X-Google-Smtp-Source: ABdhPJyv5c2Lf5Ai40QBWsrUfdH8yOZYCXnpSRhTU3ZHsYz7zhZczkT7rOkwiQ9FoV87Wl8zAfcVwQ==
X-Received: by 2002:a05:600c:2118:: with SMTP id
 u24mr16945252wml.0.1636556486241; 
 Wed, 10 Nov 2021 07:01:26 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id z15sm102400wrr.65.2021.11.10.07.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:01:25 -0800 (PST)
Subject: Re: [PATCH v2 12/14] target/riscv: Split out the vill from vtype
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-13-zhiwei_liu@c-sky.com>
 <df7ad986-8430-9994-83ac-33db2ec1f2e3@linaro.org>
 <6c0631e7-bb7c-f69c-c5fd-4023c392a7e6@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5467bfee-b9dd-1f72-c93c-82f9f77481c0@linaro.org>
Date: Wed, 10 Nov 2021 16:01:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6c0631e7-bb7c-f69c-c5fd-4023c392a7e6@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 3:26 PM, LIU Zhiwei wrote:
> One question here. Even come before patch 6, we don't have a simple way to choose vill and 
> reserved fields from s2 register in patch 6.

You can certainly split out vill before you create a new way to select it based on xlen. 
In fact, you *should* do that as a separate patch before extending helper_vsetvl to handle 
multiple xlen.

Note that vill is always at the msb, so it's easy to find without necessarily defining an 
XLEN32 field.

As for the reserved "field"... how about

     reserved = MAKE_64BIT_MASK(R_VTYPE_RESERVED_START,
                                xlen - 1 - R_VTYPE_RESERVED_START);
     reserved &= s2;

> As env->vill will be used in read_vtype,  we still need to covert env->vill type to 
> target_ulong there.

A cast in read_vtype will do.  Explicit casts to uint32_t/uint64_t would remove the need 
for an ifdef in that function as well.

> Is there any benefit to use bool instead of target_ulong?

Self-documentation?


r~

