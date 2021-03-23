Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D2345C7F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:10:02 +0100 (CET)
Received: from localhost ([::1]:52664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOevB-0000xz-2k
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lOeuK-0000Ja-Ey
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:09:08 -0400
Received: from mail.ispras.ru ([83.149.199.84]:35668)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lOeuH-0003yP-7v
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:09:08 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 45F8940755F9;
 Tue, 23 Mar 2021 11:08:54 +0000 (UTC)
Subject: [PATCH] qcow2: use external virtual timers
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Tue, 23 Mar 2021 14:08:54 +0300
Message-ID: <161649773401.599835.8362213390558184647.stgit@pasha-ThinkPad-X280>
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Regular virtual timers are used to emulate timings
related to vCPU and peripheral states. QCOW2 uses timers
to clean the cache. These timers should have external
flag. In the opposite case they affect the execution
and it can't be recorded and replayed.
This patch adds external flag to the timer for qcow2
cache clean.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 block/qcow2.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 0db1227ac9..2fb43c6f7e 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -840,9 +840,10 @@ static void cache_clean_timer_init(BlockDriverState *bs, AioContext *context)
 {
     BDRVQcow2State *s = bs->opaque;
     if (s->cache_clean_interval > 0) {
-        s->cache_clean_timer = aio_timer_new(context, QEMU_CLOCK_VIRTUAL,
-                                             SCALE_MS, cache_clean_timer_cb,
-                                             bs);
+        s->cache_clean_timer =
+            aio_timer_new_with_attrs(context, QEMU_CLOCK_VIRTUAL,
+                                     SCALE_MS, QEMU_TIMER_ATTR_EXTERNAL,
+                                     cache_clean_timer_cb, bs);
         timer_mod(s->cache_clean_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
                   (int64_t) s->cache_clean_interval * 1000);
     }


