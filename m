Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055F2E2876
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 18:56:12 +0100 (CET)
Received: from localhost ([::1]:57164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksUqQ-0007oZ-Km
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 12:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ksUpP-0007O7-7N
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:55:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ksUpM-0003j2-0V
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608832503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ckZy26XJkoskhjMUieOzT+Jdw0tSsf6MFkyUrDkYOZQ=;
 b=LQxTcOUwwkqgIgPECNiN1Tae3zP2VvqkPVnivFEB8pNcoM/m6bNM8Co4/Mwy/DKPsj0EHV
 Np5GoWekLA2nR9bVMHBLODHl+codRkTlbOzo+lxt1QLw/8YTgxafFYxiKzzCepXdLosuD2
 kYGw8Eh7ga9168S7ihCaCt1zyGbcOV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-Zo114LkGNbedbLrDY0m6jA-1; Thu, 24 Dec 2020 12:54:58 -0500
X-MC-Unique: Zo114LkGNbedbLrDY0m6jA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76B77C281;
 Thu, 24 Dec 2020 17:54:57 +0000 (UTC)
Received: from f32-work.redhat.com (ovpn-112-240.ams2.redhat.com
 [10.36.112.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FF5F57;
 Thu, 24 Dec 2020 17:54:55 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/scsi/megasas: check for NULL frame in
 megasas_command_cancelled()
Date: Thu, 24 Dec 2020 18:54:41 +0100
Message-Id: <20201224175441.67538-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: cwmyung@snu.ac.kr, hare@suse.com, mcascell@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure that 'cmd->frame' is not NULL before accessing the 'header' field.
This check prevents a potential NULL pointer dereference issue.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1910346
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
---
 hw/scsi/megasas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 1a5fc5857d..77510e120c 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1893,7 +1893,7 @@ static void megasas_command_cancelled(SCSIRequest *req)
 {
     MegasasCmd *cmd = req->hba_private;
 
-    if (!cmd) {
+    if (!cmd || !cmd->frame) {
         return;
     }
     cmd->frame->header.cmd_status = MFI_STAT_SCSI_IO_FAILED;
-- 
2.29.2


