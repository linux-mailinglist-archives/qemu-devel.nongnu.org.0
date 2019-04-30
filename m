Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08503F77D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 14:00:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLRQY-0003Ka-VZ
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 08:00:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56389)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <pl@kamp.de>)
	id 1hLROD-0002E3-NA
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 07:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pl@kamp.de>) id 1hLRKz-0002Hv-MJ
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 07:54:19 -0400
Received: from mx01.kamp.de ([82.141.2.16]:36460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pl@kamp.de>) id 1hLRKz-0002GI-Cj
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 07:54:17 -0400
Received: (qmail 15431 invoked by uid 89); 30 Apr 2019 11:54:12 -0000
Received: from [195.62.97.192] by client-16-kamp (envelope-from <pl@kamp.de>,
	uid 89) with qmail-scanner-2010/03/19-MF 
	(clamdscan: 0.101.2/25435. avast: 1.2.2/17010300. spamassassin: 3.4.1. 
	Clear:RC:1(195.62.97.192):. 
	Processed in 0.061591 secs); 30 Apr 2019 11:54:12 -0000
Received: from kerio.kamp.de ([195.62.97.192])
	by mx01.kamp.de with ESMTPS (DHE-RSA-AES256-SHA encrypted);
	30 Apr 2019 11:54:11 -0000
X-GL_Whitelist: yes
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 13:54:09 +0200
Received: (qmail 17984 invoked from network); 30 Apr 2019 11:54:11 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
	(relay@kamp.de@::ffff:172.21.12.60)
	by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted)
	ESMTPA; 30 Apr 2019 11:54:11 -0000
Received: by lieven-pc (Postfix, from userid 1060)
	id 7967113EA62; Tue, 30 Apr 2019 13:54:11 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 13:54:04 +0200
Message-Id: <20190430115404.18483-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 82.141.2.16
Subject: [Qemu-devel] [PATCH RESEND] megasas: fix mapped frame size
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
Cc: fam@euphon.net, pbonzini@redhat.com, hare@suse.com,
	Peter Lieven <pl@kamp.de>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the current value of 1024 bytes (16 * MFI_FRAME_SIZE) we map is not enough to hold
the maximum number of scatter gather elements we advertise. We actually need a
maximum of 2048 bytes. This is 128 max sg elements * 16 bytes (sizeof (union mfi_sgl)).

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Hannes Reinecke <hare@suse.com>
---
 hw/scsi/megasas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index a56317e026..5ad762de23 100644
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
2.17.1



