Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE264AEF43
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:26:35 +0100 (CET)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHkBG-0002w5-59
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:26:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk19-0003Ca-Oj
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk17-0004uj-IB
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644401764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8UBRIll1U3psQ9bfFWE/nQlRFPJJWz1cQhvfNkn/qg=;
 b=aE82MOkOU7c9qKf4obv9YTHWOwiaj8Im1q1+wQCmlw7bBv8i7lqhLWZqQgmuNBMCUZXEsm
 Y1Jorf/bbcCAFkIL3CYrMeh2ATtG+98wxiYm/0xX+oCs55drPiXVAR+hweURSBjFafq3jT
 Bz6L0LVPMiuujB349cT6mq6WSWrQmBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-BeRsYAzmPmyLNfTSvGMyvQ-1; Wed, 09 Feb 2022 05:16:03 -0500
X-MC-Unique: BeRsYAzmPmyLNfTSvGMyvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F4151091DA0;
 Wed,  9 Feb 2022 10:16:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3AE02AA92;
 Wed,  9 Feb 2022 10:15:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 4/8] tests/qemu-iotests: Allow to run "./check -n" from the
 source directory, too
Date: Wed,  9 Feb 2022 11:15:26 +0100
Message-Id: <20220209101530.3442837-5-thuth@redhat.com>
In-Reply-To: <20220209101530.3442837-1-thuth@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For better integration of the iotests into the meson build system, it
would be very helpful to get the list of the tests in the "auto" group
during the "configure" step already. However, "check -n -g auto"
currently only works if the binaries have already been built. To fix this,
skip the check for the binaries while setting up the TestEnv.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/check      | 2 +-
 tests/qemu-iotests/testenv.py | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 75de1b4691..a67b831534 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -124,7 +124,7 @@ if __name__ == '__main__':
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
-                  gdb=args.gdb, qprint=args.print)
+                  gdb=args.gdb, qprint=args.print, dry_run=args.dry_run)
 
     if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
         if not args.tests:
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 0f32897fe8..ec8c83ab07 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -180,7 +180,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  debug: bool = False,
                  valgrind: bool = False,
                  gdb: bool = False,
-                 qprint: bool = False) -> None:
+                 qprint: bool = False,
+                 dry_run: bool = False) -> None:
         self.imgfmt = imgfmt
         self.imgproto = imgproto
         self.aiomode = aiomode
@@ -226,6 +227,12 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
         self.init_directories()
+
+        # Don't try to look for binaries etc. in dry run mode, so that
+        # the dry run mode also works without building the binaries first
+        if dry_run:
+            return
+
         self.init_binaries()
 
         self.malloc_perturb_ = os.getenv('MALLOC_PERTURB_',
-- 
2.27.0


