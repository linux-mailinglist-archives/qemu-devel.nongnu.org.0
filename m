Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7A523D9FB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 13:33:22 +0200 (CEST)
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3e9B-0005dK-M2
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 07:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3dXR-0004po-RR
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 06:54:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28551
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3dXQ-0000KM-8N
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 06:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596711259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=1IQowK9NNlqpIMC+bc7iQ/baFlNISGVkiJLNBwOKRU0=;
 b=PO4SlddcX8/IU9jsoY47XodbwamC7ZP8i4DFntODkbXqgOYQQn4PV57N/GdnNIsBvsLGIY
 OA0YDDKcVTj/+z8qa5hoBymoyxvCgk4yyqZEQ5r85t6EikHnXTsEBXhN+d1eJisrz2GuIM
 Dl8KynE0WNx5AvXso6dSA3vDTciRqow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-S5m69_wZNQKd3qfH5mpn8w-1; Thu, 06 Aug 2020 06:54:15 -0400
X-MC-Unique: S5m69_wZNQKd3qfH5mpn8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 808C3100AA21;
 Thu,  6 Aug 2020 10:54:14 +0000 (UTC)
Received: from thuth.com (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE4515F202;
 Thu,  6 Aug 2020 10:54:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.2 v2 4/9] pc-bios/s390-ccw: Move the inner logic of
 find_subch() to a separate function
Date: Thu,  6 Aug 2020 12:53:44 +0200
Message-Id: <20200806105349.632-5-thuth@redhat.com>
In-Reply-To: <20200806105349.632-1-thuth@redhat.com>
References: <20200806105349.632-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:24:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Collin Walling <walling@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the code to a separate function to be able to re-use it from a
different spot later.

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/main.c | 99 ++++++++++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 42 deletions(-)

diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
index 9b64eb0c24..0d2aabbc58 100644
--- a/pc-bios/s390-ccw/main.c
+++ b/pc-bios/s390-ccw/main.c
@@ -51,6 +51,60 @@ unsigned int get_loadparm_index(void)
     return atoui(loadparm_str);
 }
 
+static int is_dev_possibly_bootable(int dev_no, int sch_no)
+{
+    bool is_virtio;
+    Schib schib;
+    int r;
+
+    blk_schid.sch_no = sch_no;
+    r = stsch_err(blk_schid, &schib);
+    if (r == 3 || r == -EIO) {
+        return -ENODEV;
+    }
+    if (!schib.pmcw.dnv) {
+        return false;
+    }
+
+    enable_subchannel(blk_schid);
+    cutype = cu_type(blk_schid);
+
+    /*
+     * Note: we always have to run virtio_is_supported() here to make
+     * sure that the vdev.senseid data gets pre-initialized correctly
+     */
+    is_virtio = virtio_is_supported(blk_schid);
+
+    /* No specific devno given, just return whether the device is possibly bootable */
+    if (dev_no < 0) {
+        switch (cutype) {
+        case CU_TYPE_VIRTIO:
+            if (is_virtio) {
+                /*
+                 * Skip net devices since no IPLB is created and therefore
+                 * no network bootloader has been loaded
+                 */
+                if (virtio_get_device_type() != VIRTIO_ID_NET) {
+                    return true;
+                }
+            }
+            return false;
+        case CU_TYPE_DASD_3990:
+        case CU_TYPE_DASD_2107:
+            return true;
+        default:
+            return false;
+        }
+    }
+
+    /* Caller asked for a specific devno */
+    if (schib.pmcw.dev == dev_no) {
+        return true;
+    }
+
+    return false;
+}
+
 /*
  * Find the subchannel connected to the given device (dev_no) and fill in the
  * subchannel information block (schib) with the connected subchannel's info.
@@ -62,53 +116,14 @@ unsigned int get_loadparm_index(void)
  */
 static bool find_subch(int dev_no)
 {
-    Schib schib;
     int i, r;
-    bool is_virtio;
 
     for (i = 0; i < 0x10000; i++) {
-        blk_schid.sch_no = i;
-        r = stsch_err(blk_schid, &schib);
-        if ((r == 3) || (r == -EIO)) {
+        r = is_dev_possibly_bootable(dev_no, i);
+        if (r < 0) {
             break;
         }
-        if (!schib.pmcw.dnv) {
-            continue;
-        }
-
-        enable_subchannel(blk_schid);
-        cutype = cu_type(blk_schid);
-
-        /*
-         * Note: we always have to run virtio_is_supported() here to make
-         * sure that the vdev.senseid data gets pre-initialized correctly
-         */
-        is_virtio = virtio_is_supported(blk_schid);
-
-        /* No specific devno given, just return 1st possibly bootable device */
-        if (dev_no < 0) {
-            switch (cutype) {
-            case CU_TYPE_VIRTIO:
-                if (is_virtio) {
-                    /*
-                     * Skip net devices since no IPLB is created and therefore
-                     * no network bootloader has been loaded
-                     */
-                    if (virtio_get_device_type() != VIRTIO_ID_NET) {
-                        return true;
-                    }
-                }
-                continue;
-            case CU_TYPE_DASD_3990:
-            case CU_TYPE_DASD_2107:
-                return true;
-            default:
-                continue;
-            }
-        }
-
-        /* Caller asked for a specific devno */
-        if (schib.pmcw.dev == dev_no) {
+        if (r == true) {
             return true;
         }
     }
-- 
2.18.1


