Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E863113127
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 17:28:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMa6x-0000i7-5p
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 11:28:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMa62-0000RA-Dk
	for qemu-devel@nongnu.org; Fri, 03 May 2019 11:27:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMa60-0006oz-Tu
	for qemu-devel@nongnu.org; Fri, 03 May 2019 11:27:34 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hMa60-0006m1-LE
	for qemu-devel@nongnu.org; Fri, 03 May 2019 11:27:32 -0400
Received: by mail-wr1-x442.google.com with SMTP id c12so8384426wrt.8
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=oN68iHaliVEMF75KacO+Zi8V6w6xDJ1ZPMQHaVQT6Rc=;
	b=kGwUnbvHq1njp8JRSwvvyK107hXOzy/XXW2YyOBb64Q4RyabozhOsp+zlaKZCZDupt
	uq/ayjaqNbWVOQfMyUyHsq/Pqd6Eb4cZ3PuWhx4B4lm0/uuGTSeCmrsH3OGrsfHz5ExF
	V7livoORe+V6vtblzmVOQuRhuzW4dYe1Dt3JB78ZqgqXiKjCeLzij5daxqtAlh2UX/lX
	2r2CZWQUVCyuwLQIE3MhIab2/QB5ryp0YRrpUB11+ckQ7zutjbPSF0yfkzSaNFRXOmkd
	T6PvCoeDFXd8xAtnp+kvMZwSzAeSIOObnNoXQrS1uosKpkxS/e+XMniZgrfD+2TIq1ju
	C7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=oN68iHaliVEMF75KacO+Zi8V6w6xDJ1ZPMQHaVQT6Rc=;
	b=WTlO3m5HEX49Gmo3JJB2txgmot9projPK5d/DVUJclVvt4JCp/1AhSWdOwtMfE0Vup
	2/+9r/2/pLJWN+GGVsBtDEpikRZC8+1GLlCGV8UxwgLFwNYPh8GseET25MFQVinrZ/4e
	IuohXY9nDrTl3K3euAZUBbGxtK3xK+DSvqD9MrbFywIp/7ECUFWCjz9EUgY5pHKfeuGE
	wEs/s7pw26XYJQwhbOycckQp06Ax/oFOiaPNaRignmkUuQ9oZj7bH85nBZ1WMqqHpbeI
	N6IxvAtdl6n1DoN81ZuhtN1owc9vTPv/338xJ9f+Pew7YrtN1KNcTLpUMw2BqCOUVxJO
	FqaA==
X-Gm-Message-State: APjAAAXnxn+QGVlaMzDkzECP7zWogrMkFQyOfgGCY0iD84gCmS8EhfZs
	7UaWl8l4pD0g2ilh9DmNVX6RUw==
X-Google-Smtp-Source: APXvYqyty7fg179y8E+CjfzeHcy2jct/aEOs6cDk+1hOwRRmNmQ09+MSt/0/gAJU7+wQOt+73PZALw==
X-Received: by 2002:a5d:4dc1:: with SMTP id f1mr7582091wru.300.1556897250021; 
	Fri, 03 May 2019 08:27:30 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id k132sm307094wmf.4.2019.05.03.08.27.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 May 2019 08:27:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 20F011FF87;
	Fri,  3 May 2019 16:27:29 +0100 (BST)
References: <20190502143409.59600-1-ysato@users.sourceforge.jp>
	<20190502143409.59600-13-ysato@users.sourceforge.jp>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190502143409.59600-13-ysato@users.sourceforge.jp>
Date: Fri, 03 May 2019 16:27:29 +0100
Message-ID: <87muk34kym.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH RFC v8 12/12] hw/registerfields.h: Add 8bit
 and 16bit register macros.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Yoshinori Sato <ysato@users.sourceforge.jp> writes:

> Some RX peripheral using 8bit and 16bit registers.
> Added 8bit and 16bit APIs.

Doesn't this mean the build breaks at some point? Features used by other
patches should be introduced first so the build remains bisectable.

>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  include/hw/registerfields.h | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> index 2659a58737..51bfd0cf67 100644
> --- a/include/hw/registerfields.h
> +++ b/include/hw/registerfields.h
> @@ -22,6 +22,14 @@
>      enum { A_ ## reg =3D (addr) };                                      =
    \
>      enum { R_ ## reg =3D (addr) / 4 };
>
> +#define REG8(reg, addr)                                                 =
 \
> +    enum { A_ ## reg =3D (addr) };                                      =
    \
> +    enum { R_ ## reg =3D (addr) };
> +
> +#define REG16(reg, addr)                                                =
  \
> +    enum { A_ ## reg =3D (addr) };                                      =
    \
> +    enum { R_ ## reg =3D (addr) / 2 };
> +
>  /* Define SHIFT, LENGTH and MASK constants for a field within a register=
 */
>
>  /* This macro will define R_FOO_BAR_MASK, R_FOO_BAR_SHIFT and R_FOO_BAR_=
LENGTH
> @@ -40,6 +48,8 @@
>  #define FIELD_EX64(storage, reg, field)                                 =
  \
>      extract64((storage), R_ ## reg ## _ ## field ## _SHIFT,             =
  \
>                R_ ## reg ## _ ## field ## _LENGTH)
> +#define FIELD_EX8  FIELD_EX32
> +#define FIELD_EX16 FIELD_EX32

Hmm maybe we should be defining extract16/extract8 in bitops so things
are a) properly types and b) bounds checked to catch errors.

>
>  /* Extract a field from an array of registers */
>  #define ARRAY_FIELD_EX32(regs, reg, field)                              =
  \
> @@ -49,6 +59,22 @@
>   * Assigning values larger then the target field will result in
>   * compilation warnings.
>   */
> +#define FIELD_DP8(storage, reg, field, val) ({                          =
  \
> +    struct {                                                            =
  \
> +        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
> +    } v =3D { .v =3D val };                                             =
      \
> +    uint8_t d;                                                          =
  \
> +    d =3D deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,       =
    \
> +                  R_ ## reg ## _ ## field ## _LENGTH, v.v);             =
  \
> +    d; })
> +#define FIELD_DP16(storage, reg, field, val) ({                         =
  \
> +    struct {                                                            =
  \
> +        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
> +    } v =3D { .v =3D val };                                             =
      \
> +    uint16_t d;                                                         =
  \
> +    d =3D deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,       =
    \
> +                  R_ ## reg ## _ ## field ## _LENGTH, v.v);             =
  \
> +    d; })
>  #define FIELD_DP32(storage, reg, field, val) ({                         =
  \
>      struct {                                                            =
  \
>          unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
> @@ -57,7 +83,7 @@
>      d =3D deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,       =
    \
>                    R_ ## reg ## _ ## field ## _LENGTH, v.v);             =
  \
>      d; })
> -#define FIELD_DP64(storage, reg, field, val) ({                         =
  \
> +#define FIELD_DP64(storage, reg, field, val) ({                         \
>      struct {                                                            =
  \
>          unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
>      } v =3D { .v =3D val };                                             =
      \


--
Alex Benn=C3=A9e

