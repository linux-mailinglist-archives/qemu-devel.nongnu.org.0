Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400763F0CB7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:27:02 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS9N-00045X-0q
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRTB-0002Lq-KH
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRTA-0007ar-3C
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629315803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjs/U9oiIIzIPYNfJJvQsKifLLyb4W5UUkK1KU3o24Q=;
 b=ZaNby2xzI7+wfbCQeGL5fG+1MVY24I7uFwKOU2b4/gcGBSvNpIMrSX00rFv1WAAX5PgxRu
 /84ijcSBiUArC35xTfKGQT+P92huZZquZaiTd/8MdEvWy+p18ok/GoN+rFN2NfiIQDLL+q
 oPHUvVRQlIG4ucsZMzlKiv4cQ6M5mNQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-GLiHe7eIPUG9RvEHm_MmGw-1; Wed, 18 Aug 2021 15:43:22 -0400
X-MC-Unique: GLiHe7eIPUG9RvEHm_MmGw-1
Received: by mail-qv1-f70.google.com with SMTP id
 u6-20020ad448660000b02903500bf28866so2885386qvy.23
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vjs/U9oiIIzIPYNfJJvQsKifLLyb4W5UUkK1KU3o24Q=;
 b=m7bJgoDH98Nx+dpiN1P6IXs9O24pv0eFzXb1TZu4NeZiRrEAptjrSPhu/eFf13/yxI
 /PSzX/iSuivb7oQYU1lc9vbK22nKrHq0+2ViwmossFGG9D9v0eV9OEvMbPak+6AAg1nh
 XPr5p3aeZgotseeUIpaCpvztlZWWbxAj59GpGdKpsjfhvvdYD3WiwkiKPOqtA2aEf7m0
 V++PCvytqYu1COxmYD3dxmKArUT698+pMQW9m5zldrAGtcEwFoqAV1MrqYMbMVmExFSk
 W5IAoMb6siN0sxReRaJobn8xH4cKglUyMRBTaEh0oDxbLsnw1+ukPNKO0qP9EKZM94um
 npPg==
X-Gm-Message-State: AOAM531QET+FWo5tNlJ+pu7NI95aE4f4YTKJ+vuWM5MW1gzxrKjyvVW2
 JeofauZafCoOntSzFqA2K+CpLQxKtq4EJOoEl0pRsazAGuRNF4iDVwyUNDQJ/tCQY73j69bJyBT
 Tgqp6VIlyoeRlewgHvyaVnmrquz4RKygl/vev5VgPcKpJXaiA1Fx3W6mbYhBZmoqC
X-Received: by 2002:ac8:7c52:: with SMTP id o18mr9198345qtv.290.1629315801846; 
 Wed, 18 Aug 2021 12:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH0dtZoBvjDPrbC83cbmuOKtJ2uyV/+Su/eL/hIeEsTCS9Dc2+qpYsSCkpVEB+lCC0IpCp3Q==
X-Received: by 2002:ac8:7c52:: with SMTP id o18mr9198313qtv.290.1629315801535; 
 Wed, 18 Aug 2021 12:43:21 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id i16sm428063qtq.52.2021.08.18.12.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:43:21 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] vl: Prioritize realizations of devices
Date: Wed, 18 Aug 2021 15:43:18 -0400
Message-Id: <20210818194318.110993-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818194217.110451-1-peterx@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 peterx@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU creates -device objects in order as specified by the user's cmdline.
However that ordering may not be the ideal order.  For example, some platform
devices (vIOMMUs) may want to be created earlier than most of the rest
devices (e.g., vfio-pci, virtio).

This patch orders the QemuOptsList of '-device's so they'll be sorted first
before kicking off the device realizations.  This will allow the device
realization code to be able to use APIs like pci_device_iommu_address_space()
correctly, because those functions rely on the platfrom devices being realized.

Now we rely on vmsd->priority which is defined as MigrationPriority to provide
the ordering, as either VM init and migration completes will need such an
ordering.  In the future we can move that priority information out of vmsd.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/vl.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5ca11e7469..3a30dfe27d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -126,6 +126,7 @@
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
+#include "migration/vmstate.h"
 
 #include "config-host.h"
 
@@ -2627,6 +2628,35 @@ static void qemu_init_board(void)
     }
 }
 
+/* Return the priority of the device option; zero is the default priority */
+static int qemu_opts_device_priority(QemuOpts *opts)
+{
+    const char *driver;
+    DeviceClass *dc;
+
+    driver = qemu_opt_get(opts, "driver");
+    if (!driver) {
+        return 0;
+    }
+
+    dc = qdev_get_device_class(&driver, NULL);
+    if (!dc) {
+        return 0;
+    }
+
+    if (!dc->vmsd) {
+        return 0;
+    }
+
+    /*
+     * Currently we rely on vmsd priority because that's solving the same
+     * problem for device realization ordering but just for migration.  In the
+     * future, we can move it out of vmsd, but that's not urgently needed.
+     * Return the negative of it so it'll be sorted with descendant order.
+     */
+    return -dc->vmsd->priority;
+}
+
 static void qemu_create_cli_devices(void)
 {
     soundhw_init();
@@ -2642,6 +2672,11 @@ static void qemu_create_cli_devices(void)
 
     /* init generic devices */
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
+    /*
+     * Sort all the -device parameters; e.g., platform devices like vIOMMU
+     * should be initialized earlier.
+     */
+    qemu_sort_opts("device", qemu_opts_device_priority);
     qemu_opts_foreach(qemu_find_opts("device"),
                       device_init_func, NULL, &error_fatal);
     rom_reset_order_override();
-- 
2.31.1


