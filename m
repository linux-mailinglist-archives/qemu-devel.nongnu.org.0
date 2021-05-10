Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE2378C8B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:04:24 +0200 (CEST)
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5aB-0006x3-7k
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg5Xp-0004V7-4a
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:01:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg5Xn-000710-48
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:01:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id z6so16551528wrm.4
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 06:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yyLMF+InCHkwRlMcP+2UfD5jMGtSMSUYClqXyqw4SD0=;
 b=VckSxG5tEDIlT4Z5NMC8T2B+urgie7H1giGWZ/ZuLie+6/IV0LzUe6+hv3FIRWfZvc
 g8hD0OGnJPdfIhB7CG+OUN7XTKCQyDMdHEELJTIrscZir90AQNPsqH3N5nPYdahUm3PF
 QCMKHnYg1ckIe8QoBtRNtQ+MJ/sv91nfCtmDumrB+yp2rM13ocRpTtRMeNt3xqQU8jXo
 W/rIHGE8lWgWD1WKgpxoj3m/yzYIN9ykdyLAuvpXhSJ7fY1cZmkoUq0tL04HI+iM3UCn
 MK7wqfLUhNJnG4a/TACCwLn46sAXQlXtSaGIU4ne9RSt4EgjpAxFBrJ4SGkmoMMCLS4l
 Lx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yyLMF+InCHkwRlMcP+2UfD5jMGtSMSUYClqXyqw4SD0=;
 b=WMJG/OWEM2FX40tPEIelXquR0nk5s+SSHaPxNXhvcAmAVy6SvAlQiaQZrmDXONDPwF
 cuwGs95eKiO0pXBcrLI3890z2lnW9Yp5UEGL84TXQwtJJO/R6ysDWd8nMCWGYumNpF4J
 QoBJN3rbxXgewGF7CmYH87URbVL+3mdLps5s7E74hsQD9LZkm6zlJz3oRwPLx6367Jdg
 /jiBZAbn1YcjpZbyAGfmyzluzdGtBlhGattaXzXTdkQfl8rejsQTegSIR5mh+le0xUkx
 Xtq27T1P4vALwN1oy4L5mVVBFA1F0ESIJedEnvcoqknhEcG2SSWLNifpF6GrApdi8hDu
 ksaw==
X-Gm-Message-State: AOAM531aYqTTmWkkgOfO6N5i5NsJxAMY+1zGopqqyYo1f02iRGtCBSVr
 ZyTuBfF+YmCzRiKsS5YI/wGi3A==
X-Google-Smtp-Source: ABdhPJxZzQ3JEEXom7E9QOK56n5C3M9wA4g2kfUkyzcEHtQLP58qLPGyjfm4UgPS5AtLf9mgk8q6xA==
X-Received: by 2002:a05:6000:108f:: with SMTP id
 y15mr31562347wrw.115.1620651713399; 
 Mon, 10 May 2021 06:01:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 16sm19463101wmi.13.2021.05.10.06.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 06:01:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B33711FF7E;
 Mon, 10 May 2021 14:01:51 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-4-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/72] qemu/host-utils: Add wrappers for carry builtins
Date: Mon, 10 May 2021 13:57:58 +0100
In-reply-to: <20210508014802.892561-4-richard.henderson@linaro.org>
Message-ID: <87k0o6yc74.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> These builtins came in clang 3.8, but are not present in gcc through
> version 11.  Even in clang the optimization is not ideal except for
> x86_64, but no worse than the hand-coding that we currently do.

Given this statement....

<snip>
> +/**
> + * uadd64_carry - addition with carry-in and carry-out
> + * @x, @y: addends
> + * @pcarry: in-out carry value
> + *
> + * Computes @x + @y + *@pcarry, placing the carry-out back
> + * into *@pcarry and returning the 64-bit sum.
> + */
> +static inline uint64_t uadd64_carry(uint64_t x, uint64_t y, bool *pcarry)
> +{
> +#if __has_builtin(__builtin_addcll)
> +    unsigned long long c =3D *pcarry;
> +    x =3D __builtin_addcll(x, y, c, &c);

what happens when unsigned long long isn't the same as uint64_t? Doesn't
C99 only specify a minimum?

> +    *pcarry =3D c & 1;

Why do we need to clamp it here? Shouldn't the compiler automatically do
that due to the bool?

> +    return x;
> +#else
> +    bool c =3D *pcarry;
> +    /* This is clang's internal expansion of __builtin_addc. */
> +    c =3D uadd64_overflow(x, c, &x);
> +    c |=3D uadd64_overflow(x, y, &x);
> +    *pcarry =3D c;
> +    return x;
> +#endif

Either way if you aren't super happy with the compilers builtin and you
get equivalent code with the unambigious hand coded version then what is
the point of having a builtin leg?

> +}
> +
> +/**
> + * usub64_borrow - subtraction with borrow-in and borrow-out
> + * @x, @y: addends
> + * @pborrow: in-out borrow value
> + *
> + * Computes @x - @y - *@pborrow, placing the borrow-out back
> + * into *@pborrow and returning the 64-bit sum.
> + */
> +static inline uint64_t usub64_borrow(uint64_t x, uint64_t y, bool *pborr=
ow)
> +{
> +#if __has_builtin(__builtin_subcll)
> +    unsigned long long b =3D *pborrow;
> +    x =3D __builtin_subcll(x, y, b, &b);
> +    *pborrow =3D b & 1;
> +    return x;
> +#else
> +    bool b =3D *pborrow;
> +    b =3D usub64_overflow(x, b, &x);
> +    b |=3D usub64_overflow(x, y, &x);
> +    *pborrow =3D b;
> +    return x;
> +#endif
> +}
> +
>  /* Host type specific sizes of these routines.  */
>=20=20
>  #if ULONG_MAX =3D=3D UINT32_MAX


--=20
Alex Benn=C3=A9e

