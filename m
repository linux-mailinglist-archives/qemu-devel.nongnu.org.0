Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D69F378C7D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:56:07 +0200 (CEST)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5SA-0007cj-5l
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lg5Q3-0005DG-Vi
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:53:56 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:9497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lg5Q2-0002OX-6Y
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1620651233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u4QGM8/JFq+CXqBDhAUitCiWNGljacYz2VCNiGxaiPY=;
 b=I5mUOPRpSOHnEMmAmbCIzzlFLUpMqHENaXtaDhpggJzKd2RGToQJZXKT
 NWjJATCpdIq6iWj93xU2UdWi5kSeOGgwSgErJE30vQE/i1KarPZsB5fSN
 8HzeK6HhlRGaibyFTyeWXDHdbOpUaejlr+FkCuOXCw0Xh+kp5OXxdx/zS k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7Z7gFGls+YTIeR9dHAOqE4/5OSsDGOG0IlwKFfX8QrI346t3wTpVuo0vXGmaWOIO8u0fDtaj6C
 yRk2urRe3DrKpumAyPYRMogiFUujHezMkQFD1hVpxFRl9KyqGl5IUnTacPZ7C2dqeJ1Z9S0Gxm
 D/7M6zlH5CpYW8xWExaRXKXgY6qRxN7/AMKQO9TrVbghfR+hrbw/RfYleW9jCvaWCFNKg0UOWR
 7XJS8QDlNeQsHgHYADlI2IsmYLMQxPy9x3jKRPFHIIqYm7LD+oV2/LnyHZ6TTVh5GYdt0EH+er
 MUQ=
X-SBRS: 5.1
X-MesageID: 43545480
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+cRTKK3RqBeITaDSvZmXgQqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.82,287,1613451600"; d="scan'208";a="43545480"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 3/3] xen-block: Use specific blockdev driver
Date: Mon, 10 May 2021 13:53:40 +0100
Message-ID: <20210510125340.903323-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510125340.903323-1-anthony.perard@citrix.com>
References: <20210510125340.903323-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=anthony.perard@citrix.com; helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

... when a xen-block backend instance is created via xenstore.

Following 8d17adf34f50 ("block: remove support for using "file" driver
with block/char devices"), using the "file" blockdev driver for
everything doesn't work anymore, we need to use the "host_device"
driver when the disk image is a block device and "file" driver when it
is a regular file.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Paul Durrant <paul@xen.org>
Message-Id: <20210430163432.468894-1-anthony.perard@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/block/xen-block.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 83754a4344..674953f1ad 100644
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


