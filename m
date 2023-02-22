Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDA569F1EE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:38:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUlZ3-0006pg-7Z; Wed, 22 Feb 2023 04:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUlYz-0006pM-3s
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:37:25 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUlYw-000666-Jd
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:37:23 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 e18-20020a0568301e5200b00690e6abbf3fso1584814otj.13
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 01:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CIkmAC1MoOAT0Eup7YMIXf7xR9rrgpsS8KntAt6SQjs=;
 b=cjmpfhFfaKGt5s1dp8ki9+0Dg9VnbhJhVHlEVLogFAf6BTJLcvibQwfdu59Y494lEz
 Euf3SkbQRPJAvNXZr1g/+qaVUOzM8vVhTkPFJhz0cL853Rp3LskequXFf8uPsuBs9j55
 IWtVPlUcNM+2y6pWxH04JnzX+bpgSuTdPn0zQC9zTipsuCVpvseCKKJs847o54Z6Ubr+
 vEq7FDoUCQT+2eaARQuUCpgfb6sexQD9v5Iugia22mtFmM4Okny9eMgefQ831CE9HOPg
 Gc1ejkXk0a6pcGDGlGgC8LS+nQjhkP0HVVRMUGFhK12E6anq23q+M/oCpaNXamIf3buq
 P6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CIkmAC1MoOAT0Eup7YMIXf7xR9rrgpsS8KntAt6SQjs=;
 b=KuCjEs6a8+lk/dYmnlDn5z+Wjdweh5/fhvZENCfWhJhhGv52A2htS+UH2sbxzgDFFH
 K3YcxVdfrDbzshR4b+Hbxg580KhJSfDcLqXV1S7jzFYUDv/+mPdw/xbbvWJcyNvG+CkM
 Cp+fhQ696OJH7QB5zCiWTSStJflhwdHAGx7osyFdEwPd2nCjiZJEjZo9YI58yw2w7RF0
 ZqYxxfuDEPs4Je9xTgI9MUbQ0TaCnU0n9KM6fkhHp6/SAIQA5HKRVpB5a8myYzpTJbGu
 Iy07Uvo8bl6l2lLplLTjcC0NRCNA6ijidBFcRBIyAESZhfR0zM/ZqeVO2jAqOEmjeJ/a
 L9zw==
X-Gm-Message-State: AO0yUKUOBhAQgw44GM7CzhFk/JJgj5sxjvBsXAReLWCjbyhTJXUUKkKM
 DxItdoIF7bpupD3ujtd5i4zR8g==
X-Google-Smtp-Source: AK7set9MHn4+ORszbDkGLXtWd6NL7jeZxkE0GllrGwjaL4EX0Zun61ABCRDRFdjm0fNcZOlGA9pHmg==
X-Received: by 2002:a9d:489:0:b0:68d:81ce:a8c1 with SMTP id
 9-20020a9d0489000000b0068d81cea8c1mr2797881otm.13.1677058641468; 
 Wed, 22 Feb 2023 01:37:21 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 2-20020aca0f02000000b0037b6f5d6309sm1217337oip.2.2023.02.22.01.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:37:20 -0800 (PST)
Message-ID: <4247ca1b-aa4c-9494-e634-c8114758bfcd@ventanamicro.com>
Date: Wed, 22 Feb 2023 06:37:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 2/4] target/riscv: implement Zicboz extension
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
 <20230217203445.51077-3-dbarboza@ventanamicro.com>
 <20408b85-2ad0-4cbc-4ccd-c512ba15ba06@linaro.org>
 <d468f8c6-f8ec-6d40-44ab-3e76df458680@ventanamicro.com>
 <4e3ac25e-6443-9365-66e4-ebd903aa29b9@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <4e3ac25e-6443-9365-66e4-ebd903aa29b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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



On 2/18/23 16:35, Richard Henderson wrote:
> On 2/17/23 23:28, Daniel Henrique Barboza wrote:
>> "A cache-block zero instruction is permitted to access the specified cache block whenever
>> a store instruction is permitted to access the corresponding physical addresses and when
>> the PMAs indicate that cache-block zero instructions are a supported access type. If access
>> to the cache block is not permitted, a cache-block zero instruction raises a store page fault
>> or store guest-page fault exception if address translation does not permit write access or
>> raises a store access fault exception otherwise. During address translation, the instruction
>> also checks the accessed and dirty bits and may either raise an exception or set the bits as
>> required."
> 
> By the way, I think the documentation should specify what happens if the page is *not* accessible.  Is badaddr = {rN, aligned(rN), unspecified, but somewhere in the block}?
> 

Do you mean that the doc should tell whether the address to be returned in the store
access fault should be aligned and whatnot?

Yeah, this is not mentioned in the docs. I think you're wondering if we should do like
ARM does, like you're mentioned in the previous version:

=======
While re-reading the ARM code, I remembered that the ARM dc.zva instruction is required
to produce original unmasked address on a page fault, thus the little dance with two
calls to probe_write.
=======

By reading target/riscv code it seems that all store acess faults are being fired via
raise_mmu_exception(), which is only called in riscv_cpu_tlb_fill(), which in turn
doesn't do any thing special with the address before firing the exception. So I guess
we can assume that badddr = aligned?



Daniel


> 
> r~

