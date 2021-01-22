Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76138300085
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:41:59 +0100 (CET)
Received: from localhost ([::1]:46368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tt8-0000ZE-E0
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1l2to0-00086W-7l
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:36:40 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:44046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1l2tnx-0001nz-Np
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:36:39 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id C02E821CD9;
 Fri, 22 Jan 2021 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1611311793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nhKqb7outROC2oEaiPUy2jffG158RIqO7jN/WR+l+cE=;
 b=TuAy76U7JOQ4CvNyosLPU1+bsQdg897+oCzBYQfHAdwHe3PuKpDPQ666S/Nyk68HPQW+3b
 YwKcNeNziBgE/5TuUwTpwtCQopgibbN/+nFl+kjT4ywGyGZDX/u18Jl2YaARCpKI34rwKE
 ODqxqFJ0Oqi63SgTWBQ9I89FUzEVUmc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/core/resettable: make in-reset state false during exit
 phase call
Date: Fri, 22 Jan 2021 11:36:29 +0100
Message-Id: <20210122103629.5412-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
 alistair@alistair23.me, f4bug@amsat.org, edgar.iglesias@gmail.com,
 Michael Peter <michael.peter@hensoldt-cyber.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the reset count decrement from "just after" to "just before"
calling the exit phase handler. The goal is to make
resettable_is_in_reset() returning false during the handler execution.

This simplifies reset handling in resettable devices.

Typically, a function that updates the device state will just need
to read the current reset state and not anymore treat the "in
a reset-exit transition" special case.

As a side note, this patch also fixes the fact that the reset count was
not decremented in case of recursive reset.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1905297
Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
--

Hi,

Following our discussion:
https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01013.html
here's my proposal to fix Michael's bug on a global scope.

I flaged it v2 because I've taken Philippe's remarks there:
https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg00635.html
I've also changed the patch title, I think it is better this way.

Thanks,
Damien

Cc: f4bug@amsat.org
Cc: peter.maydell@linaro.org
Cc: alistair@alistair23.me
Cc: edgar.iglesias@gmail.com
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


