Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA42404DC2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:08:36 +0200 (CEST)
Received: from localhost ([::1]:33546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOIr4-0003ju-Cy
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1mOIo2-0000vq-Of
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:05:32 -0400
Received: from mail05.asahi-net.or.jp ([202.224.55.45]:47235)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1mOInz-0006mg-4h
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:05:25 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail05.asahi-net.or.jp (Postfix) with ESMTPA id 9319724FDB;
 Thu,  9 Sep 2021 21:05:14 +0900 (JST)
Received: from SIOS1075.flets-east.jp (y243185.dynamic.ppp.asahi-net.or.jp
 [118.243.243.185])
 by sakura.ysato.name (Postfix) with ESMTPSA id 324C81C05AB;
 Thu,  9 Sep 2021 21:05:14 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/rx: gdbstub add acc register operation.
Date: Thu,  9 Sep 2021 21:04:59 +0900
Message-Id: <20210909120459.2199223-3-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909120459.2199223-1-ysato@users.sourceforge.jp>
References: <20210909120459.2199223-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.45;
 envelope-from=ysato@users.sourceforge.jp; helo=mail05.asahi-net.or.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I added it because the operation of the acc register was not implemented.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 target/rx/gdbstub.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/rx/gdbstub.c b/target/rx/gdbstub.c
index c811d4810b..b5da5c42cb 100644
--- a/target/rx/gdbstub.c
+++ b/target/rx/gdbstub.c
@@ -47,7 +47,7 @@ int rx_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     case 24:
         return gdb_get_regl(mem_buf, env->fpsw);
     case 25:
-        return 0;
+        return gdb_get_reg64(mem_buf, env->acc);
     }
     return 0;
 }
@@ -103,6 +103,7 @@ int rx_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         env->fpsw = ldl_p(mem_buf);
         break;
     case 25:
+        env->acc = ldq_p(mem_buf);
         return 8;
     default:
         return 0;
-- 
2.30.2


