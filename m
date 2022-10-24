Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C9D60B20D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:42:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzbX-00071B-5l; Mon, 24 Oct 2022 11:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1omzbU-0006wD-Tf; Mon, 24 Oct 2022 11:43:04 -0400
Received: from cae.in-ulm.de ([217.10.14.231])
 by eggs.gnu.org with esmtp (Exim 4.90_1) (envelope-from <lk@c--e.de>)
 id 1omzbS-00038Z-VS; Mon, 24 Oct 2022 11:43:04 -0400
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id 3EF12140306; Mon, 24 Oct 2022 17:42:50 +0200 (CEST)
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: qemu-devel@nongnu.org
Cc: "Christian A. Ehrhardt" <lk@c--e.de>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric DeVolder <eric.devolder@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] hw/acpi/erst.c: Fix memory handling issues
Date: Mon, 24 Oct 2022 17:42:33 +0200
Message-Id: <20221024154233.1043347-1-lk@c--e.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221024100323-mutt-send-email-mst@kernel.org>
References: <20221024100323-mutt-send-email-mst@kernel.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

- Fix memset argument order: The second argument is
  the value, the length goes last.
- Fix an integer overflow reported by Alexander Bulekov.

Both issues allow the guest to overrun the host buffer
allocated for the ERST memory device.

Cc: Eric DeVolder <eric.devolder@oracle.com
Cc: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-stable@nongnu.org
Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
---
 hw/acpi/erst.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index df856b2669..aefcc03ad6 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -635,7 +635,7 @@ static unsigned read_erst_record(ERSTDeviceState *s)
         if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
             rc = STATUS_FAILED;
         }
-        if ((s->record_offset + record_length) > exchange_length) {
+        if (record_length > exchange_length - s->record_offset) {
             rc = STATUS_FAILED;
         }
         /* If all is ok, copy the record to the exchange buffer */
@@ -684,7 +684,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
     if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
         return STATUS_FAILED;
     }
-    if ((s->record_offset + record_length) > exchange_length) {
+    if (record_length > exchange_length - s->record_offset) {
         return STATUS_FAILED;
     }
 
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


