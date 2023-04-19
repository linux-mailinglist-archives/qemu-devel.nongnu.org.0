Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652166E81EC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 21:32:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppDWu-0008HN-O8; Wed, 19 Apr 2023 15:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ppDWs-0008H7-41
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:31:46 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ppDWq-0001Ue-MQ
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:31:45 -0400
Received: by mail-ej1-x629.google.com with SMTP id xi5so882329ejb.13
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681932702; x=1684524702;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cX+LAQk2HqYVss/aZUAQt/9OzhHNeQrU+BnfsGMovN4=;
 b=HxeWSwrMem+6qghIookMXWlSJMAxjoDLmGG2GFJ4sX2M70DvIpn9jZjQPx4ptIIxHy
 JmQgrxda+zuIdlWSFeW5CzUy+AEh4V+rhqBW6fXk0Ng94j5qHSe7nHwfidHQ+4Z+K3k4
 LcHCpVHBTgZ9fWdaCPnzJSw54v3OHnr/KAp3iY1M3WCY42W84ajtX9HnvdSBqUQXUUr2
 qOihFZtssVs8/nIkAbpvur0rhT3qdLSq5NeiiA2UHZtQ6oi/+/o8rlDUADUlGV3nIEu5
 xeBr2DAJYPj5MsXct4m79D2ehSRFukE0URKHnXzYUy94z0FVMXd0bii8/grxLFp7YkPo
 LlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681932702; x=1684524702;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cX+LAQk2HqYVss/aZUAQt/9OzhHNeQrU+BnfsGMovN4=;
 b=NYCm10I3wdnmhSwZZphGVl0aR/HGsalnpF9nWOOkHVOwwFBdiQSqioJWI/aThBuF2H
 015YS30mcOZxgL+mu+LLuDDtvucFsTmxxRD3XmE0M7Y2q8BJIEtM1sLg45W94Nyv7Q4Y
 MPnYIICBh4lHiKHSNJM3JkDiDAW5Nn6OJcSKV+Krv2o7VRfyLBpJxTC+UjN/CjJvGkBC
 DxnAbsJJoOL9pvfEfQKFHXDT6cNuikeg7eMOskzeumBRpCgsGwUdmfYY+rV57AAz5c4W
 ceBmVw0PX5/R2JoeHf2I91U9wsS6enDcAkwlhtz6D38Jm3vsnFj6N7vxAsgwXDDoE109
 nQ0g==
X-Gm-Message-State: AAQBX9ckNRIPClQ4J+biFjvdiMbado19PMtFL74ovLslz75PYSrg0lEn
 kQfKsETfHr4Agy+CInWFEPjWKoP4L3w=
X-Google-Smtp-Source: AKy350aKGpFJubkKktMayOWdACPXwfPdtTZaagCkoJdP4zKiUQ+blYrEZa3km7cNMrFTvwaUujLZMA==
X-Received: by 2002:a17:906:82c1:b0:953:8322:a99f with SMTP id
 a1-20020a17090682c100b009538322a99fmr293399ejy.0.1681932702210; 
 Wed, 19 Apr 2023 12:31:42 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-003-214.77.183.pool.telefonica.de.
 [77.183.3.214]) by smtp.gmail.com with ESMTPSA id
 hr33-20020a1709073fa100b0094f71c73d35sm4932629ejc.145.2023.04.19.12.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 12:31:41 -0700 (PDT)
Date: Wed, 19 Apr 2023 19:31:31 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_2/7=5D_hw/pci/pci=2Ec=3A_Don=27t_l?=
 =?US-ASCII?Q?eak_PCIBus=3A=3Airq=5Fcount=5B=5D_in_pci=5Fbus=5Firqs=28=29?=
In-Reply-To: <20230403074124.3925-3-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
 <20230403074124.3925-3-shentey@gmail.com>
Message-ID: <C82C3BC0-E328-4AE8-B182-ADACF3E34A45@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 3=2E April 2023 07:41:19 UTC schrieb Bernhard Beschow <shentey@gmail=2E=
com>:
>When calling pci_bus_irqs() multiple times on the same object without cal=
ling
>pci_bus_irqs_cleanup() in between PCIBus::irq_count[] is currently leaked=
=2E
>Let's fix this because Xen will do just that in a few commits, and becaus=
e
>calling pci_bus_irqs_cleanup() in between seems fragile and cumbersome=2E
>
>Note that pci_bus_irqs_cleanup() now has to NULL irq_count such that
>pci_bus_irqs() doesn't do a double free=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>

Ping PCI maintainers

>---
> hw/pci/pci=2Ec | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/hw/pci/pci=2Ec b/hw/pci/pci=2Ec
>index def5000e7b=2E=2Ebe1c5d16ec 100644
>--- a/hw/pci/pci=2Ec
>+++ b/hw/pci/pci=2Ec
>@@ -558,6 +558,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq=
,
>     bus->set_irq =3D set_irq;
>     bus->irq_opaque =3D irq_opaque;
>     bus->nirq =3D nirq;
>+    g_free(bus->irq_count);
>     bus->irq_count =3D g_malloc0(nirq * sizeof(bus->irq_count[0]));
> }
>=20
>@@ -573,6 +574,7 @@ void pci_bus_irqs_cleanup(PCIBus *bus)
>     bus->irq_opaque =3D NULL;
>     bus->nirq =3D 0;
>     g_free(bus->irq_count);
>+    bus->irq_count =3D NULL;
> }
>=20
> PCIBus *pci_register_root_bus(DeviceState *parent, const char *name,

