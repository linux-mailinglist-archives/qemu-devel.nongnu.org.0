Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54543559BC2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:39:44 +0200 (CEST)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kTH-0007z1-Dt
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4k7M-0002UP-Ep
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:17:05 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4k7K-0002Tf-NR
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:17:04 -0400
Received: by mail-pg1-x534.google.com with SMTP id q140so2554324pgq.6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3jJQAusAk2c0Q/A4meJ6eTMz3NMMwKmecYfR4GUNgck=;
 b=hZIs6V5ZhGehLmFWTr2S1puNyt8BFgfXoqA57Xyu4DSB7Sv/RP9FElBBsW5w8kuvCo
 u22Zcbnh2aYXO3B12OdvLQVYEajhztSJVJvdgve59nC/JHl3DvqIJYNJOEL6I+E4SK7e
 h67TiCXcDEacC9AVZRtae0coI4Y7lQ/qrXpxIZGq0hVIGEITvQUYbpvfJe3NIMcXxZGq
 m6ctLVcf2Q8AQ7AUUwQwLtfQfwRBt5QDdXx3yQ2aG++phCC3v4CNUJDSWd8fD2Bm88xw
 OUts3F2Iw22l8BuEb+v3RzAMg7dc0hAX0SLrZpbG4eY/+F3bolf8Ywr8gehsdv8iclWz
 wwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3jJQAusAk2c0Q/A4meJ6eTMz3NMMwKmecYfR4GUNgck=;
 b=df/rDgUPVZ+jWMncCy3FWjFPBbS88YwwYRKinge7LYgu22HgklGduaJ/tEn5SQHL0u
 BEWsruKVqGXIqpcig4Eb/tDZcJBdGeyg5m3Lsp6TxgPSCLRNHFvJCIXhrzM7biKpHKmF
 Sj6OTx6kcXVY30uTTiveffbI4+Kdo4M4uapl/I4DNwwKm5c7Hw8AWYO81ADOfd4G1hSy
 TdJR62/QY4LvsLCRVz/XmODD2O1fYQrQBwY2cmgn1gF2SCdebZB+LZNS8833Eur3pF9X
 TZXm25H+8bUgCBgpZmVB1MdY/aVCapghTEJA4nT6+nYfDc8g92T6O2lZ5zhjrrbXy4Tg
 nBqA==
X-Gm-Message-State: AJIora8scQUsFNFf3oRnr2zJRVrX6zLGx7ORIuzoQNtKIflyM7t3B+H2
 ydVzdMBqUpj+oYu07kVq2N701Q==
X-Google-Smtp-Source: AGRyM1t3Fk4av4l3yPcxrpMVTyxulO0A01eqpBAP1uyoauswKdlxkdiBYekqdShQ13PBjYer3+CcEA==
X-Received: by 2002:a63:4643:0:b0:3fe:e16a:a01f with SMTP id
 v3-20020a634643000000b003fee16aa01fmr11911793pgk.91.1656080220548; 
 Fri, 24 Jun 2022 07:17:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b001df264610c4sm11513383pjb.0.2022.06.24.07.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 07:17:00 -0700 (PDT)
Message-ID: <c2eae981-55e4-0430-ee56-ac853cfc930d@linaro.org>
Date: Fri, 24 Jun 2022 07:16:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 30/51] target/arm: Implement FMOPA, FMOPS (non-widening)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-31-richard.henderson@linaro.org>
 <CAFEAcA-y99PmUdPbdrWSj=_vUy35tRRFOJgkG2Lyg1A_iK6qRQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-y99PmUdPbdrWSj=_vUy35tRRFOJgkG2Lyg1A_iK6qRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/22 05:31, Peter Maydell wrote:
> On Mon, 20 Jun 2022 at 19:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
>> +                         void *vpm, void *vst, uint32_t desc)
>> +{
>> +    intptr_t row, col, oprsz = simd_maxsz(desc);
>> +    uint32_t neg = simd_data(desc) << 31;
>> +    uint16_t *pn = vpn, *pm = vpm;
>> +
>> +    bool save_dn = get_default_nan_mode(vst);
>> +    set_default_nan_mode(true, vst);
>> +
>> +    for (row = 0; row < oprsz; ) {
>> +        uint16_t pa = pn[H2(row >> 4)];
>> +        do {
>> +            if (pa & 1) {
>> +                void *vza_row = vza + row * sizeof(ARMVectorReg);
>> +                uint32_t n = *(uint32_t *)(vzn + row) ^ neg;
>> +
>> +                for (col = 0; col < oprsz; ) {
>> +                    uint16_t pb = pm[H2(col >> 4)];
>> +                    do {
>> +                        if (pb & 1) {
>> +                            uint32_t *a = vza_row + col;
>> +                            uint32_t *m = vzm + col;
>> +                            *a = float32_muladd(n, *m, *a, 0, vst);
>> +                        }
>> +                        col += 4;
>> +                        pb >>= 4;
>> +                    } while (col & 15);
>> +                }
>> +            }
>> +            row += 4;
>> +            pa >>= 4;
>> +        } while (row & 15);
>> +    }
> 
> The code for the double version seems straightforward:
> row counts from 0 up to the number of rows, and we
> do something per row. Why is the single precision version
> doing something with an unrolled loop here? It's confusing
> that 'oprsz' in the two functions isn't the same thing --
> in the double version we divide by the element size, but
> here we don't.

It's all about the predicate addressing.  For doubles, the bits are spaced 8 bits apart, 
which makes it easy as you see.  For singles, the bits are spaced 4 bits apart, which is 
inconvenient.  Anyway, just as over in sve_helper.c, I load uint16_t at a time and shift 
to find each predicate bit.

So it's not unrolled, exactly.  There's second loop over predicates.  And since this is a 
matrix op, we get loops nested 4 deep.

> The pseudocode says that we ignore floating point exceptions
> (ie do not accumulate them in the FPSR) -- it passes fpexc == false
> to FPMulAdd(). Don't we need to do something special to arrange
> for that ?

Oops, somewhere I read that as "do not trap" not "do not accumulate".
But R_TGSKG is very clear on this as accumulate.


r~


