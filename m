Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E72D4991
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:56:58 +0100 (CET)
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4e1-00048Y-Lu
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3ut-0004B2-Ds
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uq-0000CC-24
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSoNUC7DG0wIijNBJsdQD+7RaOmhy7cd4bQD51mQOZk=;
 b=OSkMzAzMSkm7f9LD8U6W+oLYM7xuLVn19K7XT6NS1zz/IIEKYFkZyP2tCcSM4somBdjZXu
 RIs57DvMfoO4dEjiom8qgoNposbqJXEsjVN+vWn8HQXT47c0jyx/DgU/IvOdssxVtjXRFL
 GUhq/8gEazjbZE1J/dDmRBUbTtke/P0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-qu5ZMKd_OAaJA5z7GVTJXg-1; Wed, 09 Dec 2020 13:10:12 -0500
X-MC-Unique: qu5ZMKd_OAaJA5z7GVTJXg-1
Received: by mail-wm1-f71.google.com with SMTP id b184so640347wmh.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bSoNUC7DG0wIijNBJsdQD+7RaOmhy7cd4bQD51mQOZk=;
 b=IppmYb7+0FieDlWQCbvGoSWsb3a6Iww8AW1lu2B9TCcEX7xbfnHxYmfSTsy26l0w+f
 IpXPt8+lZp7kTcDsl/a6DnPKVTo8PgO4SacNLw/hrFYdJrC/tbYwSzF4cLSVqabxAYXK
 dLvngcbOGyzpZ2Tr22rIx2bopnB/4g6IMA40LdSJH4SzMiYg0WqeQpFVRTflG/BoPIOh
 FB+LOmmUaSS1eGW89XehDitAY1LABCAQwWCY7XMNQv+NQtKi+XaS3L4q9hpTot689zFi
 9/zdhkIC43HZJOvPIAQub6RLiUQjKVnU8obXhsPlP4lRMgetDVbrhhWY5DKvbgZpuxi3
 3+Uw==
X-Gm-Message-State: AOAM530wc0FPidex4YmiIkyx0phDJAc26TeTzt2o+DqDdNbuOZXkp9jV
 2T0LvwdDeCqLwE2+HcdOh+HOACNwarecZ670OtZTBezzUE7DA8poOq5AArwH1yKNqxDMB6wVcC5
 GQgPSVzenQq+DHI+hEGaEEvWCdTVVM+EsNw/e6g1DkviUVsC1o5eJ/s8Za/6x
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr3279828wrv.132.1607537411147; 
 Wed, 09 Dec 2020 10:10:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiPjlDxvUjA9vB163d2Sr4ll07I4SNlAjuzO8RgJNctWEWAOJqi0gQJmBkg6f8I3SBdtcGyg==
X-Received: by 2002:a5d:54cc:: with SMTP id x12mr3279801wrv.132.1607537410956; 
 Wed, 09 Dec 2020 10:10:10 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id n14sm4902731wmi.1.2020.12.09.10.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:10 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 45/65] libvhost-user: replace qemu/memfd.h usage
Message-ID: <20201209180546.721296-46-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Undo the damage from commit 5f9ff1eff3 ("libvhost-user: Support tracking
inflight I/O in shared memory") which introduced glib dependency through
osdep.h inclusion.

libvhost-user.c tries to stay free from glib usage.

Use glibc memfd_create directly when available (assumed so when
MFD_ALLOW_SEALING is defined). A following commit will make the project
standalone and check for memfd API at configure time, instead of a
panic at runtime.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201125100640.366523-3-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 50 +++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 1c1cfbf1e7..54aabd1878 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -42,8 +42,6 @@
 #endif
 
 #include "qemu/atomic.h"
-#include "qemu/osdep.h"
-#include "qemu/memfd.h"
 
 #include "libvhost-user.h"
 
@@ -1615,11 +1613,45 @@ vu_inflight_queue_size(uint16_t queue_size)
            sizeof(uint16_t), INFLIGHT_ALIGNMENT);
 }
 
+#ifdef MFD_ALLOW_SEALING
+static void *
+memfd_alloc(const char *name, size_t size, unsigned int flags, int *fd)
+{
+    void *ptr;
+    int ret;
+
+    *fd = memfd_create(name, MFD_ALLOW_SEALING);
+    if (*fd < 0) {
+        return NULL;
+    }
+
+    ret = ftruncate(*fd, size);
+    if (ret < 0) {
+        close(*fd);
+        return NULL;
+    }
+
+    ret = fcntl(*fd, F_ADD_SEALS, flags);
+    if (ret < 0) {
+        close(*fd);
+        return NULL;
+    }
+
+    ptr = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, *fd, 0);
+    if (ptr == MAP_FAILED) {
+        close(*fd);
+        return NULL;
+    }
+
+    return ptr;
+}
+#endif
+
 static bool
 vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
 {
-    int fd;
-    void *addr;
+    int fd = -1;
+    void *addr = NULL;
     uint64_t mmap_size;
     uint16_t num_queues, queue_size;
 
@@ -1637,9 +1669,13 @@ vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
 
     mmap_size = vu_inflight_queue_size(queue_size) * num_queues;
 
-    addr = qemu_memfd_alloc("vhost-inflight", mmap_size,
-                            F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
-                            &fd, NULL);
+#ifdef MFD_ALLOW_SEALING
+    addr = memfd_alloc("vhost-inflight", mmap_size,
+                       F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
+                       &fd);
+#else
+    vu_panic(dev, "Not implemented: memfd support is missing");
+#endif
 
     if (!addr) {
         vu_panic(dev, "Failed to alloc vhost inflight area");
-- 
MST


