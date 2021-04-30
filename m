Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A675036FF2E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:08:17 +0200 (CEST)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWci-00057B-NC
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lcW6l-0002K0-FT; Fri, 30 Apr 2021 12:35:15 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:15922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lcW6e-0007FU-85; Fri, 30 Apr 2021 12:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1619800508;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nuzFdV0QUWkg3W9rmcl5jJaiMd5QRUHMmTZ+jdAfApE=;
 b=ISFBOjBF4vXMMNCUvBsTaaGsuNJiT9Oq67OZxf8VyjUqDAGF/SOdnIEs
 Lwk7QcrZJva/Hcm2Oh72yz/rU1tgcRL9JcdUUO4xx9XQ6GhNdBI0dhqID
 s/ihHwk98SDBzxTEVbxYtE+EpCjTWGO+EnE0v4UQP5TcyJSkU1kFnhGJ4 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: igWuJsrqlCI9Of4M0spP8n5YBZ9E8QnoSwW2sgtj2zvUMrgmiA91yOwVrZ/ocIB4lULTxBkzOM
 0rhlKQ/InPzoIOMh8LPld722hKkPOa3kiONqAqoI7IyAb/Gbed2+2IrNINtnXNtZ8woTYad27G
 bIg7uvtl/UggzugCH3G8pGOT63sLSUYvOeb0swKcNkEJU5OyuOrEv4Pf4hQn/gaDDW1Aqzj0hD
 ghO1vPTkGn8lT+LoefDQ5PtNLJ0vWG+xVzSrUB10GxYBdsEfixVe1Rbhbz1ubrcLJSytiWjXag
 tlA=
X-SBRS: 5.1
X-MesageID: 44335315
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EsZLaq+pZ1uLW4KgT/9uk+A8I+orLtY04lQ7vn1ZYzY9SKKlvu
 qpm+kW0gKxtS0YX2sulcvFFK6LR37d8pAd2/h0AZ6JWg76tGy0aLxz9IeK+UyHJwTS/vNQvJ
 0BT4FQE9v1ZGIXse/fwC2VV+kt28OG9qfAv5a6815IQRtxY69tqydVYzzrcXFefwVNCZonGJ
 f03KMuzFDMRV0tYtmmHX5AZuDfprTw5fXbSCQbDB0q4hTmt1KVwYP9eiL24j4uFxdGwbIv6g
 H+4m7E2pk=
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; d="scan'208";a="44335315"
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 <xen-devel@lists.xenproject.org>, <qemu-block@nongnu.org>
Subject: [PATCH] xen-block: Use specific blockdev driver
Date: Fri, 30 Apr 2021 17:34:32 +0100
Message-ID: <20210430163432.468894-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=anthony.perard@citrix.com; helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

From: Anthony PERARD <anthony.perard@citrix.com>

... when a xen-block backend instance is created via xenstore.

Following 8d17adf34f50 ("block: remove support for using "file" driver
with block/char devices"), using the "file" blockdev driver for
everything doesn't work anymore, we need to use the "host_device"
driver when the disk image is a block device and "file" driver when it
is a regular file.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/block/xen-block.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 83754a434481..674953f1adee 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -728,6 +728,8 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     XenBlockDrive *drive = NULL;
     QDict *file_layer;
     QDict *driver_layer;
+    struct stat st;
+    int rc;
 
     if (params) {
         char **v = g_strsplit(params, ":", 2);
@@ -761,7 +763,17 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     file_layer = qdict_new();
     driver_layer = qdict_new();
 
-    qdict_put_str(file_layer, "driver", "file");
+    rc = stat(filename, &st);
+    if (rc) {
+        error_setg_errno(errp, errno, "Could not stat file '%s'", filename);
+        goto done;
+    }
+    if (S_ISBLK(st.st_mode)) {
+        qdict_put_str(file_layer, "driver", "host_device");
+    } else {
+        qdict_put_str(file_layer, "driver", "file");
+    }
+
     qdict_put_str(file_layer, "filename", filename);
     g_free(filename);
 
-- 
Anthony PERARD


