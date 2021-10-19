Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB1B4332D9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:51:04 +0200 (CEST)
Received: from localhost ([::1]:43342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcllv-0003Ew-PX
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljP-0000Fr-L5; Tue, 19 Oct 2021 05:48:27 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljN-0006Q3-Lp; Tue, 19 Oct 2021 05:48:27 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 5289D41BB2;
 Tue, 19 Oct 2021 11:48:22 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 39E5D601E3;
 Tue, 19 Oct 2021 11:48:22 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 1BD8514005A;
 Tue, 19 Oct 2021 11:48:22 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 02/21] memory: add a few defines for octo (128-bit) values
Date: Tue, 19 Oct 2021 11:47:53 +0200
Message-Id: <20211019094812.614056-3-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introducing unsigned quad, signed quad, and octo accesses types
to handle load and store by 128-bit processors.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 include/exec/memop.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index c554bb0ee8..476ea6cdae 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -85,10 +85,13 @@ typedef enum MemOp {
     MO_UB    = MO_8,
     MO_UW    = MO_16,
     MO_UL    = MO_32,
+    MO_UQ    = MO_64,
     MO_SB    = MO_SIGN | MO_8,
     MO_SW    = MO_SIGN | MO_16,
     MO_SL    = MO_SIGN | MO_32,
-    MO_UQ     = MO_64,
+    MO_SQ    = MO_SIGN | MO_64,
+    MO_Q     = MO_64,
+    MO_O     = MO_128,
 
     MO_LEUW  = MO_LE | MO_UW,
     MO_LEUL  = MO_LE | MO_UL,
@@ -105,9 +108,12 @@ typedef enum MemOp {
 #ifdef NEED_CPU_H
     MO_TEUW  = MO_TE | MO_UW,
     MO_TEUL  = MO_TE | MO_UL,
+    MO_TEUQ  = MO_TE | MO_UQ,
     MO_TESW  = MO_TE | MO_SW,
     MO_TESL  = MO_TE | MO_SL,
     MO_TEQ   = MO_TE | MO_UQ,
+    MO_TESQ  = MO_TE | MO_SQ,
+    MO_TEO   = MO_TE | MO_O,
 #endif
 
     MO_SSIZE = MO_SIZE | MO_SIGN,
-- 
2.33.0


