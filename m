Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE962CC2AB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 17:47:08 +0100 (CET)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkVHW-0003XP-3E
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 11:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1kkVBl-0000DZ-Jz
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:41:09 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:36864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1kkVBg-00089l-Ly
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:41:09 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPS id 2190D21CD4;
 Wed,  2 Dec 2020 16:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1606927260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=opZHA4qCLgdAN8VQ9q+MuLkIRwc2w/zJPV3w02nn1zQ=;
 b=uBriU7rePgXpzJfbS4NzUg4gaEdnj28fFZgxCuvGzMgT/zIpJsT4+gY/s8cCrhGLPj87SC
 qv7+VI8KYeVql4Qvzqj91tjagZQ5Nhj4ZBryneAeCGGElMDt3wKWVCYxY6RRUk+2JYbwB0
 wxrj1l4AARkQRVYhoifMuE2WlCXCRac=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for 5.2?] hw/core/ressetable: fix reset count decrement
Date: Wed,  2 Dec 2020 17:40:55 +0100
Message-Id: <20201202164055.30864-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 f4bug@amsat.org, Michael Peter <michael.peter@hensoldt-cyber.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The reset count was only decremented if the device was in a single
reset.

Also move the decrement before calling the exit phase method to fix
problem of reset state evaluation during that call. Update the doc
accordingly.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Fixes: 1905297 ("Zynq7000 UART clock reset initialization", 2020-11-23)
Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
--

Hi all,

While looking at the bug reported by Michael and his patch. I found another
bug. Apparently I forgot to decrement the reset count if there was several
reset at the same time.

This patch fixes that.

I also moved the place of the decrement: before calling the exit phase method.
it globally fixes Michael's reported bug, as I think it will avoid some boiler
plate code in every exit phase method we do.

Only other place where the reset state is checked is in the
hw/char/cadence-uart.c so it does not have high impact.

I'm not sure if this meets the condition for 5.2 as it changes a documented
feature. In that case we can just accept Michael solution and I'll fix the
rest later.

Here's the pointer for the bug and michael's patch.
https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05786.html
https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg06105.html

Damien
---
 docs/devel/reset.rst | 6 +++---
 hw/core/resettable.c | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/docs/devel/reset.rst b/docs/devel/reset.rst
index abea1102dc..021a7277a2 100644
--- a/docs/devel/reset.rst
+++ b/docs/devel/reset.rst
@@ -210,9 +210,9 @@ Polling the reset state
 Resettable interface provides the ``resettable_is_in_reset()`` function.
 This function returns true if the object parameter is currently under reset.
 
-An object is under reset from the beginning of the *init* phase to the end of
-the *exit* phase. During all three phases, the function will return that the
-object is in reset.
+An object is under reset from the beginning of the *init* phase to the *exit*
+phase. During *init* and *hold* phase only, the function will return that the
+object is in reset. The state is changed just before calling the *exit* method.
 
 This function may be used if the object behavior has to be adapted
 while in reset state. For example if a device has an irq input,
diff --git a/hw/core/resettable.c b/hw/core/resettable.c
index 96a99ce39e..c3df75c6ba 100644
--- a/hw/core/resettable.c
+++ b/hw/core/resettable.c
@@ -201,12 +201,11 @@ static void resettable_phase_exit(Object *obj, void *opaque, ResetType type)
     resettable_child_foreach(rc, obj, resettable_phase_exit, NULL, type);
 
     assert(s->count > 0);
-    if (s->count == 1) {
+    if (--s->count == 0) {
         trace_resettable_phase_exit_exec(obj, obj_typename, !!rc->phases.exit);
         if (rc->phases.exit && !resettable_get_tr_func(rc, obj)) {
             rc->phases.exit(obj);
         }
-        s->count = 0;
     }
     s->exit_phase_in_progress = false;
     trace_resettable_phase_exit_end(obj, obj_typename, s->count);
-- 
2.29.2


