Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5512549BE4B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:15:59 +0100 (CET)
Received: from localhost ([::1]:53538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCU6Y-0003JO-Ad
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:15:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTzQ-00050h-3i
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 17:08:36 -0500
Received: from [2607:f8b0:4864:20::431] (port=38690
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTzN-000412-0C
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 17:08:35 -0500
Received: by mail-pf1-x431.google.com with SMTP id e28so16550056pfj.5
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 14:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aaFZk1AWrpdiuRPQKKFUP3xQ/myqOYoLTGhWgDXhju0=;
 b=izS6wbVEw3lFPf6hbSeUEb7tYhM4ug3FLW+Jz0JZnma1B+E2D3sc4nt6k/BooSNFeA
 cU82M6Zv0loPJJQXOegA30TQMPdQf61/HdC8wUscyQUiyv00A3/rBRGdQbSQYfm3Rdum
 vQss2gjvGxffyo/tjc7ebleSv1CWBFVIZIWAVWW6Jhv68hKKddjdtGnpzeg+FCH/nRHn
 DSyiQUy2cgUvPVAaV90dTNMXkCZea8YUt/rRo4R1O9b7twrYcCPs2u8+lrqDg5MOB2Rm
 ylXLllLV25PnFljoEIlpZgNnUTGSFGpx8+K5QKHcmQg55AL9JYaxWTfNCVw1PQXDpMYL
 OegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aaFZk1AWrpdiuRPQKKFUP3xQ/myqOYoLTGhWgDXhju0=;
 b=Oi/blDJyMAwpJffk5dlopn6dYneljt/+fkQLM3kRFCHnn2seIk/YEkwiwj7wQeahSG
 asGrYpEwityd2n306dTSx0Y9g20OK+xc+WtElWv1nQfVnJFDypnVYtb2MksA0JBovJHf
 yAb2W+FfOtcfxSdxQ1abTkHikNRWK4dqGRkEWeLfaUXUcG7Co+w5hVsjRhKNLnabNr92
 nrz57i7TXbMlbU0mKpzBZ8lZGBMBn7s1CWxQeQENA4CnguSWByPLzb3jl1XUAXfUsq2Q
 lyjhk0YmPEQeF+EU3klXxadOuPz5lV5gNRxLleUAc19AbZ1lFPbYur+N1ekXR3j2y7VI
 ZYFQ==
X-Gm-Message-State: AOAM532yzlGK+hnxrxpqWeaK2oYUDqSkaoYsmEnaQOKDIzYN0taM58Tt
 X/XByb1yFKJk0PXJ1gQgJZD45A==
X-Google-Smtp-Source: ABdhPJweDsjyOZNjzOLbMZnadKl8NoSPiUH1dWVUINxxbIcHbSNgW+UqNbjYeZ8Mqzc+iY+cuubDxg==
X-Received: by 2002:a65:460d:: with SMTP id v13mr16689546pgq.373.1643148509256; 
 Tue, 25 Jan 2022 14:08:29 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id y42sm24942pfa.5.2022.01.25.14.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 14:08:28 -0800 (PST)
Subject: Re: [Q] arm: SVE accesses at EL0 is broken with E2H+TGE?
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <6cdfd5de-2465-adca-73b3-9c66945cf18a@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <138138f3-3fd3-b685-1492-060eda777f91@linaro.org>
Date: Wed, 26 Jan 2022 09:08:23 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6cdfd5de-2465-adca-73b3-9c66945cf18a@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kernel.yuz@gmail.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/22 2:03 PM, Zenghui Yu wrote:
> Hi,
> 
> I've just exercised the SVE emulation in QEMU with
> 
> | `qemu-system-aarch64 -M virt,virtualization=on,gic-version=3 \
> |  -cpu max -accel tcg [...]`
> 
> Since QEMU sets ID_AA64MMFR1_EL1.VH for -cpu max, the Linux guest I use
> was booting with VHE enabled and running with E2H+TGE. But I've then
> seen the Linux sve-probe-vls selftest [1] failure in guest which runs at
> EL0 and can be described as:
> 
> 1) Call prctl(PR_SVE_SET_VL, vl == 64) to set the vector length.
> 2) Emit RDVL instruction **but** get vl == 16. Emmm..
> 
> Looking a bit further at the way we emulate SVE in QEMU, there might be
> some issues need to be addressed.
> 
> * sve_zcr_len_for_el() implementation
> 
> Per DDI 0584 B.a, when HCR_EL2.{E2H,TGE} == {1,1} and EL2 is enabled in
> the current Security state, ZCR_EL1 has no effect on execution at EL0.
> We should use ZCR_EL2 instead for E2H+TGE.
> 
> * CPTR_EL2 register accessors
> 
> CPTR_EL2 has diffrent layout with or without VHE, but looks like we only
> take the nVHE one into account. Take sve_exception_el(env, el == 0) as
> an example, we don't check CPTR_EL2.ZEN for EL0 SVE accesses and we will
> never generate an exception even if needed...
> 
> ... whilst Linux kernel indeed relies on a trap to EL2 to restore SVE
> context appropriately for userland. SVE accesses at EL0 is broken in
> that case, I guess?

Correct on both.  Thanks for the detailed report.


r~

