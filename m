Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EC48133
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 13:46:45 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcq61-0005wN-3F
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 07:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54529)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hcpvh-0001f6-KT
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:36:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hcpvg-0007oi-IB
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:36:05 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39264)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hcpvg-0007nD-7P
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:36:04 -0400
Received: by mail-wr1-x441.google.com with SMTP id x4so9561658wrt.6
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 04:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=wQ1eptL89nc2bKL1StqoX5u3/ALohXwQ8MgGdkchLQg=;
 b=tA8o0uZDcb4MISaTyi5sfwCgoOsak1/obM4H4d8zvZJa5RBG/uaKiEDcCE76BHWB9m
 228VpuhxNQlaHWq49vgYrARNf5+u/IE+VFqCbIHI2wJnAKXwJKge3nmeIhbYybiPPkpj
 Pnb3p6i3visI4ACPN0xL9a75gMzF8tUsTVR9ZYIWn5DL2z2tBWiz/2Hmw7medlEwiYrP
 /p7sgefCkQ7a3Ghf+9DkJHSsYIPc1isMmPsS4TNxS/RbE+FqSkO/9yRbgFPLM+rUUSs/
 fC3XIO0soerP299zeq68McXxmmnePjulf2KSWnc25MSCGFSNWumKbCYIsnfZnwC3L5I6
 YpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=wQ1eptL89nc2bKL1StqoX5u3/ALohXwQ8MgGdkchLQg=;
 b=DoOO1ZTkqSn0ed8+oxjZJThj9t56/B9dpG4GB1UGd1tBU03+n0OpFjWJX3G9yr6xRa
 ITaQf+W0h8ITmSJXQSMPTewlrcmpzSw59abop9GnHxfr7XcelqdO4UFakBMStsfixDC0
 jwGEPdQRA7V5oykNiALJcb5lvGGjnG8o7gTOnAWqKz/92p5DYyhhVWp+z6xxchKCP02S
 hOzao2vRRFjYU7pgy45zAfCawBjttABjQnVY9xXY8PIo6yNp003KM6NGp3o2Q4IS0jsy
 xswee9kx3CUNas/xqRfaj8TA3IlxWJUUK5fxkSNv0TV5Rvz/C/9tyEGZrsJk2zgb9+Gi
 0htQ==
X-Gm-Message-State: APjAAAXDgQoPiwnHnXg29loJFmSS5NjQ7mJLHgldRK51B+64znnJvGB2
 u+7vsf/CKlIZm+In+m5XrH4IaQ==
X-Google-Smtp-Source: APXvYqzGSF7q5z0GUlFlR5owG/mkmgVR4U7UXcc7WgpAcu/pWaJbrChxncsVnVpUK1ub8dTzhQLx+Q==
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr77324290wrw.306.1560771363052; 
 Mon, 17 Jun 2019 04:36:03 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id d3sm29506651wrf.87.2019.06.17.04.36.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 04:36:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 127361FF87;
 Mon, 17 Jun 2019 12:36:02 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com>
 <20190615154352.26824-2-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
In-reply-to: <20190615154352.26824-2-philmd@redhat.com>
Date: Mon, 17 Jun 2019 12:36:02 +0100
Message-ID: <87d0jcbg0t.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 01/23] target/arm: Makefile
 cleanup (Aarch64)
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

> Group Aarch64 objects together, TCG related ones at the bottom.
> This will help when restricting TCG-only objects.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/Makefile.objs | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index dfa736a375..7c31fa01c1 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -7,8 +7,7 @@ obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
>  obj-y +=3D translate.o op_helper.o helper.o cpu.o
>  obj-y +=3D neon_helper.o iwmmxt_helper.o vec_helper.o vfp_helper.o
>  obj-y +=3D gdbstub.o
> -obj-$(TARGET_AARCH64) +=3D cpu64.o translate-a64.o helper-a64.o gdbstub6=
4.o
> -obj-$(TARGET_AARCH64) +=3D pauth_helper.o
> +obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
>  obj-y +=3D crypto_helper.o
>  obj-$(CONFIG_SOFTMMU) +=3D arm-powerctl.o
>
> @@ -33,4 +32,6 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
>  target/arm/translate.o: target/arm/decode-vfp.inc.c
>  target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
>
> +obj-$(TARGET_AARCH64) +=3D translate-a64.o helper-a64.o
>  obj-$(TARGET_AARCH64) +=3D translate-sve.o sve_helper.o
> +obj-$(TARGET_AARCH64) +=3D pauth_helper.o


--
Alex Benn=C3=A9e

