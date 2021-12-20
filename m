Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A047B261
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:54:01 +0100 (CET)
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMrG-0003Bc-LM
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:53:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKhn-00032t-IQ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:36:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKhl-00067n-QG
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5ZmWBXVIa2SXtxr5syMSK7xNafuHPKY6DumgAl83Ic=;
 b=eWao+fKDH7w0dCsVmE2qg8CE3+xkg8q6XQ2qPQBLLqvrs2IiAvbNsJvAj7brTj5eAX50Wj
 LLnbXlrPFF+/cV1NWtPt29MbC6vFkJgjaxvx3ztnGbYm754lR1dLar3vVXRWjrelACZaZl
 Ls+3HGxw5DNe0EQKZpsF0FIEHmcK/Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-6QYxUhOHOMiIuiPeJ1TT4A-1; Mon, 20 Dec 2021 03:11:09 -0500
X-MC-Unique: 6QYxUhOHOMiIuiPeJ1TT4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 903F964093
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:11:08 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 771BA5BD0B;
 Mon, 20 Dec 2021 08:11:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 3/4] tests/qtest/cdrom-test: Check whether devices are
 available before using them
Date: Mon, 20 Dec 2021 09:10:53 +0100
Message-Id: <20211220081054.151515-4-thuth@redhat.com>
In-Reply-To: <20211220081054.151515-1-thuth@redhat.com>
References: <20211220081054.151515-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Downstream users might want to disable legacy devices in their binaries,
so we should not blindly assume that they are available. Add some proper
checks before using them.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/cdrom-test.c | 60 ++++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index c1fcac5c45..cfca24fa94 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -142,21 +142,36 @@ static void add_x86_tests(void)
         qtest_add_data_func("cdrom/boot/isapc", "-M isapc "
                             "-drive if=ide,media=cdrom,file=", test_cdboot);
     }
-    qtest_add_data_func("cdrom/boot/am53c974",
-                        "-device am53c974 -device scsi-cd,drive=cd1 "
-                        "-drive if=none,id=cd1,format=raw,file=", test_cdboot);
-    qtest_add_data_func("cdrom/boot/dc390",
-                        "-device dc390 -device scsi-cd,drive=cd1 "
-                        "-blockdev file,node-name=cd1,filename=", test_cdboot);
-    qtest_add_data_func("cdrom/boot/lsi53c895a",
-                        "-device lsi53c895a -device scsi-cd,drive=cd1 "
-                        "-blockdev file,node-name=cd1,filename=", test_cdboot);
-    qtest_add_data_func("cdrom/boot/megasas", "-M q35 "
-                        "-device megasas -device scsi-cd,drive=cd1 "
-                        "-blockdev file,node-name=cd1,filename=", test_cdboot);
-    qtest_add_data_func("cdrom/boot/megasas-gen2", "-M q35 "
-                        "-device megasas-gen2 -device scsi-cd,drive=cd1 "
-                        "-blockdev file,node-name=cd1,filename=", test_cdboot);
+    if (qtest_has_device("am53c974")) {
+        qtest_add_data_func("cdrom/boot/am53c974",
+                            "-device am53c974 -device scsi-cd,drive=cd1 "
+                            "-drive if=none,id=cd1,format=raw,file=",
+                            test_cdboot);
+    }
+    if (qtest_has_device("dc390")) {
+        qtest_add_data_func("cdrom/boot/dc390",
+                            "-device dc390 -device scsi-cd,drive=cd1 "
+                            "-blockdev file,node-name=cd1,filename=",
+                            test_cdboot);
+    }
+    if (qtest_has_device("lsi53c895a")) {
+        qtest_add_data_func("cdrom/boot/lsi53c895a",
+                            "-device lsi53c895a -device scsi-cd,drive=cd1 "
+                            "-blockdev file,node-name=cd1,filename=",
+                            test_cdboot);
+    }
+    if (qtest_has_device("megasas")) {
+        qtest_add_data_func("cdrom/boot/megasas", "-M q35 "
+                            "-device megasas -device scsi-cd,drive=cd1 "
+                            "-blockdev file,node-name=cd1,filename=",
+                            test_cdboot);
+    }
+    if (qtest_has_device("megasas-gen2")) {
+        qtest_add_data_func("cdrom/boot/megasas-gen2", "-M q35 "
+                            "-device megasas-gen2 -device scsi-cd,drive=cd1 "
+                            "-blockdev file,node-name=cd1,filename=",
+                            test_cdboot);
+    }
 }
 
 static void add_s390x_tests(void)
@@ -171,12 +186,15 @@ static void add_s390x_tests(void)
                         "-drive driver=null-co,read-zeroes=on,if=none,id=d1 "
                         "-device virtio-blk,drive=d2,bootindex=1 "
                         "-drive if=none,id=d2,media=cdrom,file=", test_cdboot);
-    qtest_add_data_func("cdrom/boot/without-bootindex",
-                        "-device virtio-scsi -device virtio-serial "
-                        "-device x-terminal3270 -device virtio-blk,drive=d1 "
-                        "-drive driver=null-co,read-zeroes=on,if=none,id=d1 "
-                        "-device virtio-blk,drive=d2 "
-                        "-drive if=none,id=d2,media=cdrom,file=", test_cdboot);
+    if (qtest_has_device("x-terminal3270")) {
+        qtest_add_data_func("cdrom/boot/without-bootindex",
+                            "-device virtio-scsi -device virtio-serial "
+                            "-device x-terminal3270 -device virtio-blk,drive=d1 "
+                            "-drive driver=null-co,read-zeroes=on,if=none,id=d1 "
+                            "-device virtio-blk,drive=d2 "
+                            "-drive if=none,id=d2,media=cdrom,file=",
+                            test_cdboot);
+    }
 }
 
 int main(int argc, char **argv)
-- 
2.27.0


