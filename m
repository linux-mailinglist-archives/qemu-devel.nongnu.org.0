Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5A9807B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 18:45:40 +0200 (CEST)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Tjv-0001E8-6t
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 12:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59591)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1i0TZw-0007Yr-VY
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 12:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1i0TZv-00062w-Tc
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 12:35:20 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:36434)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1i0TZv-000621-OI; Wed, 21 Aug 2019 12:35:19 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4BAC196F51;
 Wed, 21 Aug 2019 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1566405318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7oVn6Ej5gpQqBhvpdEgVYAbVkVIuJr7fow3pu2NUpL8=;
 b=SL1t5YPNrtnpMOBRx4jIX566EM2G4MkaqeZs/BwFELIVo1+df7GjO4f+2VznMKNUVUIYIi
 6CbioF1q3EGHHMmXYqdFW57hqInZmGNLAH/CbpLTSEXOnal88V8WftKAjpbEOOR5g0UUPM
 XTNIENg6hieLzdU12sReut9jGjEP2Ug=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 18:33:37 +0200
Message-Id: <20190821163341.16309-7-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821163341.16309-1-damien.hedde@greensocs.com>
References: <20190821163341.16309-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1566405318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7oVn6Ej5gpQqBhvpdEgVYAbVkVIuJr7fow3pu2NUpL8=;
 b=ZDHnk7SDL6W49lJAL2hG4S8loJlnLLNCSOjdZV2/Go36CSg32uof4qNCTlCFtXMMyas1W6
 fBjlVxG8QADpAdvxYdX7w+aeBUguatB7DkFyP/DoufkqY1k3SAOrF9b+xrK+ZJw06REsEH
 J5sQE3Rdm6xPlRY05XG9J9/x0Ey2KrU=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1566405318; a=rsa-sha256; cv=none;
 b=Gk7oRRFSzsRxJGan7x47CiHQg2wxlUrHDLLhgMRQIYEW6Hlv0lUUT8K0pu8z4VfTXd8V35
 Gag+BkQ1lLudshxDyVql/nvW6NswlvpalgtDtuXep7rEg5g/YWD8f5Qm9rjAyZVAITaUgu
 2I5qBNeqzPWnb0P3uEwSE0rj3bb44Yk=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [PATCH v4 06/10] hw/s390x/ipl.c: replace deprecated
 qbus_reset_all registration
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>, edgar.iglesias@xilinx.com, berrange@redhat.com,
 ehabkost@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 mark.burton@greensocs.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace deprecated qbus_reset_all by resettable_cold_reset_fn for
the ipl registration in the main reset handlers.

This does not impact the behavior: qbus_reset_all is already a wrapper
for the cold reset function.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-s390x@nongnu.org
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/ipl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index ca544d64c5..2689f7a017 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -237,7 +237,15 @@ static void s390_ipl_realize(DeviceState *dev, Error=
 **errp)
      */
     ipl->compat_start_addr =3D ipl->start_addr;
     ipl->compat_bios_start_addr =3D ipl->bios_start_addr;
-    qemu_register_reset(qdev_reset_all_fn, dev);
+    /*
+     * Because this Device is not on any bus in the qbus tree (it is
+     * not a sysbus device and it's not on some other bus like a PCI
+     * bus) it will not be automatically reset by the 'reset the
+     * sysbus' hook registered by vl.c like most devices. So we must
+     * manually register a reset hook for it.
+     * TODO: there should be a better way to do this.
+     */
+    qemu_register_reset(resettable_cold_reset_fn, dev);
 error:
     error_propagate(errp, err);
 }
--=20
2.22.0


