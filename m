Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCCF39FBFF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 18:09:32 +0200 (CEST)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqeIE-00088j-Gy
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 12:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqeFn-0005za-V4
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:06:59 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqeFj-0002wS-3Q
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:06:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso2333892wmi.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RQi1+5AAsXE+lTy97a6xx4GR4Rvf3m+LedvZPew6ZQM=;
 b=dtZQNRvl/wERROjP4dlZwNRdjR3ap06v+3w2iLQ42Ci/AUVYhu/x7z+MVQNACCg4R2
 DoulqE6qFsoeDEH/Cqko/NyDPKEf63Ig3MjTdjsaiuC8YBpEV0mnBuSjFEfSNYmBc7Nz
 6wgGCt/pbEuzsoKnISX9EiYgg9mCw7jbH3D1qUywpePyaa8WJZXSH4zM5D+HfO2uYVER
 f8Q2OMaI4F/m2nLDQ13p87AtNe7I1qhOQlfztRBBbkFCYVzmmYmCu/68uNQVZXCupvis
 ccM7z9N28kWJovku9Ch4A0uOJGc4SR60oEM985o/XE2xJdqTOQBfCWgvgChzEtzbzAbF
 QMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RQi1+5AAsXE+lTy97a6xx4GR4Rvf3m+LedvZPew6ZQM=;
 b=Cmt7wkJ2ZXQEKKPVVdXl2gOorEAS1hVHlMsvILrumwO52kyDE3xh3uK0F/vGgPFRyO
 RbqwqqZ6i2FmI7xkgWHfoNN/SDYW3Mxg9uL/V0XL5GJ96wmZ9pjHRfagqbTDTa0/iqMC
 UiXOJTjULEkYZy3kNjyGB0rS1875uyNE1Dl+z1SJyarZ9sXGPSnQwY+4NucaIjr//Bk1
 8fHXYoc6EN8alZkz0NtKOPZCdzVVRfA1JZxoBkIdVxlTVMI2xHSvHscAVdDruTXFwzMH
 MnXHx1yDKy6b6ZTOQxRtOjJbH3Q8O1ub5URVsYFEM28Jqex99hEuxbFPM1ptYnV7y96O
 b4wA==
X-Gm-Message-State: AOAM5303MxxNYvPBzR6M4Pztk8ofEsljApdQZWONNBZefaB6oIR3LCAQ
 khe2Pe65MY1Y5My/PiEEU0AMJA==
X-Google-Smtp-Source: ABdhPJwsBJp1xDIyDsuVVx0GXTmizMTrY/35TCGuG6FCQGNz8kQ82ZKnQgZNdAF8xdL9w5SYxjQ24Q==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr22813582wmb.72.1623168413108; 
 Tue, 08 Jun 2021 09:06:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 32sm23056190wrs.5.2021.06.08.09.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 09:06:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD5531FF7E;
 Tue,  8 Jun 2021 17:06:51 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-19-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 18/28] tcg: Tidy tcg_n_regions
Date: Tue, 08 Jun 2021 17:06:32 +0100
In-reply-to: <20210502231844.1977630-19-richard.henderson@linaro.org>
Message-ID: <87v96ojq78.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Compute the value using straight division and bounds,
> rather than a loop.  Pass in tb_size rather than reading
> from tcg_init_ctx.code_gen_buffer_size,
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/tcg/region.c b/tcg/region.c
> index bd81b35359..b44246e1aa 100644
> --- a/tcg/region.c
> +++ b/tcg/region.c
> @@ -363,38 +363,33 @@ void tcg_region_reset_all(void)
>      tcg_region_tree_reset_all();
>  }
>=20=20
> -static size_t tcg_n_regions(unsigned max_cpus)
> +static size_t tcg_n_regions(size_t tb_size, unsigned max_cpus)
>  {
>  #ifdef CONFIG_USER_ONLY
>      return 1;
>  #else
> +    size_t n_regions;
> +
>      /*
>       * It is likely that some vCPUs will translate more code than others,
>       * so we first try to set more regions than max_cpus, with those reg=
ions
>       * being of reasonable size. If that's not possible we make do by ev=
enly
>       * dividing the code_gen_buffer among the vCPUs.
>       */
> -    size_t i;
> -
>      /* Use a single region if all we have is one vCPU thread */
>      if (max_cpus =3D=3D 1 || !qemu_tcg_mttcg_enabled()) {
>          return 1;
>      }
>=20=20
> -    /* Try to have more regions than max_cpus, with each region being >=
=3D 2 MB */
> -    for (i =3D 8; i > 0; i--) {
> -        size_t regions_per_thread =3D i;
> -        size_t region_size;
> -
> -        region_size =3D tcg_init_ctx.code_gen_buffer_size;
> -        region_size /=3D max_cpus * regions_per_thread;
> -
> -        if (region_size >=3D 2 * 1024u * 1024) {
> -            return max_cpus * regions_per_thread;
> -        }
> +    /*
> +     * Try to have more regions than max_cpus, with each region being >=
=3D 2 MB.
> +     * If we can't, then just allocate one region per vCPU thread.
> +     */
> +    n_regions =3D tb_size / (2 * MiB);
> +    if (n_regions <=3D max_cpus) {
> +        return max_cpus;
>      }
> -    /* If we can't, then just allocate one region per vCPU thread */
> -    return max_cpus;
> +    return MIN(n_regions, max_cpus * 8);
>  #endif
>  }

This is so much easier to follow now ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

