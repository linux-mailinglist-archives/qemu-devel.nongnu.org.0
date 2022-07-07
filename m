Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F095698B4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 05:17:22 +0200 (CEST)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9I13-0001dS-DJ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 23:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hvo-0003tt-NX; Wed, 06 Jul 2022 23:11:56 -0400
Received: from mout-u-204.mailbox.org ([80.241.59.204]:43386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o9Hvn-0007bz-9j; Wed, 06 Jul 2022 23:11:56 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4LdhK24WcGz9sQr;
 Thu,  7 Jul 2022 05:11:50 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH v2 3/7] hw/ide/core: Clear LBA and drive bits for EXECUTE
 DEVICE DIAGNOSTIC
Date: Thu,  7 Jul 2022 03:11:36 +0000
Message-Id: <20220707031140.158958-3-lkujaw@member.fsf.org>
In-Reply-To: <20220707031140.158958-1-lkujaw@member.fsf.org>
References: <20220707031140.158958-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=80.241.59.204; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-204.mailbox.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Prior to this patch, cmd_exec_dev_diagnostic relied upon
ide_set_signature to clear the device register.  While the
preservation of the drive bit by ide_set_signature is necessary for
the DEVICE RESET, IDENTIFY DEVICE, and READ SECTOR commands,
ATA/ATAPI-6 specifies that "DEV shall be cleared to zero" for EXECUTE
DEVICE DIAGNOSTIC.

This deviation was uncovered by the ATACT Device Testing Program
written by Hale Landis.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/ide/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 7cbc0a54a7..b747191ebf 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1704,8 +1704,14 @@ static bool cmd_identify_packet(IDEState *s, uint8_t cmd)
     return false;
 }
 
+/* EXECUTE DEVICE DIAGNOSTIC */
 static bool cmd_exec_dev_diagnostic(IDEState *s, uint8_t cmd)
 {
+    /*
+     * Clear the device register per the ATA (v6) specification,
+     * because ide_set_signature does not clear LBA or drive bits.
+     */
+    s->select = (ATA_DEV_ALWAYS_ON);
     ide_set_signature(s);
 
     if (s->drive_kind == IDE_CD) {
-- 
2.34.1


