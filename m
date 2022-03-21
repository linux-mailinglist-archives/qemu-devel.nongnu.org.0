Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29154E2C6E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:37:35 +0100 (CET)
Received: from localhost ([::1]:39478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWK6A-0008JP-Jo
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:37:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzd-0005D8-JK
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:49 -0400
Received: from [2a00:1450:4864:20::633] (port=46939
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzX-0004pr-Mc
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:45 -0400
Received: by mail-ej1-x633.google.com with SMTP id qx21so30519994ejb.13
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KzFM1VC1qBaGEQEgt4KuUH64XXgDfuuoU/tIcKK95PA=;
 b=y7ah77aCdoCwhhQF3h84K+hYDsXYZpWiahs7t777135BUKrIrjPXGMwGHsnYMXvB6F
 liIMUY51aST51ETTjbBndNhx9a41JxD2z1pJKqaf+vsQ49L+9hnMaw9yAfH5ldM+CbrH
 njg/KYGMXKAcdc/rDpvaW5Ua6bCpasOS6i2I1DPgFJJVnUt9jwktTVQU6e6TpIbd68s5
 SxJXdrgrNfyIdPXKi+wqjUxsKcFrGaSP+SYbLawn0T8aSNsIk3xqiF8j45I4uCpNeoeC
 26CmzPxD2prm6Bd3SZTdT5K2HEfbU00Dl8qF1pb/exfZWSlf/go32FEfEZEy5R70nkHA
 1VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KzFM1VC1qBaGEQEgt4KuUH64XXgDfuuoU/tIcKK95PA=;
 b=j94Jya12jF0wtcvn4CjWi1Cpj0yTUHGCoOD5CRO0ehf27s0aXsVFGD0YlX64WlBQZa
 st43MMZTg/5YVsCTT6ZLFQmQ3jVpVJlbgrXcR20yMoAOLlK2nKntpV38HQ/0G6pWrpXf
 nbMLg8849FY5dM2bmF2d8eNWXFd0H/rmYNgh+lnPe/i1gRzVUxgA3vuTprN0HTGz6glX
 sEX2gA3xF2TBfPn0Cz7MvgXzO6kRqYpoScudgU8Ic079xedsq9DkDwqL69PFzMT9ty4a
 Eg3AOoOsOXDbCQVieLU0VLCz9p1Xwrt2sU3pvWwT8vEKpfU+AiesbWbJELs9E+z9UFI6
 ENqA==
X-Gm-Message-State: AOAM531Wg8+DT10alMMjIqlkXkyBbxSllVKRcHwrffq7lbzsRWdx78am
 vmBJjXXXWa3FN8kTmF3jj4pJfM46wlGRtA==
X-Google-Smtp-Source: ABdhPJzSnh7L8Cel9UFg5enXXq11AOCkPF4UCuDTvxT9BeFfcyeokeFbF8DvZZTRNkAtnXnRkfsRaA==
X-Received: by 2002:a17:907:3e03:b0:6da:8c5a:6d4a with SMTP id
 hp3-20020a1709073e0300b006da8c5a6d4amr21644957ejc.585.1647876641483; 
 Mon, 21 Mar 2022 08:30:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 qk32-20020a1709077fa000b006df6bb30b28sm7172374ejc.171.2022.03.21.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C559D1FFB8;
 Mon, 21 Mar 2022 15:30:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/13] hw/virtio: move virtio-pci.h into shared include
 space
Date: Mon, 21 Mar 2022 15:30:25 +0000
Message-Id: <20220321153037.3622127-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "open list:virtiofs" <virtio-fs@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, stefanha@redhat.com,
 marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows other device classes that will be exposed via PCI to be
able to do so in the appropriate hw/ directory. I resisted the
temptation to re-order headers to be more aesthetically pleasing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200925125147.26943-4-alex.bennee@linaro.org>

---
v2
  - add i2c/rng device to changes
---
 {hw => include/hw}/virtio/virtio-pci.h | 0
 hw/virtio/vhost-scsi-pci.c             | 2 +-
 hw/virtio/vhost-user-blk-pci.c         | 2 +-
 hw/virtio/vhost-user-fs-pci.c          | 2 +-
 hw/virtio/vhost-user-i2c-pci.c         | 2 +-
 hw/virtio/vhost-user-input-pci.c       | 2 +-
 hw/virtio/vhost-user-rng-pci.c         | 2 +-
 hw/virtio/vhost-user-scsi-pci.c        | 2 +-
 hw/virtio/vhost-user-vsock-pci.c       | 2 +-
 hw/virtio/vhost-vsock-pci.c            | 2 +-
 hw/virtio/virtio-9p-pci.c              | 2 +-
 hw/virtio/virtio-balloon-pci.c         | 2 +-
 hw/virtio/virtio-blk-pci.c             | 2 +-
 hw/virtio/virtio-input-host-pci.c      | 2 +-
 hw/virtio/virtio-input-pci.c           | 2 +-
 hw/virtio/virtio-iommu-pci.c           | 2 +-
 hw/virtio/virtio-net-pci.c             | 2 +-
 hw/virtio/virtio-pci.c                 | 2 +-
 hw/virtio/virtio-rng-pci.c             | 2 +-
 hw/virtio/virtio-scsi-pci.c            | 2 +-
 hw/virtio/virtio-serial-pci.c          | 2 +-
 21 files changed, 20 insertions(+), 20 deletions(-)
 rename {hw => include/hw}/virtio/virtio-pci.h (100%)

diff --git a/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
similarity index 100%
rename from hw/virtio/virtio-pci.h
rename to include/hw/virtio/virtio-pci.h
diff --git a/hw/virtio/vhost-scsi-pci.c b/hw/virtio/vhost-scsi-pci.c
index cb71a294fa..08980bc23b 100644
--- a/hw/virtio/vhost-scsi-pci.c
+++ b/hw/virtio/vhost-scsi-pci.c
@@ -21,7 +21,7 @@
 #include "hw/virtio/vhost-scsi.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VHostSCSIPCI VHostSCSIPCI;
diff --git a/hw/virtio/vhost-user-blk-pci.c b/hw/virtio/vhost-user-blk-pci.c
index 33b404d8a2..eef8641a98 100644
--- a/hw/virtio/vhost-user-blk-pci.c
+++ b/hw/virtio/vhost-user-blk-pci.c
@@ -26,7 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VHostUserBlkPCI VHostUserBlkPCI;
diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
index 2ed8492b3f..6829b8b743 100644
--- a/hw/virtio/vhost-user-fs-pci.c
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -14,7 +14,7 @@
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-fs.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 struct VHostUserFSPCI {
diff --git a/hw/virtio/vhost-user-i2c-pci.c b/hw/virtio/vhost-user-i2c-pci.c
index 70b7b65fd9..00ac10941f 100644
--- a/hw/virtio/vhost-user-i2c-pci.c
+++ b/hw/virtio/vhost-user-i2c-pci.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-i2c.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 
 struct VHostUserI2CPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-user-input-pci.c b/hw/virtio/vhost-user-input-pci.c
index c9d3e9113a..b858898a36 100644
--- a/hw/virtio/vhost-user-input-pci.c
+++ b/hw/virtio/vhost-user-input-pci.c
@@ -9,7 +9,7 @@
 #include "hw/virtio/virtio-input.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VHostUserInputPCI VHostUserInputPCI;
diff --git a/hw/virtio/vhost-user-rng-pci.c b/hw/virtio/vhost-user-rng-pci.c
index c83dc86813..f64935453b 100644
--- a/hw/virtio/vhost-user-rng-pci.c
+++ b/hw/virtio/vhost-user-rng-pci.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-rng.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 
 struct VHostUserRNGPCI {
     VirtIOPCIProxy parent_obj;
diff --git a/hw/virtio/vhost-user-scsi-pci.c b/hw/virtio/vhost-user-scsi-pci.c
index d5343412a1..75882e3cf9 100644
--- a/hw/virtio/vhost-user-scsi-pci.c
+++ b/hw/virtio/vhost-user-scsi-pci.c
@@ -30,7 +30,7 @@
 #include "hw/pci/msix.h"
 #include "hw/loader.h"
 #include "sysemu/kvm.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VHostUserSCSIPCI VHostUserSCSIPCI;
diff --git a/hw/virtio/vhost-user-vsock-pci.c b/hw/virtio/vhost-user-vsock-pci.c
index 72a96199cd..e5a86e8013 100644
--- a/hw/virtio/vhost-user-vsock-pci.c
+++ b/hw/virtio/vhost-user-vsock-pci.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-user-vsock.h"
 #include "qom/object.h"
diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
index 205da8d1f5..9f34414d38 100644
--- a/hw/virtio/vhost-vsock-pci.c
+++ b/hw/virtio/vhost-vsock-pci.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "qemu/module.h"
diff --git a/hw/virtio/virtio-9p-pci.c b/hw/virtio/virtio-9p-pci.c
index e07adcd9ea..94c14f0b98 100644
--- a/hw/virtio/virtio-9p-pci.c
+++ b/hw/virtio/virtio-9p-pci.c
@@ -15,7 +15,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/9pfs/virtio-9p.h"
 #include "hw/qdev-properties.h"
 #include "qemu/module.h"
diff --git a/hw/virtio/virtio-balloon-pci.c b/hw/virtio/virtio-balloon-pci.c
index 79a3ba979a..ce2645ba71 100644
--- a/hw/virtio/virtio-balloon-pci.c
+++ b/hw/virtio/virtio-balloon-pci.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-balloon.h"
 #include "qapi/error.h"
diff --git a/hw/virtio/virtio-blk-pci.c b/hw/virtio/virtio-blk-pci.c
index 9d5795810c..9743bee965 100644
--- a/hw/virtio/virtio-blk-pci.c
+++ b/hw/virtio/virtio-blk-pci.c
@@ -19,7 +19,7 @@
 
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-blk.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qom/object.h"
diff --git a/hw/virtio/virtio-input-host-pci.c b/hw/virtio/virtio-input-host-pci.c
index 0ac360de4f..cf8a9cf9e8 100644
--- a/hw/virtio/virtio-input-host-pci.c
+++ b/hw/virtio/virtio-input-host-pci.c
@@ -8,7 +8,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-input.h"
 #include "qemu/module.h"
 #include "qom/object.h"
diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
index 48e9ff38e2..a9d0992389 100644
--- a/hw/virtio/virtio-input-pci.c
+++ b/hw/virtio/virtio-input-pci.c
@@ -8,7 +8,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
 #include "qemu/module.h"
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 6a1df7fe50..844d647704 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -11,7 +11,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
diff --git a/hw/virtio/virtio-net-pci.c b/hw/virtio/virtio-net-pci.c
index aa0b3caecb..e03543a70a 100644
--- a/hw/virtio/virtio-net-pci.c
+++ b/hw/virtio/virtio-net-pci.c
@@ -19,7 +19,7 @@
 
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-net.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qom/object.h"
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 7cf1231c1c..602be7f83d 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -33,7 +33,7 @@
 #include "hw/pci/msix.h"
 #include "hw/loader.h"
 #include "sysemu/kvm.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qemu/range.h"
 #include "hw/virtio/virtio-bus.h"
 #include "qapi/visitor.h"
diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
index c1f916268b..151ece6f94 100644
--- a/hw/virtio/virtio-rng-pci.c
+++ b/hw/virtio/virtio-rng-pci.c
@@ -11,7 +11,7 @@
 
 #include "qemu/osdep.h"
 
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-rng.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
diff --git a/hw/virtio/virtio-scsi-pci.c b/hw/virtio/virtio-scsi-pci.c
index 97fab74236..e8e3442f38 100644
--- a/hw/virtio/virtio-scsi-pci.c
+++ b/hw/virtio/virtio-scsi-pci.c
@@ -18,7 +18,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-scsi.h"
 #include "qemu/module.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VirtIOSCSIPCI VirtIOSCSIPCI;
diff --git a/hw/virtio/virtio-serial-pci.c b/hw/virtio/virtio-serial-pci.c
index 35bcd961c9..cea31adcc4 100644
--- a/hw/virtio/virtio-serial-pci.c
+++ b/hw/virtio/virtio-serial-pci.c
@@ -20,7 +20,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-serial.h"
 #include "qemu/module.h"
-#include "virtio-pci.h"
+#include "hw/virtio/virtio-pci.h"
 #include "qom/object.h"
 
 typedef struct VirtIOSerialPCI VirtIOSerialPCI;
-- 
2.30.2


