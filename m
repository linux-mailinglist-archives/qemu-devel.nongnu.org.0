Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C923139E2DD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:28:28 +0200 (CEST)
Received: from localhost ([::1]:40330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqI71-0004RQ-S3
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqI65-0003mY-RN
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:27:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqI63-0003lb-Bf
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:27:29 -0400
Received: by mail-wm1-x32c.google.com with SMTP id g204so26071wmf.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qBuHBTvrurLoJdrdrxRTkUunM+Kw3v4dKPGt2F9xpLY=;
 b=q2CT5caqlhsvLEihgUd3BSlull4NtcoaKvs4e96xp8cOln+i6lX6DKrgtv4VfPDUdI
 bQQ3QZ+eO3tdTpV2Sb2OItUBB2jAj9I1CuBpusy7nPTYvXtERySF4ZZq6HDtMDS87O1f
 8bOGSTabGJUkAEMEgp142pxP4STNMaYgGpgxGYhQDJgnL4BtyPYPEnD8BRctcVRwQgI+
 Zk9fPl3d3POzVx4GsBiw/mwaKUnkKu1aDM9+BaIZbUzNnhxk7vJ+RYfyPcAAaCuiW9V7
 1wziqbEAtaZPtF6F9ZeDVIINpBLhea3iQ+6SQ7dpaAf4ZbOlkhyn34imIwl40pVj3nho
 7bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qBuHBTvrurLoJdrdrxRTkUunM+Kw3v4dKPGt2F9xpLY=;
 b=bPQY/lUIcQytRGegkMs9fwxdSCJU/NUp6qv3lVjdnnXkwWNtcfawT8w6ppgCVqe0zR
 lcC/W5zOCgpaw5+TpW3in+jihQFrSgCNoClT/++xEcjrfoXVW2p9e5ZXyLYgP+VHa7ot
 B4hxEdGHCBIQvUnhSdvYb4VYkO+R7JmPpkcpUmC8GntsKnnqsP1fvJB2ZmkoU5TxM789
 8cOC1cGDQxRynU1lAw1eYUmbgjlhUvPO6GKlXgEqINT9fWZy0xe70YMNfnqbrwzsT5Y7
 tZ4XgofawMH4xGhxE2OE3eC26AuxI8GaQdmUWAUz6oviJNN3YY7vb1rVRX5MulLQHl+n
 kfrA==
X-Gm-Message-State: AOAM533oKE+sCj/1S+mbzqm4jjE/ncm9mdckaU/0D7/okaoeEsn+ZEaf
 9HtqcoFrFQlO6/tBer+AKKYQ3Q==
X-Google-Smtp-Source: ABdhPJy96YOlQSlkEQqvkBljmgkwUqwSBhXcRounCeU/D8UAoVm4UYSLTxr1dVRbto6wKEH3gZg7tg==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr17244717wmi.26.1623083245640; 
 Mon, 07 Jun 2021 09:27:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm18399157wre.8.2021.06.07.09.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:27:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B13371FF7E;
 Mon,  7 Jun 2021 17:27:23 +0100 (BST)
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-4-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/11] softfloat: Introduce float_flag_inorm_denormal
Date: Mon, 07 Jun 2021 16:35:43 +0100
In-reply-to: <20210527041405.391567-4-richard.henderson@linaro.org>
Message-ID: <871r9dod1w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: mmorrell@tachyum.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a new exception flag for reporting input denormals that are not
> flushed to zero, they are normalized and treated as normal numbers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat-types.h | 15 ++++---
>  fpu/softfloat.c               | 84 +++++++++++------------------------
>  fpu/softfloat-parts.c.inc     |  1 +
>  3 files changed, 36 insertions(+), 64 deletions(-)
>
> diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
> index e2d70ff556..174100e50e 100644
> --- a/include/fpu/softfloat-types.h
> +++ b/include/fpu/softfloat-types.h
> @@ -143,13 +143,14 @@ typedef enum __attribute__((__packed__)) {
>   */
>=20=20
>  enum {
> -    float_flag_invalid   =3D  1,
> -    float_flag_divbyzero =3D  4,
> -    float_flag_overflow  =3D  8,
> -    float_flag_underflow =3D 16,
> -    float_flag_inexact   =3D 32,
> -    float_flag_iflush_denormal =3D 64,
> -    float_flag_oflush_denormal =3D 128
> +    float_flag_invalid         =3D 0x0001,
> +    float_flag_divbyzero       =3D 0x0002,
> +    float_flag_overflow        =3D 0x0004,
> +    float_flag_underflow       =3D 0x0008,
> +    float_flag_inexact         =3D 0x0010,
> +    float_flag_inorm_denormal  =3D 0x0020,  /* denormal input, normalize=
d */
> +    float_flag_iflush_denormal =3D 0x0040,  /* denormal input, flushed t=
o zero */
> +    float_flag_oflush_denormal =3D 0x0080,  /* denormal result, flushed =
to zero */
>  };
>=20=20
>  /*
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index cb077cf111..e54cdb274d 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -126,61 +126,23 @@ this code that are retained.
>   * denormal/inf/NaN; (2) when operands are not guaranteed to lead to a 0=
 result
>   * and the result is < the minimum normal.
>   */
> -#define GEN_INPUT_FLUSH__NOCHECK(name, soft_t)                          \
> +
> +#define GEN_INPUT_FLUSH(name, soft_t)                                   \
>      static inline void name(soft_t *a, float_status *s)                 \
>      {                                                                   \
>          if (unlikely(soft_t ## _is_denormal(*a))) {                     \
> -            *a =3D soft_t ## _set_sign(soft_t ## _zero,                 =
  \
> -                                     soft_t ## _is_neg(*a));            \
> -            float_raise(float_flag_iflush_denormal, s);                 =
 \
> +            if (s->flush_inputs_to_zero) {                              \
> +                *a =3D soft_t ## _set_sign(0, soft_t ## _is_neg(*a));   =
  \
> +                float_raise(float_flag_iflush_denormal, s);             \
> +            } else {                                                    \
> +                float_raise(float_flag_inorm_denormal, s);              \
> +            }                                                           \
>          }                                                               \
>      }

So I'm guessing Emilio had the original flush code split was to avoid
multiple checks against s->flush_inputs_to_zero in the code. The was
possibly a good reason, comparing the before/after of float32_mul:

  Dump of assembler code for function float32_mul:
     0x0000000000934240 <+0>:	movzbl 0x1(%rdx),%eax
     0x0000000000934244 <+4>:	test   $0x20,%al
     0x0000000000934246 <+6>:	je     0x9342b0 <float32_mul+112>
     0x0000000000934248 <+8>:	cmpb   $0x0,(%rdx)
     0x000000000093424b <+11>:	jne    0x9342b0 <float32_mul+112>
     0x000000000093424d <+13>:	cmpb   $0x0,0x5(%rdx)
     0x0000000000934251 <+17>:	jne    0x9342d0 <float32_mul+144>
     0x0000000000934253 <+19>:	mov    %edi,%eax
     0x0000000000934255 <+21>:	shr    $0x17,%eax
     0x0000000000934258 <+24>:	add    $0x1,%eax
     0x000000000093425b <+27>:	test   $0xfe,%al
     0x000000000093425d <+29>:	je     0x9342a8 <float32_mul+104>
     0x000000000093425f <+31>:	mov    %esi,%eax
     0x0000000000934261 <+33>:	shr    $0x17,%eax
     0x0000000000934264 <+36>:	add    $0x1,%eax
     0x0000000000934267 <+39>:	test   $0xfe,%al
     0x0000000000934269 <+41>:	jne    0x934273 <float32_mul+51>
     0x000000000093426b <+43>:	test   $0x7fffffff,%esi
     0x0000000000934271 <+49>:	jne    0x9342b0 <float32_mul+112>
     0x0000000000934273 <+51>:	mov    %esi,-0xc(%rsp)
     0x0000000000934277 <+55>:	movss  -0xc(%rsp),%xmm0
     0x000000000093427d <+61>:	mov    %edi,-0xc(%rsp)
     0x0000000000934281 <+65>:	movss  -0xc(%rsp),%xmm2
     0x0000000000934287 <+71>:	mulss  %xmm2,%xmm0
     0x000000000093428b <+75>:	movd   %xmm0,%eax
     0x000000000093428f <+79>:	andps  0x3b805a(%rip),%xmm0        # 0xcec2f0
     0x0000000000934296 <+86>:	ucomiss 0x3b8047(%rip),%xmm0        # 0xcec2=
e4
     0x000000000093429d <+93>:	jbe    0x9342b8 <float32_mul+120>
     0x000000000093429f <+95>:	orb    $0x8,0x1(%rdx)
     0x00000000009342a3 <+99>:	retq=20=20=20
     0x00000000009342a4 <+100>:	nopl   0x0(%rax)
     0x00000000009342a8 <+104>:	test   $0x7fffffff,%edi
     0x00000000009342ae <+110>:	je     0x93425f <float32_mul+31>
     0x00000000009342b0 <+112>:	jmpq   0x9290d0 <soft_f32_mul>
     0x00000000009342b5 <+117>:	nopl   (%rax)
     0x00000000009342b8 <+120>:	movss  0x3b8020(%rip),%xmm1        # 0xcec2=
e0
     0x00000000009342c0 <+128>:	comiss %xmm0,%xmm1
     0x00000000009342c3 <+131>:	jae    0x934320 <float32_mul+224>
     0x00000000009342c5 <+133>:	retq=20=20=20
     0x00000000009342c6 <+134>:	nopw   %cs:0x0(%rax,%rax,1)
     0x00000000009342d0 <+144>:	test   $0x7f800000,%edi
     0x00000000009342d6 <+150>:	jne    0x9342f0 <float32_mul+176>
     0x00000000009342d8 <+152>:	test   $0x7fffffff,%edi
     0x00000000009342de <+158>:	je     0x9342f0 <float32_mul+176>
     0x00000000009342e0 <+160>:	or     $0x40,%eax
     0x00000000009342e3 <+163>:	and    $0x80000000,%edi
     0x00000000009342e9 <+169>:	mov    %al,0x1(%rdx)
     0x00000000009342ec <+172>:	nopl   0x0(%rax)
     0x00000000009342f0 <+176>:	test   $0x7f800000,%esi
     0x00000000009342f6 <+182>:	jne    0x934253 <float32_mul+19>
     0x00000000009342fc <+188>:	test   $0x7fffffff,%esi
     0x0000000000934302 <+194>:	je     0x934253 <float32_mul+19>
     0x0000000000934308 <+200>:	and    $0x80000000,%esi
     0x000000000093430e <+206>:	orb    $0x40,0x1(%rdx)
     0x0000000000934312 <+210>:	jmpq   0x934253 <float32_mul+19>
     0x0000000000934317 <+215>:	nopw   0x0(%rax,%rax,1)
     0x0000000000934320 <+224>:	mov    %edi,%ecx
     0x0000000000934322 <+226>:	or     %esi,%ecx
     0x0000000000934324 <+228>:	and    $0x7fffffff,%ecx
     0x000000000093432a <+234>:	jne    0x9342b0 <float32_mul+112>
     0x000000000093432c <+236>:	jmp    0x9342c5 <float32_mul+133>
  End of assembler dump.

And after this change:

  Dump of assembler code for function float32_mul:
     0x0000000000895d60 <+0>:	movzbl 0x1(%rdx),%eax
     0x0000000000895d64 <+4>:	test   $0x10,%al
     0x0000000000895d66 <+6>:	je     0x895e30 <float32_mul+208>
     0x0000000000895d6c <+12>:	cmpb   $0x0,(%rdx)
     0x0000000000895d6f <+15>:	jne    0x895e30 <float32_mul+208>
     0x0000000000895d75 <+21>:	test   $0x7f800000,%edi
     0x0000000000895d7b <+27>:	jne    0x895da0 <float32_mul+64>
     0x0000000000895d7d <+29>:	test   $0x7fffffff,%edi
     0x0000000000895d83 <+35>:	je     0x895da0 <float32_mul+64>
     0x0000000000895d85 <+37>:	cmpb   $0x0,0x5(%rdx)
     0x0000000000895d89 <+41>:	je     0x895e60 <float32_mul+256>
     0x0000000000895d8f <+47>:	or     $0x40,%eax
     0x0000000000895d92 <+50>:	and    $0x80000000,%edi
     0x0000000000895d98 <+56>:	mov    %al,0x1(%rdx)
     0x0000000000895d9b <+59>:	nopl   0x0(%rax,%rax,1)
     0x0000000000895da0 <+64>:	test   $0x7f800000,%esi
     0x0000000000895da6 <+70>:	jne    0x895dd0 <float32_mul+112>
     0x0000000000895da8 <+72>:	test   $0x7fffffff,%esi
     0x0000000000895dae <+78>:	je     0x895dd0 <float32_mul+112>
     0x0000000000895db0 <+80>:	cmpb   $0x0,0x5(%rdx)
     0x0000000000895db4 <+84>:	movzbl 0x1(%rdx),%eax
     0x0000000000895db8 <+88>:	je     0x895e50 <float32_mul+240>
     0x0000000000895dbe <+94>:	or     $0x40,%eax
     0x0000000000895dc1 <+97>:	and    $0x80000000,%esi
     0x0000000000895dc7 <+103>:	mov    %al,0x1(%rdx)
     0x0000000000895dca <+106>:	nopw   0x0(%rax,%rax,1)
     0x0000000000895dd0 <+112>:	mov    %edi,%eax
     0x0000000000895dd2 <+114>:	shr    $0x17,%eax
     0x0000000000895dd5 <+117>:	add    $0x1,%eax
     0x0000000000895dd8 <+120>:	test   $0xfe,%al
     0x0000000000895dda <+122>:	je     0x895e28 <float32_mul+200>
     0x0000000000895ddc <+124>:	mov    %esi,%eax
     0x0000000000895dde <+126>:	shr    $0x17,%eax
     0x0000000000895de1 <+129>:	add    $0x1,%eax
     0x0000000000895de4 <+132>:	test   $0xfe,%al
     0x0000000000895de6 <+134>:	jne    0x895df0 <float32_mul+144>
     0x0000000000895de8 <+136>:	test   $0x7fffffff,%esi
     0x0000000000895dee <+142>:	jne    0x895e30 <float32_mul+208>
     0x0000000000895df0 <+144>:	mov    %esi,-0xc(%rsp)
     0x0000000000895df4 <+148>:	movss  -0xc(%rsp),%xmm0
     0x0000000000895dfa <+154>:	mov    %edi,-0xc(%rsp)
     0x0000000000895dfe <+158>:	movss  -0xc(%rsp),%xmm2
     0x0000000000895e04 <+164>:	mulss  %xmm2,%xmm0
     0x0000000000895e08 <+168>:	movd   %xmm0,%eax
     0x0000000000895e0c <+172>:	andps  0x46bb5d(%rip),%xmm0        # 0xd019=
70
     0x0000000000895e13 <+179>:	ucomiss 0x46bb4a(%rip),%xmm0        # 0xd01=
964
     0x0000000000895e1a <+186>:	jbe    0x895e38 <float32_mul+216>
     0x0000000000895e1c <+188>:	orb    $0x4,0x1(%rdx)
     0x0000000000895e20 <+192>:	retq=20=20=20
     0x0000000000895e21 <+193>:	nopl   0x0(%rax)
     0x0000000000895e28 <+200>:	test   $0x7fffffff,%edi
     0x0000000000895e2e <+206>:	je     0x895ddc <float32_mul+124>
     0x0000000000895e30 <+208>:	jmpq   0x88a8c0 <soft_f32_mul>
     0x0000000000895e35 <+213>:	nopl   (%rax)
     0x0000000000895e38 <+216>:	movss  0x46bb20(%rip),%xmm1        # 0xd019=
60
     0x0000000000895e40 <+224>:	comiss %xmm0,%xmm1
     0x0000000000895e43 <+227>:	jae    0x895e70 <float32_mul+272>
     0x0000000000895e45 <+229>:	retq=20=20=20
     0x0000000000895e46 <+230>:	nopw   %cs:0x0(%rax,%rax,1)
     0x0000000000895e50 <+240>:	or     $0x20,%eax
     0x0000000000895e53 <+243>:	mov    %al,0x1(%rdx)
     0x0000000000895e56 <+246>:	jmpq   0x895dd0 <float32_mul+112>
     0x0000000000895e5b <+251>:	nopl   0x0(%rax,%rax,1)
     0x0000000000895e60 <+256>:	or     $0x20,%eax
     0x0000000000895e63 <+259>:	mov    %al,0x1(%rdx)
     0x0000000000895e66 <+262>:	jmpq   0x895da0 <float32_mul+64>
     0x0000000000895e6b <+267>:	nopl   0x0(%rax,%rax,1)
     0x0000000000895e70 <+272>:	mov    %esi,%ecx
     0x0000000000895e72 <+274>:	or     %edi,%ecx
     0x0000000000895e74 <+276>:	and    $0x7fffffff,%ecx
     0x0000000000895e7a <+282>:	jne    0x895e30 <float32_mul+208>
     0x0000000000895e7c <+284>:	jmp    0x895e45 <float32_mul+229>
  End of assembler dump.

However I'm not sure how much of that increase is down to the change of
macro expansion and how much is due to the extra leg for the flushing.

Anyway other than that observation seems OK to me:

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

