Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3BB3BE082
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:10:59 +0200 (CEST)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0w5a-0004Wj-E3
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0w4S-0003rc-Pn
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:09:48 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0w4Q-0004LC-JK
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:09:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id i13so132092plb.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Elf6yd51xkGVv1HCTXaAsNiPJI9YFXcZSMrOV69Y7bM=;
 b=hVkDFUHHLBbbmtBBkRhtms5RNSFqn277YQ/bHrBPV70GvbeYcU24SGy+jBk7ZGIpGT
 gyBVUPZyw0Rwyzen4bBoJbGOXVMiiF57okCUbKu3aPcjfqwioYXHoCjZzkZPery5eLbg
 AH/uVk2c2tQBvCqCkC7SQ/WFUM422mn3e/O5CG8V191Pi702EB00pm9N+SGr4FugrLQI
 6QHM9Sl/+vUOkFZXc1wz1l0ghKN4+KdCv46t8U1T7z8VKkg+42sDQaeO0LE4UVUI9GsJ
 uArrrvdxD8x0rtiZgRQ8SrW9vkvsKAK+I7IUCmskO+sS164A34i9WD2lmkumxNOhymNA
 Ertw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Elf6yd51xkGVv1HCTXaAsNiPJI9YFXcZSMrOV69Y7bM=;
 b=V7jK6GKG+rWWe0tWhaUwkYT9ZhmNTZNeQ9hH6Syf/DE2NnOpigDvVzgRzO2/HBx1m8
 WPm4hecWekipKcwV//7RLRy0ZUdq8AAxgcf8B+tlDlSqFrnKacM182a5QI1LOKPZR0rn
 etirhrhguUV2ezPClEbk1c++qI8IDCeWMLdzOBCceAbXRCsNE6BxYib/lSCLrEWmORZ7
 EvRF2oG0e48NIWw/PCKludzUc2AHgk8t+oMUmIxgHMrtpMo4gvZH3w5kUgUW+FoIqKl9
 3yY64T88eRB/7bpjPbLlY2SyPm7LIDwR6IF2WOrncEBKxJej3h8l7KkGCvQ2QrI/hZl1
 PS+Q==
X-Gm-Message-State: AOAM531XD+YfbDXVdsxKaj9V69ooMx0x/n1brpD5oQQ6A5qChvFAWni8
 3rzwQw2C1OuUl7H1xAyDIJqXcA==
X-Google-Smtp-Source: ABdhPJz/8vZRqn3Tc52Vz5c9UVAzni9xRt4f01Rg6AtzU0yoqhOf8eqTQvH5k1IMs75thD2jkWhThw==
X-Received: by 2002:a17:90b:4b87:: with SMTP id
 lr7mr23761854pjb.214.1625620184966; 
 Tue, 06 Jul 2021 18:09:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id e24sm17995692pfn.127.2021.07.06.18.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:09:44 -0700 (PDT)
Subject: Re: [RFC PATCH 8/8] target/i386: Move X86XSaveArea into TCG
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210705104632.2902400-1-david.edmondson@oracle.com>
 <20210705104632.2902400-9-david.edmondson@oracle.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d75c3ab-926b-d4cd-244a-8c8b603535f9@linaro.org>
Date: Tue, 6 Jul 2021 18:09:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705104632.2902400-9-david.edmondson@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, babu.moger@amd.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 3:46 AM, David Edmondson wrote:
> Given that TCG is now the only consumer of X86XSaveArea, move the
> structure definition and associated offset declarations and checks to a
> TCG specific header.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>   target/i386/cpu.h            | 57 ------------------------------------
>   target/i386/tcg/fpu_helper.c |  1 +
>   target/i386/tcg/tcg-cpu.h    | 57 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 58 insertions(+), 57 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 96b672f8bd..0f7ddbfeae 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1305,48 +1305,6 @@ typedef struct XSavePKRU {
>       uint32_t padding;
>   } XSavePKRU;
>   
> -#define XSAVE_FCW_FSW_OFFSET    0x000
> -#define XSAVE_FTW_FOP_OFFSET    0x004
> -#define XSAVE_CWD_RIP_OFFSET    0x008
> -#define XSAVE_CWD_RDP_OFFSET    0x010
> -#define XSAVE_MXCSR_OFFSET      0x018
> -#define XSAVE_ST_SPACE_OFFSET   0x020
> -#define XSAVE_XMM_SPACE_OFFSET  0x0a0
> -#define XSAVE_XSTATE_BV_OFFSET  0x200
> -#define XSAVE_AVX_OFFSET        0x240
> -#define XSAVE_BNDREG_OFFSET     0x3c0
> -#define XSAVE_BNDCSR_OFFSET     0x400
> -#define XSAVE_OPMASK_OFFSET     0x440
> -#define XSAVE_ZMM_HI256_OFFSET  0x480
> -#define XSAVE_HI16_ZMM_OFFSET   0x680
> -#define XSAVE_PKRU_OFFSET       0xa80
> -
> -typedef struct X86XSaveArea {
> -    X86LegacyXSaveArea legacy;
> -    X86XSaveHeader header;
> -
> -    /* Extended save areas: */
> -
> -    /* AVX State: */
> -    XSaveAVX avx_state;
> -
> -    /* Ensure that XSaveBNDREG is properly aligned. */
> -    uint8_t padding[XSAVE_BNDREG_OFFSET
> -                    - sizeof(X86LegacyXSaveArea)
> -                    - sizeof(X86XSaveHeader)
> -                    - sizeof(XSaveAVX)];
> -
> -    /* MPX State: */
> -    XSaveBNDREG bndreg_state;
> -    XSaveBNDCSR bndcsr_state;
> -    /* AVX-512 State: */
> -    XSaveOpmask opmask_state;
> -    XSaveZMM_Hi256 zmm_hi256_state;
> -    XSaveHi16_ZMM hi16_zmm_state;
> -    /* PKRU State: */
> -    XSavePKRU pkru_state;
> -} X86XSaveArea;
> -
>   QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
>   QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
>   QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
> @@ -1355,21 +1313,6 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
>   QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
>   QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
>   
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) != XSAVE_FCW_FSW_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) != XSAVE_FTW_FOP_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) != XSAVE_CWD_RIP_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) != XSAVE_CWD_RDP_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) != XSAVE_MXCSR_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) != XSAVE_ST_SPACE_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) != XSAVE_XMM_SPACE_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
> -
>   typedef struct ExtSaveArea {
>       uint32_t feature, bits;
>       uint32_t offset, size;
> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> index 4e11965067..74bbe94b80 100644
> --- a/target/i386/tcg/fpu_helper.c
> +++ b/target/i386/tcg/fpu_helper.c
> @@ -20,6 +20,7 @@
>   #include "qemu/osdep.h"
>   #include <math.h>
>   #include "cpu.h"
> +#include "tcg-cpu.h"
>   #include "exec/helper-proto.h"
>   #include "fpu/softfloat.h"
>   #include "fpu/softfloat-macros.h"
> diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h
> index 36bd300af0..53a8494455 100644
> --- a/target/i386/tcg/tcg-cpu.h
> +++ b/target/i386/tcg/tcg-cpu.h
> @@ -19,6 +19,63 @@
>   #ifndef TCG_CPU_H
>   #define TCG_CPU_H
>   
> +#define XSAVE_FCW_FSW_OFFSET    0x000
> +#define XSAVE_FTW_FOP_OFFSET    0x004
> +#define XSAVE_CWD_RIP_OFFSET    0x008
> +#define XSAVE_CWD_RDP_OFFSET    0x010
> +#define XSAVE_MXCSR_OFFSET      0x018
> +#define XSAVE_ST_SPACE_OFFSET   0x020
> +#define XSAVE_XMM_SPACE_OFFSET  0x0a0
> +#define XSAVE_XSTATE_BV_OFFSET  0x200
> +#define XSAVE_AVX_OFFSET        0x240
> +#define XSAVE_BNDREG_OFFSET     0x3c0
> +#define XSAVE_BNDCSR_OFFSET     0x400
> +#define XSAVE_OPMASK_OFFSET     0x440
> +#define XSAVE_ZMM_HI256_OFFSET  0x480
> +#define XSAVE_HI16_ZMM_OFFSET   0x680
> +#define XSAVE_PKRU_OFFSET       0xa80
> +
> +typedef struct X86XSaveArea {
> +    X86LegacyXSaveArea legacy;
> +    X86XSaveHeader header;
> +
> +    /* Extended save areas: */
> +
> +    /* AVX State: */
> +    XSaveAVX avx_state;
> +
> +    /* Ensure that XSaveBNDREG is properly aligned. */
> +    uint8_t padding[XSAVE_BNDREG_OFFSET
> +                    - sizeof(X86LegacyXSaveArea)
> +                    - sizeof(X86XSaveHeader)
> +                    - sizeof(XSaveAVX)];
> +
> +    /* MPX State: */
> +    XSaveBNDREG bndreg_state;
> +    XSaveBNDCSR bndcsr_state;
> +    /* AVX-512 State: */
> +    XSaveOpmask opmask_state;
> +    XSaveZMM_Hi256 zmm_hi256_state;
> +    XSaveHi16_ZMM hi16_zmm_state;
> +    /* PKRU State: */
> +    XSavePKRU pkru_state;
> +} X86XSaveArea;
> +
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) != XSAVE_FCW_FSW_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) != XSAVE_FTW_FOP_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) != XSAVE_CWD_RIP_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) != XSAVE_CWD_RDP_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) != XSAVE_MXCSR_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) != XSAVE_ST_SPACE_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) != XSAVE_XMM_SPACE_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);

My only quibble is that these offsets are otherwise unused.  This just becomes validation 
of compiler layout.

I presume that XSAVE_BNDREG_OFFSET is not merely ROUND_UP(offsetof(avx_state) + 
sizeof(avx_state), some_pow2)?

Do these offsets need to be migrated?  Otherwise, how can one start a vm with kvm and then 
migrate to tcg?  I presume the offsets above are constant for a given cpu, and that 
whatever cpu provides different offsets is not supported by tcg?  Given the lack of avx, 
that's trivial these days...


r~

