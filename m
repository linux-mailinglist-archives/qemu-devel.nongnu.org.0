Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CA96C9E2A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 10:40:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgiNv-00023E-Ik; Mon, 27 Mar 2023 04:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgiNm-00022z-Mk
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 04:39:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgiNk-00051k-QT
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 04:39:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d17so7776989wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 01:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679906350;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EfCtTWxaCXjdbfNGevXGKdXDHA+idYUQLzGs6lRAd8U=;
 b=RGYIpmnkX/k7n3OFxz43ebntoSTq7tKPNLYCxdBB7OaV6BOALTPsap2E5UJ+tVOPx0
 gyY9iN/59k+4tsTlDF56CczRTTwwhlgyU86mjPi2w/Quthg9/YJ3NRvauwyBl6Pu+b2Y
 yBgTQcP6omB8Nv0M/2hd87jVAWbeEFlw9ELvLdC+B6ytrzMn+40DAjxkb7Hj/Y5xBzpy
 3FxU8C1Ya9BiUrm1AwN69Y6EIz4+RwSZbC7gRmQEdTjP8EDTsXiIbnHDJTunyXt4YRqu
 MdXkr+tbcV0XQTR96V7IgZibxmkh6ZGUFD1skNN+68a4kEPUMtjUSByTioPPGUqqKIID
 OzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679906350;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EfCtTWxaCXjdbfNGevXGKdXDHA+idYUQLzGs6lRAd8U=;
 b=KaWbuiJc/QVQKUmFtEr3hsIvF1Y50yO3sjLUo4Arzxnv8ECThO9eQ5nZe506VtOxS/
 v+mMQ9xwcLPvvSVtqjtLQ2Gp8Dq5cb8Jyylk5ReLRgnqaFkpkgFa9KklkkK6CITUeGEG
 4mDAqxYNP6K/4EJ9gaetf79NFmMqlo0+opyY8he5DrIxa2NvtN1qOUH6fqPnTO5zSoOq
 Crh9IieZaPqfqbnZocWQL4eZ1vDj1aTLoqvyuteMrskMhH2wmpVZH/WwLXpJ23BI3lG3
 QlKKg3DY87Gploh3gwWAPS5p+fGIthoKek9WuMr9S8oTqLxDxNxhUrxQthCF9Y+dv3Lh
 uV6w==
X-Gm-Message-State: AAQBX9dr1k9/kFybXTWUbE3uJ/IQjm3PZvCh8ZtXKIwgvX4HqEIsKjOu
 2wcSXJ0Ts7tyfru4jWq1wLTBaw==
X-Google-Smtp-Source: AKy350aIxNYGNzebZ0SPBSzq53Lty8VTASyqpAVbFzsRjt04ru9w/kj3pekylI8H5KGyh6MXweJ5+Q==
X-Received: by 2002:adf:dcc6:0:b0:2c7:1b4c:da75 with SMTP id
 x6-20020adfdcc6000000b002c71b4cda75mr9309317wrm.69.1679906350348; 
 Mon, 27 Mar 2023 01:39:10 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b002c5691f13eesm24391848wrn.50.2023.03.27.01.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 01:39:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7407F1FFB7;
 Mon, 27 Mar 2023 09:39:09 +0100 (BST)
References: <20230322150744.175010-1-richard.henderson@linaro.org>
 <20230322150744.175010-12-richard.henderson@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: cota@braap.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0 11/11] linux-user/arm: Take more care allocating
 commpage
Date: Mon, 27 Mar 2023 09:38:33 +0100
In-reply-to: <20230322150744.175010-12-richard.henderson@linaro.org>
Message-ID: <87zg7ysi4y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> User setting of -R reserved_va can lead to an assertion
> failure in page_set_flags.  Sanity check the value of
> reserved_va and print an error message instead.  Do not
> allocate a commpage at all for m-profile cpus.

I see this:

  TEST    convd on i386
qemu-i386: Unable to reserve 0x100000000 bytes of virtual address space
at 0x8000 (File exists) for use as guest address space (check your
virtual memory ulimit setting, min_mmap_addr or reserve less using -R
option)

on the ubuntu aarch64 static build:

  https://gitlab.com/stsquad/qemu/-/jobs/4003523064

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 37 +++++++++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index b068676340..0529430b1d 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -422,12 +422,32 @@ enum {
>=20=20
>  static bool init_guest_commpage(void)
>  {
> -    abi_ptr commpage =3D HI_COMMPAGE & -qemu_host_page_size;
> -    void *want =3D g2h_untagged(commpage);
> -    void *addr =3D mmap(want, qemu_host_page_size, PROT_READ | PROT_WRIT=
E,
> -                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
> +    ARMCPU *cpu =3D ARM_CPU(thread_cpu);
> +    abi_ptr want =3D HI_COMMPAGE & TARGET_PAGE_MASK;
> +    abi_ptr addr;
>=20=20
> -    if (addr =3D=3D MAP_FAILED) {
> +    /*
> +     * M-profile allocates maximum of 2GB address space, so can never
> +     * allocate the commpage.  Skip it.
> +     */
> +    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
> +        return true;
> +    }
> +
> +    /*
> +     * If reserved_va does not cover the commpage, we get an assert
> +     * in page_set_flags.  Produce an intelligent error instead.
> +     */
> +    if (reserved_va !=3D 0 && want + TARGET_PAGE_SIZE - 1 > reserved_va)=
 {
> +        error_report("Allocating guest commpage: -R 0x%" PRIx64 " too sm=
all",
> +                     (uint64_t)reserved_va + 1);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    addr =3D target_mmap(want, TARGET_PAGE_SIZE, PROT_READ | PROT_WRITE,
> +                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
> +
> +    if (addr =3D=3D -1) {
>          perror("Allocating guest commpage");
>          exit(EXIT_FAILURE);
>      }
> @@ -436,15 +456,12 @@ static bool init_guest_commpage(void)
>      }
>=20=20
>      /* Set kernel helper versions; rest of page is 0.  */
> -    __put_user(5, (uint32_t *)g2h_untagged(0xffff0ffcu));
> +    put_user_u32(5, 0xffff0ffcu);
>=20=20
> -    if (mprotect(addr, qemu_host_page_size, PROT_READ)) {
> +    if (target_mprotect(addr, qemu_host_page_size, PROT_READ | PROT_EXEC=
)) {
>          perror("Protecting guest commpage");
>          exit(EXIT_FAILURE);
>      }
> -
> -    page_set_flags(commpage, commpage | ~qemu_host_page_mask,
> -                   PAGE_READ | PAGE_EXEC | PAGE_VALID);
>      return true;
>  }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

