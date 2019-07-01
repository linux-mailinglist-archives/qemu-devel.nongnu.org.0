Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A539D1FBD0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 22:53:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hR0tw-0007Ux-Px
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 16:53:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0rT-0005tp-JK
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:50:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0rR-0001E8-KA
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:50:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1hR0rP-0001CH-Md; Wed, 15 May 2019 16:50:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13B6D3001561;
	Wed, 15 May 2019 20:50:46 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FFF85C5B0;
	Wed, 15 May 2019 20:50:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 May 2019 22:50:17 +0200
Message-Id: <1557953433-19663-6-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
References: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 15 May 2019 20:50:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 05/21] megasas: fix mapped frame size
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Lieven <pl@kamp.de>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

the current value of 1024 bytes (16 * MFI_FRAME_SIZE) we map is not enough to hold
the maximum number of scatter gather elements we advertise. We actually need a
maximum of 2048 bytes. This is 128 max sg elements * 16 bytes (sizeof (union mfi_sgl)).

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
Message-Id: <20190404121015.28634-1-pl@kamp.de>
Reviewed-by: Hannes Reinecke <hare@suse.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/megasas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index a56317e..5ad762d 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -477,7 +477,7 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState *s,
 {
     PCIDevice *pcid = PCI_DEVICE(s);
     MegasasCmd *cmd = NULL;
-    int frame_size = MFI_FRAME_SIZE * 16;
+    int frame_size = MEGASAS_MAX_SGE * sizeof(union mfi_sgl);
     hwaddr frame_size_p = frame_size;
     unsigned long index;
 
-- 
1.8.3.1



