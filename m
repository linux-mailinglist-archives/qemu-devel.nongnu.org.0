Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8A414CDA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:17:52 +0200 (CEST)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT40N-0001Vw-HP
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT3yv-0008R1-0x
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:16:21 -0400
Received: from [115.28.160.31] (port=38440 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT3yq-00063v-V9
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:16:20 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 210F1633F2;
 Wed, 22 Sep 2021 23:16:07 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632323767; bh=ixEjrV654ri/mXiUZn0tllL4e/hK0kkqMlYBNC2VJVo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=OFwGP8+Xy4kbifIx7PvqJE2FeOJ06UA7/leR3PFayEYOa+eZKNQFmIjy3VR3IKLXF
 PRQhKQHUzKl5EA4vsGCkvTbunbVAlYSvGdz+5SoKakZrF9FpKoOtgkr77o8PQUJRaX
 8pZxvpU8mQNfJd+47tFsFJ4Q41zcsBfZnnxFBEQo=
Message-ID: <75621c34-5cf8-3ae9-86cf-ce3cf53b4669@xen0n.name>
Date: Wed, 22 Sep 2021 23:16:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v2 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-10-git@xen0n.name>
 <0717a7de-7c41-990d-ec7a-51b44f49724e@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <0717a7de-7c41-990d-ec7a-51b44f49724e@linaro.org>
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

On 9/22/21 12:25, Richard Henderson wrote:
> On 9/21/21 1:18 PM, WANG Xuerui wrote:
>> +    /* Test for PC-relative values that can be loaded faster.  */
>> +    intptr_t pc_offset = val - (uintptr_t)s->code_ptr;
>
> This isn't quite right for split r^x code buffer.
> You should have seen this with --enable-debug-tcg...
>
> You need pc_offset = tcg_pcrel_diff(s, (void *)val).
Indeed; I just realized TCG debugging isn't fully enabled with 
--enable-debug only. Will fix in v3.
>
>> +    if (pc_offset == (int32_t)pc_offset) {
>> +        tcg_target_long lo = sextreg(pc_offset, 0, 12);
>> +        tcg_target_long hi = pc_offset - lo;
>> +        tcg_out_opc_pcaddu12i(s, rd, hi >> 12);
>
> And... this doesn't quite work, right at the edges.  If lo is 
> negative, hi can overflow out of range.  There are a number of ways to 
> fix this.  One is to extract the pieces and re-assemble to see if it 
> matches.  Another is to rearrange the arithmetic just a little and use 
> PCALAU12I.
I actually wrote a small test program to test for this, but found no 
overflow issues here; rather the tcg_out_opc_ori call below has 
signedness problem (need to mask the low variable, which is signed, with 
0xfff to avoid overwriting the opcode field). I think I'll add a 
tcg_debug_assert here, but keep the logic intact.
>
>> +    tcg_target_long upper = (val >> 12) & 0xfffff;
>> +    tcg_target_long higher = (val >> 32) & 0xfffff;
>
> Better to use extract64(val, 12, 20) and extract64(val, 32, 30).
Sure; but as the instructions perform sign-extension, thus taking signed 
operands, sextract64 or the wrapped sextreg will do it.
>
>
> r~

