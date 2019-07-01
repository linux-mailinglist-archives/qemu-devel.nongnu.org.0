Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C514C17F34
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 19:40:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOQXw-0008DS-1p
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 13:40:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41944)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
	id 1hOQWu-0007wM-3R
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
	id 1hOQWs-0007cK-28
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:38:56 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:49328)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
	id 1hOQWp-0007Zg-3N
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:38:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
	s=pic; 
	t=1557337127; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
	Date: Subject: Cc: To: From: Sender;
	bh=YvsWYTSVQUmO5f5aefREeZm0X5cwenQtMoPL4ghpEhc=;
	b=JzJRyCRhJ4HtM2dzbt/9FxoUHyNic/WG+U/sfRXeCdhRfby6p/xAMVmL0sOs27jV2B7bThUu
	+rJpc5dXoLrFMCThPBXlCU70entsk5aHyOehNOa4OBvlle7B94QMNhpoRNPeGF2zTwycVmhZ
	fITARLRkE4X7QeyYYMigx8EVkn1d+AtH1QlCVyxpQnAk8o1In8yTqxIPKHaminDkDAYDNWbr
	uIjWGFQvm26EBRR91Q36wlcZAIkivT3C3CvcgUFyC9FyuYndYvhHRdHRyTa3RVUV+xp71w46
	OQZHr/rIB+RrjbwDTzgTsyLf3qbFV73I81UoDFvbyEI6hJ5thbKtVg==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
	(30-9-187.wireless.csail.mit.edu [128.30.9.187])
	by mxa.mailgun.org with ESMTP id 5cd31425.7fe2f866d350-smtp-out-n02;
	Wed, 08 May 2019 17:38:45 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org
Date: Wed,  8 May 2019 13:38:35 -0400
Message-Id: <20190508173835.14528-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-devel] [PATCH] target/riscv: Only flush TLB if SATP.ASID
 changes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jonathan Behrens <jonathan@fintelia.io>, Palmer Dabbelt <palmer@sifive.com>,
	qemu-riscv@nongnu.org, Jonathan Behrens <fintelia@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is an analogous change for ARM here:
https://patchwork.kernel.org/patch/10649857

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 target/riscv/csr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6083c782a1..1ec1222da1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -732,7 +732,9 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
         if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
             return -1;
         } else {
-            tlb_flush(CPU(riscv_env_get_cpu(env)));
+            if((val ^ env->satp) & SATP_ASID) {
+                tlb_flush(CPU(riscv_env_get_cpu(env)));
+            }
             env->satp = val;
         }
     }
-- 
2.20.1

