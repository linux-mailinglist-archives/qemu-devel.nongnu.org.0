Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0BF683587
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:43:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMva9-0005OB-14; Tue, 31 Jan 2023 13:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMva4-0005Nh-Sj
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:42:08 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMva3-0007tn-Bg
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:42:08 -0500
Received: by mail-wr1-x435.google.com with SMTP id m7so15124416wru.8
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I26ez1P9fzlynHBrFB6XfQb1ct0hzREZ103/zj1Rupc=;
 b=ai4D5Hk5Wh2zIbCjZUZGyrPFdgF1uqtSpJL+Tb9ZxwAAa47COBt92qZhDhoEVxGiAq
 9g5flQYICMn7pLlagJKBOObq0b6rp9gN6VC1i6pEOhuUrv7a3949tDRm+pYJUnIUY9h2
 MAkuntKgZZ5jLnuQ8wZA+9cfTfwucI6m9jEYTHkiX+luSKa9oydhAG+u2U9oGLZqT3H+
 dlXzpcpq7G0UnfTrU6xHBVOy5QS2VycYhKIk6JOuenbO7rI1PFT3T4GkcIXmnw//isqf
 hUC1wpGlcEtnS+kLhzS5TV0Z0aMd2mr0uVjqDDhZp9CSLsdR0s+5HJoGMlgT2Ygv58qz
 6lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I26ez1P9fzlynHBrFB6XfQb1ct0hzREZ103/zj1Rupc=;
 b=iWITyPYw/6+k+z3z5W/QlYLxjzfG7rCoEioZnCq8AeLdAbWmD1Zo1sUiwd7WktxRXO
 r/QM77dfYez10+fNJpjU31L1+jOPE53HqUKnBievP3b47xA5SY5JgUbHeHwwjMpECvBc
 F/9O3bln2HT3mTVJ8v51+K+cSFmfd92xXhBYxzwKoVcy8M/brwIL73qUqQEcxAzuvHm5
 OUcKIjVPgHNIpT2zo/XoKVVQoWVb+FuZJ2qK6lQ33+45H709+a0iz8nHO7at9AUqaxDc
 sNcCkzHGPxayQ62NQKRLEp9H9Mz4vbisClKDi8Eq+Y4sCL0yyMKc3oIRcgFpPubBF1s4
 0uJA==
X-Gm-Message-State: AO0yUKXPdHoJm8qATTZ6ArD4wPtf4LXix/70/pTPnRiOGVhO0dyllCuf
 8TENrOh8ZcPyNc9Qps3A6UUMVQ==
X-Google-Smtp-Source: AK7set+/b68BrOESPzTkTci6anuo12DC+jed9KZiZY9ocH3vZgaSW88Kn+O7lUpszGDHzqxwW7a1PQ==
X-Received: by 2002:adf:dccd:0:b0:2bf:e2bf:c4ea with SMTP id
 x13-20020adfdccd000000b002bfe2bfc4eamr1406wrm.35.1675190525807; 
 Tue, 31 Jan 2023 10:42:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a5d58fc000000b002be5401ef5fsm15913949wrd.39.2023.01.31.10.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:42:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3F051FFB7;
 Tue, 31 Jan 2023 18:42:04 +0000 (GMT)
References: <20230131182057.2261614-1-iii@linux.ibm.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg/s390x: Use -nostdlib for softmmu tests
Date: Tue, 31 Jan 2023 18:41:51 +0000
In-reply-to: <20230131182057.2261614-1-iii@linux.ibm.com>
Message-ID: <87lelitukj.fsf@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> The code currently uses -nostartfiles, but this does not prevent
> linking with libc. On Fedora there is no cross-libc, so the linking
> step fails.
>
> Fix by using the more comprehensive -nostdlib (that's also what
> probe_target_compiler() checks for as well).
>
> Fixes: 503e549e441e ("tests/tcg/s390x: Test unaligned accesses to lowcore=
")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/s390x/Makefile.softmmu-target | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Ma=
kefile.softmmu-target
> index a34fa68473e..50c1b88065d 100644
> --- a/tests/tcg/s390x/Makefile.softmmu-target
> +++ b/tests/tcg/s390x/Makefile.softmmu-target
> @@ -3,7 +3,7 @@ VPATH+=3D$(S390X_SRC)
>  QEMU_OPTS=3D-action panic=3Dexit-failure -kernel
>=20=20
>  %: %.S
> -	$(CC) -march=3Dz13 -m64 -nostartfiles -static -Wl,-Ttext=3D0 \
> +	$(CC) -march=3Dz13 -m64 -nostdlib -static -Wl,-Ttext=3D0 \
>  		-Wl,--build-id=3Dnone $< -o $@
>=20=20
>  TESTS +=3D unaligned-lowcore

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I take it this will go via the s390x tree?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

