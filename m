Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D7457027C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:36:42 +0200 (CEST)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAseX-0005Gp-JX
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oAsbW-0002FV-SM
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:33:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oAsbT-0008Iy-9B
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 08:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657542810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bFJ2IIkBCyxBG1qvoFS4GvNefMXeQktvcarxWRfXOVE=;
 b=Wq8oXh9xnAr13yMXhANgNQlxESLTfnVWEN2DetrhC9URrtPendcXK11NDT1k9rzRFad6T7
 fvvqZikHtm43y2Bcn8UUc1JUeTEi4/BJq/AeCx6NdhTgSAu6atVgifa7SPXmlg7X0M/mMl
 pKhO4Grgsn4iv5c2m9gtEYaoZxaj6Fo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-PftZKj6hMKSSxljTBoVwiA-1; Mon, 11 Jul 2022 08:33:29 -0400
X-MC-Unique: PftZKj6hMKSSxljTBoVwiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD1771044560;
 Mon, 11 Jul 2022 12:33:28 +0000 (UTC)
Received: from f35-work.redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0D5B2026D64;
 Mon, 11 Jul 2022 12:33:26 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mcascell@redhat.com, pbonzini@redhat.com, fam@euphon.net, thuth@redhat.com,
 alxndr@bu.edu
Subject: [PATCH v2] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
Date: Mon, 11 Jul 2022 14:33:16 +0200
Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
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

Set current_req to NULL to prevent reusing a free'd buffer in case of repeated
SCSI cancel requests. Thanks to Thomas Huth for suggesting the first version of
the patch and Alexander Bulekov for providing a reproducer.

Fixes: CVE-2022-0216
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
v2:
- handle CLEAR QUEUE and BUS DEVICE RESET messages
- new qtest: test_lsi_do_msgout_cancel_req

 hw/scsi/lsi53c895a.c               |  2 +
 tests/qtest/fuzz-lsi53c895a-test.c | 71 ++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index c8773f73f7..6934040c59 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1030,6 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
             trace_lsi_do_msgout_abort(current_tag);
             if (current_req) {
                 scsi_req_cancel(current_req->req);
+                current_req = NULL;
             }
             lsi_disconnect(s);
             break;
@@ -1055,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
             /* clear the current I/O process */
             if (s->current) {
                 scsi_req_cancel(s->current->req);
+                current_req = NULL;
             }
 
             /* As the current implemented devices scsi_disk and scsi_generic
diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index 2e8e67859e..6872c70d3a 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -8,6 +8,74 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
+/*
+ * This used to trigger a UAF in lsi_do_msgout()
+ * https://gitlab.com/qemu-project/qemu/-/issues/972
+ */
+static void test_lsi_do_msgout_cancel_req(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-M q35 -m 4G -display none -nodefaults "
+                   "-device lsi53c895a,id=scsi "
+                   "-device scsi-hd,drive=disk0 "
+                   "-drive file=null-co://,id=disk0,if=none,format=raw");
+
+    qtest_outl(s, 0xcf8, 0x80000810);
+    qtest_outl(s, 0xcf8, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80000810);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x80000810);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80000804);
+    qtest_outw(s, 0xcfc, 0x05);
+    qtest_writeb(s, 0x69736c10, 0x08);
+    qtest_writeb(s, 0x69736c13, 0x58);
+    qtest_writeb(s, 0x69736c1a, 0x01);
+    qtest_writeb(s, 0x69736c1b, 0x06);
+    qtest_writeb(s, 0x69736c22, 0x01);
+    qtest_writeb(s, 0x69736c23, 0x07);
+    qtest_writeb(s, 0x69736c2b, 0x02);
+    qtest_writeb(s, 0x69736c48, 0x08);
+    qtest_writeb(s, 0x69736c4b, 0x58);
+    qtest_writeb(s, 0x69736c52, 0x04);
+    qtest_writeb(s, 0x69736c53, 0x06);
+    qtest_writeb(s, 0x69736c5b, 0x02);
+    qtest_outl(s, 0xc02d, 0x697300);
+    qtest_writeb(s, 0x5a554662, 0x01);
+    qtest_writeb(s, 0x5a554663, 0x07);
+    qtest_writeb(s, 0x5a55466a, 0x10);
+    qtest_writeb(s, 0x5a55466b, 0x22);
+    qtest_writeb(s, 0x5a55466c, 0x5a);
+    qtest_writeb(s, 0x5a55466d, 0x5a);
+    qtest_writeb(s, 0x5a55466e, 0x34);
+    qtest_writeb(s, 0x5a55466f, 0x5a);
+    qtest_writeb(s, 0x5a345a5a, 0x77);
+    qtest_writeb(s, 0x5a345a5b, 0x55);
+    qtest_writeb(s, 0x5a345a5c, 0x51);
+    qtest_writeb(s, 0x5a345a5d, 0x27);
+    qtest_writeb(s, 0x27515577, 0x41);
+    qtest_outl(s, 0xc02d, 0x5a5500);
+    qtest_writeb(s, 0x364001d0, 0x08);
+    qtest_writeb(s, 0x364001d3, 0x58);
+    qtest_writeb(s, 0x364001da, 0x01);
+    qtest_writeb(s, 0x364001db, 0x26);
+    qtest_writeb(s, 0x364001dc, 0x0d);
+    qtest_writeb(s, 0x364001dd, 0xae);
+    qtest_writeb(s, 0x364001de, 0x41);
+    qtest_writeb(s, 0x364001df, 0x5a);
+    qtest_writeb(s, 0x5a41ae0d, 0xf8);
+    qtest_writeb(s, 0x5a41ae0e, 0x36);
+    qtest_writeb(s, 0x5a41ae0f, 0xd7);
+    qtest_writeb(s, 0x5a41ae10, 0x36);
+    qtest_writeb(s, 0x36d736f8, 0x0c);
+    qtest_writeb(s, 0x36d736f9, 0x80);
+    qtest_writeb(s, 0x36d736fa, 0x0d);
+    qtest_outl(s, 0xc02d, 0x364000);
+
+    qtest_quit(s);
+}
+
 /*
  * This used to trigger the assert in lsi_do_dma()
  * https://bugs.launchpad.net/qemu/+bug/697510
@@ -44,5 +112,8 @@ int main(int argc, char **argv)
     qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
                    test_lsi_do_dma_empty_queue);
 
+    qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
+                   test_lsi_do_msgout_cancel_req);
+
     return g_test_run();
 }
-- 
2.35.3


