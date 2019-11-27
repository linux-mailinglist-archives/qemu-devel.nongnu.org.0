Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D98110B6F1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 20:43:07 +0100 (CET)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia3DO-0002mJ-1a
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 14:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia37O-0005d2-O4
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:36:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia37N-0003SN-Hd
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:36:54 -0500
Received: from relay.sw.ru ([185.231.240.75]:55074)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia37N-0003Oo-8M
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:36:53 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia37J-0004Xw-3a; Wed, 27 Nov 2019 22:36:49 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6] hw/tpm: rename Error ** parameter to more common errp
Date: Wed, 27 Nov 2019 22:36:48 +0300
Message-Id: <20191127193648.23403-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: vsementsov@virtuozzo.com, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---

v6: add Stefan's r-b

 hw/tpm/tpm_emulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/tpm/tpm_emulator.c b/hw/tpm/tpm_emulator.c
index 22f9113432..10d587ed40 100644
--- a/hw/tpm/tpm_emulator.c
+++ b/hw/tpm/tpm_emulator.c
@@ -155,7 +155,7 @@ static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
                                      const uint8_t *in, uint32_t in_len,
                                      uint8_t *out, uint32_t out_len,
                                      bool *selftest_done,
-                                     Error **err)
+                                     Error **errp)
 {
     ssize_t ret;
     bool is_selftest = false;
@@ -165,20 +165,20 @@ static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
         is_selftest = tpm_util_is_selftest(in, in_len);
     }
 
-    ret = qio_channel_write_all(tpm_emu->data_ioc, (char *)in, in_len, err);
+    ret = qio_channel_write_all(tpm_emu->data_ioc, (char *)in, in_len, errp);
     if (ret != 0) {
         return -1;
     }
 
     ret = qio_channel_read_all(tpm_emu->data_ioc, (char *)out,
-              sizeof(struct tpm_resp_hdr), err);
+              sizeof(struct tpm_resp_hdr), errp);
     if (ret != 0) {
         return -1;
     }
 
     ret = qio_channel_read_all(tpm_emu->data_ioc,
               (char *)out + sizeof(struct tpm_resp_hdr),
-              tpm_cmd_get_size(out) - sizeof(struct tpm_resp_hdr), err);
+              tpm_cmd_get_size(out) - sizeof(struct tpm_resp_hdr), errp);
     if (ret != 0) {
         return -1;
     }
-- 
2.21.0


