Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598786A9B62
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7wi-0007lw-Lt; Fri, 03 Mar 2023 11:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wZ-0007dL-GP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wY-0005jX-1Z
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677859657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdcDICZq/dCtnaFXWoLRhtoDbEWsAWhIpKZoGOSU984=;
 b=NUecyBu0Ozzizq5VazaNfFoafp4etYDD0m8nnVQoXo03fRwW2c8rmGO/UuAfKk/3NUlXWX
 YRiAWH1rpHF69nQaeE/bp2ldocprS9ElvntHtoNDqiraUqsCbacqzfwXxcEpBP/PLL7Nf+
 YLsuoz94mzLzeHe6GRMnAF1SEm/t8zs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-FUd80qgTMqy-07o2GIoHOQ-1; Fri, 03 Mar 2023 11:07:34 -0500
X-MC-Unique: FUd80qgTMqy-07o2GIoHOQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C876D380610B;
 Fri,  3 Mar 2023 16:07:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 456F6492C14;
 Fri,  3 Mar 2023 16:07:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/8] iotests: allow test discovery before building
Date: Fri,  3 Mar 2023 16:07:21 +0000
Message-Id: <20230303160727.3977246-3-berrange@redhat.com>
In-Reply-To: <20230303160727.3977246-1-berrange@redhat.com>
References: <20230303160727.3977246-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The 'check' script can be invoked in "dry run" mode, in which case it
merely does test discovery and prints out all their names. Despite only
doing test discovery it still validates that the various QEMU binaries
can be found. This makes it impossible todo test discovery prior to
building QEMU. This is a desirable feature to support, because it will
let meson discover tests.

Fortunately the code in the TestEnv constructor is ordered in a way
that makes this fairly trivial to achieve. We can just short circuit
the constructor after the basic directory paths have been set.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/check      | 3 ++-
 tests/qemu-iotests/testenv.py | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index da7e8a87fe..bb294ef556 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -145,7 +145,8 @@ if __name__ == '__main__':
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
-                  gdb=args.gdb, qprint=args.print)
+                  gdb=args.gdb, qprint=args.print,
+                  dry_run=args.dry_run)
 
     if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
         if not args.tests:
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index aa9d735414..9a37ad9152 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -178,7 +178,8 @@ def __init__(self, source_dir: str, build_dir: str,
                  debug: bool = False,
                  valgrind: bool = False,
                  gdb: bool = False,
-                 qprint: bool = False) -> None:
+                 qprint: bool = False,
+                 dry_run: bool = False) -> None:
         self.imgfmt = imgfmt
         self.imgproto = imgproto
         self.aiomode = aiomode
@@ -218,6 +219,10 @@ def __init__(self, source_dir: str, build_dir: str,
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
         self.init_directories()
+
+        if dry_run:
+            return
+
         self.init_binaries()
 
         self.malloc_perturb_ = os.getenv('MALLOC_PERTURB_',
-- 
2.39.2


