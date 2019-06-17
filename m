Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC448120
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 13:44:41 +0200 (CEST)
Received: from localhost ([::1]:46266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcq40-0004It-NA
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 07:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54704)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hcpwD-0002Oa-Au
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hcpwB-0008V3-CD
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:36:37 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hcpw9-0008LX-8t
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:36:35 -0400
Received: by mail-wm1-x342.google.com with SMTP id s15so8728208wmj.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=LE/vgjgV3L2QM0IhA5UFBw8V9LoyfknCUTpbu7QPvNI=;
 b=T1o/A/VOJC+ADtmStZ6BxoB+a2eOyYxImY5l2dot5Em280oM8pnpc5MP1NpzlUCJA3
 Hbqi0DgxuMzXcLh2In4sUNFzv0Kgc44hSyFExNH9rzp8N6jZJOkKrRypt4NgPGWpyVG3
 nqOAvicSAN01SAl4qcXjCTflk8gIkhGpE3SGOK5EeGBCzvTM4rjREUAJuMrvwMhecTo4
 vATOZ/JumNX7MeTAC+Q6XTJqAawZPo8cAAc0gefW7wrm+nkEPLeFkYk3YCuHNZSP2e/X
 fjtzD+a523FXn5vU6mdzulbaYq6s+AL8mbsSxXdiRDUwc8muk/7Kj1p6Z+bW6dm+9x0D
 kl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=LE/vgjgV3L2QM0IhA5UFBw8V9LoyfknCUTpbu7QPvNI=;
 b=qEA/sQiT/vlevjp7IPosbR0Q5AUXZ6kdlgc03jayl6E1UCNPG/8t0ApuS1AHOSFDYe
 O2hVy0Cy7A/kk3MVqBMRpZoVpXAj0/LS7eiLzFPNkzzn32+FEhVK1ZHu7ZmYI4/LYsZ0
 gqdBderxouCCSeennvFiCPG+cWbFtkEYctkkjeWbxHb2hZ2H+MmJh/NLpUre/d+o50FZ
 bZpZgI/uMQCaIovUzdS60o6VFOmb++G8NhB1yUmMyQFOX768woVfUlEUt9+D4lvRfl4H
 MeTALiUWNBu+LsoU1mEIgGev8sAaigdxOGnD1nJTjelVQf0c817bsIaTQ0yBrvArzcHD
 zM3g==
X-Gm-Message-State: APjAAAVXUl9TctMTnvX1tRdaHPbu01n2AtsfszaWniCp10xDeKtFqZIw
 FpaE0GneriRE9YQbNjD2MRydZw==
X-Google-Smtp-Source: APXvYqzqOZsB2Q2VizsHHRFqz7cmxncUWkl9gF2QkZ+5izyCfO3IhEQPQMen6RKH8sRvJV8vx0+lMw==
X-Received: by 2002:a1c:c583:: with SMTP id
 v125mr17667477wmf.158.1560771388844; 
 Mon, 17 Jun 2019 04:36:28 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id v67sm15036224wme.24.2019.06.17.04.36.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 04:36:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E931B1FF87;
 Mon, 17 Jun 2019 12:36:27 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com>
 <20190615154352.26824-3-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
In-reply-to: <20190615154352.26824-3-philmd@redhat.com>
Date: Mon, 17 Jun 2019 12:36:27 +0100
Message-ID: <87blywbg04.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 02/23] target/arm: Makefile
 cleanup (ARM)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Group ARM objects together, TCG related ones at the bottom.
> This will help when restricting TCG-only objects.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/Makefile.objs | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index 7c31fa01c1..3269dda613 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -4,11 +4,9 @@ obj-$(CONFIG_KVM) +=3D kvm.o
>  obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
>  obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) +=3D kvm64.o
>  obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
> -obj-y +=3D translate.o op_helper.o helper.o cpu.o
> -obj-y +=3D neon_helper.o iwmmxt_helper.o vec_helper.o vfp_helper.o
> +obj-y +=3D helper.o cpu.o
>  obj-y +=3D gdbstub.o
>  obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
> -obj-y +=3D crypto_helper.o
>  obj-$(CONFIG_SOFTMMU) +=3D arm-powerctl.o
>
>  DECODETREE =3D $(SRC_PATH)/scripts/decodetree.py
> @@ -32,6 +30,11 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
>  target/arm/translate.o: target/arm/decode-vfp.inc.c
>  target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
>
> +obj-y +=3D translate.o op_helper.o
> +obj-y +=3D crypto_helper.o
> +obj-y +=3D iwmmxt_helper.o vec_helper.o
> +obj-y +=3D neon_helper.o vfp_helper.o
> +
>  obj-$(TARGET_AARCH64) +=3D translate-a64.o helper-a64.o
>  obj-$(TARGET_AARCH64) +=3D translate-sve.o sve_helper.o
>  obj-$(TARGET_AARCH64) +=3D pauth_helper.o


--
Alex Benn=C3=A9e

