Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A00298A49
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 11:22:00 +0100 (CET)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWzdX-0005It-FN
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 06:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kWzPG-0002l7-Ui
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kWzPA-0006hj-EL
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603706824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=WbjpSFd8Wy+vijEQr6h3rVLa4JiCyrzL8aZ0esPPjcU=;
 b=BAo0W96UtlHILF+SCJ6YTbXr2sTBtI///KvgNEjUDCr0C8tTppBLy4mcwnsAPdy0gINgFi
 RJzbsioRge0Rpg2o24Xy7eNR9wmunf6t8saFAvZTQEChNdeM/10jUeV0VYiG+FOctyWqvr
 NOlkdXpMf2bsb5mVjWtanvaBNDqrVcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-C3BiNeECMhKfY0O13VytPg-1; Mon, 26 Oct 2020 06:07:02 -0400
X-MC-Unique: C3BiNeECMhKfY0O13VytPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDE480B723;
 Mon, 26 Oct 2020 10:07:00 +0000 (UTC)
Received: from thuth.com (ovpn-112-104.ams2.redhat.com [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1EF18B842;
 Mon, 26 Oct 2020 10:06:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 16/31] fuzz: add a DISABLE_PCI op to generic-fuzzer
Date: Mon, 26 Oct 2020 11:06:17 +0100
Message-Id: <20201026100632.212530-17-thuth@redhat.com>
In-Reply-To: <20201026100632.212530-1-thuth@redhat.com>
References: <20201026100632.212530-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

This new operation is used in the next commit, which concatenates two
fuzzer-generated inputs. With this operation, we can prevent the second
input from clobbering the PCI configuration performed by the first.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20201023150746.107063-9-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 62a94de9dd..6ec20464bd 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -39,6 +39,7 @@ enum cmds {
     OP_WRITE,
     OP_PCI_READ,
     OP_PCI_WRITE,
+    OP_DISABLE_PCI,
     OP_ADD_DMA_PATTERN,
     OP_CLEAR_DMA_PATTERNS,
     OP_CLOCK_STEP,
@@ -116,6 +117,7 @@ static GArray *dma_regions;
 
 static GArray *dma_patterns;
 static int dma_pattern_index;
+static bool pci_disabled;
 
 /*
  * Allocate a block of memory and populate it with a pattern.
@@ -484,7 +486,7 @@ static void op_pci_read(QTestState *s, const unsigned char * data, size_t len)
         uint8_t base;
         uint8_t offset;
     } a;
-    if (len < sizeof(a) || fuzzable_pci_devices->len == 0) {
+    if (len < sizeof(a) || fuzzable_pci_devices->len == 0 || pci_disabled) {
         return;
     }
     memcpy(&a, data, sizeof(a));
@@ -514,7 +516,7 @@ static void op_pci_write(QTestState *s, const unsigned char * data, size_t len)
         uint8_t offset;
         uint32_t value;
     } a;
-    if (len < sizeof(a) || fuzzable_pci_devices->len == 0) {
+    if (len < sizeof(a) || fuzzable_pci_devices->len == 0 || pci_disabled) {
         return;
     }
     memcpy(&a, data, sizeof(a));
@@ -569,6 +571,11 @@ static void op_clock_step(QTestState *s, const unsigned char *data, size_t len)
     qtest_clock_step_next(s);
 }
 
+static void op_disable_pci(QTestState *s, const unsigned char *data, size_t len)
+{
+    pci_disabled = true;
+}
+
 static void handle_timeout(int sig)
 {
     if (qtest_log_enabled) {
@@ -624,6 +631,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
         [OP_WRITE]              = op_write,
         [OP_PCI_READ]           = op_pci_read,
         [OP_PCI_WRITE]          = op_pci_write,
+        [OP_DISABLE_PCI]        = op_disable_pci,
         [OP_ADD_DMA_PATTERN]    = op_add_dma_pattern,
         [OP_CLEAR_DMA_PATTERNS] = op_clear_dma_patterns,
         [OP_CLOCK_STEP]         = op_clock_step,
@@ -656,6 +664,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
         }
 
         op_clear_dma_patterns(s, NULL, 0);
+        pci_disabled = false;
 
         while (cmd && Size) {
             /* Get the length until the next command or end of input */
-- 
2.18.2


