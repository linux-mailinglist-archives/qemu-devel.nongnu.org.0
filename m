Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E8C357EB3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:07:03 +0200 (CEST)
Received: from localhost ([::1]:40348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQcw-0006n7-Se
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUQab-0005s5-QQ
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:04:37 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUQaZ-0001Mi-Le
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:04:37 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x15so1284966wrq.3
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Dtqd6W8O9vCxSdmsz3CClJlyAyCflKDDHPIyhUPfA40=;
 b=AbYR+Pore0M46E5oLVwrQbTPGrimYJ07Rj2+Nap2KbVtdztI80GOJVGJZcuHnr2qie
 Annj662wnSmLvxIo8qwGv9WzYwMy9GB+sh8IVZLqTYSPV9Ct5jTT9h7hh9V1C4+DqELR
 +pM4wJLZmp89CAdW5ceuH98bcqo7sJC5S6DzR7OcUVNANARwndfLyuzW8lF5457iKb9v
 qcFArWMtwfqi0xlo91EeprYf6G6x4UDcNGMlBOGBoQrG5dJj3SgyUpsXUnGhBvlJUiNi
 Pm8YVs8WZFSy51oH6r8PXQIgD42i2bNDf7Zg4etpGpVvgxABow69+yOdvkIiLgwrDDKR
 ZIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Dtqd6W8O9vCxSdmsz3CClJlyAyCflKDDHPIyhUPfA40=;
 b=YmV226IJ/HJzoz9MH6YpXCwoKeWSPlqNmr/50pW0myx5KYxEbpPtbgZVOtfmsaBXA8
 Bi9Pqd6+rWxZn8TTXM3fMX2RsjnyW3htfimEV162MpvBX5PuyQYs6WrVuSeQQJu1snfp
 iQCleIJ7vOAiPRp8fRUWweXLnHv4JZXoEVVyy+zfxiYvSmFY9NrALv6IzNRSvJ7ro7NU
 5wu60w/0RA9j9m7EoJmZmko9nJFpjw3VggI1E1T+psZb45pzMvcz+V3h8L4nNpskmQrP
 SGdM38pP2AOcKgoB1MtSCJDIKq84uNn2JExUvxWHjLCM9Rc+7N/QgkxV9+sjJgKLdxWz
 1Nmg==
X-Gm-Message-State: AOAM5315PgaYEya0t+xtisf83Qn0s8uUq+ZXUBOwnYb0oOR24hoHQhd4
 Rbi0AiQJ67VcblV8OpdtJLr/dA==
X-Google-Smtp-Source: ABdhPJxYms6J7m5Qj00Jf+T7rpWKrZTfPspaR7TzJhEiCcl8eiH1rwZXsWaormX95yF5HST40oTZOA==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr9975138wrc.168.1617872674161; 
 Thu, 08 Apr 2021 02:04:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g13sm3136830wrr.9.2021.04.08.02.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 02:04:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D2771FF7E;
 Thu,  8 Apr 2021 10:04:32 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 04/12] target/arm: Split out mte_probe_int
Date: Thu, 08 Apr 2021 10:01:39 +0100
In-reply-to: <20210406174031.64299-5-richard.henderson@linaro.org>
Message-ID: <87v98xtae7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

> Split out a helper function from mte_checkN to perform
> all of the checking and address manpulation.  So far,
> just use this in mte_checkN itself.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index c87717127c..144bfa4a51 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -753,33 +753,45 @@ static int checkN(uint8_t *mem, int odd, int cmp, i=
nt count)
>      return n;
>  }
>=20=20
> -uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
> -                    uint64_t ptr, uintptr_t ra)
> +/*
> + * mte_probe_int:

nit: you might as well go full kernel-doc here as you are documenting
the helper:

/**
 * mte_probe_int() - helper for mte_probe and mte_check

> + * @env: CPU environment
> + * @desc: MTEDESC descriptor
> + * @ptr: virtual address of the base of the access
> + * @fault: return virtual address of the first check failure
> + *
> + * Internal routine for both mte_probe and mte_check.
> + * Return zero on failure, filling in *fault.
> + * Return negative on trivial success for tbi disabled.
> + * Return positive on success with tbi enabled.
> + */
> +static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
> +                         uintptr_t ra, uint32_t total, uint64_t *fault)
>  {
>      int mmu_idx, ptr_tag, bit55;
>      uint64_t ptr_last, prev_page, next_page;
>      uint64_t tag_first, tag_last;
>      uint64_t tag_byte_first, tag_byte_last;
> -    uint32_t total, tag_count, tag_size, n, c;
> +    uint32_t tag_count, tag_size, n, c;
>      uint8_t *mem1, *mem2;
>      MMUAccessType type;
>=20=20
>      bit55 =3D extract64(ptr, 55, 1);
> +    *fault =3D ptr;
>=20=20
>      /* If TBI is disabled, the access is unchecked, and ptr is not dirty=
. */
>      if (unlikely(!tbi_check(desc, bit55))) {
> -        return ptr;
> +        return -1;
>      }
>=20=20
>      ptr_tag =3D allocation_tag_from_addr(ptr);
>=20=20
>      if (tcma_check(desc, bit55, ptr_tag)) {
> -        goto done;
> +        return 1;
>      }
>=20=20
>      mmu_idx =3D FIELD_EX32(desc, MTEDESC, MIDX);
>      type =3D FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DAT=
A_LOAD;
> -    total =3D FIELD_EX32(desc, MTEDESC, TSIZE);
>=20=20
>      /* Find the addr of the end of the access, and of the last element. =
*/
>      ptr_last =3D ptr + total - 1;
> @@ -803,7 +815,7 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>          mem1 =3D allocation_tag_mem(env, mmu_idx, ptr, type, total,
>                                    MMU_DATA_LOAD, tag_size, ra);
>          if (!mem1) {
> -            goto done;
> +            return 1;
>          }
>          /* Perform all of the comparisons. */
>          n =3D checkN(mem1, ptr & TAG_GRANULE, ptr_tag, tag_count);
> @@ -829,23 +841,39 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>          }
>          if (n =3D=3D c) {
>              if (!mem2) {
> -                goto done;
> +                return 1;
>              }
>              n +=3D checkN(mem2, 0, ptr_tag, tag_count - c);
>          }
>      }
>=20=20
> +    if (likely(n =3D=3D tag_count)) {
> +        return 1;
> +    }
> +
>      /*
>       * If we failed, we know which granule.  For the first granule, the
>       * failure address is @ptr, the first byte accessed.  Otherwise the
>       * failure address is the first byte of the nth granule.
>       */
> -    if (unlikely(n < tag_count)) {
> -        uint64_t fault =3D (n =3D=3D 0 ? ptr : tag_first + n * TAG_GRANU=
LE);
> -        mte_check_fail(env, desc, fault, ra);
> +    if (n > 0) {
> +        *fault =3D tag_first + n * TAG_GRANULE;
>      }
> +    return 0;
> +}
>=20=20
> - done:
> +uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
> +                    uint64_t ptr, uintptr_t ra)
> +{
> +    uint64_t fault;
> +    uint32_t total =3D FIELD_EX32(desc, MTEDESC, TSIZE);
> +    int ret =3D mte_probe_int(env, desc, ptr, ra, total, &fault);
> +
> +    if (unlikely(ret =3D=3D 0)) {
> +        mte_check_fail(env, desc, fault, ra);
> +    } else if (ret < 0) {
> +        return ptr;
> +    }
>      return useronly_clean_ptr(ptr);
>  }

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

