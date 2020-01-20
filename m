Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C34B142925
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 12:23:39 +0100 (CET)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itV9e-0003k5-8a
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 06:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1itUpt-0001BJ-40
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:03:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1itUpo-00009g-1g
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:03:12 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50330)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1itUpn-00009I-R8
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:03:07 -0500
Received: by mail-wm1-x341.google.com with SMTP id a5so14033705wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 03:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=if2jQzJ0JN3HZjix+IX3YLcUvsCrd0RAqio9jShR0AA=;
 b=g8VhosLE0F8HS/NKbQTORq4dHI3UW8NWcDNMbTG7SA9dOpkTKXrk44cW9KFfPyxWBw
 rJS2Op47BXNuzNnyTPYUnfLE5llHwYpfgYylLym94rv6wEK/8q60d7S+iGyuNXYGOcUG
 KFxIoItsVlnxWFKJFyz1wu/TjpkjEMae2PdCcyzmaem1m98UIQPBizCUEAL3dnNBB9iG
 y1DjjBh2ec/V6yYwuhNMmfWSvPT1tJXO4eOW3+AkMBHBbdxh0c0/699V5FfDJWGAoQu4
 pCr+1HaIfkrnNTJTqBffDwOFHTHzLz0IPAlv8LaWf6nxjhrsv7rJ2b1b1EXKB12/a6IX
 /IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=if2jQzJ0JN3HZjix+IX3YLcUvsCrd0RAqio9jShR0AA=;
 b=GxZL0onDvGMPO2Fx+WSvsA07kDIeXCOKCZxRn+sV62deq1NLMw05MVbOkZOqhzrpKP
 N/aTd4rcRsMwnGES6ga+nm7Ps/oksdBmkgN8nbDWobJYPaYsJVO94InZirkpykJ5gB3W
 oQo9Co4w+w8UPy9E8EQp7XhymgYfuwXxaf9AJwILHApEDwTl018+peiMoVhuj0fKKRtK
 xZEDkNvDlGdK3Nsd6p6ouhYenQ4fUzOShmuMWBvG/sEz8dxRPXBcODq89iNjBf+JVdX2
 PYIOivgLiWoc87DVspMVyu0BSf5yaEymQD3bUlT9jXAH+jrqsa1mTwcrnF2j5rcIbHd4
 rENQ==
X-Gm-Message-State: APjAAAU4irhyh9DtWffp8fpCaKmNofY5FUzWIQo6X4Tv8pC/1kMjVSin
 YJCcqQA4Xe2u0ljpU2KxU2Qq/A==
X-Google-Smtp-Source: APXvYqycrhqE6XnOh3VhhVbcYhzusw0AqJuy7VzyKqtcXTCoXN1IMUG3OABazBWEww8Ch9hZVaNydA==
X-Received: by 2002:a1c:7f4f:: with SMTP id a76mr18827993wmd.77.1579518186591; 
 Mon, 20 Jan 2020 03:03:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 2sm46359372wrq.31.2020.01.20.03.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 03:03:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0E681FF87;
 Mon, 20 Jan 2020 11:03:04 +0000 (GMT)
References: <20200118140619.26333-1-philmd@redhat.com>
 <20200118140619.26333-3-philmd@redhat.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/6] Makefile: Clarify all the codebase requires qom/
 objects
In-reply-to: <20200118140619.26333-3-philmd@redhat.com>
Date: Mon, 20 Jan 2020 11:03:04 +0000
Message-ID: <87ftga4cgn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> QEMU user-mode also requires the qom/ objects, it is not only
> used by "system emulation and qemu-img". As we will use a big
> if() block, move it upper in the "Common libraries for tools
> and emulators" section.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  Makefile.objs | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/Makefile.objs b/Makefile.objs
> index 7c1e50f9d6..5aae561984 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -2,6 +2,7 @@
>  # Common libraries for tools and emulators
>  stub-obj-y =3D stubs/
>  util-obj-y =3D crypto/ util/ qobject/ qapi/
> +qom-obj-y =3D qom/
>=20=20
>  chardev-obj-y =3D chardev/
>=20=20
> @@ -26,11 +27,6 @@ block-obj-m =3D block/
>=20=20
>  crypto-obj-y =3D crypto/
>=20=20
> -#######################################################################
> -# qom-obj-y is code used by both qemu system emulation and qemu-img
> -
> -qom-obj-y =3D qom/
> -
>  #######################################################################
>  # io-obj-y is code used by both qemu system emulation and qemu-img


--=20
Alex Benn=C3=A9e

