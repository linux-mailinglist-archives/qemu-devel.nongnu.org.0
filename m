Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD91723E3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 17:48:56 +0100 (CET)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7MLH-00008a-My
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 11:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7MK9-0007Qr-6d
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7MK7-0002Gi-GK
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:47:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45548
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7MK7-0002G8-DC
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582822063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLYJa04/ib8S/ZD5NLXELObh98IS1WlwLAmx6ECTU+w=;
 b=MMn1YmNKnqhmMRsoLTvqK2qpYywk4AWUVg+PPZ044X9sQPPPgIkkawDcHxTliZvj5xK0Ga
 n1SO9fy/Qqbvn0UAoZcoh5X/8KPBLpptvk0sXIJYePYWfRW8BkOY50gShVEgrfZQjJB+kH
 UxpQr4+5g31xZGCYOsWjE4J/2j3fclk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-oj9voCXsO-qcVs1eIct9FQ-1; Thu, 27 Feb 2020 11:47:41 -0500
X-MC-Unique: oj9voCXsO-qcVs1eIct9FQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C8C0189F760;
 Thu, 27 Feb 2020 16:47:40 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B2FC5C883;
 Thu, 27 Feb 2020 16:47:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
Date: Thu, 27 Feb 2020 17:47:27 +0100
Message-Id: <20200227164728.11635-2-philmd@redhat.com>
In-Reply-To: <20200227164728.11635-1-philmd@redhat.com>
References: <20200227164728.11635-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Make sure a null SMMUPciBus is returned in case we were
not able to identify a pci bus matching the @bus_num.

This matches the fix done on intel iommu in commit:
a2e1cd41ccfe796529abfd1b6aeb1dd4393762a2

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20200226172628.17449-1-eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/smmu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0f2573f004..67d7b2d0fd 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -301,6 +301,7 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t=
 bus_num)
                 return smmu_pci_bus;
             }
         }
+        smmu_pci_bus =3D NULL;
     }
     return smmu_pci_bus;
 }
--=20
2.21.1


