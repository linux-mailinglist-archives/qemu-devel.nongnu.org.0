Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4AA6F4628
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:38:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptr8i-0002R4-4j; Tue, 02 May 2023 10:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1ptr8c-0002Qs-9A
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:37:54 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1ptr8a-0007Yp-Je
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:37:53 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-5ed99ebe076so40637556d6.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683038269; x=1685630269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mvVfVNvdUQ+dsVuQLzLVZgrOBwJbAlAHyxtlDPxYDPI=;
 b=lMWbI9liklknEyp0AdJfA4fBntRe1FaP0pj28bEYVRNdksesc9BHCIRW52HokmkTNa
 207rKs0CEVeHnl/UoakvcCupxqMXBb1fboaptwS7g6SIB5qtTCM3As3PLwDbG2T8bPpx
 YAry278fCOasg5uNV66jrPXKjxqSFpVqzUdIUVL3N4uTkKyk7l/pQxYi8Y2ih4HBERpp
 5lj6j+LX4Ke4vyr1hfbGEuqdLVIvv30gHWy8DztM1aBIMy8zB8HT0quLvLxbyatd5nd9
 ZarV8fvQ5oyAIu97M2gY+ZZo7tZsUdL5BcuptsiHKrLZq5vCk7MowTw1mCYIvQxvGCjA
 dKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683038269; x=1685630269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mvVfVNvdUQ+dsVuQLzLVZgrOBwJbAlAHyxtlDPxYDPI=;
 b=SEx2Wn1MChkG/cMD6Zc3vt1OTE/0/qDYKavAN1ac53pOgTjENqXav11bXaN9IcYdTq
 glWiToxVKcQ9FW9OWGloXVHILEeFemkBZJ1o6sr3X+jfFhxZdFnIv5Ln6uJ0B6IgU9/x
 jNwku7CIZtKDSp1sG1JsDgBKy/Qbt7G9mJdfqyiPQpqaB26N1e3W5WeKVOSUj1ql7FJ8
 LdZcOuIcCtgJBcu+Bdj7w3SjpYL38aBYd0MaWuG8yqeGvArYaZNwtPNtsLiygyrA9ws+
 IXKCpFBCqg+6Ui0jhkhNmc75SQyKebDXRJRegi3UY/9iyA46Wm/zulfgOS/g5sgQzfWc
 9Ikg==
X-Gm-Message-State: AC+VfDyst7X+dAZE4542EQTKUoL9631OWKrfppX08X4CUZ/RMEaFWsvB
 keUICy+v+nZPsdPOzNH03Br59Ezny9Y=
X-Google-Smtp-Source: ACHHUZ7zYKwzvzyqRlxFZI4PuMYtfmBEJ9Pyx91MTJn4ENx0QM8Y5we0PQ1VIzxQMHmYfE+nlnND0Q==
X-Received: by 2002:a05:6214:1d23:b0:5f7:8b31:4548 with SMTP id
 f3-20020a0562141d2300b005f78b314548mr6214915qvd.4.1683038269491; 
 Tue, 02 May 2023 07:37:49 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l17-20020a0ce511000000b005dd8b9345dbsm2123688qvm.115.2023.05.02.07.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 07:37:48 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH] 9pfs/xen: Fix segfault on shutdown
Date: Tue,  2 May 2023 10:37:22 -0400
Message-Id: <20230502143722.15613-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=jandryuk@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

xen_9pfs_free can't use gnttabdev since it is already closed and NULL-ed
out when free is called.  Do the teardown in _disconnect().  This
matches the setup done in _connect().

trace-events are also added for the XenDevOps functions.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 hw/9pfs/trace-events     |  5 +++++
 hw/9pfs/xen-9p-backend.c | 36 +++++++++++++++++++++++-------------
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
index 6c77966c0b..7b5b0b5a48 100644
--- a/hw/9pfs/trace-events
+++ b/hw/9pfs/trace-events
@@ -48,3 +48,8 @@ v9fs_readlink(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
 v9fs_readlink_return(uint16_t tag, uint8_t id, char* target) "tag %d id %d name %s"
 v9fs_setattr(uint16_t tag, uint8_t id, int32_t fid, int32_t valid, int32_t mode, int32_t uid, int32_t gid, int64_t size, int64_t atime_sec, int64_t mtime_sec) "tag %u id %u fid %d iattr={valid %d mode %d uid %d gid %d size %"PRId64" atime=%"PRId64" mtime=%"PRId64" }"
 v9fs_setattr_return(uint16_t tag, uint8_t id) "tag %u id %u"
+
+xen_9pfs_alloc(char *name) "name %s"
+xen_9pfs_connect(char *name) "name %s"
+xen_9pfs_disconnect(char *name) "name %s"
+xen_9pfs_free(char *name) "name %s"
diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 0e266c552b..c646a0b3d1 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -25,6 +25,8 @@
 #include "qemu/iov.h"
 #include "fsdev/qemu-fsdev.h"
 
+#include "trace.h"
+
 #define VERSIONS "1"
 #define MAX_RINGS 8
 #define MAX_RING_ORDER 9
@@ -337,6 +339,8 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
     Xen9pfsDev *xen_9pdev = container_of(xendev, Xen9pfsDev, xendev);
     int i;
 
+    trace_xen_9pfs_disconnect(xendev->name);
+
     for (i = 0; i < xen_9pdev->num_rings; i++) {
         if (xen_9pdev->rings[i].evtchndev != NULL) {
             qemu_set_fd_handler(qemu_xen_evtchn_fd(xen_9pdev->rings[i].evtchndev),
@@ -345,40 +349,42 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
                                    xen_9pdev->rings[i].local_port);
             xen_9pdev->rings[i].evtchndev = NULL;
         }
-    }
-}
-
-static int xen_9pfs_free(struct XenLegacyDevice *xendev)
-{
-    Xen9pfsDev *xen_9pdev = container_of(xendev, Xen9pfsDev, xendev);
-    int i;
-
-    if (xen_9pdev->rings[0].evtchndev != NULL) {
-        xen_9pfs_disconnect(xendev);
-    }
-
-    for (i = 0; i < xen_9pdev->num_rings; i++) {
         if (xen_9pdev->rings[i].data != NULL) {
             xen_be_unmap_grant_refs(&xen_9pdev->xendev,
                                     xen_9pdev->rings[i].data,
                                     xen_9pdev->rings[i].intf->ref,
                                     (1 << xen_9pdev->rings[i].ring_order));
+            xen_9pdev->rings[i].data = NULL;
         }
         if (xen_9pdev->rings[i].intf != NULL) {
             xen_be_unmap_grant_ref(&xen_9pdev->xendev,
                                    xen_9pdev->rings[i].intf,
                                    xen_9pdev->rings[i].ref);
+            xen_9pdev->rings[i].intf = NULL;
         }
         if (xen_9pdev->rings[i].bh != NULL) {
             qemu_bh_delete(xen_9pdev->rings[i].bh);
+            xen_9pdev->rings[i].bh = NULL;
         }
     }
 
     g_free(xen_9pdev->id);
+    xen_9pdev->id = NULL;
     g_free(xen_9pdev->tag);
+    xen_9pdev->tag = NULL;
     g_free(xen_9pdev->path);
+    xen_9pdev->path = NULL;
     g_free(xen_9pdev->security_model);
+    xen_9pdev->security_model = NULL;
     g_free(xen_9pdev->rings);
+    xen_9pdev->rings = NULL;
+    return;
+}
+
+static int xen_9pfs_free(struct XenLegacyDevice *xendev)
+{
+    trace_xen_9pfs_free(xendev->name);
+
     return 0;
 }
 
@@ -390,6 +396,8 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
     V9fsState *s = &xen_9pdev->state;
     QemuOpts *fsdev;
 
+    trace_xen_9pfs_connect(xendev->name);
+
     if (xenstore_read_fe_int(&xen_9pdev->xendev, "num-rings",
                              &xen_9pdev->num_rings) == -1 ||
         xen_9pdev->num_rings > MAX_RINGS || xen_9pdev->num_rings < 1) {
@@ -499,6 +507,8 @@ out:
 
 static void xen_9pfs_alloc(struct XenLegacyDevice *xendev)
 {
+    trace_xen_9pfs_alloc(xendev->name);
+
     xenstore_write_be_str(xendev, "versions", VERSIONS);
     xenstore_write_be_int(xendev, "max-rings", MAX_RINGS);
     xenstore_write_be_int(xendev, "max-ring-page-order", MAX_RING_ORDER);
-- 
2.40.1


