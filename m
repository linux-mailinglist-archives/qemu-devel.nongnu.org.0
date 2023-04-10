Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDAA6DCAD5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:36:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plwMd-0000z9-73; Mon, 10 Apr 2023 14:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plwMa-0000xG-FE
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:35:36 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plwMY-0004tD-NV
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:35:36 -0400
Received: by mail-oi1-x236.google.com with SMTP id bh10so3854315oib.1
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681151733;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nPTWeDL3468+QPqj1nlFyIfB1RZ591sAixxr9adplMo=;
 b=om8pDnZM2IEzGhjHvPMVotF+Bd0OPvp0L2WycdBnwqlBprmblLB4gxhSOsaOsUSE4b
 Qtc+JFcWOC1XXpcP7UIcwNifpqtzVa2tRlAL7KMn8UjnyeE4WJ9G5iwvGfxoZGLeV0G0
 IAOU2FNzFCuHMJCZ0KNAKQvdastIc9Q2S7UkIbRiBH7n9qDubMK6oBduFfpKo5VKHQ4I
 RP8AzLGsIUzsAn8lCSvmtuFR5qUfcaxjTzlcNslafhsdM/0Q9g7apqTbxPlqhs5Ij0o4
 g0cKNknrkYHseLZ9Ma483lwkpFU3Kbb2stAB/vQHdD0fK2j38fNQ97npHsAUWrcYUWNY
 nfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681151733;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nPTWeDL3468+QPqj1nlFyIfB1RZ591sAixxr9adplMo=;
 b=P+44Exzo56ZwEUQ8wVUhQuXAr0DoeNXcstQuDTwpvA2a7Dh3tNrGO9QziP+uzOq+Qm
 Dh/nh75srrXv5PVKlyx+pXDVF/tS9riHcszf9YBaKUuK5BAO5TldR4xFTEmQi0X0jDH4
 rw7RRkklgXb8ERm+ozYym7ojKEYjP9hvkyboud8UqITHNRM9FhpT2HOBFmcvOYPgM9a5
 8jGJilGrjmWw1EuAeRrwHnZlT3o08Kf/I0lAdLhxB9z1Ca5eo//TQA/ZegyALuP69AdO
 Yo39dj05QCIsS2glSIsfxS7PYalYqIcg0asoHRqSXUt8HQ9pjwt8BWFps0IdqC+kN9Am
 Wyag==
X-Gm-Message-State: AAQBX9el7LTliC0BKrvweCdyWN2N4VyKZU3Er+n+UOdGT4m1cz+uhlCN
 GalDwrcF/JtKtTxYdPh+AYr2pQ==
X-Google-Smtp-Source: AKy350YTGGL6K/VGcBAi+1cJiPImeS7N+625FuYOfXp9JfPANNkK7ATuOIxXGiYKdzukVtwdJ3RV3Q==
X-Received: by 2002:a05:6808:1a11:b0:386:e309:cfbf with SMTP id
 bk17-20020a0568081a1100b00386e309cfbfmr6612784oib.13.1681151733552; 
 Mon, 10 Apr 2023 11:35:33 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 q127-20020acad985000000b0038756901d1esm4733436oig.35.2023.04.10.11.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 11:35:33 -0700 (PDT)
Message-ID: <64a2cbe7-e1ed-f309-f99a-7bad02c8e39b@ventanamicro.com>
Date: Mon, 10 Apr 2023 15:35:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/2] target/riscv: Separate implicitly-enabled and
 explicitly-enabled extensions
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230410033526.31708-1-liweiwei@iscas.ac.cn>
 <0fd5d633-8aac-4186-a7b8-0e27f416bb3f@ventanamicro.com>
 <4d88929f-56c6-db02-c9ba-cd5fd5a63bca@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <4d88929f-56c6-db02-c9ba-cd5fd5a63bca@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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



On 4/10/23 11:20, liweiwei wrote:
> 
> On 2023/4/10 21:48, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> On 4/10/23 00:35, Weiwei Li wrote:
>>> The patch tries to separate the multi-letter extensions that may implicitly-enabled by misa.EXT from the explicitly-enabled cases, so that the misa.EXT can truely disabled by write_misa().
>>> With this separation, the implicitly-enabled zve64d/f and zve32f extensions will no work if we clear misa.V. And clear misa.V will have no effect on the explicitly-enalbed zve64d/f and zve32f extensions.
>>
>> For this particular case of write_misa() I'm not sure if we need all that. If we want
>> to grant user choice on write_misa(), let's say that the user wants to enable/disable
>> RVV, we can enable/disable all RVV related Z-extensions by hand. It's just a matter
>> of writing enable/disable code that write_misa() would use.
>>
>> In the end, write_misa() is also an user choice. If write_misa() wants to disable RVV,
>> this means that the user wants to disable RVV, so it doesn't matter whether the user
>> enabled zve32f on the command line or not - we disable zve32f as well. Same thing for
>> RVC and its related Z-extensions.
>>
> Yeah. It's also a choice. It's a question whether we take C_Zca and C as the same user choice.
> 
> If we consider them as different, then this patch works. And this patch can bypass the priv version problem.
> 
>> The reason why I didn't do this particular code for RVC and RVV is because we have
>> pending work in the ML that I would like to get it merged first. And there's a few
>> caveats we need to decide what to do, e.g. what if the user disables F but V is
>> enabled? Do we refuse write_misa()? Do we disable RVV?
>>
> In section 3.1.1 of privilege spec:
> 
> "If an ISA feature x depends on an ISA feature y, then attempting to enable feature x but disable
> 
> feature y results in both features being disabled."
> 
> Even though there is also another description in the following content of the same section:
> 
> "An implementation may impose additional constraints on the collective setting of two or more misa
> fields, in which case they function collectively as a single WARL field. An attempt to write an
> unsupported combination causes those bits to be set to some supported combination."
> 
> I think the former description is more explicit.

Yeah. Disabling a MISA bit should disable all dependencies of the bit and there's
not much to discuss about it.

As far as the current write_misa() impl in the mailing list goes, we're refusing to
disable the bit (e.g. the validation would fail if RVF is disabled while keeping all
its dependencies, write_misa() becomes a no-op).

If we decide to give users this kind of control I believe we should disregard all user
choice during boot and enable/disable extensions as required.



Thanks,

Daniel

> 
> Regards,
> 
> Weiwei Li
> 
>>
>> All this said, patch 1 is still a good addition to make it easier to distinguish
>> the Z-extensions we're enabling due to MISA bits. I believe we should use
>> set_implicit_extensions_from_ext() in the future for all similar situations.
>>
>>
>>
>> Thanks,
>>
>> Daniel
>>
>>
>>
>>>
>>> Weiwei Li (2):
>>>    target/riscv: Add set_implicit_extensions_from_ext() function
>>>    target/riscv: Add ext_z*_enabled for implicitly enabled extensions
>>>
>>>   target/riscv/cpu.c                      | 73 +++++++++++++++----------
>>>   target/riscv/cpu.h                      |  8 +++
>>>   target/riscv/cpu_helper.c               |  2 +-
>>>   target/riscv/csr.c                      |  2 +-
>>>   target/riscv/insn_trans/trans_rvd.c.inc |  2 +-
>>>   target/riscv/insn_trans/trans_rvf.c.inc |  2 +-
>>>   target/riscv/insn_trans/trans_rvi.c.inc |  5 +-
>>>   target/riscv/insn_trans/trans_rvv.c.inc | 16 +++---
>>>   target/riscv/translate.c                |  4 +-
>>>   9 files changed, 68 insertions(+), 46 deletions(-)
>>>
> 

