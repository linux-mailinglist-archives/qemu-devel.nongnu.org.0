Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F25F9B8E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:01:20 +0200 (CEST)
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohof1-0003B9-Rh
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ohoWj-00030a-Jr; Mon, 10 Oct 2022 04:52:51 -0400
Received: from mout-p-103.mailbox.org ([80.241.56.161]:38792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@mailbox.org>)
 id 1ohoWg-0006C9-3Z; Mon, 10 Oct 2022 04:52:44 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4MmCNM0YsSz9sSX;
 Mon, 10 Oct 2022 10:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1665391955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IKgzJ8v5oduP+PmJ6RUy+LlwkuDDbmwLqegxY3iL1DY=;
 b=TJVGFfetRw0VDADsdZPTL3iTZ8T/h3sRrpNMBEMzlCfnMF6ROlkdLmrFj1zx2KlfszBG9Z
 XOA08QWwSg50VQ9Z1li8TAFkuC13ims8f+NSB5vpz4pxehFc9DmccbgGfE738KOVERfO9z
 qBuJIS3ojoRdKUSP3QD3gucL2srcnrg2ta89k9V6qWSKNI1dEMhz55Dan3ONuyOxruwjfA
 Y0hE/+MWXTzRihrXRpOISLMvEbvxNUAb4+OW9dmlEedpDbaGZD3pcCduGSRwxMysOwaCcn
 gWfwcgRabFo8GibFbrswKYpIIrJa65l0EhScPipv1TWjxWbYB/9zj73dFIDTQA==
From: Lev Kujawski <lkujaw@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1665391953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IKgzJ8v5oduP+PmJ6RUy+LlwkuDDbmwLqegxY3iL1DY=;
 b=lEgBd9YyfQ8Mjg2EiSwzMzYdxOUR/BjnVaV8HRUXf4KqsxaKjldg7OXDyNf+subugHFP3C
 B6WELyitvyZjr0TxojSmfM2zvEzBGH9h5aoeJgDnUuDlTgjG1Mocj8wt/OukP42O9BWze2
 ewHY9iKSstIbZRdgXjF/oLksO7DGDbb6Wa6dYScAxAcT9z7vniklPNkHjIw6Xe+oit0vB+
 4RJqI2EJ/V/XUPNvAxBXcAJbHsyNbMdcSUIwV7l9ryEsqqyavp7Ba1p4B86PHdlf3fC5f9
 bLhxJAs50aHMr9uVbK1jBKb/SxXTartiXNjwPmkMztRzW99ov//KdMNEMy2wUA==
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Lev Kujawski <lkujaw@mailbox.org>
Subject: [PATCH 1/2] hw/ide/core.c (cmd_read_native_max): Avoid limited device
 parameters
Date: Mon, 10 Oct 2022 08:52:28 +0000
Message-Id: <20221010085229.2431276-1-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9f8794479e1583480e3
X-MBO-RS-META: yaew78cu7mp33wrs9comtwzb58ons7gc
Received-SPF: pass client-ip=80.241.56.161; envelope-from=lkujaw@mailbox.org;
 helo=mout-p-103.mailbox.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always use the native CHS device parameters for the ATA commands READ
NATIVE MAX ADDRESS and READ NATIVE MAX ADDRESS EXT, not those limited
by the ATA command INITIALIZE_DEVICE_PARAMETERS (introduced in patch
176e4961, hw/ide/core.c: Implement ATA INITIALIZE_DEVICE_PARAMETERS
command, 2022-07-07.)

As stated by the ATA/ATAPI specification, "[t]he native maximum is the
highest address accepted by the device in the factory default
condition."  Therefore this patch substitutes the native values in
drive_heads and drive_sectors before calling ide_set_sector().

One consequence of the prior behavior was that setting zero sectors
per track could lead to an FPE within ide_set_sector().  Thanks to
Alexander Bulekov for reporting this issue.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1243
Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
---
 hw/ide/core.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 39afdc0006..ee836401bc 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1608,11 +1608,24 @@ static bool cmd_read_native_max(IDEState *s, uint8_t cmd)
     /* Refuse if no sectors are addressable (e.g. medium not inserted) */
     if (s->nb_sectors == 0) {
         ide_abort_command(s);
-        return true;
-    }
+    } else {
+        /*
+         * Save the active drive parameters, which may have been
+         * limited from their native counterparts by, e.g., INITIALIZE
+         * DEVICE PARAMETERS or SET MAX ADDRESS.
+         */
+        const int aheads = s->heads;
+        const int asectors = s->sectors;
 
-    ide_cmd_lba48_transform(s, lba48);
-    ide_set_sector(s, s->nb_sectors - 1);
+        s->heads = s->drive_heads;
+        s->sectors = s->drive_sectors;
+
+        ide_cmd_lba48_transform(s, lba48);
+        ide_set_sector(s, s->nb_sectors - 1);
+
+        s->heads = aheads;
+        s->sectors = asectors;
+    }
 
     return true;
 }
-- 
2.34.1


