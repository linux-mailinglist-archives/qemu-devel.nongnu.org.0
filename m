Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F24C7658
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:03:27 +0100 (CET)
Received: from localhost ([::1]:36050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkMo-0008AN-Rj
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:03:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkJ4-00050Q-3f
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 12:59:34 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35717
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkIz-0001eo-4b
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 12:59:32 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so15472454pjt.0
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 09:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BwkfpREBgcJ8nAOb6SaelF1nE5To/hhoMMt6nUoajTw=;
 b=So8Y/osn6qJXZyOjpRl33BURiKYlu/zluMTqmR/C08Y40m32A4x3lOyGuSkZlKpSBI
 zbHbzU+qp14w/VGBcDI9OtmfwpXT0zJu9jXCtcepMbikoEPB3b/o35IrBJksPY+0oXvP
 +brCTih2OTCUWSArkZ9qoJ9+WMw8QeGWe0TnWE1z2wpwTvHGLBa59sEgl5zomTaVO+fW
 mfXPESxz4CAyBRAbDEkssTKtFNImVwFfDIrHVDRqlLZRNVG15wWO9moYIHJ+1aYu8szZ
 Y+p7xfm6ult0EDTHpsRzfwPZOLfSdG934WEZGRVn+5mur8eE2riW9tPuXMTS+BIjdPL5
 knpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BwkfpREBgcJ8nAOb6SaelF1nE5To/hhoMMt6nUoajTw=;
 b=cemJPF6Dpv1JlU+TVn5IIu7d87y04INoEAtl6fH8701B2Z/KPG8VU/6tB0/ME+wBye
 R6OYQf+6Fr1WFkZSHb7sDh/guNdE3sbftBek5QrDMURVWJKdY3/dSkbGmleuPqYH4jZ2
 9khL38aEQP+fV0gka1TS3yRxoHkh8d+vnCErSi4lCUdgdbm5UmRDffiMkA675FhiK3XY
 8GHPH82KcM4woWlN/Mud3/ERbPuBgWTpxHZgBEGdLCowfyv+1dNEIe8Rl0m3l/zSgkpz
 cp2WFYj1fqeRW/Zbx1UhVSwOaVCCm3PS+2lEdHkRAsQunbGbTg33UuhJ3VasCnSMCEU8
 qp7A==
X-Gm-Message-State: AOAM533tHF7KissQ0MIFJ/dPkWLEiG+iLpk5lAeKxZvaytncvPOuK486
 x1VOrBnC/9QgpUgLb5Ck7KREEw==
X-Google-Smtp-Source: ABdhPJyfvpxD8TGHYUMv8AD2hcmpPrqF8+vTIdjY3Wdwr7G30Gb/7nJ7SCnVLGwaNcUSEEgmRyIjVg==
X-Received: by 2002:a17:902:7204:b0:14f:b325:7658 with SMTP id
 ba4-20020a170902720400b0014fb3257658mr21505558plb.110.1646071165334; 
 Mon, 28 Feb 2022 09:59:25 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a62640c000000b004f104f0ee75sm13230351pfb.185.2022.02.28.09.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 09:59:24 -0800 (PST)
Message-ID: <9aeda35f-1bce-d8eb-9dba-4993dc6a605d@linaro.org>
Date: Mon, 28 Feb 2022 07:59:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, David Miller <dmiller423@gmail.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220223223117.66660-1-dmiller423@gmail.com>
 <20220223223117.66660-4-dmiller423@gmail.com>
 <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
 <3853fa79-4578-be7b-4a2f-5b31cdd5c4c7@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3853fa79-4578-be7b-4a2f-5b31cdd5c4c7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 2/28/22 00:14, Thomas Huth wrote:
> Full patch can be seen here:
> 
> https://gitlab.com/thuth/qemu/-/commit/38af118ea2fef0c473


> static inline void mvcrl_8(const char *dst, const char *src)
> {
>     asm volatile (
>     "llill %%r0, 8\n"
>     ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
>     : : [dst] "d" (dst), [src] "d" (src)
>     : "memory");
> }

Need clobber of r0 here.

> #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
> {                            \
>     uint64_t res = 0;        \
>     asm (                    \
>          "lg %%r2, %[a]\n"   \
>          "lg %%r3, %[b]\n"   \
>          "lg %%r0, %[c]\n"   \
>          "ltgr %%r0, %%r0\n" \
>          ASM                 \
>          "stg %%r0, %[res] " \
>          : [res] "=m" (res)  \
>          : [a] "m" (a),      \
>            [b] "m" (b),      \
>            [c] "m" (c)       \
>          : "r0", "r2",       \
>            "r3", "r4"        \
>     );                       \
>     return res;              \
> }
> 
> Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n")
> Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n")
> Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n")

This isn't actively broken, but could use the same treatment as NCRK et al:

#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
{                            \
     uint64_t res;            \
     asm("ltgr %[c], %[c]\n\t" ASM
         : [res] "=&r" (res)
         : [a] "r" (a), [b] "r" (b), [c] "r" (c)
         : "cc");
     return res;
}

Fi3(_selre,   ".insn rrf, 0xB9F00000, %[res], %[a], %[b], 8")

etc.


r~

