Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A852446D2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 11:15:28 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6Vo6-00071X-ST
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 05:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VmV-0004xt-Ks
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VmM-0002oA-As
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCwinYbY8KogL6MVGmLHlxl2ZdviDPrAvyQ0cEAXXVE=;
 b=IsiWYzVaoIdJM+M810g/G5UcI3CuSU8kwOqDX+GyDEYoWL98V9G68mMvudvNXmB3JdYmfx
 AE4hj0cGfLnobqWZcW69PQFwuqjI9qr723sPi1ktJM5fNP5mQHAT86BaXiKBr7kJIyUtv3
 wVHebh1fW+fvZqxTKub+/3EdyofJfi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-XxPUrIuoO9Wm66c1Wm2FEQ-1; Fri, 14 Aug 2020 05:13:35 -0400
X-MC-Unique: XxPUrIuoO9Wm66c1Wm2FEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FB4E85B67B
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:13:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 342D3709D2
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:13:34 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 010/150] tests/docker: add test script for static linux-user
 builds
Date: Fri, 14 Aug 2020 05:11:06 -0400
Message-Id: <20200814091326.16173-11-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:13:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/test-static | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100755 tests/docker/test-static

diff --git a/tests/docker/test-static b/tests/docker/test-static
new file mode 100755
index 0000000000..372ef6fac7
--- /dev/null
+++ b/tests/docker/test-static
@@ -0,0 +1,24 @@
+#!/bin/bash -e
+#
+# Compile QEMU user mode emulators as static binaries on Linux.
+#
+# Copyright (c) 2020 Red Hat Inc.
+#
+# Authors:
+#  Paolo Bonzini <pbonzini@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+. common.rc
+
+cd "$BUILD_DIR"
+
+build_qemu \
+    --disable-system \
+    --disable-tools \
+    --disable-guest-agent \
+    --disable-docs \
+    --static
+install_qemu
-- 
2.26.2



