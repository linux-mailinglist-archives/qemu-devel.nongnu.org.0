Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B34C6703
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 11:18:04 +0100 (CET)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOd6P-00008s-RF
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 05:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOd3d-0007F6-Ho
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOd3Z-0004vG-2I
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646043303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xj2KhMknEFceS5hFCXhjM4uogxp/QvUcLco1E9mNfPA=;
 b=fw+1jh3Ip3ejHSUmAJgwrxk35kXwkktAC/4zEe2YRZJZLX+AaYhhd9oYk5VBjrSaELaGz7
 pLqSiEQRwYFWOR9RHO3l2kWBWkQ98lRhcC4cEwyMKXwrsP1thLI4z8pbgBYWTOjLVtSnAt
 PxUXHAa2b5PahZKw2e22xCact97vsxY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-xoGvhBEcPeafmjT8Nb1-Sg-1; Mon, 28 Feb 2022 05:15:02 -0500
X-MC-Unique: xoGvhBEcPeafmjT8Nb1-Sg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so1863751wrg.20
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 02:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xj2KhMknEFceS5hFCXhjM4uogxp/QvUcLco1E9mNfPA=;
 b=0fu7zUZXvZXqIUptrE6t5u7sITmZoNmrvzMSsmRsHVWWUSn3pB6JSUZdO3C9F1poKH
 whx1n+8t3j20ddlzZFLef31RZmyLVkjPGzn3QpCGj/E5tZT5U28Wl4D6LqiwXFnL1WhL
 4+FDQyex1/JUEgf1CE2DN8LqwVzZU+nzBglll97x0H8Iu6SaqIWbaMDAiQ2SjMBrls1V
 T1JlqSNacuFPtwn19TUaqGlbw4AwN4/o67USnsOI4aowD58kllI6HeKjdaFgApWxIYis
 J/UCrmzu+SHC3RkDF+9CPkOaeQIFiwjbDMBbilevGaZY6cqt2AssQt226SDvRwTR4CKL
 FAmQ==
X-Gm-Message-State: AOAM530k+EWst3UAU510ea7VMAfuMAzZJ0OuWmdVF6Xt0Qy83KhoMi58
 6+a3zSvLD6oe8ap3jGR8zR0v/OFAYkzDomxhxer90lklP2h4vix2uDJ/4zjHW5zAJLULQjXQWbW
 Wb/BnMad1xyGxqoM=
X-Received: by 2002:adf:cd02:0:b0:1ef:7498:bcbd with SMTP id
 w2-20020adfcd02000000b001ef7498bcbdmr10743546wrm.278.1646043301295; 
 Mon, 28 Feb 2022 02:15:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEX2aUspEPcUZvU8OmMAxuSEznupnp1SUAjJCXbdytFPs9zn1j1UNLQmoHoTmutXAu7kqomw==
X-Received: by 2002:adf:cd02:0:b0:1ef:7498:bcbd with SMTP id
 w2-20020adfcd02000000b001ef7498bcbdmr10743522wrm.278.1646043301062; 
 Mon, 28 Feb 2022 02:15:01 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 u4-20020adfdb84000000b001e8d8ac5394sm10461530wri.110.2022.02.28.02.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 02:15:00 -0800 (PST)
Message-ID: <3853fa79-4578-be7b-4a2f-5b31cdd5c4c7@redhat.com>
Date: Mon, 28 Feb 2022 11:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: Richard Henderson <richard.henderson@linaro.org>,
 David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220223223117.66660-1-dmiller423@gmail.com>
 <20220223223117.66660-4-dmiller423@gmail.com>
 <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/2022 00.43, Richard Henderson wrote:
> On 2/23/22 12:31, David Miller wrote:
>> +#define F_EPI "stg %%r0, %[res] " : [res] "+m" (res) : : "r0", "r2", "r3"
>> +
>> +#define F_PRO    asm ( \
>> +    "llihf %%r0,801\n" \
>> +    "lg %%r2, %[a]\n"  \
>> +    "lg %%r3, %[b] "   \
>> +    : : [a] "m" (a),   \
>> +        [b] "m" (b)    \
>> +    : "r2", "r3")
>> +
>> +#define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
>> +{ uint64_t res = 0; F_PRO; ASM; return res; }
>> +
>> +/* AND WITH COMPLEMENT */
>> +FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2\n" F_EPI))
>> +FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2\n" F_EPI))
> 
> Better written as
> 
>    asm("ncrk %0, %3, %2" : "=&r"(res) : "r"(a), "r"(b) : "cc");

I agree with Richard, especially since it's kind of "dangerous" to chain 
multiple asm() statements (without "volatile") and hoping that the compiler 
keeps the values in the registers in between (without reordering the 
statements).

Anyway, since I'll be away for most the rest of the week and we already have 
soft-freeze next week, I'd like to get this fixed for my pull request that I 
plan later for today or tomorrow, so I now went ahead and modified the code 
to look like this:

#define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
{ \
     uint64_t res = 0; \
     asm ("llihf %[res],801\n" ASM \
          : [res]"=&r"(res) : [a]"r"(a), [b]"r"(b) : "cc"); \
     return res; \
}

/* AND WITH COMPLEMENT */
FbinOp(_ncrk,  ".insn rrf, 0xB9F50000, %[res], %[b], %[a], 0\n")
FbinOp(_ncgrk, ".insn rrf, 0xB9E50000, %[res], %[b], %[a], 0\n")

/* NAND */
FbinOp(_nnrk,  ".insn rrf, 0xB9740000, %[res], %[b], %[a], 0\n")
FbinOp(_nngrk, ".insn rrf, 0xB9640000, %[res], %[b], %[a], 0\n")

/* NOT XOR */
FbinOp(_nxrk,  ".insn rrf, 0xB9770000, %[res], %[b], %[a], 0\n")
FbinOp(_nxgrk, ".insn rrf, 0xB9670000, %[res], %[b], %[a], 0\n")

/* NOR */
FbinOp(_nork,  ".insn rrf, 0xB9760000, %[res], %[b], %[a], 0\n")
FbinOp(_nogrk, ".insn rrf, 0xB9660000, %[res], %[b], %[a], 0\n")

/* OR WITH COMPLEMENT */
FbinOp(_ocrk,  ".insn rrf, 0xB9750000, %[res], %[b], %[a], 0\n")
FbinOp(_ocgrk, ".insn rrf, 0xB9650000, %[res], %[b], %[a], 0\n")

Full patch can be seen here:

https://gitlab.com/thuth/qemu/-/commit/38af118ea2fef0c473

I hope that's ok for everybody?

  Thomas


