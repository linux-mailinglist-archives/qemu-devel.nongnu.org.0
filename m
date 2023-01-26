Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98F67C307
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 04:10:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKsda-0001u6-Ew; Wed, 25 Jan 2023 22:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKsdY-0001tv-46
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 22:09:16 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKsdW-0000tH-4C
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 22:09:15 -0500
Received: by mail-pl1-x62f.google.com with SMTP id k18so787002pll.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 19:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I4ivT8AAE4lzNER76osvbNwgB024Bjl9ImhCavzrtSI=;
 b=Jr4xXwDBGWmfC1er5X4bwQI9WZhuGS0oskhqf0HfHmb4KEfYERMGAeuTGURt98wvDR
 GH0fOMsq2Hav2ewIFBu4R++GpyqTVPpa0sqJCRRoeydKmdP33R/cX8FRDKy19nqrc2Rr
 I/Uf/FPS+J7FYshqky3HiAYIAxVT2eDkr5BQR0iskAWNIxdqKabzAspMAtpJMhQqHtxs
 QGwgSdifO+Ar4+0ozgmJg2cRL54Aakqc5hHBaJ/shki7fzcx6T9ySJneoB7HMLNbmp/A
 I59CREnAELtXu8aYBXIXXElOXWcK6THjJuXJUzvpm5hSlFkdjXcSeFINCZzI7cBNVf8n
 /34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I4ivT8AAE4lzNER76osvbNwgB024Bjl9ImhCavzrtSI=;
 b=R+KDKUxoHLDAWqG50qOztSR/92ckq2PjNomiX8CmaJO+gC7w+rsWBughCANn3L5edR
 sa+kL7A6Qn9ySTJrd0Ap3wKjRMiAvE6sfILEIKgd9iw5OM5tyTIOYLDtvkfSncF/4tta
 nmglCPTHH/Md0EgfPx4l+4g64xsfgIL+zqBAo6FfnlRWMEpxUf6DvuDUCmOPolarcMRx
 0QkshWWFjSFWfYnJYNM2fJ7ojqG+zajVvWfaIcbE9EGFxrTvj6htdnaK+SHnH9MThwbk
 ti0Fy1q94uPrL+jLGAw40N6EmmdIZQLNXcHgp8YY29ZBz27+INm/3ecYF0RxmFCh2dpH
 JsmQ==
X-Gm-Message-State: AO0yUKXVV8xdD/cDa4eeo96R43hatfD8geRyEdNvAmYgI52JYL2lhXzo
 VU/Vvrzbo4FwscTEZV7WNNwLbA==
X-Google-Smtp-Source: AK7set9ur362/lqi6zAu1vUZ429JDBvXWjcWZ9ZMACpiV5CNnQNm082aO74gbu2jOfFsJH6BtcoYgg==
X-Received: by 2002:a17:90b:4f43:b0:22b:e304:a85 with SMTP id
 pj3-20020a17090b4f4300b0022be3040a85mr10292781pjb.28.1674702551932; 
 Wed, 25 Jan 2023 19:09:11 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 w9-20020a63af09000000b0046fefb18a09sm3838044pge.91.2023.01.25.19.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 19:09:11 -0800 (PST)
Message-ID: <1d938e78-5654-25cc-b901-aa8bf09b5287@linaro.org>
Date: Wed, 25 Jan 2023 17:09:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: ARM: ptw.c:S1_ptw_translate
To: Sid Manning <sidneym@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "philmd@linaro.org" <philmd@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
 <a07b1be0-7ee2-9b7b-a2d7-7d2435f25007@linaro.org>
 <BYAPR02MB55099839E05FC89E5EBB9D9EBEFB9@BYAPR02MB5509.namprd02.prod.outlook.com>
 <BYAPR02MB550960AECCDF2B28D2C4F8EABECE9@BYAPR02MB5509.namprd02.prod.outlook.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <BYAPR02MB550960AECCDF2B28D2C4F8EABECE9@BYAPR02MB5509.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 1/25/23 13:27, Sid Manning wrote:
> On 7.2 VA to PA mappings are not consistent:
> 
>   Thread 10 "vp" hit Breakpoint 1, tlb_add_large_page (env=0xeb7ac0, mmu_idx=0x2, vaddr=0xffffff809977f000, size=0x1000) at ../../../../../../src/qemu/accel/tcg/cputlb.c:1090
> tlb_set_page_full: vaddr=ffffff809977f000 paddr=0x0000000f35f32000 prot=3 idx=2
> Thread 14 "vp" hit Breakpoint 1, tlb_add_large_page (env=0xf185e0, mmu_idx=0x2, vaddr=0xffffff809977f000, size=0x1000) at ../../../../../../src/qemu/accel/tcg/cputlb.c:1090
> tlb_set_page_full: vaddr=ffffff809977f000 paddr=0x0000000f42a16000 prot=3 idx=2
> 
> Using the monitor to view the memory I see that on 7.2 the first entry appears to be accurate.
> xp /2x 0x0000000f35f32018
> 0000000f35f32018: 0x9977eff0 0xffffff80
> 
> And the second is not:
> xp /2x 0x0000000f42a16018
> 0000000f42a16018: 0x00000000 0x00000000
> 
> 7.2 is calling arm_cpu_tlb_fill more often now and I don't know if that is related to the problem I'm seeing or a natural result of the changes made to S1_ptw_translate between the releases.

Well, there are more calls to tlb_fill, since we're now also using tlb_fill for the stage2 
translation, and for the translation tables themselves.  It's possible that there's a bug 
in the stage2 tlb flushing that wouldn't have been visible before (and also not visible 
from the monitor, since that avoids tlb_fill entirely).

While it would still be handier to have a test case, the next best thing may be for me to 
add some tracepoints within ptw.c.  I'll work on that later today or tomorrow.


r~


