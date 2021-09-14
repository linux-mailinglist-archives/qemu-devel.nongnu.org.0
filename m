Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D7940B577
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:57:25 +0200 (CEST)
Received: from localhost ([::1]:56062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQBkK-0004HU-8l
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQBjE-0003Ze-8h
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQBjB-0000Lo-8P
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631638572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WHQlRS0Zu2sgW41L9O86IdM6XicY5Bjt/AOj1eWd3s4=;
 b=V4McZnt/AviU81WEmf/8eJWZpxNOwYkmIu3nl4gvVV09K4Wchqfm1Q9j++MS1K2Fz9BsPx
 E9MX7zkSlRUKm7eRKysxZhh8BKqgAWvyEQh645Ly0AvJnGEA7T/fBtNkogTx3r+XcU4igy
 C45uX7hBQdJCka0ooyD/+h2Xyasltr4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-a7ZyJgc1N-yAYA7aPOnE2w-1; Tue, 14 Sep 2021 12:56:11 -0400
X-MC-Unique: a7ZyJgc1N-yAYA7aPOnE2w-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so925447wml.5
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 09:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WHQlRS0Zu2sgW41L9O86IdM6XicY5Bjt/AOj1eWd3s4=;
 b=zhHhXJsFO/aInlzD6GXFc0zGsaIAEPwMb+uI853NC9kFe6kTTWKKNQDCRLJAlDzkP5
 xzfVlnPbaOBYCK33nGCJa51PNPgNmLcbelETdzxMTgbDtGW/GQAqxtvoJj816xkwA8dZ
 fYug3DZQnJYmYjiShC3s4ZUOTRWIjI1ye8wopFxM0NwdM3j7rBuFp0r/buPL4vGJlETT
 eF6E9ERKXJW/ceREpp7S6Pi5i8j04N6qsvK8ApsITZC0HQ5ofifA3Brdxf35y3aAeNFz
 dXz1TYdvaOx3C0ZXoToqd8Ojm4aAdEyaom6oJwOt0mrn0XQUJQzZRiqoMTTaqODNjzvF
 4yew==
X-Gm-Message-State: AOAM5329DUatDN+4T9IPgyOsLtx4yfBDa/LmYQ1EpEU0spiac+olVt4u
 wAsaIacwwfeUBXclfX6P5+sqwFRUJd2H6P4VplsKyyyiSrLjFgBBa5Sk06wRuPyXa9haqRQSE2q
 fJBBfQN9k3BNjb0/sc8el6tZBoNIT/ORdx67IHl2OZm8Yu592KyM7SUEje3SYGT0=
X-Received: by 2002:a1c:2056:: with SMTP id g83mr130589wmg.27.1631638570280;
 Tue, 14 Sep 2021 09:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzghadGQNSE2TBU/QfNaL+5Y2x6eWEJBNAcId8rMu6x0B29QmMdXCPLdICabJ1PBB3WHhxEpQ==
X-Received: by 2002:a1c:2056:: with SMTP id g83mr130561wmg.27.1631638569981;
 Tue, 14 Sep 2021 09:56:09 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 48sm11347608wrc.14.2021.09.14.09.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 09:56:09 -0700 (PDT)
Subject: Re: [PATCH v4 06/16] tcg/s390x: Implement tcg_out_mov for vector types
From: David Hildenbrand <david@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-7-richard.henderson@linaro.org>
 <045600e5-a3bf-18f3-b8a8-9e593c97a3ed@redhat.com>
Organization: Red Hat
Message-ID: <2808db81-0743-e10d-d28e-5b9d25e13ec6@redhat.com>
Date: Tue, 14 Sep 2021 18:56:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <045600e5-a3bf-18f3-b8a8-9e593c97a3ed@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 14.09.21 18:53, David Hildenbrand wrote:
> On 26.06.21 07:02, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>    tcg/s390x/tcg-target.c.inc | 72 +++++++++++++++++++++++++++++++++++---
>>    1 file changed, 68 insertions(+), 4 deletions(-)
>>
>> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
>> index b6ea129e14..c4e12a57f3 100644
>> --- a/tcg/s390x/tcg-target.c.inc
>> +++ b/tcg/s390x/tcg-target.c.inc
>> @@ -265,6 +265,11 @@ typedef enum S390Opcode {
>>        RX_STC      = 0x42,
>>        RX_STH      = 0x40,
>>    
>> +    VRRa_VLR    = 0xe756,
>> +
>> +    VRSb_VLVG   = 0xe722,
>> +    VRSc_VLGV   = 0xe721,
>> +
>>        VRX_VL      = 0xe706,
>>        VRX_VLLEZ   = 0xe704,
>>        VRX_VST     = 0xe70e,
>> @@ -548,6 +553,39 @@ static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
>>             | ((v4 & 0x10) << (4 + 0));
>>    }
>>    
>> +static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
>> +                              TCGReg v1, TCGReg v2, int m3)
>> +{
>> +    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
>> +    tcg_debug_assert(v2 >= TCG_REG_V0 && v2 <= TCG_REG_V31);
>> +    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | (v2 & 15));
>> +    tcg_out32(s, (op & 0x00ff) | RXB(v1, v2, 0, 0) | (m3 << 12));
>> +}
>> +
>> +static void tcg_out_insn_VRSb(TCGContext *s, S390Opcode op, TCGReg v1,
>> +                              intptr_t d2, TCGReg b2, TCGReg r3, int m4)
>> +{
>> +    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
>> +    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
>> +    tcg_debug_assert(b2 <= TCG_REG_R15);
>> +    tcg_debug_assert(r3 <= TCG_REG_R15);
>> +    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | r3);
>> +    tcg_out16(s, b2 << 12 | d2);
>> +    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m4 << 12));
>> +}
>> +
>> +static void tcg_out_insn_VRSc(TCGContext *s, S390Opcode op, TCGReg r1,
>> +                              intptr_t d2, TCGReg b2, TCGReg v3, int m4)
>> +{
>> +    tcg_debug_assert(r1 <= TCG_REG_R15);
>> +    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
>> +    tcg_debug_assert(b2 <= TCG_REG_R15);
>> +    tcg_debug_assert(v3 >= TCG_REG_V0 && v3 <= TCG_REG_V31);
>> +    tcg_out16(s, (op & 0xff00) | (r1 << 4) | (v3 & 15));
>> +    tcg_out16(s, b2 << 12 | d2);
>> +    tcg_out16(s, (op & 0x00ff) | RXB(0, 0, v3, 0) | (m4 << 12));
>> +}
>> +
>>    static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
>>                                 TCGReg b2, TCGReg x2, intptr_t d2, int m3)
>>    {
>> @@ -581,12 +619,38 @@ static void tcg_out_sh32(TCGContext* s, S390Opcode op, TCGReg dest,
>>    
>>    static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
>>    {
>> -    if (src != dst) {
>> -        if (type == TCG_TYPE_I32) {
>> +    if (src == dst) {
>> +        return true;
>> +    }
>> +    switch (type) {
>> +    case TCG_TYPE_I32:
>> +        if (likely(dst < 16 && src < 16)) {
>>                tcg_out_insn(s, RR, LR, dst, src);
>> -        } else {
>> -            tcg_out_insn(s, RRE, LGR, dst, src);
>> +            break;
>>            }
>> +        /* fallthru */
>> +
> 
> Does that fall-through work as expected? I would have thought we would
> want to pass "2" as m4 for VLGV and VLVG below?
> 

Forget my question, we're not doing memory access :)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


