Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4557024A3C7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 18:09:55 +0200 (CEST)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Qew-0001J2-6T
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 12:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8QYx-0003XB-BS
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 12:03:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52334
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8QYv-0005ru-BX
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 12:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597853020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRQ9mJzxFFnnzbD5pf4D2DkfPqunxufmo1dZugmab6A=;
 b=fCsTWS/mMipNLtZyr0mBNDXWBYvcMxgxaxjRzD68PUFV0HhB/NEeZQPIdXQS/9sXCbog6o
 bvM9v0fPV6ly6ZECsPdZlaN8+q5Ktx7FJ5D1XGTsq2eL/ccaOfhNqcTNF+4Inkk3Oby2Rz
 4zi1gNzwdyzrq9c8XyLJmv0Avdp9W6Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-vjFQymdINMmAbevngV-aLQ-1; Wed, 19 Aug 2020 12:03:38 -0400
X-MC-Unique: vjFQymdINMmAbevngV-aLQ-1
Received: by mail-wm1-f69.google.com with SMTP id c186so1185552wmd.9
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 09:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRQ9mJzxFFnnzbD5pf4D2DkfPqunxufmo1dZugmab6A=;
 b=Yfy3titUhvC6Cswodnfvj8GL/zdhtMciYYpoQzPRJ0ATpx6PnhWVx9N2Ey4Rr3d39/
 uvuIUYqM1dSe7xgsgrgogJvm8+EeGmAEkxhC14RGb6korBNNXUajFhGY4jNn/Nchbr9l
 dhaptNWLZb4FQnBNcoUgBbCfG9UGIGBoDPaURliBpyB/dw3tBhEqHSFyP3x4g+tOhGve
 +Wi6BDPyCSlflERXjui43do2kNBNzC8dI9tc0/mIU6/Vt874ElpX0JIFJoFiJrtuFnSW
 JaK/F17VknBcg/T1oyd2VlfRPU2QmOMmf6vx0J1S1YDrdM5Z6fh6Puvhxndf5EH+2UKz
 xDZw==
X-Gm-Message-State: AOAM5334FL0NfF80c15Z+qU6u3eJwP/m1rU5dWvwVkm8BtZlfAoqF8YM
 sGljpjWFEoSmYYVrEhFZN136EMg39BQMShbxDPXu5OR6Z7kHk68B2zLo7ejwmq35+c2U1XRcRPn
 8ezn5JM1xfkc5oyA=
X-Received: by 2002:a1c:6289:: with SMTP id w131mr5792689wmb.41.1597853016819; 
 Wed, 19 Aug 2020 09:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoRrvzyCvbz3ztv5TNpPvcFk98hJtWjid85QONpc+Fpw8/fxtWP9u3Pb3+v0FCcPYjUg39Pw==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr5792667wmb.41.1597853016650; 
 Wed, 19 Aug 2020 09:03:36 -0700 (PDT)
Received: from x1w.redhat.com (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id p15sm40334929wrj.61.2020.08.19.09.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 09:03:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 3/5] util/vfio-helpers: Report error when IOMMU page
 size is not supported
Date: Wed, 19 Aug 2020 18:03:16 +0200
Message-Id: <20200819160318.835292-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819160318.835292-1-philmd@redhat.com>
References: <20200819160318.835292-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This driver uses the host page size to align its memory regions,
but this size is not always compatible with the IOMMU. Add a
check if the size matches, and bails out with listing the sizes
the IOMMU supports.

Example on Aarch64:

 $ qemu-system-aarch64 -M virt -drive if=none,id=nvme0,file=nvme://0006:90:00.0/1,format=raw
 qemu-system-aarch64: -drive if=none,id=nvme0,file=nvme://0006:90:00.0/1,format=raw: Unsupported IOMMU page size: 4 KiB
 Available page size:
  64 KiB
  512 MiB

Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 9a83e6084e5..8f4a3d452ed 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include <sys/ioctl.h>
 #include <linux/vfio.h>
 #include "qapi/error.h"
@@ -316,6 +317,25 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
         ret = -errno;
         goto fail;
     }
+    if (!(iommu_info.flags & VFIO_IOMMU_INFO_PGSIZES)) {
+        error_setg(errp, "Failed to get IOMMU page size info");
+        ret = -errno;
+        goto fail;
+    }
+    if (!extract64(iommu_info.iova_pgsizes,
+                   ctz64(qemu_real_host_page_size), 1)) {
+        g_autofree char *host_page_size = size_to_str(qemu_real_host_page_size);
+        error_setg(errp, "Unsupported IOMMU page size: %s", host_page_size);
+        error_append_hint(errp, "Available page size:\n");
+        for (int i = 0; i < 64; i++) {
+            if (extract64(iommu_info.iova_pgsizes, i, 1)) {
+                g_autofree char *iova_pgsizes = size_to_str(1UL << i);
+                error_append_hint(errp, " %s\n", iova_pgsizes);
+            }
+        }
+        ret = -EINVAL;
+        goto fail;
+    }
 
     s->device = ioctl(s->group, VFIO_GROUP_GET_DEVICE_FD, device);
 
-- 
2.26.2


