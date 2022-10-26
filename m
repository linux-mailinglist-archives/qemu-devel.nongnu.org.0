Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B6160E27E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:48:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongkN-0000IK-K3; Wed, 26 Oct 2022 09:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ongkC-0007LK-8P
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:47:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ongkA-00028O-Ds
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:46:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id h9so15324682wrt.0
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRkyGyjLZo5ytwRdJzyE6pTgixBjOomFFnC20tn9000=;
 b=c1A1fymvSLeO1zMKOTVBQlH/MwgErkSAu97JrS3yqO5SUin3Tb/A9R/J2b3HCKsu+Z
 C0bs9mMWQzzEC2oXPBfl3juerNDy3UmTD3z4B2e/mNp5f2M46HrgZR0ya9dSlYvwBGfY
 y6ydeUxer/wCqB9hn1Jzu4LiW5KIFEp7sJ8Fmai5g8NqBDAsgSJLgexCVh/FcLaI2Z76
 WGdvVMSLpiju62acN/x2z4FbKwXAyvnEXk+QvDN3mCqEYNZHKi68pJvNjlBQhwfhI4B2
 SKhEFq+b6prAo2aJ0gzwoOEU9hfDEa/ig4zWTH+0IU90Z1HXbsHI5Cd/CV30Js44SUvZ
 GD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yRkyGyjLZo5ytwRdJzyE6pTgixBjOomFFnC20tn9000=;
 b=XREKhTlemjwGZ7oWueUtYFFOYZibLlsKxg22I7llXeOwGkfZ1qlKwkirGxKx+Kx4zy
 mTup1R+BP/SFDiTuSSXYSEsCaArmMbj1N0e5C40m2ACn1XmC55tDKO7J8qM72WXoTMDt
 a1aw4LiM++C0uam1o2hG+JYJzXhzUy+whVF2jzDgwok3ZQ5H6Aq60eEwjmbIgsCplcZQ
 fzzMpL1WBmyZqpyNbtjLMaAjolcP+1l9O7B6LFPVkV8C67DEM0F/uZw/x3LACuS11D+S
 nLhwwL8X1TKR7B6M8UOxvIaudwkqB7BYGGb59RaoVaROf/xWvPbNarBVuHxPdD1VKjiI
 bWEA==
X-Gm-Message-State: ACrzQf0RuVNNbO9oa6PYuI8e5ZfskE2chcwJRVyQaDVY/UFlXhPSXzPc
 +j1up3cd6FSViFLzKPiFkbwaFA==
X-Google-Smtp-Source: AMsMyM4CLYKds1g6QAnDuWpxKy83TPGKcndPsxkSMRO6T/qL1DG5stYU+r9mdnJZ3YmsAA7OtAMtfg==
X-Received: by 2002:a5d:4887:0:b0:226:ed34:7bbd with SMTP id
 g7-20020a5d4887000000b00226ed347bbdmr27820037wrq.561.1666792012517; 
 Wed, 26 Oct 2022 06:46:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a5d4709000000b0022ac1be009esm5396851wrq.16.2022.10.26.06.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 06:46:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79DAA1FFB7;
 Wed, 26 Oct 2022 14:46:51 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-23-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 22/24] accel/tcg: Use interval tree for user-only page
 tracking
Date: Wed, 26 Oct 2022 14:36:35 +0100
In-reply-to: <20221006031113.1139454-23-richard.henderson@linaro.org>
Message-ID: <87eduu4rzo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

> Finish weaning user-only away from PageDesc.
>
> Using an interval tree to track page permissions means that
> we can represent very large regions efficiently.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/290
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/967
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1214
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h           |   4 +-
>  accel/tcg/tb-maint.c           |  20 +-
>  accel/tcg/user-exec.c          | 614 ++++++++++++++++++++++-----------
>  tests/tcg/multiarch/test-vma.c |  22 ++
>  4 files changed, 451 insertions(+), 209 deletions(-)
>  create mode 100644 tests/tcg/multiarch/test-vma.c
>
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index 250f0daac9..c7e157d1cd 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -24,9 +24,7 @@
>  #endif
>=20=20
>  typedef struct PageDesc {
> -#ifdef CONFIG_USER_ONLY
> -    unsigned long flags;
> -#else
> +#ifndef CONFIG_USER_ONLY
>      QemuSpin lock;
>      /* list of TBs intersecting this ram page */
>      uintptr_t first_tb;
> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
> index 14e8e47a6a..694440cb4a 100644
> --- a/accel/tcg/tb-maint.c
> +++ b/accel/tcg/tb-maint.c
> @@ -68,15 +68,23 @@ static void page_flush_tb(void)
<snip>
>=20=20
>  int page_get_flags(target_ulong address)
>  {
> -    PageDesc *p;
> +    PageFlagsNode *p =3D pageflags_find(address, address);
>=20=20
> -    p =3D page_find(address >> TARGET_PAGE_BITS);
> +    /*
> +     * See util/interval-tree.c re lockless lookups: no false positives =
but
> +     * there are false negatives.  If we find nothing, retry with the mm=
ap
> +     * lock acquired.
> +     */
>      if (!p) {
> -        return 0;
> +        if (have_mmap_lock()) {
> +            return 0;
> +        }
> +        mmap_lock();
> +        p =3D pageflags_find(address, address);
> +        mmap_unlock();
> +        if (!p) {
> +            return 0;
> +        }
>      }
>      return p->flags;

To avoid the brain twisting following locks and multiple return legs how ab=
out this:

  int page_get_flags(target_ulong address)
  {
      PageFlagsNode *p =3D pageflags_find(address, address);

      /*
       * See util/interval-tree.c re lockless lookups: no false positives b=
ut
       * there are false negatives.  If we had the lock and found
       * nothing we are done, otherwise retry with the mmap lock acquired.
       */
      if (have_mmap_lock()) {
          return p ? p->flags : 0;
      }

      mmap_lock();
      p =3D pageflags_find(address, address);
      mmap_unlock();

      return p ? p->flags : 0;
  }


> diff --git a/tests/tcg/multiarch/test-vma.c b/tests/tcg/multiarch/test-vm=
a.c
> new file mode 100644
> index 0000000000..2893d60334
> --- /dev/null
> +++ b/tests/tcg/multiarch/test-vma.c
> @@ -0,0 +1,22 @@
> +/*
> + * Test very large vma allocations.
> + * The qemu out-of-memory condition was within the mmap syscall itself.
> + * If the syscall actually returns with MAP_FAILED, the test succeeded.
> + */
> +#include <sys/mman.h>
> +
> +int main()
> +{
> +    int n =3D sizeof(size_t) =3D=3D 4 ? 32 : 45;
> +
> +    for (int i =3D 28; i < n; i++) {
> +        size_t l =3D (size_t)1 << i;
> +        void *p =3D mmap(0, l, PROT_NONE,
> +                       MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, =
0);
> +        if (p =3D=3D MAP_FAILED) {
> +            break;
> +        }
> +        munmap(p, l);
> +    }
> +    return 0;
> +}

So is the failure mode here we actually seg or bus out?

--=20
Alex Benn=C3=A9e

