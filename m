Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290A960D4CB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 21:39:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onPix-0001Pu-2A; Tue, 25 Oct 2022 15:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onPis-000190-9B
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 15:36:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onPiq-0004gw-4Z
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 15:36:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g12so10055642wrs.10
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8imvIOMzLJXGzG1g66Obi5LJ6SXIPOUSobi1+rzclj0=;
 b=Zmz4Ikp4vGVwe4vWCqBWmdmgBEH8AuG0ChR8Ih/5bAo2AkgTZ4dHqRb4RiADvYOa56
 AsUF9ahydo67ya4Hz3AV0FXQUmuHB/ALbLRSJw8Z4Eb4s1hKhqi3wD7M7x3yaaFVK6uz
 LNP21rnw9GO3BGVitgNfEFHURC5j6L8hlXqzmYhIUPA9TtT7pDZCTjd7dlmW3n4U6VkK
 V69Z3Kvu0aME9elXaQ6bIlbr9LE06SphckCRhnpfJ1xASzJ2TZElwtAHXDRjv5I8foO8
 PkSof4tPyNidYXwKD8h4pt+MWJzOlGHqbTbwpKe0HOLFjeh/imxSPZy4jTn0mezPHcBB
 bKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8imvIOMzLJXGzG1g66Obi5LJ6SXIPOUSobi1+rzclj0=;
 b=kMwBVd587FEUceVFEPq43E8SuJwLQOMwHfN9UudRH1j3T0lB1qwuunSQ37xhvzc1zO
 zj84u0cZsICG9doAUFyJxvCPAoFVl5sNZRPpxIn7uCgKMEt+xCHmM8FXIPVfLzqmvoKO
 BWsHhSAPHQHIgBkaOhmn42wWykyn5c3aOrMfJHQPdpKGlnr67uqes4fzWBfH2aj5FMVX
 1jwi5MD5RoNEQ5q5M1kMb/grqZv3tlfK36d9vN0O/QdUv+tJSNqCyb/Oq2akP2PFU713
 zW7PsAk8XllE3nemO9+sGBoljIurM7ymzc6pzV1dK7TS4dBtAXrFQyVdSWpD0ftlk0O/
 mwmA==
X-Gm-Message-State: ACrzQf0ltn3TASVsWt6xDIOe6xej0MJcnKzM6NPH9IbqMLFZfZHQ+zun
 lQRoieivWqtxFUdWvkNkGXIKIw==
X-Google-Smtp-Source: AMsMyM5BEK+zijIBxzYaZZVLS2Xh1o2ByW0S/td1+BBia+hmHSHjTS8n6HpVKJYOJELephNnrcLErw==
X-Received: by 2002:adf:ef4e:0:b0:236:6608:f6ce with SMTP id
 c14-20020adfef4e000000b002366608f6cemr10915871wrp.85.1666726581361; 
 Tue, 25 Oct 2022 12:36:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b003c7087f6c9asm12349669wmq.32.2022.10.25.12.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 12:36:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 631F01FFB7;
 Tue, 25 Oct 2022 20:36:20 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-21-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 20/24] accel/tcg: Use interval tree for
 TARGET_PAGE_DATA_SIZE
Date: Tue, 25 Oct 2022 20:30:20 +0100
In-reply-to: <20221006031113.1139454-21-richard.henderson@linaro.org>
Message-ID: <87bkpz66h7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Continue weaning user-only away from PageDesc.
>
> Use an interval tree to record target data.
> Chunk the data, to minimize allocation overhead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h  |   1 -
>  accel/tcg/user-exec.c | 110 ++++++++++++++++++++++++++++++++----------
>  2 files changed, 85 insertions(+), 26 deletions(-)
>
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index 1bd5a02911..8731dc52e2 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -26,7 +26,6 @@
>  typedef struct PageDesc {
>  #ifdef CONFIG_USER_ONLY
>      unsigned long flags;
> -    void *target_data;
>  #else
>      QemuSpin lock;
>      /* list of TBs intersecting this ram page */
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index fb7d6ee9e9..bce3d5f335 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -210,47 +210,107 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchSta=
te *env, target_ulong addr,
>      return addr;
>  }
>=20=20
> +#ifdef TARGET_PAGE_DATA_SIZE
> +/*
> + * Allocate chunks of target data together.  For the only current user,
> + * if we allocate one hunk per page, we have overhead of 40/128 or 40%.
> + * Therefore, allocate memory for 64 pages at a time for overhead < 1%.
> + */
> +#define TPD_PAGES  64
> +#define TBD_MASK   (TARGET_PAGE_MASK * TPD_PAGES)
> +
> +typedef struct TargetPageDataNode {
> +    IntervalTreeNode itree;
> +    char data[TPD_PAGES][TARGET_PAGE_DATA_SIZE] __attribute__((aligned));
> +} TargetPageDataNode;
> +
> +static IntervalTreeRoot targetdata_root;
> +
>  void page_reset_target_data(target_ulong start, target_ulong end)
>  {
> -#ifdef TARGET_PAGE_DATA_SIZE
> -    target_ulong addr, len;
> +    IntervalTreeNode *n, *next;
> +    target_ulong last;
>=20=20
> -    /*
> -     * This function should never be called with addresses outside the
> -     * guest address space.  If this assert fires, it probably indicates
> -     * a missing call to h2g_valid.
> -     */
> -    assert(end - 1 <=3D GUEST_ADDR_MAX);
> -    assert(start < end);
>      assert_memory_lock();
>=20=20
>      start =3D start & TARGET_PAGE_MASK;
> -    end =3D TARGET_PAGE_ALIGN(end);
> +    last =3D TARGET_PAGE_ALIGN(end) - 1;
>=20=20
> -    for (addr =3D start, len =3D end - start;
> -         len !=3D 0;
> -         len -=3D TARGET_PAGE_SIZE, addr +=3D TARGET_PAGE_SIZE) {
> -        PageDesc *p =3D page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
> +    for (n =3D interval_tree_iter_first(&targetdata_root, start, last),
> +         next =3D n ? interval_tree_iter_next(n, start, last) : NULL;
> +         n !=3D NULL;
> +         n =3D next,
> +         next =3D next ? interval_tree_iter_next(n, start, last) : NULL)=
 {
> +        target_ulong n_start, n_last, p_ofs, p_len;
> +        TargetPageDataNode *t;
>=20=20
> -        g_free(p->target_data);
> -        p->target_data =3D NULL;
> +        if (n->start >=3D start && n->last <=3D last) {
> +            interval_tree_remove(n, &targetdata_root);
> +            g_free(n);
> +            continue;
> +        }
> +
> +        if (n->start < start) {
> +            n_start =3D start;
> +            p_ofs =3D (start - n->start) >> TARGET_PAGE_BITS;
> +        } else {
> +            n_start =3D n->start;
> +            p_ofs =3D 0;
> +        }
> +        n_last =3D MIN(last, n->last);
> +        p_len =3D (n_last + 1 - n_start) >> TARGET_PAGE_BITS;
> +
> +        t =3D container_of(n, TargetPageDataNode, itree);
> +        memset(t->data[p_ofs], 0, p_len * TARGET_PAGE_DATA_SIZE);
>      }
> -#endif
>  }
>=20=20
> -#ifdef TARGET_PAGE_DATA_SIZE
>  void *page_get_target_data(target_ulong address)
>  {
> -    PageDesc *p =3D page_find(address >> TARGET_PAGE_BITS);
> -    void *ret =3D p->target_data;
> +    IntervalTreeNode *n;
> +    TargetPageDataNode *t;
> +    target_ulong page, region;
> +    bool locked;
>=20=20
> -    if (!ret) {
> -        ret =3D g_malloc0(TARGET_PAGE_DATA_SIZE);
> -        p->target_data =3D ret;
> +    page =3D address & TARGET_PAGE_MASK;
> +    region =3D address & TBD_MASK;
> +
> +    n =3D interval_tree_iter_first(&targetdata_root, page, page);
> +    if (n) {
> +        goto found;
>      }
> -    return ret;
> +
> +    /*
> +     * See util/interval-tree.c re lockless lookups: no false positives =
but
> +     * there are false negatives.  If we find nothing, retry with the mm=
ap
> +     * lock acquired.  We also need the lock for the allocation + insert.
> +     */
> +    locked =3D have_mmap_lock();

Are we expecting to already hold the lock here?

> +    if (!locked) {
> +        mmap_lock();
> +        n =3D interval_tree_iter_first(&targetdata_root, page, page);

So we only search if we haven't got a lock already.

> +        if (n) {
> +            mmap_unlock();
> +            goto found;
> +        }
> +    }
> +
> +    t =3D g_new0(TargetPageDataNode, 1);
> +    n =3D &t->itree;
> +    n->start =3D region;
> +    n->last =3D region | ~TBD_MASK;
> +    interval_tree_insert(n, &targetdata_root);
> +    if (!locked) {
> +        mmap_unlock();
> +    }

To be honest the mmap_lock safe to use recursively and wrapping the
locked portion in a LOCK_GUARD would make me happier that we didn't cock
up unwinding.

> +
> + found:
> +    t =3D container_of(n, TargetPageDataNode, itree);
> +    return t->data[(page - region) >> TARGET_PAGE_BITS];
>  }
> -#endif
> +#else
> +void page_reset_target_data(target_ulong start, target_ulong end) { }
> +#endif /* TARGET_PAGE_DATA_SIZE */
>=20=20
>  /* The softmmu versions of these helpers are in cputlb.c.  */


--=20
Alex Benn=C3=A9e

