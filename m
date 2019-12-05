Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2279E114380
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 16:27:34 +0100 (CET)
Received: from localhost ([::1]:56232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ict2S-0005nh-OO
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 10:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icsvy-0000Be-FH
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:20:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icsvu-0005ng-Rc
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:20:49 -0500
Received: from relay.sw.ru ([185.231.240.75]:43546)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icsvt-0005d3-57
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:20:45 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icsve-00007O-EI; Thu, 05 Dec 2019 18:20:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 16/21] hw/tpm: rename Error ** parameter to more common errp
Date: Thu,  5 Dec 2019 18:20:14 +0300
Message-Id: <20191205152019.8454-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205152019.8454-1-vsementsov@virtuozzo.com>
References: <20191205152019.8454-1-vsementsov@virtuozzo.com>
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
Cc: vsementsov@virtuozzo.com, armbru@redhat.com,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
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


