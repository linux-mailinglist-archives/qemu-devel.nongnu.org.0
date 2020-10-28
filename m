Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971429D2C1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 22:34:52 +0100 (CET)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXt5n-0008JJ-1v
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 17:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXt4N-0007nQ-Nw
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 17:33:23 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXt4L-00011R-RT
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 17:33:23 -0400
Received: by mail-pl1-x644.google.com with SMTP id t22so259316plr.9
 for <qemu-devel@nongnu.org>; Wed, 28 Oct 2020 14:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hl8eZrnUazypVpmS84gj/jRQ+6BQ0RDKqt+nbHgCpVM=;
 b=rgrYWEXpMz/vNkYKfWRywyFzcRP/Ivf6X9PTzsMd3gi+Pbbs4skjwLZkHWxytuNi+f
 IkFa4R09frGtoMegq4PRSEakpm4Pcq8SvLuL9miNKFDn1Qd2iSa2hs3QvvfJV/90AhL4
 YfiA2eJ+4ni2PCyP4sr2hVKFaeB3cXEVapFx8HAhlo9SqPmiAXHzCILdfy+fe2ZLj9Qf
 9N5CXtzz7L8wSDmMLIMp5WsnyXQ/jcm/CcdlGElUndKN+pWtoZt4K9/E70NbP+Al76nu
 UWEckKN0VmX4NM/XhfteuODPwso0MDs4vOKu6jKyKDGE5iKitNY8Yj2XBDe5CjujvhYu
 H6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hl8eZrnUazypVpmS84gj/jRQ+6BQ0RDKqt+nbHgCpVM=;
 b=MiCPqz5Jqne0QMQlp50gSKLq+8y7C4oPMyD7QDILXcceTyQUlCSqY9EZEFSRY7KHwx
 0ud8yX0IXdzCwxQ6HwoEWN+ZqYJNpiFLsq/MAfQAbPTEmfel+9tXENCsQJD6l11Cvx2d
 2KnhYOSBn5DcqYdSxPSyiCsr/rJGOXJcy9pdxcHoc5N0gGYyFXQRPuS53f0uKzZIDYWp
 +WLnCX0A9H7I9vW5cBOi6GkrDI/P2DvthIBWDGGi1/Bj8PnlN4O6boHBvqNrr3Ks1PZT
 GzSiOI3XIlv0oen0qD226LFdFs1sja5gdwQiLKqcIiF1tQ1gS93DgiS/McotSV/mBT1X
 6DNA==
X-Gm-Message-State: AOAM532lVGdus8tM7JSdXC1ByFer6LeFxGM3TxFfD43fYCR/UCJqrZuC
 GNcqYEbrgZIEmeA1yGI+5vW6Og==
X-Google-Smtp-Source: ABdhPJzw6cLIk9NnhARWjj3Cm92THcAd3+vambII4faNkofbN+yxaU67SWaW3Q2cHk6u/vkfuCkfjQ==
X-Received: by 2002:a17:902:342:b029:d5:ab9e:19ce with SMTP id
 60-20020a1709020342b02900d5ab9e19cemr899693pld.48.1603920799419; 
 Wed, 28 Oct 2020 14:33:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y5sm555730pfq.79.2020.10.28.14.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 14:33:18 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] target/riscv: Add a virtualised MMU Mode
To: Alistair Francis <alistair23@gmail.com>
References: <cover.1603896075.git.alistair.francis@wdc.com>
 <d0eeb9ea64462044a67f5b803d6cb62dd10e017a.1603896075.git.alistair.francis@wdc.com>
 <f8c23bed-3b6c-e01d-cb04-ce945d509970@linaro.org>
 <CAKmqyKNGUcz+WkNNY6dac5d0cypAw4jFiBQFvxAwTQyK0mkGtw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6272150f-a828-3f3e-8d1d-722850af92af@linaro.org>
Date: Wed, 28 Oct 2020 14:33:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNGUcz+WkNNY6dac5d0cypAw4jFiBQFvxAwTQyK0mkGtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.921,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/20 1:51 PM, Alistair Francis wrote:
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 3eb3a034db..453e4c6d8a 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -30,6 +30,10 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>>>  #ifdef CONFIG_USER_ONLY
>>>      return 0;
>>>  #else
>>> +    if (riscv_cpu_virt_enabled(env)) {
>>> +        return env->priv | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
>>> +    }
>>
>> This is wrong.  You only want to set this flag in response to one of the
>> hypervisor special instructions.  This is setting it any time virt is enabled.
> 
> Isn't that ok though? I thought this was the correct approach.

No.

Consider: The *presence* of this bit means a change of behaviour in
get_physical_address.

Things are mostly working for you because you then mask this bit off when
installing it to TBFLAGS.  Which you then use during translate without adding
it back on, except for the one place you need it.

The things that won't work are generic bits of code which use e.g.
cpu_ldub_data(), which calls cpu_mmu_index(), change behaviour.  Which you
don't want.


r~

