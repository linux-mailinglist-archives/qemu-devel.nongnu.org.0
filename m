Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D754973C2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:44:06 +0200 (CEST)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0LHp-0000HO-47
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0t-0005Cc-5O
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0s-0008WU-3C
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:35 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:58895)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L0r-0008SN-6U; Wed, 21 Aug 2019 03:26:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CzjG1gy1z9sR4; Wed, 21 Aug 2019 17:25:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372354;
 bh=QARuwKhSE++Gm/g/XBmuh7qM1lgGrxAx08cn8npusc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UwtbdpJQHATmipJJbpYeBMKvk9AvPoxDYc9oIoQFPlwBYWkggb4/S0L1UpBIqLvxW
 7fVFXFLq3l2uviOZChCZPUmbMvO7FhAyNuPE38SruMvF820SdGHHv6flEpqqSKNPK+
 f1OdD0IUM1xJ/8P1U2I/7tGiAdkGS6IIShvy5qow=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:34 +1000
Message-Id: <20190821072542.23090-35-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 34/42] spapr/pci: Free MSIs during reset
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

When the machine is reset, the MSI bitmap is cleared but the allocated
MSIs are not freed. Some operating systems, such as AIX, can detect the
previous configuration and assert.

Empty the MSI cache, this performs the needed cleanup.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156415228410.1064338.4486161194061636096.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 6e6b4d0f60..deb0b0c80c 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2080,6 +2080,8 @@ static void spapr_phb_reset(DeviceState *qdev)
     if (spapr_phb_eeh_available(SPAPR_PCI_HOST_BRIDGE(qdev))) {
         spapr_phb_vfio_reset(qdev);
     }
+
+    g_hash_table_remove_all(sphb->msi);
 }
=20
 static Property spapr_phb_properties[] =3D {
--=20
2.21.0


