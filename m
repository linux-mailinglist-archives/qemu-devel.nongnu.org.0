Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08712170614
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 18:27:51 +0100 (CET)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j70TO-00007J-4D
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 12:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j70SM-00082m-TZ
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 12:26:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j70SL-0005Nh-J6
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 12:26:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20709
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j70SL-0005Fp-7K
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 12:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582738004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J9wll+plIfhDIdmgkRRYJeSJEE3Lh0NPJHy67PoM9Ss=;
 b=PeyUcFAjobH5RTPQCD2u54L/5hlhTltz0hkgc0H2SzeFbWueHIb3MH+d6ceVOaEf/1j3H1
 y74zOE1U4Kf8DIm1SYdnIvdu9lXf1TUWU4Z6EwQAp7wHmI1mr8N4V7hUt8dPKyAtjxeLKH
 E98tKYkLH8qNI4xGb4d1CK4UCbzT7Q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-_5ErXceoMQCESc6wiSA_0g-1; Wed, 26 Feb 2020 12:26:42 -0500
X-MC-Unique: _5ErXceoMQCESc6wiSA_0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 971F4100726B;
 Wed, 26 Feb 2020 17:26:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F095491851;
 Wed, 26 Feb 2020 17:26:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
Date: Wed, 26 Feb 2020 18:26:28 +0100
Message-Id: <20200226172628.17449-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make sure a null SMMUPciBus is returned in case we were
not able to identify a pci bus matching the @bus_num.

This matches the fix done on intel iommu in commit:
a2e1cd41ccfe796529abfd1b6aeb1dd4393762a2

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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
2.20.1


