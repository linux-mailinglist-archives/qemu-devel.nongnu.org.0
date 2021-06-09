Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD53A1290
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:25:06 +0200 (CEST)
Received: from localhost ([::1]:50402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwKX-0003zE-EM
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqwJb-0003KL-Me
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:24:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqwJZ-0006sZ-Qo
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:24:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id f2so25015909wri.11
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=POuaYosSRk4QSeQBCUGEWMnsiQST5KDkwuZHo7HndgM=;
 b=r5N/gCit7qkQaRaSfS1eKSh8jjRKqITw7ZuBDjPs3J9I3GM2CpxR9QYG5k3UyGkq8n
 hJG5O7w4jr6bUUuPLeQuCU4/773kXXyCUk/UoIXpSdq88EUha9TqBnhCXzIagFX+QieK
 btExA+cZtfrqPeEnu5ZZfRJzNX1Bnw3CoQ0MKKXssI7l64k3X4OgZlWAYmZqgLNF7yfe
 AfEDE2cTIQ/SADmeNJIA3V+Cp8jgIYMuFdr/jwx48UVfKY9V798pRlEIkLtK8qJcKD3e
 OHkMvhl2TenDM3zZSajNMSZrAJsGxuJTrNgPFPCqE89gftrDFFtSX0YvAFmG12LmLAKo
 jkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=POuaYosSRk4QSeQBCUGEWMnsiQST5KDkwuZHo7HndgM=;
 b=HDXBQ36CKup/T5KCKHePXvE0pdsVzBd+8RGIPECR5Pa0AiSMTXZMc1nmBgk87zaIU1
 ad9hggYOGd/EBUqhdCy1l3FuLAag7/bBT66bUlX/4jS7t+ZTnxj9YbzvisK6MzTb1OFj
 UNSo/7lCitROEkGjE2Yg+3nIq0eDVh/typQ8jIYFazIdfKBfPjo1GHCGitFWqSzu2U50
 Bq4VQr0JbGJQIO6Rl2d2aWK0YSXxmxSn2PnrIt/HWXLTEC1eg/sHGXaCK6+MA+qTYepc
 ebrIT9ICYCFa0yfWlGXDS9P7eJ9p5nNM895daQ8NdZ0JfwDzn64d+LUni/9zrRtYGmee
 SFfw==
X-Gm-Message-State: AOAM531YSM1YEumeEaUAPnPP5GG55PKZObA1kwGci2sXxLzkuI/EHbwo
 zU2eWhCSK9JSCM66hi8owQiTVg==
X-Google-Smtp-Source: ABdhPJwL4p1rBEaUIPyV6+KW9Vnj+eHvPQN3V8H4DwHv6UHe4mk1CgW96AwaP+YHE6UdNJzHAC97XA==
X-Received: by 2002:adf:f98e:: with SMTP id f14mr27798068wrr.408.1623237843541; 
 Wed, 09 Jun 2021 04:24:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l10sm22856867wrm.2.2021.06.09.04.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 04:24:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 932381FF7E;
 Wed,  9 Jun 2021 12:24:01 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-28-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 27/28] tcg: When allocating for !splitwx, begin with
 PROT_NONE
Date: Wed, 09 Jun 2021 12:21:16 +0100
In-reply-to: <20210502231844.1977630-28-richard.henderson@linaro.org>
Message-ID: <875yynjn72.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

> There's a change in mprotect() behaviour [1] in the latest macOS
> on M1 and it's not yet clear if it's going to be fixed by Apple.
>
> In this case, instead of changing permissions of N guard pages,
> we change permissions of N rwx regions.  The same number of
> syscalls are required either way.
>
> [1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/tcg/region.c b/tcg/region.c
> index 604530b902..5e00db4cfb 100644
> --- a/tcg/region.c
> +++ b/tcg/region.c
> @@ -765,12 +765,15 @@ static int alloc_code_gen_buffer(size_t size, int s=
plitwx, Error **errp)
>          error_free_or_abort(errp);
>      }
>=20=20
> -    prot =3D PROT_READ | PROT_WRITE | PROT_EXEC;
> +    /*
> +     * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
> +     * rejects a permission change from RWX -> NONE when reserving the
> +     * guard pages later.  We can go the other way with the same number
> +     * of syscalls, so always begin with PROT_NONE.
> +     */
> +    prot =3D PROT_NONE;
>      flags =3D MAP_PRIVATE | MAP_ANONYMOUS;
> -#ifdef CONFIG_TCG_INTERPRETER
> -    /* The tcg interpreter does not need execute permission. */
> -    prot =3D PROT_READ | PROT_WRITE;
> -#elif defined(CONFIG_DARWIN)
> +#ifdef CONFIG_DARWIN
>      /* Applicable to both iOS and macOS (Apple Silicon). */
>      if (!splitwx) {
>          flags |=3D MAP_JIT;
> @@ -901,11 +904,7 @@ void tcg_region_init(size_t tb_size, int splitwx, un=
signed max_cpus)
>              }
>          }

I think the comment in tcg_region_init needs to be updated, currently
reads:

    /*
     * Set guard pages in the rw buffer, as that's the one into which
     * buffer overruns could occur.  Do not set guard pages in the rx
     * buffer -- let that one use hugepages throughout.
     * Work with the page protections set up with the initial mapping.
     */
    need_prot =3D PAGE_READ | PAGE_WRITE;

but now we start with everything at PROT_NONE and are just setting
need_prot for the non-guard pages.

>          if (have_prot !=3D 0) {
> -            /*
> -             * macOS 11.2 has a bug (Apple Feedback FB8994773) in which =
mprotect
> -             * rejects a permission change from RWX -> NONE.  Guard page=
s are
> -             * nice for bug detection but are not essential; ignore any =
failure.
> -             */
> +            /* Guard pages are nice for bug detection but are not essent=
ial. */
>              (void)qemu_mprotect_none(end, page_size);

Isn't the last page already set as PROT_NONE?

>          }
>      }


--=20
Alex Benn=C3=A9e

