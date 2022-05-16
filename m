Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F990528291
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:50:21 +0200 (CEST)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYIu-0002rN-4x
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5k-0006PN-ID
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5i-0005J2-3e
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4jjNpge5tna/oASVM3YwL7Uz2omLxWJm5YyzVq4gOE=;
 b=Z7DY/J/nBfaELAu3dS2ntGeyOXHzfsK+gM0moEuq+dGr4TsoxVjfEH8pEEHRivNJ3dwOTV
 OjdnI5QtZmp2pGAoJ2cg9eB7PvP0yj+YT8zGsMHZfhCnPU1Ix1YsiW38r81b4Bt7oTASSm
 QdyLkagjYFuRip/O0G6cNFJOwDz0QI0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-cv3eUy9_OjK_CqZBmeE0yw-1; Mon, 16 May 2022 06:36:38 -0400
X-MC-Unique: cv3eUy9_OjK_CqZBmeE0yw-1
Received: by mail-wr1-f70.google.com with SMTP id
 bs25-20020a056000071900b0020d03bbc3bbso449738wrb.19
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f4jjNpge5tna/oASVM3YwL7Uz2omLxWJm5YyzVq4gOE=;
 b=eKL9ewbia0aODpfIqyCJxEWBgtbMyV0EN9BSiGK5gSRBTSag74Vf5SykoYFJNFDsIv
 GN2Whx8cK8S6Jx9HlmAl4eAJp7a55lu/Wp/7zXyW9AhpBiI+hnlvmIKK8//Nfvitz8Tv
 joZsdMAVN8J+9d3t1P33ldsFc272cl1phcpUzikr3fT6x+vK0+ZV9FnPszbC93eQlRN5
 kr23GOSOf7qAUULNY904gjkP3d55lUryaFmrDaMWRbaYrM8VHSOPa91vdi35DgFwOrEl
 O+ZbRtBHGV+IjzCINFvBKI78DsRj9AREyDsUOWbXXBlQKwnd/1N3RwqjcD8N3bankE6P
 3hcw==
X-Gm-Message-State: AOAM532eF09DrohgsV2hXc3b0j28ai9HuWnT2gbs1atlimnsnkI/YP73
 tFOXhJDHzLL6O+hx2THWIDnA/rQNLBGUp6fNuZTWCQvkvElvpo5KKAIstTR0QGwRYatppcUMHN6
 40ILFdmIjLGsrKOIDuCe9cFW/BzgTU4tSZQbaxxaxkCnSt7ow77Az4WR28zJe
X-Received: by 2002:a5d:4561:0:b0:20d:3a3:c111 with SMTP id
 a1-20020a5d4561000000b0020d03a3c111mr6296335wrc.609.1652697397417; 
 Mon, 16 May 2022 03:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcn54/ulX7sxkQ07b1HV0v0K6GIZLgDiEQNW1CnqZLE7bEyiqBdtH9uJDU85YVhrB7FB8Cbw==
X-Received: by 2002:a5d:4561:0:b0:20d:3a3:c111 with SMTP id
 a1-20020a5d4561000000b0020d03a3c111mr6296309wrc.609.1652697397127; 
 Mon, 16 May 2022 03:36:37 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfae09000000b0020c5253d8edsm9246275wrc.57.2022.05.16.03.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:36 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 17/91] qtest/cxl: Introduce initial test for pxb-cxl only.
Message-ID: <20220516095448.507876-18-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Initial test with just pxb-cxl.  Other tests will be added
alongside functionality.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-16-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/cxl-test.c  | 22 ++++++++++++++++++++++
 tests/qtest/meson.build |  4 ++++
 2 files changed, 26 insertions(+)
 create mode 100644 tests/qtest/cxl-test.c

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
new file mode 100644
index 0000000000..c031049930
--- /dev/null
+++ b/tests/qtest/cxl-test.c
@@ -0,0 +1,22 @@
+/*
+ * QTest testcase for CXL
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+static void cxl_basic_pxb(void)
+{
+    qtest_start("-machine q35,cxl=on -device pxb-cxl,bus=pcie.0");
+    qtest_end();
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 3551b9c946..71e86bc2a3 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -35,6 +35,9 @@ qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
 
+qtests_cxl = \
+  (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
+
 qtests_i386 = \
   (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                     \
@@ -74,6 +77,7 @@ qtests_i386 = \
    slirp.found() ? ['virtio-net-failover'] : []) +                                          \
   (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
   qtests_pci +                                                                              \
+  qtests_cxl +                                                                              \
   ['fdc-test',
    'ide-test',
    'hd-geo-test',
-- 
MST


