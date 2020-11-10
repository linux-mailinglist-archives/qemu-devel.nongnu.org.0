Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41C2ADCA4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:11:17 +0100 (CET)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXAp-00010c-W8
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcX3G-00045d-7g
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:03:26 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcX3B-0007MU-C9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:03:25 -0500
Received: by mail-wm1-x342.google.com with SMTP id h62so3785253wme.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=WDVpTdYB/gxictCIeeRGT1DrBwWs1y/sZO8KemzFxB4=;
 b=ZKE4hJjBPZHgQOdljVkEYaB8YeKiGMwv9Tx8Ph6YGKDPOMnkot6SJC1SjHzSiDXRjw
 R30BKwDY0YEUcDHZDHvuvMw7AaWZg+Gkkks//uegikjBC5HBvKrSCHgzN5V0czSgO/y9
 /Cpkihqgq8YlQF0AYAYvCKddJYJrcSFuUWzPIYqYA1aAzKzs/shIgauidNHt+T2tC2jF
 +i5RcFTPWmvfTBSdoAIgUBxhGtRPmfLBdOMz90tCp6yzHQQEWfw5od7BOuyWSJR1RTA5
 vyB24FM5cRV4qE7Wnk3YBN9GTuPFim8s892t0H4KE3GqLQTcuwKeUvMyvj+DYqOQxdgp
 z+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=WDVpTdYB/gxictCIeeRGT1DrBwWs1y/sZO8KemzFxB4=;
 b=AuTZ55NNE6ztVkVfQsM6Oag3wznLxSLWfx+KwlzmMR1ux0RejPwnoQXvn6bjaSOGLE
 WVlS5ytH89pwaSAVFbTkapdO0mFY5VwcDfyxVsn1xmcFsdKcbp9v0AhGjZ2QGj0w0H3s
 bfmXrif7lk8GDn6S8hM/dbTXeEEej03xjLb3qC2y5s/9ySABqKNYw4FVFOdIF4qWHbTJ
 vqeVbwUWFf0xfTx1v565ufZIxLCHY9cO1xg0jjx4+d1wv2LrOMWI0uuNlF+pCvsoJduG
 ot/g3TQOiCqltQHvx6fpH3sVoQZNd7y38kAyEXmnChDaHAPlnTP5tM+MOqHR7m+5F5YM
 /0MQ==
X-Gm-Message-State: AOAM530qwLMPDStLXmmlCHzHPt5kLeW2E2PQkkcfltAJxbX56gXeikRi
 meBZ941Q9U3cMCT0BJFEnO+2fQ==
X-Google-Smtp-Source: ABdhPJzZPAREGSs4ufgsoLTePCEZ6Fdaz9OIPcjjnBLM4dg+M2HB6H9HvmYpIyXwaRFQO4+6Dlh/Kw==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr35558wme.158.1605027796452;
 Tue, 10 Nov 2020 09:03:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm3589456wma.47.2020.11.10.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:03:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EB5D1FF7E;
 Tue, 10 Nov 2020 17:03:14 +0000 (GMT)
References: <20201106032921.600200-1-richard.henderson@linaro.org>
 <20201106032921.600200-16-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 15/41] accel/tcg: Support split-wx for linux with memfd
In-reply-to: <20201106032921.600200-16-richard.henderson@linaro.org>
Date: Tue, 10 Nov 2020 17:03:14 +0000
Message-ID: <875z6d87ql.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: j@getutm.app, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We cannot use a real temp file, because we would need to find
> a filesystem that does not have noexec enabled.  However, a
> memfd is not associated with any filesystem.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

It looks like this breaks --enable-tcg-interpreter:

  FAILED: libqemu-ppc64-softmmu.fa.p/accel_tcg_translate-all.c.o
  cc -Ilibqemu-ppc64-softmmu.fa.p -I. -I../.. -Itarget/ppc -I../../target/p=
pc -I../../dtc/libfdt -I../../capstone/include/capstone -Iqapi -Itrace -Iui=
 -Iui/shader -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/incl=
ude/pixman-1 -I/usr/include/libdrm -I/usr/include/glib-2.0 -I/usr/lib/x86_6=
4-linux-gnu/glib-2.0/include -fdiagnostics-color=3Dauto -pipe -Wall -Winval=
id-pch -Werror -std=3Dgnu99 -O2 -g -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 =
-m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wst=
rict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototy=
pes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-=
style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -=
Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansio=
n-to-defined -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi=
 -fstack-protector-strong -DLEGACY_RDMA_REG_MR -isystem /home/alex/lsrc/qem=
u.git/linux-headers -isystem linux-headers -iquote /home/alex/lsrc/qemu.git=
/tcg/tci -iquote . -iquote /home/alex/lsrc/qemu.git -iquote /home/alex/lsrc=
/qemu.git/accel/tcg -iquote /home/alex/lsrc/qemu.git/include -iquote /home/=
alex/lsrc/qemu.git/disas/libvixl -pthread -fPIC -isystem../../linux-headers=
 -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"ppc64-softmmu-confi=
g-target.h"' '-DCONFIG_DEVICES=3D"ppc64-softmmu-config-devices.h"' -MD -MQ =
libqemu-ppc64-softmmu.fa.p/accel_tcg_translate-all.c.o -MF libqemu-ppc64-so=
ftmmu.fa.p/accel_tcg_translate-all.c.o.d -o libqemu-ppc64-softmmu.fa.p/acce=
l_tcg_translate-all.c.o -c ../../accel/tcg/translate-all.c
  ../../accel/tcg/translate-all.c:1138:13: error: =E2=80=98alloc_code_gen_b=
uffer_splitwx_memfd=E2=80=99 defined but not used [-Werror=3Dunused-functio=
n]
   static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **err=
p)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors


> ---
>  accel/tcg/translate-all.c | 84 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 76 insertions(+), 8 deletions(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index a29cb4a42e..1931e65365 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1078,17 +1078,11 @@ static bool alloc_code_gen_buffer(size_t size, in=
t splitwx, Error **errp)
>      return true;
>  }
>  #else
> -static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
> +static bool alloc_code_gen_buffer_anon(size_t size, int prot,
> +                                       int flags, Error **errp)
>  {
> -    int prot =3D PROT_WRITE | PROT_READ | PROT_EXEC;
> -    int flags =3D MAP_PRIVATE | MAP_ANONYMOUS;
>      void *buf;
>=20=20
> -    if (splitwx > 0) {
> -        error_setg(errp, "jit split-wx not supported");
> -        return false;
> -    }
> -
>      buf =3D mmap(NULL, size, prot, flags, -1, 0);
>      if (buf =3D=3D MAP_FAILED) {
>          error_setg_errno(errp, errno,
> @@ -1137,6 +1131,80 @@ static bool alloc_code_gen_buffer(size_t size, int=
 splitwx, Error **errp)
>      tcg_ctx->code_gen_buffer =3D buf;
>      return true;
>  }
> +
> +#ifdef CONFIG_POSIX
> +#include "qemu/memfd.h"
> +
> +static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **err=
p)
> +{
> +    void *buf_rw, *buf_rx;
> +    int fd =3D -1;
> +
> +    buf_rw =3D qemu_memfd_alloc("tcg-jit", size, 0, &fd, errp);
> +    if (buf_rw =3D=3D NULL) {
> +        return false;
> +    }
> +
> +    buf_rx =3D mmap(NULL, size, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0=
);
> +    if (buf_rx =3D=3D MAP_FAILED) {
> +        error_setg_errno(errp, errno,
> +                         "failed to map shared memory for execute");
> +        munmap(buf_rw, size);
> +        close(fd);
> +        return false;
> +    }
> +    close(fd);
> +
> +    tcg_ctx->code_gen_buffer =3D buf_rw;
> +    tcg_ctx->code_gen_buffer_size =3D size;
> +    tcg_splitwx_diff =3D buf_rx - buf_rw;
> +
> +    /* Request large pages for the buffer and the splitwx.  */
> +    qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
> +    qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
> +    return true;
> +}
> +#endif /* CONFIG_POSIX */
> +
> +static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
> +{
> +    if (TCG_TARGET_SUPPORT_MIRROR) {
> +#ifdef CONFIG_POSIX
> +        return alloc_code_gen_buffer_splitwx_memfd(size, errp);
> +#endif
> +    }
> +    error_setg(errp, "jit split-wx not supported");
> +    return false;
> +}
> +
> +static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
> +{
> +    ERRP_GUARD();
> +    int prot, flags;
> +
> +    if (splitwx) {
> +        if (alloc_code_gen_buffer_splitwx(size, errp)) {
> +            return true;
> +        }
> +        /*
> +         * If splitwx force-on (1), fail;
> +         * if splitwx default-on (-1), fall through to splitwx off.
> +         */
> +        if (splitwx > 0) {
> +            return false;
> +        }
> +        error_free_or_abort(errp);
> +    }
> +
> +    prot =3D PROT_READ | PROT_WRITE | PROT_EXEC;
> +    flags =3D MAP_PRIVATE | MAP_ANONYMOUS;
> +#ifdef CONFIG_TCG_INTERPRETER
> +    /* The tcg interpreter does not need execute permission. */
> +    prot =3D PROT_READ | PROT_WRITE;
> +#endif
> +
> +    return alloc_code_gen_buffer_anon(size, prot, flags, errp);
> +}
>  #endif /* USE_STATIC_CODE_GEN_BUFFER, WIN32, POSIX */
>=20=20
>  static bool tb_cmp(const void *ap, const void *bp)


--=20
Alex Benn=C3=A9e

