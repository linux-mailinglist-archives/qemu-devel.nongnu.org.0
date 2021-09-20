Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF5412787
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:53:57 +0200 (CEST)
Received: from localhost ([::1]:44886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQIW-0001jv-AD
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQEe-00046l-VA
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQEc-0008DA-Ao
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632170993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOIEpkGxbFu9mYJvkDgG47ylkHA4+6XMPlPdz10hhtg=;
 b=IbYHmRWtV2CIHZ0wlKAHiIT9BBP2+knQZCgU3lSZv4+GGffPtVhkQP9Vwcw/1Qrwnz6Mym
 oZMGSEG3v2WxClFA7RGOQDOce74XuHENmqCg1DuikTZnBkm9VFwKhkOL5zmp37yo4Cw6qr
 i8BQj/nlDzTs84mLAX7ac4nzpLkKw9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-u-Kx6ud2MSujVbo2aqQqUw-1; Mon, 20 Sep 2021 16:49:52 -0400
X-MC-Unique: u-Kx6ud2MSujVbo2aqQqUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF7C1800D41
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 20:49:51 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.16.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5509519D9D;
 Mon, 20 Sep 2021 20:49:45 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] avocado_qemu: fix import module based on isort
Date: Mon, 20 Sep 2021 17:49:29 -0300
Message-Id: <20210920204932.94132-4-willianr@redhat.com>
In-Reply-To: <20210920204932.94132-1-willianr@redhat.com>
References: <20210920204932.94132-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index d2077d63cd..edb9ed7485 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -12,19 +12,13 @@
 import os
 import shutil
 import sys
-import uuid
 import tempfile
+import uuid
 
 import avocado
-
-from avocado.utils import cloudinit
-from avocado.utils import datadrainer
-from avocado.utils import network
-from avocado.utils import ssh
-from avocado.utils import vmimage
+from avocado.utils import cloudinit, datadrainer, network, ssh, vmimage
 from avocado.utils.path import find_command
 
-
 #: The QEMU build root directory.  It may also be the source directory
 #: if building from the source dir, but it's safer to use BUILD_DIR for
 #: that purpose.  Be aware that if this code is moved outside of a source
@@ -42,11 +36,9 @@
 sys.path.append(os.path.join(SOURCE_DIR, 'python'))
 
 from qemu.machine import QEMUMachine
-from qemu.utils import (
-    get_info_usernet_hostfwd_port,
-    kvm_available,
-    tcg_available,
-)
+from qemu.utils import (get_info_usernet_hostfwd_port, kvm_available,
+                        tcg_available)
+
 
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
-- 
2.31.1


