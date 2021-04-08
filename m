Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A06357EBD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:10:01 +0200 (CEST)
Received: from localhost ([::1]:49146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQfo-000222-3K
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUQcU-0007NW-J1
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:06:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUQcQ-0002Vm-Iw
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:06:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 g18-20020a7bc4d20000b0290116042cfdd8so2512132wmk.4
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 02:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=awRN3RcVuVTw8TRdkIAUzoY8+X6bZBfkKVaaIB882yk=;
 b=FEqqGq0JMgW+Y2vpZF2YqkIKMCibwHbHUrPEn6fSqRx4KQuLApwfG61k52TV+IxAYy
 X9NovWa6zC/A4lpXIIHuIJcFN9YKyzsFzI8Np0bUb0SZNRp5QIpADLGdc0Shy+58jqJg
 0xwXCB0QtKzt/AzDLGEaCGhSAIkZizptRUviEsALHHe1APwEEhhCyiyNQTInbILV5Bsj
 GRT1E3ePoGf3MxOMKcklsXdfbt/adjCJGrT5ik9tZfap23+fX72bKFEo9AJEh53B5DqQ
 4gPlkscIIWEjKpUbXqJv6wPR8h62F1tfMf/JRuU67sYPIPEL1DZaq1m9KqLoL/iixnl6
 ppZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=awRN3RcVuVTw8TRdkIAUzoY8+X6bZBfkKVaaIB882yk=;
 b=pkxaSVHBAG12wyli2vjcRYnR4sqicVISw5VD4dHhT5WsFjDxf5nxhkilRW1Z7TDwc4
 ptalRE82qVira0VVOrT1HCgCPE865OXD8GpRMNklXTcajVJoCCjngfL2BWGn6G/xiJJS
 +gWK+z0s7A1jJVP21+AGE5mGb3fKlD2fAxgJsm6FVmE/KmG6SdctmrVvCMZ+571oQ8zs
 kC6qdG+tsDIJNpGB+Xk70VdZK86+cATI6zIq1pHa5U8Y68Ve81r5TwoagMvF6j9g85q1
 g0HrI6jqQjpI98vFitEbefWhfYrbs5OFXblqawBPGL6NIl6xaxDRIr2Q/iWl5015Uzpw
 czWg==
X-Gm-Message-State: AOAM532AOFzanQxjsiPKeooE2r9ZLHbb4/NdiziyBC6ZNK90tjDDE6fj
 s0S3nicU0ruzrNJlJbkkC+WEWA==
X-Google-Smtp-Source: ABdhPJwNq0xeG5Q0zx19A+CH7XpzN8wQe+wuqra2/Zjt7NPJojJwUPI/gEMh1rPa/rpzdK6RrhFW+g==
X-Received: by 2002:a05:600c:358c:: with SMTP id
 p12mr7448127wmq.159.1617872789164; 
 Thu, 08 Apr 2021 02:06:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x12sm35588906wrr.7.2021.04.08.02.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 02:06:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE59C1FF7E;
 Thu,  8 Apr 2021 10:06:27 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 05/12] target/arm: Fix unaligned checks for
 mte_check1, mte_probe1
Date: Thu, 08 Apr 2021 10:05:50 +0100
In-reply-to: <20210406174031.64299-6-richard.henderson@linaro.org>
Message-ID: <87sg41tab0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We were incorrectly assuming that only the first byte of an MTE access
> is checked against the tags.  But per the ARM, unaligned accesses are
> pre-decomposed into single-byte accesses.  So by the time we reach the
> actual MTE check in the ARM pseudocode, all accesses are aligned.
>
> We cannot tell a priori whether or not a given scalar access is aligned,
> therefore we must at least check.  Use mte_probe_int, which is already
> set up for checking multiple granules.
>
> Buglink: https://bugs.launchpad.net/bugs/1921948
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

(tested with hand crafted kunit test)

> ---
>  target/arm/mte_helper.c | 109 +++++++++++++---------------------------
>  1 file changed, 35 insertions(+), 74 deletions(-)
>
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 144bfa4a51..619c4b9351 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -617,80 +617,6 @@ static void mte_check_fail(CPUARMState *env, uint32_=
t desc,
>      }
>  }
>=20=20
> -/*
> - * Perform an MTE checked access for a single logical or atomic access.
> - */
> -static bool mte_probe1_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
> -                           uintptr_t ra, int bit55)
> -{
> -    int mem_tag, mmu_idx, ptr_tag, size;
> -    MMUAccessType type;
> -    uint8_t *mem;
> -
> -    ptr_tag =3D allocation_tag_from_addr(ptr);
> -
> -    if (tcma_check(desc, bit55, ptr_tag)) {
> -        return true;
> -    }
> -
> -    mmu_idx =3D FIELD_EX32(desc, MTEDESC, MIDX);
> -    type =3D FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DAT=
A_LOAD;
> -    size =3D FIELD_EX32(desc, MTEDESC, ESIZE);
> -
> -    mem =3D allocation_tag_mem(env, mmu_idx, ptr, type, size,
> -                             MMU_DATA_LOAD, 1, ra);
> -    if (!mem) {
> -        return true;
> -    }
> -
> -    mem_tag =3D load_tag1(ptr, mem);
> -    return ptr_tag =3D=3D mem_tag;
> -}
> -
> -/*
> - * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
> - * Returns false if the access is Checked and the check failed.  This
> - * is only intended to probe the tag -- the validity of the page must
> - * be checked beforehand.
> - */
> -bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
> -{
> -    int bit55 =3D extract64(ptr, 55, 1);
> -
> -    /* If TBI is disabled, the access is unchecked. */
> -    if (unlikely(!tbi_check(desc, bit55))) {
> -        return true;
> -    }
> -
> -    return mte_probe1_int(env, desc, ptr, 0, bit55);
> -}
> -
> -uint64_t mte_check1(CPUARMState *env, uint32_t desc,
> -                    uint64_t ptr, uintptr_t ra)
> -{
> -    int bit55 =3D extract64(ptr, 55, 1);
> -
> -    /* If TBI is disabled, the access is unchecked, and ptr is not dirty=
. */
> -    if (unlikely(!tbi_check(desc, bit55))) {
> -        return ptr;
> -    }
> -
> -    if (unlikely(!mte_probe1_int(env, desc, ptr, ra, bit55))) {
> -        mte_check_fail(env, desc, ptr, ra);
> -    }
> -
> -    return useronly_clean_ptr(ptr);
> -}
> -
> -uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t pt=
r)
> -{
> -    return mte_check1(env, desc, ptr, GETPC());
> -}
> -
> -/*
> - * Perform an MTE checked access for multiple logical accesses.
> - */
> -
>  /**
>   * checkN:
>   * @tag: tag memory to test
> @@ -882,6 +808,41 @@ uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32=
_t desc, uint64_t ptr)
>      return mte_checkN(env, desc, ptr, GETPC());
>  }
>=20=20
> +uint64_t mte_check1(CPUARMState *env, uint32_t desc,
> +                    uint64_t ptr, uintptr_t ra)
> +{
> +    uint64_t fault;
> +    uint32_t total =3D FIELD_EX32(desc, MTEDESC, ESIZE);
> +    int ret =3D mte_probe_int(env, desc, ptr, ra, total, &fault);
> +
> +    if (unlikely(ret =3D=3D 0)) {
> +        mte_check_fail(env, desc, fault, ra);
> +    } else if (ret < 0) {
> +        return ptr;
> +    }
> +    return useronly_clean_ptr(ptr);
> +}
> +
> +uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t pt=
r)
> +{
> +    return mte_check1(env, desc, ptr, GETPC());
> +}
> +
> +/*
> + * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
> + * Returns false if the access is Checked and the check failed.  This
> + * is only intended to probe the tag -- the validity of the page must
> + * be checked beforehand.
> + */
> +bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
> +{
> +    uint64_t fault;
> +    uint32_t total =3D FIELD_EX32(desc, MTEDESC, ESIZE);
> +    int ret =3D mte_probe_int(env, desc, ptr, 0, total, &fault);
> +
> +    return ret !=3D 0;
> +}
> +
>  /*
>   * Perform an MTE checked access for DC_ZVA.
>   */


--=20
Alex Benn=C3=A9e

