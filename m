Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB953F5C53
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:45:03 +0200 (CEST)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITvR-0001Xe-Cl
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1mITuT-0000ii-0w; Tue, 24 Aug 2021 06:44:01 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:42490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1mITuQ-0008Et-R7; Tue, 24 Aug 2021 06:44:00 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 4AED511A;
 Tue, 24 Aug 2021 12:43:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEnFLMtb_X7f; Tue, 24 Aug 2021 12:43:50 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 6B86C85;
 Tue, 24 Aug 2021 12:43:50 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1mITuH-00GH4r-7i; Tue, 24 Aug 2021 12:43:49 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH] ide: Cap LBA28 capacity announcement to 2^28-1
Date: Tue, 24 Aug 2021 12:43:44 +0200
Message-Id: <20210824104344.3878849-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++
X-Rspamd-Server: hera
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Queue-Id: 4AED511A
X-Spamd-Result: default: False [2.90 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_COUNT_THREE(0.00)[3]; MID_CONTAINS_FROM(1.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 BAYES_HAM(-2.10)[95.62%]
Received-SPF: neutral client-ip=185.233.100.1;
 envelope-from=samuel.thibault@ens-lyon.org; helo=hera.aquilenet.fr
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, damien@zamaudio.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LBA28 capacity (at offsets 60/61 of identification) is supposed to
express the maximum size supported by LBA28 commands. If the device is
larger than this, we have to cap it to 2^28-1.

At least NetBSD happens to be using this value to determine whether to use
LBA28 or LBA48 for its commands, using LBA28 for sectors that don't need
LBA48. This commit thus fixes NetBSD access to disks larger than 128GiB.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 hw/ide/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index fd69ca3167..e28f8aad61 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -98,8 +98,12 @@ static void put_le16(uint16_t *p, unsigned int v)
 static void ide_identify_size(IDEState *s)
 {
     uint16_t *p = (uint16_t *)s->identify_data;
-    put_le16(p + 60, s->nb_sectors);
-    put_le16(p + 61, s->nb_sectors >> 16);
+    int64_t nb_sectors_lba28 = s->nb_sectors;
+    if (nb_sectors_lba28 >= 1 << 28) {
+        nb_sectors_lba28 = (1 << 28) - 1;
+    }
+    put_le16(p + 60, nb_sectors_lba28);
+    put_le16(p + 61, nb_sectors_lba28 >> 16);
     put_le16(p + 100, s->nb_sectors);
     put_le16(p + 101, s->nb_sectors >> 16);
     put_le16(p + 102, s->nb_sectors >> 32);
-- 
2.32.0


