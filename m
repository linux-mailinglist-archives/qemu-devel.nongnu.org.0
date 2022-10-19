Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E32605048
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 21:19:40 +0200 (CEST)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olEbK-0005OW-W0
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 15:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1olEXT-0003bJ-Ox; Wed, 19 Oct 2022 15:15:40 -0400
Received: from cae.in-ulm.de ([217.10.14.231]:59340)
 by eggs.gnu.org with esmtp (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1olEXR-0006Ti-Md; Wed, 19 Oct 2022 15:15:39 -0400
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id 6325C1402DC; Wed, 19 Oct 2022 21:15:25 +0200 (CEST)
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: qemu-devel@nongnu.org
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
 Eric DeVolder <eric.devolder@oracle.com>, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH] hw/acpi/erst.c: Fix memset argument order
Date: Wed, 19 Oct 2022 21:15:22 +0200
Message-Id: <20221019191522.1004804-1-lk@c--e.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=217.10.14.231; envelope-from=lk@c--e.de;
 helo=cae.in-ulm.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Fix memset argument order: The second argument is
the value, the length goes last.

Cc: Eric DeVolder <eric.devolder@oracle.com>
Cc: qemu-stable@nongnu.org
Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
---
 hw/acpi/erst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index df856b2669..26391f93ca 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
     if (nvram) {
         /* Write the record into the slot */
         memcpy(nvram, exchange, record_length);
-        memset(nvram + record_length, exchange_length - record_length, 0xFF);
+        memset(nvram + record_length, 0xFF, exchange_length - record_length);
         /* If a new record, increment the record_count */
         if (!record_found) {
             uint32_t record_count;
-- 
2.34.1


