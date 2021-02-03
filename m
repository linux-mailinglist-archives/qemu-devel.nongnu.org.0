Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414C30D33F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 07:01:55 +0100 (CET)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7BEf-00080v-U9
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 01:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l7BDI-0007OY-Ar
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 01:00:29 -0500
Received: from mail.ispras.ru ([83.149.199.84]:54096)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l7BD9-0003uM-Gg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 01:00:28 -0500
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 288F4407626A;
 Wed,  3 Feb 2021 06:00:13 +0000 (UTC)
Subject: [PATCH] replay: rng-builtin support
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Wed, 03 Feb 2021 09:00:12 +0300
Message-ID: <161233201286.170686.7858208964037376305.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru,
 amit@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch enables using rng-builtin with record/replay
by making the callbacks deterministic.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 backends/rng-builtin.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/backends/rng-builtin.c b/backends/rng-builtin.c
index f38dff117d..f367eb665c 100644
--- a/backends/rng-builtin.c
+++ b/backends/rng-builtin.c
@@ -10,6 +10,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "qom/object.h"
+#include "sysemu/replay.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(RngBuiltin, RNG_BUILTIN)
 
@@ -37,7 +38,7 @@ static void rng_builtin_request_entropy(RngBackend *b, RngRequest *req)
 {
     RngBuiltin *s = RNG_BUILTIN(b);
 
-    qemu_bh_schedule(s->bh);
+    replay_bh_schedule_event(s->bh);
 }
 
 static void rng_builtin_init(Object *obj)


