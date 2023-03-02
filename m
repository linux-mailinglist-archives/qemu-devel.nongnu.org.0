Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85516A88B6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:47:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXnwc-0001PV-HZ; Thu, 02 Mar 2023 13:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnwZ-0001By-Sn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnwY-0005AV-Bm
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677782777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vm2qo2oFGbt/kSCsSBoZ+hFmn5nLvxm4q9lpIJk2PwE=;
 b=Oxi/MAzAhrihhQ55PeG6v3OlILEzHH3KFLzChVhr9Dja1rrUPtL/phEo/KcCvO9/qesO73
 uH4Fl9lrWdqi+N9hIq69H84AkLTJQmDja14WPCqth1QtvZhJDtSpiVp2K6nKrlw5OEdJk3
 5PxCNjTZFuu318CWbQA5keTSb2vOgRM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-q6IhYmwoN0ungU0xSvTLdg-1; Thu, 02 Mar 2023 13:46:14 -0500
X-MC-Unique: q6IhYmwoN0ungU0xSvTLdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 172173C14864;
 Thu,  2 Mar 2023 18:46:14 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78FEFC1602A;
 Thu,  2 Mar 2023 18:46:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/5] iotests: allow test discovery before building
Date: Thu,  2 Mar 2023 18:46:03 +0000
Message-Id: <20230302184606.418541-3-berrange@redhat.com>
In-Reply-To: <20230302184606.418541-1-berrange@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/check      | 1 +
 tests/qemu-iotests/testenv.py | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 806abc21d6..7e287a79a3 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -129,6 +129,7 @@ if __name__ == '__main__':
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
                   gdb=args.gdb, qprint=args.print,
+                  dry_run=args.dry_run,
                   source_dir=args.source_dir,
                   build_dir=args.build_dir)
 
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 9bf37cd381..952efa0e63 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -178,6 +178,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  valgrind: bool = False,
                  gdb: bool = False,
                  qprint: bool = False,
+                 dry_run: bool = False,
                  source_dir: Optional[str] = None,
                  build_dir: Optional[str] = None) -> None:
         self.imgfmt = imgfmt
@@ -232,6 +233,10 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
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


