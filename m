Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9719665F6A3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYWS-0007Ta-45; Thu, 05 Jan 2023 17:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDYW2-0007T8-HP; Thu, 05 Jan 2023 17:15:14 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDYW0-0002UM-NZ; Thu, 05 Jan 2023 17:15:14 -0500
Received: by mail-ed1-x535.google.com with SMTP id s5so54701093edc.12;
 Thu, 05 Jan 2023 14:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6dpbcNHyQ6HrazDj8r0JuCScCuDNWD9QAETZkINxTk=;
 b=Fsiw89Mfvj4DFC/Qf1uEkC7xAb3t8d/FFZaDptuCsOw9spWJqZ9QGEYp06W2oWBjTq
 goIjlXLzZ2oE9XPFzmdo2Emr+nWda7f68HNCUdU5R6gLVOigL35/xENW8i3Nl8bwWT4k
 WFBfUxuyCr8HztStO8gN2iYpgOfZvagW1Xt7aSUtavoYrSPk8fDj9EpuXf9zXIwcFIX/
 3nyBLGsnYHKbsuTiKGOK6BH0AvgS6xG9hsQ5XMH4GpXX/kGWM3hf/mdTMzn4yKUdT0Uq
 PUEoP7KqACz+94c/Nw+WohtRo2EHgPFCobCQgIyXXmKJfliTVNiwtISk3WyFCYMksJA0
 nzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6dpbcNHyQ6HrazDj8r0JuCScCuDNWD9QAETZkINxTk=;
 b=mpk2a6VRPOWoJTN74+kMsnKhSxx2RLiM452y82lyzjEyXbToFYY+JhlPv+8A9FtXBV
 VOYv8lRhdbiiYu0hKgISiOPfwiwUptMfWB40kqHnStoOzI/fwD1/o56SSHDRvoLON2X4
 jaZMaBxt0zlAyrISLl7xKd59FK2MakFphyfIdJbGPEpv4ZBuRcOgvZ8S285PEg+NrdAy
 zX1AoX2AmwF3mgVHmN64+v3+yOXe19j00xPDc5kPKmd8etSMzm+7yBBM3YQ7fSgeV3NK
 VMdXcbA8pFDTnDdL0bQgaU/tMAg17h9WmnjdbAkPDvYRhma6xeA8tCRYM73qZrvEAoiO
 316w==
X-Gm-Message-State: AFqh2koDBNlEp67r/Y32pUb5l0z2FCIvYUCCWsu+LzO0dgN4cqoXXnXP
 sIXD/zDVrSsWRUxJdxSMEAE=
X-Google-Smtp-Source: AMrXdXtSjqwwk/Ln1NUhmTCek8A/3wIPQzgTqx2CwijM2dWr17gZxOnlU/sqzfhpTN1v1ndmRFSYeA==
X-Received: by 2002:a05:6402:371b:b0:48e:c0c3:796f with SMTP id
 ek27-20020a056402371b00b0048ec0c3796fmr9761398edb.28.1672956910683; 
 Thu, 05 Jan 2023 14:15:10 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20075742c50f98f829f.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:7574:2c50:f98f:829f])
 by smtp.gmail.com with ESMTPSA id
 bo6-20020a0564020b2600b0048ca2b6c370sm6344586edb.29.2023.01.05.14.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:15:10 -0800 (PST)
Date: Thu, 05 Jan 2023 22:15:06 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_hw/pci-host=3A_Use_reg?=
 =?US-ASCII?Q?ister_definitions_from_PCI_standard?=
In-Reply-To: <20230105173702.56610-1-philmd@linaro.org>
References: <20230105173702.56610-1-philmd@linaro.org>
Message-ID: <8D8FFBAE-6097-408A-9597-52B145A00057@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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



Am 5=2E Januar 2023 17:37:02 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>No need to document magic values when the definition names
>from "standard-headers/linux/pci_regs=2Eh" are self-explicit=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/pci-host/grackle=2Ec  |  2 +-
> hw/pci-host/raven=2Ec    |  6 +++---
> hw/pci-host/uninorth=2Ec | 33 +++++++++++----------------------
> 3 files changed, 15 insertions(+), 26 deletions(-)
>
>diff --git a/hw/pci-host/grackle=2Ec b/hw/pci-host/grackle=2Ec
>index 95945ac0f4=2E=2E2a45cc13c3 100644
>--- a/hw/pci-host/grackle=2Ec
>+++ b/hw/pci-host/grackle=2Ec
>@@ -91,7 +91,7 @@ static void grackle_init(Object *obj)
>=20
> static void grackle_pci_realize(PCIDevice *d, Error **errp)
> {
>-    d->config[0x09] =3D 0x01;
>+    d->config[PCI_CLASS_PROG] =3D 0x01;
> }
>=20
> static void grackle_pci_class_init(ObjectClass *klass, void *data)
>diff --git a/hw/pci-host/raven=2Ec b/hw/pci-host/raven=2Ec
>index 7a105e4a63=2E=2Ec47259a851 100644
>--- a/hw/pci-host/raven=2Ec
>+++ b/hw/pci-host/raven=2Ec
>@@ -329,9 +329,9 @@ static void raven_realize(PCIDevice *d, Error **errp)
>     char *filename;
>     int bios_size =3D -1;
>=20
>-    d->config[0x0C] =3D 0x08; // cache_line_size
>-    d->config[0x0D] =3D 0x10; // latency_timer
>-    d->config[0x34] =3D 0x00; // capabilities_pointer
>+    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>+    d->config[PCI_LATENCY_TIMER] =3D 0x10;
>+    d->config[PCI_CAPABILITY_LIST] =3D 0x00;
>=20
>     memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_S=
IZE,
>                                      &error_fatal);
>diff --git a/hw/pci-host/uninorth=2Ec b/hw/pci-host/uninorth=2Ec
>index 8396c91d59=2E=2E38b38c8a00 100644
>--- a/hw/pci-host/uninorth=2Ec
>+++ b/hw/pci-host/uninorth=2Ec
>@@ -276,12 +276,9 @@ static void pci_unin_internal_init(Object *obj)
>=20
> static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
> {
>-    /* cache_line_size */
>-    d->config[0x0C] =3D 0x08;
>-    /* latency_timer */
>-    d->config[0x0D] =3D 0x10;
>-    /* capabilities_pointer */
>-    d->config[0x34] =3D 0x00;
>+    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>+    d->config[PCI_LATENCY_TIMER] =3D 0x10;
>+    d->config[PCI_CAPABILITY_LIST] =3D 0x00;
>=20
>     /*
>      * Set kMacRISCPCIAddressSelect (0x48) register to indicate PCI
>@@ -296,30 +293,22 @@ static void unin_main_pci_host_realize(PCIDevice *d=
, Error **errp)
>=20
> static void unin_agp_pci_host_realize(PCIDevice *d, Error **errp)
> {
>-    /* cache_line_size */
>-    d->config[0x0C] =3D 0x08;
>-    /* latency_timer */
>-    d->config[0x0D] =3D 0x10;
>-    /* capabilities_pointer
>-    d->config[0x34] =3D 0x80; */
>+    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>+    d->config[PCI_LATENCY_TIMER] =3D 0x10;
>+    /* d->config[PCI_CAPABILITY_LIST] =3D 0x80; */
> }
>=20
> static void u3_agp_pci_host_realize(PCIDevice *d, Error **errp)
> {
>-    /* cache line size */
>-    d->config[0x0C] =3D 0x08;
>-    /* latency timer */
>-    d->config[0x0D] =3D 0x10;
>+    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>+    d->config[PCI_LATENCY_TIMER] =3D 0x10;
> }
>=20
> static void unin_internal_pci_host_realize(PCIDevice *d, Error **errp)
> {
>-    /* cache_line_size */
>-    d->config[0x0C] =3D 0x08;
>-    /* latency_timer */
>-    d->config[0x0D] =3D 0x10;
>-    /* capabilities_pointer */
>-    d->config[0x34] =3D 0x00;
>+    d->config[PCI_CACHE_LINE_SIZE] =3D 0x08;
>+    d->config[PCI_LATENCY_TIMER] =3D 0x10;
>+    d->config[PCI_CAPABILITY_LIST] =3D 0x00;
> }
>=20
> static void unin_main_pci_host_class_init(ObjectClass *klass, void *data=
)

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

