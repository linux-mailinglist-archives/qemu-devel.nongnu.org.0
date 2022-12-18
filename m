Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21DD6502A3
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 17:49:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6wpu-0006Yf-3m; Sun, 18 Dec 2022 11:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p6wps-0006Wm-9m
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 11:48:24 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p6wpq-0005kB-Pk
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 11:48:24 -0500
Received: by mail-ej1-x62f.google.com with SMTP id qk9so16686253ejc.3
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eoRB6z0eHG3Lt9o+tpMzjd8H8PWZeUryxmgvbSd4ZmI=;
 b=Zrrvn4AvTPCm8Q9v/5qGPpVcqZMttVstYeV6+vA5uUvxNPxFvu4iKIWTBryJdRB7lX
 W4lMNxDhchIlO9AQbYMjtc8hZN44USs8/hGSzE521ry0KN2nROFZMGFgqFQA1AgpkBic
 2isxqY4FV8NvEefSo/oaiDKxCNW8ZpO6cwUgO6xiDw1QOfccR8JFK28Ny0QQVgvbMHLs
 BvKIBJSKmh/tq2BrLAet6nTuzi/1dASG/irohFBC2CTq8DtkLiXXpIKwSBHHqeHBdgE2
 qTC+N6+ekIA2Rb+ApKRqAwYKGSTN/IdPFmRKjrzXngKQkF1I2Bu75Xg6gDX0Sv6vmZlq
 aMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eoRB6z0eHG3Lt9o+tpMzjd8H8PWZeUryxmgvbSd4ZmI=;
 b=wajAmYHnlGzCCW5UekFwsyiqKTbWLsW1+FSZNdgTkpJzVcNI6Uk0G+HDdCoWrgSIqA
 YlVuxdSy2+aGkJnkPZOSRAx3cQv9hDEYBJt7M2mBEyPDBiP/ff2zwa7myG4017WN+9vM
 AoAK84LgH9bNsf7rZQKDoRHGcVANmHXqbqo5pjAaExGl66GFirKXx3+k7ngzgqwbdR11
 Gz7+Bua/zFHu/5t5mRy9hZXQE7o61h87uTRfD8tbERXrgD82VPSlQwFnzENPs9cW+thA
 z6PQPSp0XG1XdoIpH01gI45n1CJvGdBqjDHN3sETABsHO2kJDz50WmaONnGAwq6EyVhu
 b6ag==
X-Gm-Message-State: ANoB5pkZvImIgjW4jn3LfOzY5/Hq/GJDnE7T0pX2J8L6kfW1zSF9d1b6
 GBF1MpT+rK+XcftHba4RjQg=
X-Google-Smtp-Source: AA0mqf77QzD64xhGFoOVk8Ej7cavGfHT+504+/KVN14uE6c94PIiVy95f6bzTtUfAeyKgzMiKr4Mvw==
X-Received: by 2002:a17:907:c78f:b0:7c1:4e8f:df2f with SMTP id
 tz15-20020a170907c78f00b007c14e8fdf2fmr49913201ejc.17.1671382101370; 
 Sun, 18 Dec 2022 08:48:21 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-182-244-095.77.182.pool.telefonica.de.
 [77.182.244.95]) by smtp.gmail.com with ESMTPSA id
 q23-20020a17090676d700b007c1175334basm3335651ejn.78.2022.12.18.08.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 08:48:20 -0800 (PST)
Date: Sun, 18 Dec 2022 16:48:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/3=5D_hw/mips/malta=3A_I?=
 =?US-ASCII?Q?ntroduce_PIIX4=5FPCI=5FDEVFN_definition?=
In-Reply-To: <20221027204720.33611-2-philmd@linaro.org>
References: <20221027204720.33611-1-philmd@linaro.org>
 <20221027204720.33611-2-philmd@linaro.org>
Message-ID: <D738D4E9-56D6-473A-8294-BA6A94B61E57@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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



Am 27=2E Oktober 2022 20:47:18 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>The PIIX4 PCI-ISA bridge function is always located at 10:0=2E
>Since we want to re-use its address, add the PIIX4_PCI_DEVFN
>definition=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

> hw/mips/malta=2Ec | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/hw/mips/malta=2Ec b/hw/mips/malta=2Ec
>index 272d93eea7=2E=2Edf0f448b67 100644
>--- a/hw/mips/malta=2Ec
>+++ b/hw/mips/malta=2Ec
>@@ -72,6 +72,8 @@
>=20
> #define MAX_IDE_BUS         2
>=20
>+#define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
>+
> typedef struct {
>     MemoryRegion iomem;
>     MemoryRegion iomem_lo; /* 0 - 0x900 */
>@@ -1377,7 +1379,7 @@ void mips_malta_init(MachineState *machine)
>     empty_slot_init("GT64120", 0, 0x20000000);
>=20
>     /* Southbridge */
>-    piix4 =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),=
 true,
>+    piix4 =3D pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, =
true,
>                                             TYPE_PIIX4_PCI_DEVICE);
>     dev =3D DEVICE(piix4);
>     isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa=2E0"));

