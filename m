Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A24606B1
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 15:08:20 +0100 (CET)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrKqp-0001cC-4S
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 09:08:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKhC-0006HT-9n; Sun, 28 Nov 2021 08:58:22 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrKh7-0004gD-4r; Sun, 28 Nov 2021 08:58:21 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 21E51402AD;
 Sun, 28 Nov 2021 14:57:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1638107870;
 bh=pQPhk3Roa8AWVed59iJw90P0Vrf0P6qIiM/hXaHdw80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GNT+Wx2SGBfcE/Rtm6Hc0zlqliM7JOIGlW+7WIiOcd7zL5Q3eTcn7H5Bii+xLc1tT
 8KXg84ovLhVekw0XbKQGQw+l0uwm3XTVEQNDjHIgv+fOrVUinIdClzVJx7xgz0m62Y
 slQMQrNSGa8v4muFyRoui/z3oBUfNeBDFS8Uxsx1Vd7rgxYOidV1/Isl8bEUrvX+3y
 BF448LDMTA5Ja7IDLPxzlgBdRHEpdjX47NCN3Ba106VHnzQZ6p6o3WtmyG3l++gdb3
 Ip37LH7dW3wJ0jdlcciISkFWtD8h7o9JzjbS0g1LT1AbqwCmpCO/43eRIIjWIa48i6
 /aznMmjYL4yaA==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 09A4560066;
 Sun, 28 Nov 2021 14:57:50 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id CFB954006D;
 Sun, 28 Nov 2021 14:57:49 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 15/18] target/riscv: adding high part of some csrs
Date: Sun, 28 Nov 2021 14:57:16 +0100
Message-Id: <20211128135719.50444-16-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding the high part of a very minimal set of csr.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     | 4 ++++
 target/riscv/machine.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 603ae04837..a7c2e5c93e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -193,6 +193,10 @@ struct CPURISCVState {
     target_ulong hgatp;
     uint64_t htimedelta;
 
+    /* Upper 64-bits of 128-bit CSRs */
+    uint64_t mscratchh;
+    uint64_t sscratchh;
+
     /* Virtual CSRs */
     /*
      * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 8af9caabf5..13b9ab375b 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -179,6 +179,8 @@ static const VMStateDescription vmstate_rv128 = {
     .needed = rv128_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gprh, RISCVCPU, 32),
+        VMSTATE_UINT64(env.mscratchh, RISCVCPU),
+        VMSTATE_UINT64(env.sscratchh, RISCVCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.34.0


