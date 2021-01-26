Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976FC304D89
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 01:44:03 +0100 (CET)
Received: from localhost ([::1]:43358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4YwE-0007F3-LG
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 19:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <110bef3595cb841dfa1b86733c174ac9774eb37e@lizzy.crudebyte.com>)
 id 1l4YsV-00058B-71
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:40:11 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:39029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <110bef3595cb841dfa1b86733c174ac9774eb37e@lizzy.crudebyte.com>)
 id 1l4YsT-0007ao-OP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=lRzWEo6b7k9+kApoB+89gLCgSlgbKdep1hgOxL6/O8s=; b=MNsvY
 LWcj1Cz3mE3nQH579Vxuvj7w+H7N/S9rZSdNeTyEANH2ZHcae6pBPBfxMwACW2Dd1E6K3w8rFWBQl
 J2/WDIl0q4sPe0ttT+l+ru4rAz25sx1nj+pqmMq3oWmGfpLv/2z1OxFIGng2I5JYq1plg6wsqjIFm
 nZ+oyu8JDWQ5Qqe7ryexKy5EIt5IG4ICG/FKMt4MI1JDuKETYWr0KaSLVQWnrL73/IrE7i7UZmaev
 rD+yY37wNWyA9fRIpQkhzxXmDrGTa8Xm+W9/9Do6mPYWwpWA+IW6V+/5wAerYETEuieL3tI8Y03uN
 d/mYptw3dRpS1WaUvDGbuuzKdsBhA==;
Message-Id: <110bef3595cb841dfa1b86733c174ac9774eb37e.1611704181.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1611704181.git.qemu_oss@crudebyte.com>
References: <cover.1611704181.git.qemu_oss@crudebyte.com>
Date: Wed, 27 Jan 2021 00:26:16 +0100
Subject: [PATCH 5/5] tests/qtest/qos-test: dump QEMU command if verbose
To: qemu-devel@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=110bef3595cb841dfa1b86733c174ac9774eb37e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

If qtests are run in verbose mode (i.e. if --verbose CL argument
was provided) then print the assembled qemu command line for each
test.

Use qos_printf() instead of g_test_message() to avoid the latter
cluttering the output.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/qos-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index b279b6f816..f97d0a08fd 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -89,6 +89,9 @@ static void qos_set_machines_devices_available(void)
 
 static void restart_qemu_or_continue(char *path)
 {
+    if (g_test_verbose()) {
+        qos_printf("Run QEMU with: '%s'\n", path);
+    }
     /* compares the current command line with the
      * one previously executed: if they are the same,
      * don't restart QEMU, if they differ, stop previous
-- 
2.20.1


