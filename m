Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174AB4C8975
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:39:51 +0100 (CET)
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzv4-0000Iz-6a
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOzg3-00082L-MD
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOzg0-0007oX-AY
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646130255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XEhAxR4nc7urCc61k3df30tT2N2VH8lAnOyMc2O9zI=;
 b=KYS+OID5UJz2GLDltAeZLPUXVviCOTMe55EXxp601AvskcxkAY45sooJP3UrKDcQIRJcDk
 ZeGqf5Wwh9SXaRNoCthPV/HwkTAPB8qSYJSGLTT1HC5//bmNRhE004m2Yaj8GsbGAX8xHf
 wc3IIWNiNjaC3vEhJzg1GkbZdN6wAA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-Ag50pwMpO1WfYLQJJze2eg-1; Tue, 01 Mar 2022 05:24:14 -0500
X-MC-Unique: Ag50pwMpO1WfYLQJJze2eg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b0037bb9f6feeeso777549wma.5
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 02:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/XEhAxR4nc7urCc61k3df30tT2N2VH8lAnOyMc2O9zI=;
 b=RNnz24kTpTNExUXm+nk0XPl6Hpv4xCnKIjAoWLbcehnLDCSI96ZaZ+pJAwEm49jQi9
 r+v3siv0aqh6zhXfyW9BS/us3poT0/xZuku1bqrWUBPL1bvJzfosor8kjRXH/I0dSPod
 4ZZxRXPyhfb73/ReE/rTX+9EpyUmaerRmVhJdhESJRhx+4txlirxodJXcfAmPeDNdCDT
 6xRdgiVl2JtnRPjRVxDV3Dpd/27GeUKZmlrh42D82TxdVdHGRYeJ5ylQorWSy/DIZ41V
 zSzf0dhyVqOZOKM7IXOlIkKvtrZsqUQOrl6e0DCzGcb91jyUNJQyV8lWgMw7q5vKMtnS
 qy3A==
X-Gm-Message-State: AOAM532Rg/FgIP41F79pLodbPSIPv5a9Ipani1ZcZ1us/isa0uZK/BQa
 rPneso8t5z58d3hXx/B4l1RoYQEnVZq+r38rlT2jR5qMGygZoi/dv4gK3A991XTR7P8XZ/kdbdt
 wbzPU+Ic+bNBawc4=
X-Received: by 2002:adf:fd87:0:b0:1ed:e0c3:a2d4 with SMTP id
 d7-20020adffd87000000b001ede0c3a2d4mr18728953wrr.374.1646130252920; 
 Tue, 01 Mar 2022 02:24:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfb2vbxwBtL9e+Nnd2u0ISLZw8E+K12H36jDyO0fHteKMI9owr6NO96sn5ztrDdD3cnjcFUA==
X-Received: by 2002:adf:fd87:0:b0:1ed:e0c3:a2d4 with SMTP id
 d7-20020adffd87000000b001ede0c3a2d4mr18728939wrr.374.1646130252688; 
 Tue, 01 Mar 2022 02:24:12 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 k7-20020adfb347000000b001e595adb6d9sm13915132wrd.79.2022.03.01.02.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 02:24:12 -0800 (PST)
Message-ID: <7303f69a-d29c-42a5-a63d-a2d9c473e35d@redhat.com>
Date: Tue, 1 Mar 2022 11:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: David Miller <dmiller423@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220223223117.66660-1-dmiller423@gmail.com>
 <20220223223117.66660-4-dmiller423@gmail.com>
 <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
 <3853fa79-4578-be7b-4a2f-5b31cdd5c4c7@redhat.com>
 <9aeda35f-1bce-d8eb-9dba-4993dc6a605d@linaro.org>
 <CAEgyohW5KcOLYcYHP=oD7+6Bba6ueXv8bh136jFczwFky6BUFQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEgyohW5KcOLYcYHP=oD7+6Bba6ueXv8bh136jFczwFky6BUFQ@mail.gmail.com>
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
Cc: farman@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 cohuck@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/02/2022 19.31, David Miller wrote:
> Had it on my TODO list for this morning, thank you.

Thanks! Please send it as additional patch on top of my s390x-next, since I 
already sent a pull request for the other patches yesterday:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

> On Mon, Feb 28, 2022 at 12:59 PM Richard Henderson 
> <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 2/28/22 00:14, Thomas Huth wrote:
>      > Full patch can be seen here:
>      >
>      > https://gitlab.com/thuth/qemu/-/commit/38af118ea2fef0c473
>     <https://gitlab.com/thuth/qemu/-/commit/38af118ea2fef0c473>
> 
> 
>      > static inline void mvcrl_8(const char *dst, const char *src)
>      > {
>      >     asm volatile (
>      >     "llill %%r0, 8\n"
>      >     ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
>      >     : : [dst] "d" (dst), [src] "d" (src)
>      >     : "memory");
>      > }
> 
>     Need clobber of r0 here.

Right. This test fails with Clang, indeed, as I discovered today, since 
Clang uses r0 more often than GCC, as it seems. I've already sent some 
patches for some other tests today, so there'll be another s390x pull 
request next week for TCG tests fixups :-)

  Thomas


>      > #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
>      > {                            \
>      >     uint64_t res = 0;        \
>      >     asm (                    \
>      >          "lg %%r2, %[a]\n"   \
>      >          "lg %%r3, %[b]\n"   \
>      >          "lg %%r0, %[c]\n"   \
>      >          "ltgr %%r0, %%r0\n" \
>      >          ASM                 \
>      >          "stg %%r0, %[res] " \
>      >          : [res] "=m" (res)  \
>      >          : [a] "m" (a),      \
>      >            [b] "m" (b),      \
>      >            [c] "m" (c)       \
>      >          : "r0", "r2",       \
>      >            "r3", "r4"        \
>      >     );                       \
>      >     return res;              \
>      > }
>      >
>      > Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n")
>      > Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n")
>      > Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n")
> 
>     This isn't actively broken, but could use the same treatment as NCRK et al:
> 
>     #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
>     {                            \
>           uint64_t res;            \
>           asm("ltgr %[c], %[c]\n\t" ASM
>               : [res] "=&r" (res)
>               : [a] "r" (a), [b] "r" (b), [c] "r" (c)
>               : "cc");
>           return res;
>     }
> 
>     Fi3(_selre,   ".insn rrf, 0xB9F00000, %[res], %[a], %[b], 8")
> 
>     etc.
> 
> 
>     r~
> 


