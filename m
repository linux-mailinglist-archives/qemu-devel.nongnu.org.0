Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8669453724A
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 21:07:47 +0200 (CEST)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvOGP-0000oE-4d
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 15:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nvOF5-00006Y-Nd
 for qemu-devel@nongnu.org; Sun, 29 May 2022 15:06:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nvOF3-00066y-OS
 for qemu-devel@nongnu.org; Sun, 29 May 2022 15:06:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id k16so7730512wrg.7
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=9csmgoehTqdULGWVNd/e7GVAVkvehO7bmj+sRTty0KM=;
 b=FwcKoPxHsqS5ASWYyv4JxOaI89+al70CEhhDr4x8LP/IsJY51N5WmIgMHjtEx5ejcH
 R+FpT6L4fErNQQuiKUlsY6yUSMRXpy4QoacIg7DWanIqPmfUkj3c6s+f4Mq1vWOyWYQL
 xKO+OVroBYbRpIox5fapxgd6tVda9/CQOTenzIuERD6zn6YGCxC008pQaTLj1N+R5gDT
 Cj7WGpucYMnG4I6J9Q5xv2ZDK7DxwP1Q3d1hojnWZCdlFI1Nbnof/rLYanF2/Crkovjb
 MBo34YCU0Vju7PItrt0Y/yS6gPvatTE8QhWAUAqsggou4jg1CniqHGvZSIr3vogF9Rnp
 FyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=9csmgoehTqdULGWVNd/e7GVAVkvehO7bmj+sRTty0KM=;
 b=fv+LrsJwtlfHmfP8C5Ge3t1RluWYjYp5YsJhj5Ida1bmUnxu6X4KJlY+ma+vxQev2E
 X3XOUY3Qx2T8nM1ngfAWWVdq4HHwMZvEbZn1n1ZQLRR8tzheH0hiVlIy8a7dvqZOGDQC
 49f1Zc6X+W5ljCcIUM8mLNpw8S5RSUtEiLxMizdkz0bgN/EEJp/xmJHHhA++f0sNE8MB
 gpmLUGpY6wo9R/X5Gr+5kVQvcnWxN/nvBoCuNoRdMJXcxnfMIqZY5YOPpNkrUwa6axU9
 228gCsLZY8h1zBWgaC4vjP0WfLd05m4J28NlI2qZ7T05aQ36thVVWVsxBoDuwoN/2peq
 fLHw==
X-Gm-Message-State: AOAM531OgVHCggVcaCaitpbF8h/t6XXzYIGjhS4/uUwcKEjWRG8inUlf
 YRI+42nIWN0/LmMOyPLA2Tg=
X-Google-Smtp-Source: ABdhPJxQ8Uy8W1yN9TApXBOun7J+ZA5TwpVxbtoOrJ2SCR7tuPVlg4eR3mEe7yB6nubv/aC/YfV5yA==
X-Received: by 2002:adf:e195:0:b0:20d:110c:b890 with SMTP id
 az21-20020adfe195000000b0020d110cb890mr42966898wrb.232.1653851180399; 
 Sun, 29 May 2022 12:06:20 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d00154dd35d8bf95fb4.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:154d:d35d:8bf9:5fb4])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a5d66c5000000b0020e5e906e47sm5813957wrw.75.2022.05.29.12.06.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 May 2022 12:06:20 -0700 (PDT)
Date: Sun, 29 May 2022 19:06:17 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, hpoussin@reactos.org,
 qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_07/12=5D_hw/acpi/piix4=3A_introdu?=
 =?US-ASCII?Q?ce_piix4=5Fpm=5Finit=28=29_instance_init_function?=
In-Reply-To: <20220528091934.15520-8-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <20220528091934.15520-8-mark.cave-ayland@ilande.co.uk>
Message-ID: <4BDCA8D0-F8C1-4C0D-8EFB-E003E1444AAA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28=2E Mai 2022 09:19:29 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayland=
@ilande=2Eco=2Euk>:
>Use the new piix4_pm_init() instance init function to initialise 2 separa=
te qdev
>gpios for the SCI and SMI IRQs=2E
>
>Signed-off-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>---
> hw/acpi/piix4=2Ec | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/hw/acpi/piix4=2Ec b/hw/acpi/piix4=2Ec
>index d897d2dee6=2E=2E454fa34df1 100644
>--- a/hw/acpi/piix4=2Ec
>+++ b/hw/acpi/piix4=2Ec
>@@ -497,6 +497,14 @@ static void piix4_pm_realize(PCIDevice *dev, Error *=
*errp)
>     piix4_pm_add_properties(s);
> }
>=20
>+static void piix4_pm_init(Object *obj)
>+{
>+    PIIX4PMState *s =3D PIIX4_PM(obj);
>+
>+    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
>+    qdev_init_gpio_out_named(DEVICE(obj), &s->smi_irq, "smi-irq", 1);
>+}

The two IRQs still get connected internally=2E Doesn't this create the ris=
k of double connections until patches 8 and 9 are applied?

>+
> PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_ba=
se,
>                               qemu_irq sci_irq, qemu_irq smi_irq,
>                               int smm_enabled)
>@@ -663,6 +671,7 @@ static void piix4_pm_class_init(ObjectClass *klass, v=
oid *data)
> static const TypeInfo piix4_pm_info =3D {
>     =2Ename          =3D TYPE_PIIX4_PM,
>     =2Eparent        =3D TYPE_PCI_DEVICE,
>+    =2Einstance_init  =3D piix4_pm_init,
>     =2Einstance_size =3D sizeof(PIIX4PMState),
>     =2Eclass_init    =3D piix4_pm_class_init,
>     =2Einterfaces =3D (InterfaceInfo[]) {


