Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1416819D3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:05:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMZRb-0006XX-TI; Mon, 30 Jan 2023 14:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZRR-0006Wv-9F
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:03:48 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZRO-00023x-2i
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:03:44 -0500
Received: by mail-pl1-x62c.google.com with SMTP id be8so12663118plb.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cldVkEOBEK4xSOlEgPNBqk4WdPF4KskiZ+LCYJfiZ90=;
 b=l4z0EtGQ7ZzZwlvo0xezjXPQkWRFexoSxsGjQBwby5Aky9w748j4j1lJPxSnkDUKIw
 /YjQgy24Cl47HCzeIX4RzDasE+V4UE05H6EdEZ/7PsCYqwqQlXBHt1vQtOvlmp3eTzKN
 v4CXc1rvQCtmikSc3dMWFe/LcCO1A7D0e8ek1eXrZeKmV/Ge7gEP1cReTF3l5VcBn8jH
 amtnITbVcOg55FZ1jcUJ8f6fibAImZEUPRysmP1uW9uat++UyQPnCIyc9Rjp8hy9JxYC
 Tp6qsOwO+AFWWQUSVTJ1iGO4kVNvP8AWNfYTN08g8nIvonlvhsFykiBXZmvJpP06XM49
 1ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cldVkEOBEK4xSOlEgPNBqk4WdPF4KskiZ+LCYJfiZ90=;
 b=eLwFKT4iHzL8MAA7oKJZBe5xKOb2wROAql60aWRI+Sxho2FpKOqt/pFUwE21/FXiBM
 WePqDX0O3URgYAsx45SUho9X7MiBqb7qjMJFB6KPGPrPrSlgoNnWIpSoac6fnx44f/mS
 xb4/it4IEHVi2B4eDSc7zHXot534MZz7T7drWfVxa3ceRQ0hGJqUZeCm+DJ5DB4ZBumB
 Qjrtxwo/CG4sXmSSdDmJtTYw+SFXNP9hZ/keMMc4pH+a1w85YJWFkDz7gm+ocaMpnSl5
 XSlE/kR7xqqPRYpmVPJkR+A1SaG8pUil3h3V3UqLK2AkpG0v4cR8Eo6awzmXvZPKkrjh
 TUbQ==
X-Gm-Message-State: AO0yUKVEMi/+Vu3V2JRkx5Tv3BF3Whf47NbQ7iNV1fWHA7TWnkQSOiV1
 DlRj1PVq9S8Xrf+E5ze74XCi+w==
X-Google-Smtp-Source: AK7set90TPrhz763+UcQmuO9lTPOBXa74+LycnBOUB1uOePZj08WatUVvxlIkmqZHBJqPCPwW93U4Q==
X-Received: by 2002:a17:902:c24d:b0:196:3bbb:e9db with SMTP id
 13-20020a170902c24d00b001963bbbe9dbmr19269606plg.10.1675105420083; 
 Mon, 30 Jan 2023 11:03:40 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 p24-20020a170903249800b00195e6ea45a8sm8124901plw.305.2023.01.30.11.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 11:03:39 -0800 (PST)
Message-ID: <41e5c5bd-9328-c99e-e37b-aadd2b7d308b@linaro.org>
Date: Mon, 30 Jan 2023 09:03:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 08/14] RISC-V: Adding T-Head MemPair extension
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-9-christoph.muellner@vrull.eu>
 <48ff4151-25d9-4b4d-d50a-6516000599c7@linaro.org>
 <8385d954-678e-d78d-c3ae-d74a4a902907@linux.alibaba.com>
 <7f8383f6-e860-5e3e-e89c-dfdac4e05dc5@linaro.org>
 <82e49515-512f-9439-ceab-6c5df3bb20e4@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <82e49515-512f-9439-ceab-6c5df3bb20e4@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/29/23 22:41, LIU Zhiwei wrote:
> 
> On 2023/1/30 13:43, Richard Henderson wrote:
>> On 1/29/23 16:03, LIU Zhiwei wrote:
>>> Thanks. It's a bug. We should load all memory addresses to  local TCG temps first.
>>>
>>> Do you think we should probe all the memory addresses for the store pair instructions? 
>>> If so, can we avoid the use of a helper function?
>>
>> Depends on what the hardware does.  Even with a trap in the middle the stores are 
>> restartable, since no register state changes.
> 
> I refer to the specification of LDP and STP on AARCH64. The specification allows
> 
> "any access performed before the exception was taken is repeated".
> 
> In detailed,
> 
> "If, according to these rules, an instruction is executed as a sequence of accesses, exceptions, including interrupts,
> can be taken during that sequence, regardless of the memory type being accessed. If any of these exceptions are
> returned from using their preferred return address, the instruction that generated the sequence of accesses is
> re-executed, and so any access performed before the exception was taken is repeated. See also Taking an interrupt
> during a multi-access load or store on page D1-4664."
> 
> However I see the implementation of LDP and STP on QEMU are in different ways. LDP will 
> only load the first register when it ensures no trap in the second access.
> 
> So I have two questions here.
> 
> 1) One for the QEMU implementation about LDP. Can we implement the LDP as two directly 
> loads to cpu registers instead of local TCG temps?

For the Thead specification, where rd1 != rs1 (and you enforce it), then yes, I suppose 
you could load directly to the cpu registers, because on restart rs1 would be unmodified.

For AArch64, which you quote above, there is no constraint that the destinations do not 
overlap the address register, so we must implement "LDP r0, r1, [r0]" as a load into temps.


> 2) One for the comment. Why register state changes cause non-restartable? Do you mean if 
> the first register changes, it may influence the calculation of address after the trap?

Yes, that's what I mean about non-restartable -- if any of the input registers are changed 
before the trap is recognized.


>> Yes.  Conciser what happens when the insn is encoded with .long. Does the hardware trap 
>> an illegal instruction?  Is the behavior simply unspecified?  The manual could be 
>> improved to specify, akin to the Arm terms: UNDEFINED, CONSTRAINED UNPREDICTABLE, 
>> IMPLEMENTATION DEFINED, etc.
>>
>>
> Thanks, I will fix the manual.

Excellent, thanks.


r~


