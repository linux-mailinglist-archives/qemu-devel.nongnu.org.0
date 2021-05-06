Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24CA37535C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 13:59:24 +0200 (CEST)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lecf5-0004Qn-Va
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 07:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lecbS-00012n-3v
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lecbP-0005Yo-95
 for qemu-devel@nongnu.org; Thu, 06 May 2021 07:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620302134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3KSwQ/DdxnBs2N8+aZ2LwqV4O9Fv4GATov26XuMqEM=;
 b=KWkFNXXZHADMDv56/NxiBkUqE8FVjfecDdnPZQMhVcMkbF+vAyMDcU+YR1YBNDxHRKbSR4
 WZ6MommEqaax3DV1wEZi6/Ofco+h97jLmrJxICuUoTShALvnNJaHCA96V8KJzlYCtN5paP
 5V+s36R711rpDyHvvxkwZEY1VS70Wcs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-aSCHVuDDPTuIA-kxFy_tQw-1; Thu, 06 May 2021 07:55:33 -0400
X-MC-Unique: aSCHVuDDPTuIA-kxFy_tQw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a05600c2c4ab029014b601975e1so2254283wmg.0
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 04:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=K3KSwQ/DdxnBs2N8+aZ2LwqV4O9Fv4GATov26XuMqEM=;
 b=CT52sR5saTIBzWYd+mTf0szFM7ph5mR6kQ0S8EfXQTnuva5+TX+zPL20UHAJ+jxNVj
 S0tVNSxQXUbSR/pf5SgDg2Tg9JIASvvtA+f7nvddTMpqyYhk9AOoTig0zhqF29qSsUwQ
 U18kqYqYLUKzs7FePsaN/xnEcJJcVo8/mmTp4Y8SEN5UKQkLstWyAzmFI6J7VNAgJU4N
 kcTObh1tVZqvBJRmkVik5khNAtzFFJJamdkX4UDTHcvXfoU+UIHaXz65A+22ML0FkLo5
 t1ae2zJ6a0jr4zNfl1x+N8YITRbjEZHe146jj6BQ57p6w7Pf2olmkoFB3LNyfDrYx4o2
 WkIw==
X-Gm-Message-State: AOAM530isTIhyOR1n+olVtqIovqpxGPmn2+7PGnBCU7dV5pXFgTygagD
 bGW8jwb4Eqf1OXjRf1JvO9HrZx+ZLbSo/H09K6ZoNG+Jn12Je4OM99Bw41Bz9iDBG3PFUiO14S6
 mdCYRJN343Skjdu8=
X-Received: by 2002:a05:600c:3205:: with SMTP id
 r5mr3576960wmp.78.1620302131858; 
 Thu, 06 May 2021 04:55:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuISEzLn2n1Q2/6O2NxZMcq/4OJ83O0vIvj2AW4dJaE8x12bZD+5JK5J2KxeI9DKZEIsw8JA==
X-Received: by 2002:a05:600c:3205:: with SMTP id
 r5mr3576929wmp.78.1620302131465; 
 Thu, 06 May 2021 04:55:31 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id u6sm3159375wml.6.2021.05.06.04.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 04:55:31 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
 <20210503183541.2014496-6-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 05/16] tcg/s390x: Implement tcg_out_ld/st for vector
 types
Message-ID: <f5ca7ade-5566-0186-67f6-a9e38bd73922@redhat.com>
Date: Thu, 6 May 2021 13:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503183541.2014496-6-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.05.21 20:35, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 117 +++++++++++++++++++++++++++++++++----
>   1 file changed, 105 insertions(+), 12 deletions(-)
> 
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index 52df20a1ed..6ed9a309c1 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -265,6 +265,12 @@ typedef enum S390Opcode {
>       RX_STC      = 0x42,
>       RX_STH      = 0x40,
>   
> +    VRX_VL      = 0xe706,
> +    VRX_VLLEZ   = 0xe704,
> +    VRX_VST     = 0xe70e,
> +    VRX_VSTEF   = 0xe70b,
> +    VRX_VSTEG   = 0xe70a,
> +
>       NOP         = 0x0707,
>   } S390Opcode;
>   
> @@ -532,6 +538,26 @@ static void tcg_out_insn_RSY(TCGContext *s, S390Opcode op, TCGReg r1,
>   #define tcg_out_insn_RX   tcg_out_insn_RS
>   #define tcg_out_insn_RXY  tcg_out_insn_RSY
>   
> +static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
> +{
> +    return ((v1 & 16) << (7 - 3))
> +         | ((v2 & 16) << (6 - 3))
> +         | ((v3 & 16) << (5 - 3))
> +         | ((v4 & 16) << (4 - 3));
> +}

This a bit confusing (and maybe wrong?).

If we have v1=TCG_REG_V31, corresponding to "32 + 31", we'd get

   (63 & 16) << (7 - 3)
=    16     <<  4
= 256
= 0x100

And with v4=TCG_REG_V31
   (63 & 16) << (4 - 3)
=    16     <<  1
= 32
= 0x20

Which doesn't make any sense to me, because the RXB is bit 36-39 in an 
48-bit instruction (here: 0xf00) . But maybe I messed up.


RXB is 4 bit. Can we just make RXB() return these 4 bits and do any 
shifting in the caller? At least for me that would be easier to grasp.

static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
{
     return (v1 - TCG_REG_V0 >= 16) << 3 |
            (v2 - TCG_REG_V0 >= 16) << 2 |
            (v3 - TCG_REG_V0 >= 16) << 1 |
            (v4 - TCG_REG_V0 >= 16);
}

or without comparisons

static uint8_t RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
{
     return ((v1 & 16) >> (4 - 3)) |
            ((v2 & 16) >> (4 - 2)) |
            ((v3 & 16) >> (4 - 1)) |
            ((v4 & 16) >> (4 - 0));
}

And then maybe add a simple

static uint16_t RXB_INSTR(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
{
	return RXB(v1, v2, v3, v4) << 8;
}

that shifts the RXB into place if necessary.


> +
> +static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
> +                             TCGReg b2, TCGReg x2, intptr_t d2, int m3)
> +{
> +    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
> +    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
> +    tcg_debug_assert(x2 <= TCG_REG_R15);
> +    tcg_debug_assert(b2 <= TCG_REG_R15);
> +    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | x2);
> +    tcg_out16(s, (b2 << 12) | d2);
> +    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m3 << 12));
> +}
> +
>   /* Emit an opcode with "type-checking" of the format.  */
>   #define tcg_out_insn(S, FMT, OP, ...) \
>       glue(tcg_out_insn_,FMT)(S, glue(glue(FMT,_),OP), ## __VA_ARGS__)
> @@ -708,25 +734,92 @@ static void tcg_out_mem(TCGContext *s, S390Opcode opc_rx, S390Opcode opc_rxy,
>       }
>   }
>   
> +static void tcg_out_vrx_mem(TCGContext *s, S390Opcode opc_vrx,
> +                            TCGReg data, TCGReg base, TCGReg index,
> +                            tcg_target_long ofs, int m3)
> +{
> +    if (ofs < 0 || ofs >= 0x1000) {
> +        if (ofs >= -0x80000 && ofs < 0x80000) {
> +            tcg_out_insn(s, RXY, LAY, TCG_TMP0, base, index, ofs);
> +            base = TCG_TMP0;
> +            index = TCG_REG_NONE;
> +            ofs = 0;
> +        } else {
> +            tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP0, ofs);
> +            if (index != TCG_REG_NONE) {
> +                tcg_out_insn(s, RRE, AGR, TCG_TMP0, index);
> +            }
> +            index = TCG_TMP0;
> +            ofs = 0;
> +        }
> +    }
> +    tcg_out_insn_VRX(s, opc_vrx, data, base, index, ofs, m3);
> +}
>   
>   /* load data without address translation or endianness conversion */
> -static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg data,
> -                              TCGReg base, intptr_t ofs)
> +static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg data,
> +                       TCGReg base, intptr_t ofs)
>   {
> -    if (type == TCG_TYPE_I32) {
> -        tcg_out_mem(s, RX_L, RXY_LY, data, base, TCG_REG_NONE, ofs);
> -    } else {
> -        tcg_out_mem(s, 0, RXY_LG, data, base, TCG_REG_NONE, ofs);
> +    switch (type) {
> +    case TCG_TYPE_I32:
> +        if (likely(data < 16)) {
> +            tcg_out_mem(s, RX_L, RXY_LY, data, base, TCG_REG_NONE, ofs);
> +            break;
> +        }
> +        tcg_out_vrx_mem(s, VRX_VLLEZ, data, base, TCG_REG_NONE, ofs, MO_32);
> +        break;
> +
> +    case TCG_TYPE_I64:
> +        if (likely(data < 16)) {
> +            tcg_out_mem(s, 0, RXY_LG, data, base, TCG_REG_NONE, ofs);
> +            break;
> +        }
> +        /* fallthru */
> +
> +    case TCG_TYPE_V64:
> +        tcg_out_vrx_mem(s, VRX_VLLEZ, data, base, TCG_REG_NONE, ofs, MO_64);
> +        break;
> +
> +    case TCG_TYPE_V128:
> +        /* Hint quadword aligned.  */
> +        tcg_out_vrx_mem(s, VRX_VL, data, base, TCG_REG_NONE, ofs, 4);
> +        break;
> +
> +    default:
> +        g_assert_not_reached();
>       }
>   }
>   
> -static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg data,
> -                              TCGReg base, intptr_t ofs)
> +static void tcg_out_st(TCGContext *s, TCGType type, TCGReg data,
> +                       TCGReg base, intptr_t ofs)
>   {
> -    if (type == TCG_TYPE_I32) {
> -        tcg_out_mem(s, RX_ST, RXY_STY, data, base, TCG_REG_NONE, ofs);
> -    } else {
> -        tcg_out_mem(s, 0, RXY_STG, data, base, TCG_REG_NONE, ofs);
> +    switch (type) {
> +    case TCG_TYPE_I32:
> +        if (likely(data < 16)) {
> +            tcg_out_mem(s, RX_ST, RXY_STY, data, base, TCG_REG_NONE, ofs);
> +        } else {
> +            tcg_out_vrx_mem(s, VRX_VSTEF, data, base, TCG_REG_NONE, ofs, 1);
> +        }
> +        break;
> +
> +    case TCG_TYPE_I64:
> +        if (likely(data < 16)) {
> +            tcg_out_mem(s, 0, RXY_STG, data, base, TCG_REG_NONE, ofs);
> +            break;
> +        }
> +        /* fallthru */
> +
> +    case TCG_TYPE_V64:
> +        tcg_out_vrx_mem(s, VRX_VSTEG, data, base, TCG_REG_NONE, ofs, 0);
> +        break;
> +
> +    case TCG_TYPE_V128:
> +        /* Hint quadword aligned.  */
> +        tcg_out_vrx_mem(s, VRX_VST, data, base, TCG_REG_NONE, ofs, 4);
> +        break;
> +
> +    default:
> +        g_assert_not_reached();
>       }
>   }
>   
> 

Remaining stuff LGTM, although I have little experience with that code

-- 
Thanks,

David / dhildenb


