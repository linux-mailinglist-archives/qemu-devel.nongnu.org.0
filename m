Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE12F9FF0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:37:52 +0100 (CET)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tn5-0004Bf-B9
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1Tka-0002Nm-S9
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1TkM-0003hL-Lq
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610973299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/97PmEfPWw7p0FoZql1yaBLEJwVZY0EPwJzxKt+Q+KU=;
 b=hUvi/S8jdJVUn12EWBMX4swEhWG1RQrHxgboIQCjc5lBDxXua+Aj+NHTNYpZfXcck1j4Za
 OV9GpSoNHmV/RyWY27d6Kew132FNoBVzhu4U/ijABhLO6staLcLmY7d9/NLZYCfloZ5LsX
 HJwz+Mbnwh3QHwGcJzC6reajgutAYw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-pIVN0KWcPV-kM7adS9Gp9A-1; Mon, 18 Jan 2021 07:34:56 -0500
X-MC-Unique: pIVN0KWcPV-kM7adS9Gp9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F01E7800D53;
 Mon, 18 Jan 2021 12:34:54 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D164F9CA0;
 Mon, 18 Jan 2021 12:34:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] virtio-scsi-test: Test writing to scsi-cd device
Date: Mon, 18 Jan 2021 13:34:48 +0100
Message-Id: <20210118123448.307825-3-kwolf@redhat.com>
In-Reply-To: <20210118123448.307825-1-kwolf@redhat.com>
References: <20210118123448.307825-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, alxndr@bu.edu, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tests that trying to write to a (read-only) scsi-cd device backed
by a read-write image file doesn't crash and results in the correct
error.

This is a regression test for https://bugs.launchpad.net/bugs/1906693.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/virtio-scsi-test.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
index 0415e75876..1b7ecc1c8f 100644
--- a/tests/qtest/virtio-scsi-test.c
+++ b/tests/qtest/virtio-scsi-test.c
@@ -200,6 +200,32 @@ static void test_unaligned_write_same(void *obj, void *data,
     qvirtio_scsi_pci_free(vs);
 }
 
+static void test_write_to_cdrom(void *obj, void *data,
+                                QGuestAllocator *t_alloc)
+{
+    QVirtioSCSI *scsi = obj;
+    QVirtioSCSIQueues *vs;
+    uint8_t buf[2048] = { 0 };
+    const uint8_t write_cdb[VIRTIO_SCSI_CDB_SIZE] = {
+        /* WRITE(10) to LBA 0, transfer length 1 */
+        0x2a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
+    };
+    struct virtio_scsi_cmd_resp resp;
+
+    alloc = t_alloc;
+    vs = qvirtio_scsi_init(scsi->vdev);
+
+    virtio_scsi_do_command(vs, write_cdb, NULL, 0, buf, 2048, &resp);
+    g_assert_cmphex(resp.response, ==, 0);
+    g_assert_cmphex(resp.status, ==, CHECK_CONDITION);
+    g_assert_cmphex(resp.sense[0], ==, 0x70);
+    g_assert_cmphex(resp.sense[2], ==, DATA_PROTECT);
+    g_assert_cmphex(resp.sense[12], ==, 0x27); /* WRITE PROTECTED */
+    g_assert_cmphex(resp.sense[13], ==, 0x00); /* WRITE PROTECTED */
+
+    qvirtio_scsi_pci_free(vs);
+}
+
 static void test_iothread_attach_node(void *obj, void *data,
                                       QGuestAllocator *t_alloc)
 {
@@ -267,6 +293,16 @@ static void *virtio_scsi_setup(GString *cmd_line, void *arg)
     return arg;
 }
 
+static void *virtio_scsi_setup_cd(GString *cmd_line, void *arg)
+{
+    g_string_append(cmd_line,
+                    " -drive file=null-co://,"
+                    "file.read-zeroes=on,"
+                    "if=none,id=dr1,format=raw "
+                    "-device scsi-cd,drive=dr1,lun=0,scsi-id=1");
+    return arg;
+}
+
 static void *virtio_scsi_setup_iothread(GString *cmd_line, void *arg)
 {
     g_string_append(cmd_line,
@@ -287,6 +323,9 @@ static void register_virtio_scsi_test(void)
     qos_add_test("unaligned-write-same", "virtio-scsi",
                  test_unaligned_write_same, &opts);
 
+    opts.before = virtio_scsi_setup_cd;
+    qos_add_test("write-to-cdrom", "virtio-scsi", test_write_to_cdrom, &opts);
+
     opts.before = virtio_scsi_setup_iothread;
     opts.edge = (QOSGraphEdgeOptions) {
         .extra_device_opts = "iothread=thread0",
-- 
2.29.2


