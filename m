Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D2E4C672F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 11:41:17 +0100 (CET)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOdSt-0008Cg-Sb
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 05:41:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nOdRZ-0007TH-BF
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:39:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nOdRT-0005o2-LC
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646044786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=77wqe65t9eCG/+72LnWhRbz6a6CAkgUDZpRiD0ETUqc=;
 b=OWiGOhlXbVxmIznK3K2/28RWXGcCmKKsqs9u2vzTikgls50kI1Xg0mVB+89lDb3RQr+HWV
 Li0JSMFKe6QQ4cBOBeSJHLEL1r3n2Y/DV7M3G5GnckLEurM7laH1r35UZa6XeiYzM+apQv
 uaUyaVtKA6o4Ql1xxwEQMWAyYEP2Vio=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-tCQFStawNCWwHfBkZ3msJA-1; Mon, 28 Feb 2022 05:39:44 -0500
X-MC-Unique: tCQFStawNCWwHfBkZ3msJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so6242202wme.1
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 02:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=77wqe65t9eCG/+72LnWhRbz6a6CAkgUDZpRiD0ETUqc=;
 b=5BwcjgPqABFGR9mcZT+mPS3HEIE2QAsMiZElUwm0z4x28xp6McEJLuFDoY0g57HkCP
 N0N0jo/Ve89fvC8z2EkVVIBlpBDpMsqwSGirsWXf6ksw3M7VJypAnlkcPDdFQe7T4KjW
 t5ELCR24LUHD9pj5pfO7QAdFWMLo4ZNbxoqOTnJPwThwMCYhsGoCEdhf+sElMTmA1Z/D
 khCStXDCpJhvIbBFZhTYYr9l40e/vutFmSqOyJfO+rg8ShDPpk5dlU+Me9YxGs3xAjiI
 O0muoS3NvZOiHDscPINticdSHsJQtxBRQqpL8eyMrhTsFK6IpDV2TwIdjg+0qMLQO/2L
 sGRQ==
X-Gm-Message-State: AOAM531pBansQMONFAY1FVT6eOfVAAyJvrfHcS/J35S1WisA0K49eF1t
 0oZTWrtiM7IQSUJ3Ta5B6fGyl2wF53MRiDI0nGkrGjTszpoEodQgBVFfpiecfw+kl1Mt1PjYqb5
 mGyft5Nsvr7uSmXs=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr6627595wrh.407.1646044783432; 
 Mon, 28 Feb 2022 02:39:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeq3oF/qCyBat+ClqSO6vjltY1qXz7rU6e/Cm4utSrsZMoLF4cMiSeF/PatDgY9isQZfZg0Q==
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr6627577wrh.407.1646044783104; 
 Mon, 28 Feb 2022 02:39:43 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:9700:f1d:e242:33b4:67f?
 (p200300cbc70297000f1de24233b4067f.dip0.t-ipconnect.de.
 [2003:cb:c702:9700:f1d:e242:33b4:67f])
 by smtp.gmail.com with ESMTPSA id
 s3-20020adfbc03000000b001e4b0e4a7fdsm10426677wrg.93.2022.02.28.02.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 02:39:42 -0800 (PST)
Message-ID: <6d3f8708-d5b1-8abc-7d00-deb4e014ad52@redhat.com>
Date: Mon, 28 Feb 2022 11:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220223223117.66660-1-dmiller423@gmail.com>
 <20220223223117.66660-4-dmiller423@gmail.com>
 <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
 <3853fa79-4578-be7b-4a2f-5b31cdd5c4c7@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <3853fa79-4578-be7b-4a2f-5b31cdd5c4c7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.02.22 11:14, Thomas Huth wrote:
> On 24/02/2022 00.43, Richard Henderson wrote:
>> On 2/23/22 12:31, David Miller wrote:
>>> +#define F_EPI "stg %%r0, %[res] " : [res] "+m" (res) : : "r0", "r2", "r3"
>>> +
>>> +#define F_PRO    asm ( \
>>> +    "llihf %%r0,801\n" \
>>> +    "lg %%r2, %[a]\n"  \
>>> +    "lg %%r3, %[b] "   \
>>> +    : : [a] "m" (a),   \
>>> +        [b] "m" (b)    \
>>> +    : "r2", "r3")
>>> +
>>> +#define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
>>> +{ uint64_t res = 0; F_PRO; ASM; return res; }
>>> +
>>> +/* AND WITH COMPLEMENT */
>>> +FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2\n" F_EPI))
>>> +FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2\n" F_EPI))
>>
>> Better written as
>>
>>    asm("ncrk %0, %3, %2" : "=&r"(res) : "r"(a), "r"(b) : "cc");
> 
> I agree with Richard, especially since it's kind of "dangerous" to chain 
> multiple asm() statements (without "volatile") and hoping that the compiler 
> keeps the values in the registers in between (without reordering the 
> statements).
> 
> Anyway, since I'll be away for most the rest of the week and we already have 
> soft-freeze next week, I'd like to get this fixed for my pull request that I 
> plan later for today or tomorrow, so I now went ahead and modified the code 
> to look like this:
> 
> #define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
> { \
>      uint64_t res = 0; \
>      asm ("llihf %[res],801\n" ASM \
>           : [res]"=&r"(res) : [a]"r"(a), [b]"r"(b) : "cc"); \
>      return res; \
> }
> 
> /* AND WITH COMPLEMENT */
> FbinOp(_ncrk,  ".insn rrf, 0xB9F50000, %[res], %[b], %[a], 0\n")
> FbinOp(_ncgrk, ".insn rrf, 0xB9E50000, %[res], %[b], %[a], 0\n")
> 
> /* NAND */
> FbinOp(_nnrk,  ".insn rrf, 0xB9740000, %[res], %[b], %[a], 0\n")
> FbinOp(_nngrk, ".insn rrf, 0xB9640000, %[res], %[b], %[a], 0\n")
> 
> /* NOT XOR */
> FbinOp(_nxrk,  ".insn rrf, 0xB9770000, %[res], %[b], %[a], 0\n")
> FbinOp(_nxgrk, ".insn rrf, 0xB9670000, %[res], %[b], %[a], 0\n")
> 
> /* NOR */
> FbinOp(_nork,  ".insn rrf, 0xB9760000, %[res], %[b], %[a], 0\n")
> FbinOp(_nogrk, ".insn rrf, 0xB9660000, %[res], %[b], %[a], 0\n")
> 
> /* OR WITH COMPLEMENT */
> FbinOp(_ocrk,  ".insn rrf, 0xB9750000, %[res], %[b], %[a], 0\n")
> FbinOp(_ocgrk, ".insn rrf, 0xB9650000, %[res], %[b], %[a], 0\n")
> 
> Full patch can be seen here:
> 
> https://gitlab.com/thuth/qemu/-/commit/38af118ea2fef0c473
> 
> I hope that's ok for everybody?

Fine with me.


-- 
Thanks,

David / dhildenb


