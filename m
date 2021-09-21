Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81F5412ECF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:47:37 +0200 (CEST)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZZ2-0002xh-Pb
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSZUr-0000FA-9V
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:43:17 -0400
Received: from [115.28.160.31] (port=48292 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSZUk-00027m-SC
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:43:13 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 060CB600FF;
 Tue, 21 Sep 2021 14:42:59 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632206580; bh=nCQKR4/QLFS4W6Hso+7nH6Asm/yWDeJfewyli3FuDs0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=hu/6vaet/B89hfG8I6OBxtKd4tX6mqi8AgJej9MguLG8JSMIszLy5O3HwGn7Yskor
 49Ua+4K8ysxv0zuQBVFw98sVKNr6DKIbBxUtZmeR5+5XffaaEX5gj01wULmBfL+l1t
 KBnIzUFA3X+LES6p//CPs1JEPQy8zX0t/ch8LeYs=
Message-ID: <733b9bb1-fd35-dd7f-2162-3362659e864f@xen0n.name>
Date: Tue, 21 Sep 2021 14:42:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 21/30] tcg/loongarch: Implement tcg_out_call
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-22-git@xen0n.name>
 <0176e1cb-faaf-ca08-a35d-879811c18670@linaro.org>
 <9c4f7220-1c6a-03f4-f265-b337909583e5@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <9c4f7220-1c6a-03f4-f265-b337909583e5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/21/21 00:35, Richard Henderson wrote:
> On 9/20/21 9:31 AM, Richard Henderson wrote:
>> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>>> +    } else if (TCG_TARGET_REG_BITS == 32 || offset == 
>>> (int32_t)offset) {
>>> +        /* long jump: +/- 2GiB */
>>> +        tcg_out_opc_pcaddu12i(s, TCG_REG_TMP0, 0);
>>> +        tcg_out_opc_jirl(s, link, TCG_REG_TMP0, 0);
>>> +        ret = reloc_call(s->code_ptr - 2, arg);
>>> +        tcg_debug_assert(ret == true);
>>
>> Just inline reloc_call here, so that you can provide the correct 
>> offsets to the pcadd and jirl instructions directly.  The assert will 
>> vanish, because you've already done the range check with "offset == 
>> (int32_t)offset".
>
> Actually, don't you want offset == sextract64(offset, 0, 34), and use 
> pcaddu18i? Depending on the memory map of qemu, those extra bits could 
> make the difference in directly reaching the main executable.
>
Whoa, silly me, I actually didn't realize a single expected use case of 
pcaddu18i until I read this, the low 2 bits are always clear so 18 is 
exactly the amount of shift needed when paired with jirl!

I'll of course rework this to use pcaddu18i+jirl instead.

>
> r~

