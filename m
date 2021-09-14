Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C8440B53E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:48:17 +0200 (CEST)
Received: from localhost ([::1]:49482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQBbU-0007qC-Vu
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQBZV-00072i-Gq
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:46:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQBZT-00006P-U4
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631637970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilN9du72iXyecgNuk6rA986bt5BdCKuy8I5KMPf+ziE=;
 b=b57NbbPfNgfUBmwq6GybowHLOa6I6c7iHy1YKs3sIwfwfiEsJyMFTPN3g/wSK1Gyi9pD+/
 RAWIqOb4YgmXF1mJAs2+NxFnIPCh25d4od/FJi5A3p35TNSPCpQukG/6mL9M65+mSq9+aZ
 /Yjpfi6JqSxtVnm/TBPWusDG6E6Ai8c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-ZRng2UM9PQujmB5R_5ZWFA-1; Tue, 14 Sep 2021 12:46:09 -0400
X-MC-Unique: ZRng2UM9PQujmB5R_5ZWFA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v1-20020adfc401000000b0015e11f71e65so1745840wrf.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 09:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ilN9du72iXyecgNuk6rA986bt5BdCKuy8I5KMPf+ziE=;
 b=dpkBKtK67ig9p+BZnutYtiJmGr+NQjEBecENdWjUvtmIwHbAKzDoOVwCe8CGFScLzc
 bBL6Qet7pgkTpNuTrw9E2onlM+5UHoVQwz+NB4xza60tUZ9GPZn05YMivNZQhQRPnatt
 ssWL93L5BqbWzo3v8aC97jYoanBdBPW+3vczM2/tTnlxV/d2xbftAQ8Np5+u6jmf03fW
 EBEGVAxEsaAtwL/twFfi+4+GGRI1vdk1R9BLirs9Ogc29F7u8/s+hplxvfNX4ZqpPNCf
 X2OQ8g40UrKt/8JrMhkNAQ4jQEP6j/KhghiRZiJiVv2DmThzxSatJAn+lrI+FtPcZiWA
 4vXw==
X-Gm-Message-State: AOAM532xqbbp/YdSvreI/oO6VRvCNqftteGJ9GlRTRwprKavvwr57UYK
 jBlRwic1Mh6stHj+fF+kNSTD8vxc+MzpZc1FrtwHefssDktf8GPFwIk0D8pr/wD2HlteNHoFv1R
 9BIligIWL8/0bA/7UYlBRqnkGa5b+1ScSITAPas/BVDSTxAcxuX2K8AtkH3502us=
X-Received: by 2002:adf:e88e:: with SMTP id d14mr83495wrm.207.1631637968223;
 Tue, 14 Sep 2021 09:46:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0Wtx/B4ZFVrFP+41sTCZQjQly02QEwO1wRkFldeaONt9qSglbnhMXPnUOh3Hb0LuvIn4w5A==
X-Received: by 2002:adf:e88e:: with SMTP id d14mr83462wrm.207.1631637967949;
 Tue, 14 Sep 2021 09:46:07 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 n17sm3782534wrp.17.2021.09.14.09.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 09:46:07 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-6-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 05/16] tcg/s390x: Implement tcg_out_ld/st for vector
 types
Message-ID: <7bd6c9a6-6b0f-5a0c-f9a2-be8a37102196@redhat.com>
Date: Tue, 14 Sep 2021 18:46:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626050307.2408505-6-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26.06.21 07:02, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 122 +++++++++++++++++++++++++++++++++----
>   1 file changed, 110 insertions(+), 12 deletions(-)
> 
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index 18233c628d..b6ea129e14 100644
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
> @@ -529,6 +535,31 @@ static void tcg_out_insn_RSY(TCGContext *s, S390Opcode op, TCGReg r1,
>   #define tcg_out_insn_RX   tcg_out_insn_RS
>   #define tcg_out_insn_RXY  tcg_out_insn_RSY
>   
> +static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
> +{
> +    /*
> +     * Shift bit 4 of each regno to its corresponding bit of RXB.
> +     * RXB itself begins at bit 8 of the instruction so 8 - 4 = 4
> +     * is the left-shift of the 4th operand.
> +     */
> +    return ((v1 & 0x10) << (4 + 3))
> +         | ((v2 & 0x10) << (4 + 2))
> +         | ((v3 & 0x10) << (4 + 1))
> +         | ((v4 & 0x10) << (4 + 0));
> +}
> +
> +static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
> +                             TCGReg b2, TCGReg x2, intptr_t d2, int m3)

Is intptr_t really the right type here? Just curious ... I'd have used 
an uint16_t and asserted "!(d1 & 0xf000)".

> +{
> +    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
> +    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
> +    tcg_debug_assert(x2 <= TCG_REG_R15);
> +    tcg_debug_assert(b2 <= TCG_REG_R15);
> +    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | x2);

Nit: ((v1 & 0xf) << 4)

makes it immediately clearer to me which bits are set by which piece of 
this puzzle :)

> +    tcg_out16(s, (b2 << 12) | d2);
> +    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m3 << 12));
> +}
> +
>   /* Emit an opcode with "type-checking" of the format.  */
>   #define tcg_out_insn(S, FMT, OP, ...) \
>       glue(tcg_out_insn_,FMT)(S, glue(glue(FMT,_),OP), ## __VA_ARGS__)
> @@ -705,25 +736,92 @@ static void tcg_out_mem(TCGContext *s, S390Opcode opc_rx, S390Opcode opc_rxy,
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

This actually maps to "if (likely(data <= TCG_REG_R15))", correct?

-- 
Thanks,

David / dhildenb


