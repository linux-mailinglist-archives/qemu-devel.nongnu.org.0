Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424B4E26C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 10:56:39 +0200 (CEST)
Received: from localhost ([::1]:55612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heFLa-0002UC-4R
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 04:56:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58308)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEzV-0004Ba-W4
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEow-0001ky-VA
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:22:55 -0400
Received: from mail.ispras.ru ([83.149.199.45]:41794)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1heEow-0001kl-OG
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 04:22:54 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id DBBF454006B;
 Fri, 21 Jun 2019 11:22:53 +0300 (MSK)
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 11:22:53 +0300
Message-ID: <156110537370.25431.15604146322775530877.stgit@pasha-Precision-3630-Tower>
In-Reply-To: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
References: <156110523748.25431.9310430853468653085.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: [Qemu-devel] [PATCH for-4.1 24/24] icount: clean up cpu_can_io
 before jumping to the next block
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com, quintela@redhat.com, ciro.santilli@gmail.com,
 jasowang@redhat.com, crosthwaite.peter@gmail.com, armbru@redhat.com,
 mreitz@redhat.com, alex.bennee@linaro.org, maria.klimushenkova@ispras.ru,
 mst@redhat.com, kraxel@redhat.com, boost.lists@gmail.com,
 thomas.dullien@googlemail.com, dovgaluk@ispras.ru, artem.k.pisarenko@gmail.com,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

Most of IO instructions can be executed only at the end of the block in
icount mode. Therefore translator can set cpu_can_io flag when translating
the last instruction.
But when the blocks are chained, then this flag is not reset and may
remain set at the beginning of the next block.
This patch resets the flag before "chaining" the translation blocks.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 accel/tcg/tcg-runtime.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 8a1e408e31..fe6b83d0fc 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -151,6 +151,8 @@ void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     target_ulong cs_base, pc;
     uint32_t flags;
 
+    /* We are going to jump to the next block. can_do_io should be reset */
+    cpu->can_do_io = !use_icount;
     tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, curr_cflags());
     if (tb == NULL) {
         return tcg_ctx->code_gen_epilogue;


