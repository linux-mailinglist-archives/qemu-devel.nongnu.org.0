Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6365F66C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYP7-0004JL-L5; Thu, 05 Jan 2023 17:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDYOz-0004HP-JZ; Thu, 05 Jan 2023 17:07:58 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDYOx-0005e6-FZ; Thu, 05 Jan 2023 17:07:57 -0500
Received: by mail-ej1-x632.google.com with SMTP id qk9so93012968ejc.3;
 Thu, 05 Jan 2023 14:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HsoKfy1OGl5wffmH3G6kL8YnN1OQcVYpBmCDWFKuPuY=;
 b=TheRmXxsgqTo38Lze4u3+lKtVYHc2aLmIwPS8E1hZjOPEoa17zmVH7phQUYMr9JtLp
 DwF8DOm0rWYfTNiI/86mGdn1fX1ff1M/JDZbIa7LWbvDfSz6IdDf7p1oZbQe/mDVE4Xt
 C6rW+5pN2KYDTStxpIWyDl+eSDR41tj6X4y0O9DNKZabvNoLECyua8N1Xoq2cR6AJilY
 cOLLoQBmGTJFaMnFhdtJ07svWUuD7Ao63dEJ5koEL99WdSumYVPlRf1PbFSPGSxVsKq4
 QkXbnuaIUygX2/vLiR5g/SHafJ6y++iSEd+YmnC6BaU1vQEXRIGR9JesEsfTtH2w6fuY
 m+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HsoKfy1OGl5wffmH3G6kL8YnN1OQcVYpBmCDWFKuPuY=;
 b=zuQ4kYJ0vv8GzIwH2QPWJnD7EbPOv0VtpA0ax8Hlv/aF5yE0Ck+SkYe0QPuESMXo66
 2dZxge54g+ZkoZMq0060oT+Ygc0RRj8tFKWiCcnSv8xrfPkWYm3GKGbopKc/DDShW//P
 hQk6jfpuNfaTladq6uxkbwTQVT1QxCNsovpF5fHAZTXm2WEsTf7zvd9T9N3KSUB+0+Hu
 /N+iDT5/6lgq0krqPDswEs686COZ1bglZ2Sbq+cxoT2Jy5Bufi2L+dKWDwDn2T0IiV/R
 FJ88P6DpwLGmJE+JK8Vsti8fIMEtcLB2eQxreJCOYP1Hc26288NTJWsKBA7CO0j9GgYH
 YyuA==
X-Gm-Message-State: AFqh2koF6xFvXdGl01lmBVwoJabAFMXtNMoWG53ztGUO9qgSoED5EM8M
 n/L+oFhsnAfWCDEsk8FZFhNyPJlKR6ZEWA==
X-Google-Smtp-Source: AMrXdXvJDE9EX/vW896LNSD4ereH7wHfSUTrLIgnwqdzpRONFe+BQeFuBVdh0F4TAkwaU16D2ZaDQA==
X-Received: by 2002:a17:906:99c7:b0:7b5:860d:7039 with SMTP id
 s7-20020a17090699c700b007b5860d7039mr45935655ejn.10.1672956472937; 
 Thu, 05 Jan 2023 14:07:52 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20075742c50f98f829f.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:7574:2c50:f98f:829f])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a170906145b00b007ad69e9d34dsm16938758ejc.54.2023.01.05.14.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:07:52 -0800 (PST)
Date: Thu, 05 Jan 2023 22:07:47 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_hw/i386/pc=3A_Remove_unused_=27?=
 =?US-ASCII?Q?owner=27_argument_from_pc=5Fpci=5Fas=5Fmapping=5Finit?=
In-Reply-To: <20230105173826.56748-1-philmd@linaro.org>
References: <20230105173826.56748-1-philmd@linaro.org>
Message-ID: <03C00391-4F15-4192-8A66-1CDB39F2A141@gmail.com>
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



Am 5=2E Januar 2023 17:38:26 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>This argument was added 9 years ago in commit 83d08f2673
>("pc: map PCI address space as catchall region for not mapped
>addresses") and has never been used since, so remove it=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> hw/i386/pc=2Ec         | 2 +-
> hw/pci-host/i440fx=2Ec | 3 +--
> hw/pci-host/q35=2Ec    | 3 +--
> include/hw/i386/pc=2Eh | 2 +-
> 4 files changed, 4 insertions(+), 6 deletions(-)
>
>diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>index d489ecc0d1=2E=2E6e592bd969 100644
>--- a/hw/i386/pc=2Ec
>+++ b/hw/i386/pc=2Ec
>@@ -782,7 +782,7 @@ void pc_guest_info_init(PCMachineState *pcms)
> }
>=20
> /* setup pci memory address space mapping into system address space */
>-void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
>+void pc_pci_as_mapping_init(MemoryRegion *system_memory,
>                             MemoryRegion *pci_address_space)
> {
>     /* Set to lower priority than RAM */
>diff --git a/hw/pci-host/i440fx=2Ec b/hw/pci-host/i440fx=2Ec
>index d5426ef4a5=2E=2E262f82c303 100644
>--- a/hw/pci-host/i440fx=2Ec
>+++ b/hw/pci-host/i440fx=2Ec
>@@ -272,8 +272,7 @@ PCIBus *i440fx_init(const char *pci_type,
>                      IO_APIC_DEFAULT_ADDRESS - 1);
>=20
>     /* setup pci memory mapping */
>-    pc_pci_as_mapping_init(OBJECT(f), f->system_memory,
>-                           f->pci_address_space);
>+    pc_pci_as_mapping_init(f->system_memory, f->pci_address_space);
>=20
>     /* if *disabled* show SMRAM to all CPUs */
>     memory_region_init_alias(&f->smram_region, OBJECT(d), "smram-region"=
,
>diff --git a/hw/pci-host/q35=2Ec b/hw/pci-host/q35=2Ec
>index 20da121374=2E=2E26390863d6 100644
>--- a/hw/pci-host/q35=2Ec
>+++ b/hw/pci-host/q35=2Ec
>@@ -574,8 +574,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
>     }
>=20
>     /* setup pci memory mapping */
>-    pc_pci_as_mapping_init(OBJECT(mch), mch->system_memory,
>-                           mch->pci_address_space);
>+    pc_pci_as_mapping_init(mch->system_memory, mch->pci_address_space);
>=20
>     /* if *disabled* show SMRAM to all CPUs */
>     memory_region_init_alias(&mch->smram_region, OBJECT(mch), "smram-reg=
ion",
>diff --git a/include/hw/i386/pc=2Eh b/include/hw/i386/pc=2Eh
>index 991f905f5d=2E=2E88a120bc23 100644
>--- a/include/hw/i386/pc=2Eh
>+++ b/include/hw/i386/pc=2Eh
>@@ -156,7 +156,7 @@ void pc_guest_info_init(PCMachineState *pcms);
> #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
>=20
>=20
>-void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
>+void pc_pci_as_mapping_init(MemoryRegion *system_memory,
>                             MemoryRegion *pci_address_space);
>=20
> void xen_load_linux(PCMachineState *pcms);

