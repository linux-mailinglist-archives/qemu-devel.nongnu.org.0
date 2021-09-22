Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB18414F38
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:36:03 +0200 (CEST)
Received: from localhost ([::1]:39140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6A5-0001j7-9P
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT66i-0007ZV-FT
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:32:32 -0400
Received: from [115.28.160.31] (port=39844 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT66b-0000Vy-T1
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:32:32 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6D624633F2;
 Thu, 23 Sep 2021 01:32:20 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632331940; bh=8zDOXjhgew2/NmjfWvfXVWPL4E6TWqAnyZfp/4BfuRY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=WZpIFaYXaVEUzE8CyF6NF20IRpSqWwaz+C2nDuf/5ED5jHL5uBCSUHxqWz7V0tzdm
 Dmfifz/7TLk2jmqdiH8iAaBbhFnVlZvqS4p7w9I0A9vxbzwcMesfCQW0KqFYavX8C1
 RJXSJWWeVOuvQgt2ZasKY887bRcMqm+gu48yGjzk=
Message-ID: <3a02530c-c757-5494-0468-e467353c1d4b@xen0n.name>
Date: Thu, 23 Sep 2021 01:32:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v2 23/30] tcg/loongarch64: Add softmmu load/store helpers, 
 implement qemu_ld/qemu_st ops
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-24-git@xen0n.name>
 <69924e4b-53dc-fd75-db6b-d094cec103b5@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <69924e4b-53dc-fd75-db6b-d094cec103b5@linaro.org>
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

On 9/23/21 00:29, Richard Henderson wrote:
> On 9/21/21 1:19 PM, WANG Xuerui wrote:
>> +    /* Compare masked address with the TLB entry.  */
>> +    label_ptr[0] = s->code_ptr;
>> +    tcg_out_opc_bne(s, TCG_REG_TMP0, TCG_REG_TMP1, 0);
>> +
>> +    /* TLB Hit - translate address using addend.  */
>> +    tcg_out_opc_add_d(s, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
>
> You removed a little too much here.  You still need
>
>     if (TARGET_LONG_BITS == 32) {
>         tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
>         addrl = TCG_REG_TMP0;
>     }
>     tcg_out_opc_add_d(s, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
Ah, of course that was necessary because TARGET_LONG_BITS depends on the 
*target*... silly me. Thanks for catching this, I was just about to 
debug the "mysterious" segfaults on all the 32-bit targets :facepalm:
>
>> +static void add_qemu_ldst_label(TCGContext *s, int is_ld, 
>> TCGMemOpIdx oi,
>> +                                TCGReg datalo, TCGReg addrlo,
>> +                                void *raddr, tcg_insn_unit **label_ptr)
>> +{
>> +    TCGLabelQemuLdst *label = new_ldst_label(s);
>> +
>> +    label->is_ld = is_ld;
>> +    label->oi = oi;
>> +    label->type = 0;
>
> Type should be set based on "is_64" argument to tcg_out_qemu_ld (or 
> indeed, is_64 could be replaced by "type", which would probably make 
> more sense).
>
> This will be used to fix...
>
>> +    if (opc & MO_SIGN) {
>> +        /* Sign-extend directly into destination.  */
>> +        switch (size) {
>> +        case MO_8:
>> +            tcg_out_ext8s(s, l->datalo_reg, TCG_REG_A0);
>> +            break;
>> +        case MO_16:
>> +            tcg_out_ext16s(s, l->datalo_reg, TCG_REG_A0);
>> +            break;
>> +        case MO_32:
>> +            tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
>> +            break;
>> +        default:
>> +            g_assert_not_reached();
>> +            break;
>> +        }
>> +    } else {
>> +        tcg_out_mov(s, size == MO_64, l->datalo_reg, TCG_REG_A0);
>> +    }
>
> ... this, where TCG_TYPE_I32 loads should always be sign-extended from 
> 32-bits.  Something like
>
>     switch (opc & MO_SSIZE) {
>     case MO_SB:
>         ext8s;
>         break;
>     case MO_SH:
>         ext16s;
>         break;
>     case MO_SL:
>         ext32s;
>         break;
>     case MO_UL:
>         if (type == TCG_TYPE_I32) {
>             ext32s;
>             break;
>         }
>         /* fall through */
>     default:
>         tcg_out_mov(s, TCG_TYPE_REG, datalo, A0);
>         break;
>     }
Ack; I'll modify tcg_out_qemu_ld and add_qemu_ldst_label to take a TCGType.
>
>> +    case MO_64:
>> +        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A2, l->datalo_reg);
>
> TCG_TYPE_I64, to match MO_64.
Ack; will fix.
>
>> +    if (USE_GUEST_BASE) {
>> +        tcg_out_opc_add_d(s, base, TCG_GUEST_BASE_REG, addr_regl);
>> +    } else {
>> +        tcg_out_opc_add_d(s, base, addr_regl, TCG_REG_ZERO);
>> +    }
>
> Still adding zero in tcg_out_qemu_st.
One probably should not even attempt to fix code at 4 am, esp. while 
going through tens of review comments...
>
>
> r~

