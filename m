Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CB636CAF1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:13:27 +0200 (CEST)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbSD8-0004Cd-F5
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbSAH-0002xq-Rx
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbSAD-0006H7-35
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619547024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1KE7/QJmTSkIDuxL8n4+AKAZd5xcv00uFG60q2b5FwM=;
 b=T7Tak92RLemoP5rxEZGFkXulBTtRW407xBbdbR8E8/lq5WOsDuaOL3PP6w9FrxTUDV4+92
 sKq5ZhMUOp7rguiu6iitL0GP05dMyJfwUIlt5Dfj74eqgnlFucW3E0aC5CXnT+eWHupdQD
 m7DLOp2ETT/EXB8OjBSm4xUiHs5BqLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-xN3TxMDLPEqNMisQGSlCFw-1; Tue, 27 Apr 2021 14:10:13 -0400
X-MC-Unique: xN3TxMDLPEqNMisQGSlCFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6327F801F98;
 Tue, 27 Apr 2021 18:10:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B924F614FF;
 Tue, 27 Apr 2021 18:10:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] fdc: fix floppy boot for Red Hat Linux 5.2
Date: Tue, 27 Apr 2021 14:10:10 -0400
Message-Id: <20210427181010.1920534-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The image size indicates it's an 81 track floppy disk image, which we
don't have a listing for in the geometry table. When you force the drive
type to 1.44MB, it guesses the reasonably close 18/80. When the drive
type is allowed to auto-detect or set to 2.88, it guesses a very
incorrect geometry.

auto, 144 and 288 drive types get the right geometry with the new entry
in the table.

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>

---

V2: I didn't actually stage this, so this is just a re-send to get a
fresh Message-ID to reference in the PR. Added Thomas's R-B.

 hw/block/fdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index a825c2acbae..0f0c716d878 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -122,6 +122,7 @@ static const FDFormat fd_formats[] = {
     /* First entry is default format */
     /* 1.44 MB 3"1/2 floppy disks */
     { FLOPPY_DRIVE_TYPE_144, 18, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 2880 */
+    { FLOPPY_DRIVE_TYPE_144, 18, 81, 1, FDRIVE_RATE_500K, },
     { FLOPPY_DRIVE_TYPE_144, 20, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 3200 */
     { FLOPPY_DRIVE_TYPE_144, 21, 80, 1, FDRIVE_RATE_500K, },
     { FLOPPY_DRIVE_TYPE_144, 21, 82, 1, FDRIVE_RATE_500K, },
-- 
2.30.2


