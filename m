Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46A65DD0A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 20:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD9fJ-0007xJ-MN; Wed, 04 Jan 2023 14:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pD9fG-0007wj-T5; Wed, 04 Jan 2023 14:43:06 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pD9fE-0002Mr-Or; Wed, 04 Jan 2023 14:43:06 -0500
Received: by mail-ej1-x632.google.com with SMTP id ud5so85254563ejc.4;
 Wed, 04 Jan 2023 11:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnxXdsP69wb0+o++OCM64Qdw3tyDeO4HaziIHZU2LnU=;
 b=ppzFbFDFrBIp8bbBIYFImVEx1xDYYVbfD54ssiFQwSsysgmtzsOAh+wL7FuatHvNqg
 AInKrsSUkMJTYFXRohVM8KoDOFoY/u83Xpe/l6yOSpGNGYm+/HAE7MuVHkQGcQZga0lN
 HrJ4rUYEUdSiDorndqSpYIZJqdqm+iUK5lWxSuU1epAMrULKVnwuG/1I93pcibF+J7E7
 qyou1exADZxeGgyvHgn+fRY9JrEdfaqErPDUlkS5kbp0h0CpFCBFMhBAdwhfBN/gIVLa
 XW4Zcmu4i29T4VYPmSiYcUQdDERcqllnp47ub7OeZ97mYi6bTn/nr0DPOQG54ZDfRoWg
 ALpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fnxXdsP69wb0+o++OCM64Qdw3tyDeO4HaziIHZU2LnU=;
 b=TURw8GYmt/ZOU3otb9DpRE6IRjl48mDY8l7IxPYPcCAxbmBuAKQNC7PlMxD6Q0ViAW
 Qxtsw/z9bAtkl3F2nD+fbSXNQVSFJIFBdI8aREf3L1BJ4UXD5+tBC+NZiBQBbDBD+Awi
 qLVcbGjXe4SbQoJjU+pQ7eWLjTzRLwCI+TUgmG2UPF/0zxPiRlysO+0CSNpxh8KNWfvh
 Bc+saI04VeMTTbiibl+Z9GVxR/Cr5XqTuhKZRVsrTvnzHuwxYfiCcZYpUqyqXRyilxAW
 2Vga/kK/MyDvjovvq6XGaMnn8Lw66uC9ivuiLHtWZHeiPIZPkgckfEKfCkfxYt8GYKSg
 Xygw==
X-Gm-Message-State: AFqh2kp20qj2lzTX36+78h+4wBhd/Z1RUw9D95eHHz/7aHfFnSa4LZPn
 eMuI8yG6iZ2iPtToWcbIAGKsFHmOHonE9w==
X-Google-Smtp-Source: AMrXdXufLO4k8zbmYftmTmeR/BqIMxS6/XKiEUCtmpABREhlk8Z8SEGWdQ3K+6eg7zOwd3MEpKZ14g==
X-Received: by 2002:a17:907:6d98:b0:7c1:12b0:7d5d with SMTP id
 sb24-20020a1709076d9800b007c112b07d5dmr54968597ejc.4.1672861382413; 
 Wed, 04 Jan 2023 11:43:02 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008108eedf25879029.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8108:eedf:2587:9029])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170907985400b007c0b6e1c7fdsm15625555ejc.104.2023.01.04.11.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 11:43:02 -0800 (PST)
Date: Wed, 04 Jan 2023 19:42:55 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_06/30=5D_hw/i386/pc=5Fpiix=3A_Associat?=
 =?US-ASCII?Q?e_pci=5Fmap=5Firq=5Ffn_as_soon_as_PCI_bus_is_created?=
In-Reply-To: <20221221170003.2929-7-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-7-shentey@gmail.com>
Message-ID: <CA2E4713-EAA3-4C72-B575-2BCE73B2A285@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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



Am 21=2E Dezember 2022 16:59:39 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>Observe that the pci_map_irq_fn's don't depend on the south bridge
>instance=2E So associate them immediately when the PCI bus is created to
>keep things logically together=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>

This patch was new in v4 and therefore still lacks review=2E It could be s=
quashed into https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/m=
sg03312=2Ehtml for a cleaner history=2E

Best regards,
Bernhard
>---
> hw/i386/pc_piix=2Ec | 7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
>
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index e4bb8994da=2E=2Ebfa7cb513b 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -229,6 +229,9 @@ static void pc_init1(MachineState *machine,
>                               x86ms->below_4g_mem_size,
>                               x86ms->above_4g_mem_size,
>                               pci_memory, ram_memory);
>+        pci_bus_map_irqs(pci_bus,
>+                         xen_enabled() ? xen_pci_slot_get_pirq
>+                                       : pci_slot_get_pirq);
>         pcms->bus =3D pci_bus;
>=20
>         pci_dev =3D pci_create_simple_multifunction(pci_bus, -1, true, t=
ype);
>@@ -236,10 +239,6 @@ static void pc_init1(MachineState *machine,
>         piix3->pic =3D x86ms->gsi;
>         piix3_devfn =3D piix3->dev=2Edevfn;
>         isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa=2E0")=
);
>-
>-        pci_bus_map_irqs(pci_bus,
>-                         xen_enabled() ? xen_pci_slot_get_pirq
>-                                       : pci_slot_get_pirq);
>     } else {
>         pci_bus =3D NULL;
>         isa_bus =3D isa_bus_new(NULL, get_system_memory(), system_io,

