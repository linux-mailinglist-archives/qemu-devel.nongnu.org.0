Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082E2225D0C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 13:04:22 +0200 (CEST)
Received: from localhost ([::1]:57756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxTan-0007kd-3e
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 07:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jxTYI-0004UX-EO
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 07:01:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50147
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jxTYG-0008Ok-M5
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 07:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595242903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=vlNfwCgWDMNagxJ/BA9y3/iXVjRBVtFuveun+05G65k=;
 b=jVFhUAHoR9KLqsCpbxMiJtH2WWvVqXljnHHkeKs9u2rhHivDkkyx5jAwLGQxPKLvZvBFGu
 7UPKur3CR2KnUXMf5LGxoyisZB8nUXaoGIhuGXdkfTWtzQ3yP65I0ReZc4tmAE0XpqVu33
 fsEWJXCISrZ4UNTwGCPu5WN787BJicg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-xjqAMlq3PeOqx5YMu3bOfw-1; Mon, 20 Jul 2020 07:01:40 -0400
X-MC-Unique: xjqAMlq3PeOqx5YMu3bOfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DB14108C;
 Mon, 20 Jul 2020 11:01:40 +0000 (UTC)
Received: from thuth.com (ovpn-112-34.ams2.redhat.com [10.36.112.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C705B5D9E4;
 Mon, 20 Jul 2020 11:01:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: [PATCH for-5.2 2/3] qga/commands-posix: Rework
 build_guest_fsinfo_for_real_device() function
Date: Mon, 20 Jul 2020 13:01:32 +0200
Message-Id: <20200720110133.4366-3-thuth@redhat.com>
In-Reply-To: <20200720110133.4366-1-thuth@redhat.com>
References: <20200720110133.4366-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:16:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to support non-PCI devices soon. For this we need to split
the generic GuestDiskAddress and GuestDiskAddressList memory allocation
and chaining into a separate function first.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qga/commands-posix.c | 65 ++++++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 1a62a3a70d..cddbaf5c69 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -861,28 +861,30 @@ static int build_hosts(char const *syspath, char const *host, bool ata,
     return i;
 }
 
-/* Store disk device info specified by @sysfs into @fs */
-static void build_guest_fsinfo_for_real_device(char const *syspath,
-                                               GuestFilesystemInfo *fs,
-                                               Error **errp)
+/*
+ * Store disk device info for devices on the PCI bus.
+ * Returns true if information has been stored, or false for failure.
+ */
+static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
+                                           GuestDiskAddress *disk,
+                                           GuestPCIAddress *pciaddr,
+                                           Error **errp)
 {
     unsigned int pci[4], host, hosts[8], tgt[3];
     int i, nhosts = 0, pcilen;
-    GuestDiskAddress *disk;
-    GuestPCIAddress *pciaddr;
-    GuestDiskAddressList *list = NULL;
     bool has_ata = false, has_host = false, has_tgt = false;
     char *p, *q, *driver = NULL;
 #ifdef CONFIG_LIBUDEV
     struct udev *udev = NULL;
     struct udev_device *udevice = NULL;
 #endif
+    bool ret = false;
 
     p = strstr(syspath, "/devices/pci");
     if (!p || sscanf(p + 12, "%*x:%*x/%x:%x:%x.%x%n",
                      pci, pci + 1, pci + 2, pci + 3, &pcilen) < 4) {
         g_debug("only pci device is supported: sysfs path '%s'", syspath);
-        return;
+        return false;
     }
 
     p += 12 + pcilen;
@@ -903,7 +905,7 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
         }
 
         g_debug("unsupported driver or sysfs path '%s'", syspath);
-        return;
+        return false;
     }
 
     p = strstr(syspath, "/target");
@@ -929,18 +931,11 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
         }
     }
 
-    pciaddr = g_malloc0(sizeof(*pciaddr));
     pciaddr->domain = pci[0];
     pciaddr->bus = pci[1];
     pciaddr->slot = pci[2];
     pciaddr->function = pci[3];
 
-    disk = g_malloc0(sizeof(*disk));
-    disk->pci_controller = pciaddr;
-
-    list = g_malloc0(sizeof(*list));
-    list->value = disk;
-
 #ifdef CONFIG_LIBUDEV
     udev = udev_new();
     udevice = udev_device_new_from_syspath(udev, syspath);
@@ -1018,21 +1013,43 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
         goto cleanup;
     }
 
-    list->next = fs->disk;
-    fs->disk = list;
-    goto out;
+    ret = true;
 
 cleanup:
-    if (list) {
-        qapi_free_GuestDiskAddressList(list);
-    }
-out:
     g_free(driver);
 #ifdef CONFIG_LIBUDEV
     udev_unref(udev);
     udev_device_unref(udevice);
 #endif
-    return;
+    return ret;
+}
+
+/* Store disk device info specified by @sysfs into @fs */
+static void build_guest_fsinfo_for_real_device(char const *syspath,
+                                               GuestFilesystemInfo *fs,
+                                               Error **errp)
+{
+    GuestDiskAddress *disk;
+    GuestPCIAddress *pciaddr;
+    GuestDiskAddressList *list = NULL;
+    bool has_pci;
+
+    pciaddr = g_malloc(sizeof(*pciaddr));
+    memset(pciaddr, -1, sizeof(*pciaddr));  /* -1 means field is invalid */
+
+    disk = g_malloc0(sizeof(*disk));
+    disk->pci_controller = pciaddr;
+
+    list = g_malloc0(sizeof(*list));
+    list->value = disk;
+
+    has_pci = build_guest_fsinfo_for_pci_dev(syspath, disk, pciaddr, errp);
+    if (has_pci) {
+        list->next = fs->disk;
+        fs->disk = list;
+    } else {
+        qapi_free_GuestDiskAddressList(list);
+    }
 }
 
 static void build_guest_fsinfo_for_device(char const *devpath,
-- 
2.18.1


