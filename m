Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0256502A5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 17:50:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6wr7-00079R-5o; Sun, 18 Dec 2022 11:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p6wr5-000793-EZ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 11:49:39 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p6wr3-0005qt-PN
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 11:49:39 -0500
Received: by mail-ej1-x62c.google.com with SMTP id tz12so16633058ejc.9
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9HB/SyszN9UCCc/FLDjnt6UZsLW6GzUyaUW5v0Q/v/U=;
 b=h+aXyOiF9ZFw2Yehhg+C++GrK+d/4ihj0RDalXpOAIMdkQA9K61wA2fwFbx6wDFy9t
 AmSVkFFZ5YPIi+aGXabinIECRDkhCiZiDurayaz4JKTQkxRjbZ4a/vYRZpvtAF7XLSs8
 8QdZIh95xtwaZtdiVSIOzx4G7li+5mcru2ajYmT/expIrHM2h5y3Xe546La2iih8QiuH
 EGgx5lsr0cozVUqIMXU7qAZH/UVweoEzW9TZdBbkHfb9vjPpcEJ27IASibuNIWXRKwhw
 VrWVufMdP4moXOzOYUWzq4wfZVEiV/L5TyJoWmHpLfqMDLno+RKezCpFTEEcm2Rm+HOp
 P+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HB/SyszN9UCCc/FLDjnt6UZsLW6GzUyaUW5v0Q/v/U=;
 b=s74WBQUg49NPA+LgqbKM3QGM6wueERqCw7fvVqFW/mXlOmSy+VAu8+0IPci0dclT7D
 FvtzBflMfELKsr30RG9CFQ2bo0QqXzhdZQ2kps3iI/RnAwBfOay9YTq8tXKXL1GD9zIk
 zSBiZl1plREsXNXfn04jI1lZzCSeTRwuHPdgl+iqfKZUCVOUEIlG9WrgvOvVJGYfQWW4
 k0Cun4kUz9XbFn/xE8haCV53wIOvQgBXmIiiym+mE+EAVnze4u068q2gzHbApiq9Wf8u
 6DFOj+a4/EUllQmfnPzKebtG5DTdTkLxfSPOO+TT1vmtMW6bBS2TtGhN2UKX2WHeDIaj
 5bJQ==
X-Gm-Message-State: ANoB5plXcdQrwSAP8ovq4IQ7EB2eK+ykM365cL75LyC4V/qT/HUXNXYs
 ydCdOVhq+4K3ar7vKPHD9rg=
X-Google-Smtp-Source: AA0mqf7VKR6UvfJY+K8HvQ7MoZ214Ko/ET0vvrJNX1ceGRp9lt4itKWo03snlQx6InlNH2n3+KKI2w==
X-Received: by 2002:a17:906:f9d9:b0:7c1:2e19:ba3f with SMTP id
 lj25-20020a170906f9d900b007c12e19ba3fmr33330906ejb.57.1671382176162; 
 Sun, 18 Dec 2022 08:49:36 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-182-244-095.77.182.pool.telefonica.de.
 [77.182.244.95]) by smtp.gmail.com with ESMTPSA id
 d13-20020a170906304d00b007b4bc423b41sm3299200ejd.190.2022.12.18.08.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 08:49:35 -0800 (PST)
Date: Sun, 18 Dec 2022 16:49:33 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v2 3/3] hw/isa/piix4: Correct IRQRC[A:D] reset values
In-Reply-To: <20221027204720.33611-4-philmd@linaro.org>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-4-philmd@linaro.org>
Message-ID: <A602E066-BABE-4E42-9C1E-3B8D5761C156@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 27=2E Oktober 2022 20:47:20 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>IRQRC[A:D] registers reset value is 0x80=2E We were forcing
>the MIPS Malta machine routing to be able to boot a Linux
>kernel without any bootloader=2E
>We now have these registers initialized in the Malta machine
>write_bootloader(), so we can use the correct reset values=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

> hw/isa/piix4=2Ec | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>index 15f344dbb7=2E=2Ea2165c6a49 100644
>--- a/hw/isa/piix4=2Ec
>+++ b/hw/isa/piix4=2Ec
>@@ -115,10 +115,10 @@ static void piix4_isa_reset(DeviceState *dev)
>     pci_conf[0x4c] =3D 0x4d;
>     pci_conf[0x4e] =3D 0x03;
>     pci_conf[0x4f] =3D 0x00;
>-    pci_conf[0x60] =3D 0x0a; // PCI A -> IRQ 10
>-    pci_conf[0x61] =3D 0x0a; // PCI B -> IRQ 10
>-    pci_conf[0x62] =3D 0x0b; // PCI C -> IRQ 11
>-    pci_conf[0x63] =3D 0x0b; // PCI D -> IRQ 11
>+    pci_conf[0x60] =3D 0x80;
>+    pci_conf[0x61] =3D 0x80;
>+    pci_conf[0x62] =3D 0x80;
>+    pci_conf[0x63] =3D 0x80;
>     pci_conf[0x69] =3D 0x02;
>     pci_conf[0x70] =3D 0x80;
>     pci_conf[0x76] =3D 0x0c;

