Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E7D240BBE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:15:14 +0200 (CEST)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5BOD-0006Mi-MD
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIh-0005Th-Js
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39929
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIg-0002iD-0f
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=fmBNVvuZ6i8RWnrpkbk/zA4aYLSsrA5fNfjRgl12UO4=;
 b=OribmkD+07WY7FPG0LTLEZsLyGr2G+R8gzLu1azb22wUMI0a7jXfbFer2aDIuSRCQthmXB
 O13IpoQ5rAbyx+3dIFSMYzvBd0UkHuu3P0j+R6J8P/qaGKB/g5ccMW6ywAgneFOztUR57Z
 DUCpHeR6NabsGAMMxlBhUu0RX2s2r/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-Vm2D8iTGOFqJk2vt3p1-2w-1; Mon, 10 Aug 2020 13:09:27 -0400
X-MC-Unique: Vm2D8iTGOFqJk2vt3p1-2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D990119057A3
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:26 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B8FD5F1E9
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:25 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 009/147] tests/docker: add test script for static linux-user
 builds
Date: Mon, 10 Aug 2020 19:06:47 +0200
Message-Id: <1597079345-42801-10-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 11:00:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/test-static | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100755 tests/docker/test-static

diff --git a/tests/docker/test-static b/tests/docker/test-static
new file mode 100755
index 0000000..372ef6f
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
1.8.3.1



