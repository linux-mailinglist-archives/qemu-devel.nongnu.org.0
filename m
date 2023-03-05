Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4716AAE7F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 08:40:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYixv-0001U9-1b; Sun, 05 Mar 2023 02:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYixo-0001Tl-60; Sun, 05 Mar 2023 02:39:25 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYixm-0006a7-9d; Sun, 05 Mar 2023 02:39:23 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e13so5882500wro.10;
 Sat, 04 Mar 2023 23:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678001960;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzfQg5l3tymYUW3CLKnF3t1uMEvqV1NJYZ6MNs0lOZI=;
 b=WlhgZL8sgeAZX0gGeasy9D2jdAnSimS61hcJ/fc96kkjXlbC/T9lAuNhbFgQ2b38d4
 A0e+uQdg4vrI56PwYTebJdLr+pHeU9BXnJsiFgjaCWaJdHPa2tS6RPx/C0VQpXjnn0B6
 JsSH7xLtvNixYB/kqrAPW842Li3WJZ6Lwi05a7UCO6S0U3BuxoyEKFSzN730w40eQmUN
 a0MTZbldfCAnLOE34BYbcJIoTwSNmKFjwyMNQiw26WqWdlAciV3nFdLioLfdF7O9Bo+c
 Qz7a14I15VcW5ejwrC6Nv3KaML9f23eIyRP5nKnDuOOwYvvq05bFjcmsBpRSH4kxmVBh
 OGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678001960;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzfQg5l3tymYUW3CLKnF3t1uMEvqV1NJYZ6MNs0lOZI=;
 b=rar1OjrN9wNMqmY6FUgn8K4GcdKKEo7ttjPMN8e1vCHIV557KbYqy6SD+yyTYjB43A
 IcOVAJatGV3AgzSMwVjirF6xCIdL2NPi7PFfEHUYuiW8o9ob//9roP/0bh0XuM36Asno
 jxKC171GqYq3Qdz85ojeCaG3SSQ9g6+X1wT130hr2BmL5AXBM4AEx9umGo1p1coX2LzU
 fELre3jiXgdZPmKvBqv1bKq5/G7S2aoh+f962xOGth4nMnRXT/iBfeWaZrPNf1KYHgjv
 4A4SwNBxD0LygcTQXboowsG683+Vpf+pYIH6n3EYLjMhNzTutWwBdy5U3y0rB7npgLiw
 Y26A==
X-Gm-Message-State: AO0yUKW8UPsQM30FJDJOfiKmvJVdxyXP0Nq5w+PdjICh0UfCCPmzCyPE
 JmCcKAdp4+6BHTOi5KAoVrk=
X-Google-Smtp-Source: AK7set9DMKhOV8NT+5yNin9mzHuETjWrvMmCyO/fBD5PBCh0hVY4xrgLw/A3+jUVfZfTP6ogEEcCwA==
X-Received: by 2002:adf:ffcf:0:b0:2c7:103f:7122 with SMTP id
 x15-20020adfffcf000000b002c7103f7122mr5157834wrs.28.1678001959762; 
 Sat, 04 Mar 2023 23:39:19 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-176-138.78.54.pool.telefonica.de.
 [78.54.176.138]) by smtp.gmail.com with ESMTPSA id
 n18-20020adfe352000000b002c567881dbcsm6715468wrj.48.2023.03.04.23.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 23:39:19 -0800 (PST)
Date: Sun, 05 Mar 2023 07:39:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: Re: [PATCH v6 5/7] hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
In-Reply-To: <cfede50077a960a6445c135bbd496cb30fbeedff.1677940224.git.balaton@eik.bme.hu>
References: <cover.1677940224.git.balaton@eik.bme.hu>
 <cfede50077a960a6445c135bbd496cb30fbeedff.1677940224.git.balaton@eik.bme.hu>
Message-ID: <05E4CDDA-AE6A-487F-9D7A-204BE8ED013D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42d.google.com
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



Am 4=2E M=C3=A4rz 2023 14:48:23 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>According to the PCI specification, PCI_INTERRUPT_LINE shall have no
>effect on hardware operations=2E Now that the VIA south bridges implement
>the internal PCI interrupt router let's be more conformant to the PCI
>specification=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>Tested-by: Rene Engel <ReneEngel80@emailn=2Ede>

Reviewed-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>

See https://lore=2Ekernel=2Eorg/qemu-devel/69ca8f8f-7b6c-f746-c414-1f121a3=
1eaef@ilande=2Eco=2Euk/

>---
> hw/usb/vt82c686-uhci-pci=2Ec | 12 ------------
> 1 file changed, 12 deletions(-)
>
>diff --git a/hw/usb/vt82c686-uhci-pci=2Ec b/hw/usb/vt82c686-uhci-pci=2Ec
>index 46a901f56f=2E=2Eb4884c9011 100644
>--- a/hw/usb/vt82c686-uhci-pci=2Ec
>+++ b/hw/usb/vt82c686-uhci-pci=2Ec
>@@ -1,17 +1,7 @@
> #include "qemu/osdep=2Eh"
>-#include "hw/irq=2Eh"
> #include "hw/isa/vt82c686=2Eh"
> #include "hcd-uhci=2Eh"
>=20
>-static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
>-{
>-    UHCIState *s =3D opaque;
>-    uint8_t irq =3D pci_get_byte(s->dev=2Econfig + PCI_INTERRUPT_LINE);
>-    if (irq > 0 && irq < 15) {
>-        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
>-    }
>-}
>-
> static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
> {
>     UHCIState *s =3D UHCI(dev);
>@@ -25,8 +15,6 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, =
Error **errp)
>     pci_set_long(pci_conf + 0xc0, 0x00002000);
>=20
>     usb_uhci_common_realize(dev, errp);
>-    object_unref(s->irq);
>-    s->irq =3D qemu_allocate_irq(uhci_isa_set_irq, s, 0);
> }
>=20
> static UHCIInfo uhci_info[] =3D {

