Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC949C005
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 01:14:31 +0100 (CET)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCVxF-0000MI-T1
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 19:14:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCVsO-0005w3-9p
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 19:09:28 -0500
Received: from [2607:f8b0:4864:20::1035] (port=38621
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCVsM-0006EG-H0
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 19:09:27 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so3203519pjj.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 16:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4HF7wLuxfSuEzncaeCa3tIHO8CR4NPk77onD3UVpJvg=;
 b=itGmavk1zdREbPigpEtPtzfU/HVtIT2bVt9D/SEvH73RhRBj663/g7lqd/NbzwZn2v
 v3stk3Lo2e9pf4zq6ULDDBHuqlGlb1Q4nMhAyJe15LSs7YMTSH+VoBwR6q1sLTIT68ND
 4eAdiX0Zc/hizL+X7pmbhskyILX9scEYqwITq9zB6MS+Co7ek/ou4IMZR9cfvzxt0Cez
 QhZbzErrOLDrfIf/8TqnaI/vWzRkWrnCQGOecnVgUOseP1QLGwPw+x2Nj799aeCo6phE
 L02Y6Qjtw6BTaHdRkQNQhPiwtoBTyDmhATJtUHwoZ6K8uwxf5CJryyF34/vyzbmC1iWB
 XguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4HF7wLuxfSuEzncaeCa3tIHO8CR4NPk77onD3UVpJvg=;
 b=rx5GsVmVb8+xcjBv5YRSoOqdntTS3mn2iuf8a3ue1qCCGXmjzv8E09DPLgDKbMJPqV
 VfzJ7fTErEPWAVsJrXU4XGRWsxKQXkKZS6QONm7+BqF4TY9ffeDT9Qj9cgI1GWL/17gX
 /JtmTLgSKd8Z9hAr0iKBbOSVWgwYzhrfBNx5XRK1kGFcYklgy3lWmnXqw0pmZAHDCUr6
 pGFDQVdRFzvG+9QPBSiI8Z/6sLM9UFogMwQ1jhaMKs+LdjyTn1vQVTKEMD5gGurlcCZZ
 qPEmS9X50xwKfDsk5AIYt1mIv+NP7qJCAsCbDatYyeeZ6RmcgLUWuT7COsSLc0PH65mj
 e0ww==
X-Gm-Message-State: AOAM532EIUk2l1/mlogc64J71ik+i+xHmt1asLIcmVgc8jgroBfIcIrU
 1cqDASt4BWm+trqxOo75zRIESg==
X-Google-Smtp-Source: ABdhPJwU6JrfOAXbVOwlxvWATaGt8eYUk5wvgR3gNr6tBT5IfX/klz/uTl9DN7iB1liO6muoxmGK8A==
X-Received: by 2002:a17:902:ab8d:b0:14a:98aa:b87 with SMTP id
 f13-20020a170902ab8d00b0014a98aa0b87mr21208453plr.100.1643155764798; 
 Tue, 25 Jan 2022 16:09:24 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id om6sm1478217pjb.24.2022.01.25.16.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 16:09:24 -0800 (PST)
Subject: Re: [PATCH 0/2] RISC-V: Correctly generate store/amo faults
To: LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
 <bdc7e993-1baa-0ce9-75f9-fc078617ed4f@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9fe41ac9-f0d9-1122-7ec3-3f20e3667826@linaro.org>
Date: Wed, 26 Jan 2022 11:09:15 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bdc7e993-1baa-0ce9-75f9-fc078617ed4f@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 alistair23@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, bmeng.cn@gmail.com,
 palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 4:17 PM, LIU Zhiwei wrote:
> 
> On 2022/1/24 上午8:59, Alistair Francis wrote:
>> From: Alistair Francis <alistair.francis@wdc.com>
>>
>> This series adds a MO_ op to specify that a load instruction should
>> produce a store fault. This is used on RISC-V to produce a store/amo
>> fault when an atomic access fails.
> 
> Hi Alistair,
> 
> As Richard said,  we  can address this issue in two ways, probe_read(I think probe_write 
> is typo)

It is not a typo: we want to verify that the memory is writable before we perform the 
load.  This will raise a write fault on a no-access page before a read fault would be 
generated by the load.  This may still generate the wrong fault for a write-only page. 
(Is such a page permission encoding possible with RISCV?  Not all cpus support that, since 
at first blush it seems to be mostly useless.  But some do, and a generic tcg feature 
should be designed with those in mind.)

> In my opinion use MO_op in io_readx may be not right because the issue is not only with IO 
> access. And MO_ op in io_readx is too later because the exception has been created when 
> tlb_fill.

You are correct that changing only io_readx is insufficient.  Very much so.

Alistair, you're only changing the reporting of MMIO faults for which read permission is 
missing.  Importantly, the actual permission check is done elsewhere, and you aren't 
changing that to perform a write access check.  Also, you very much need to handle normal 
memory not just MMIO.  Which will require changes across all tcg/arch/, as well as in all 
of the memory access helpers in accel/tcg/.

We may not want to add this check along the normal hot path of a normal load, but create 
separate helpers for "load with write-permission-check".  And we should answer the 
question of whether it should really be "load with read-write-permission-check", which 
will make the changes to tcg/arch/ harder.


r~

