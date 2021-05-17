Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FEF382CD3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:07:43 +0200 (CEST)
Received: from localhost ([::1]:58884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licyE-0001lg-V4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1licwF-0006k9-Ur
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:05:39 -0400
Received: from mail.ispras.ru ([83.149.199.84]:50026)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1licwC-0002hL-WE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:05:39 -0400
Received: from [127.0.1.1] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id E2F5B4076B5F;
 Mon, 17 May 2021 13:05:33 +0000 (UTC)
Subject: [PATCH] replay: fix event queue flush for qemu shutdown
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Mon, 17 May 2021 16:05:33 +0300
Message-ID: <162125673369.1252743.1121827086025789296.stgit@pasha-ThinkPad-X280>
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes event queue flush in the case of emulator
shutdown. replay_finish_events should be called when replay_mode
is not cleared.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 replay/replay.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/replay/replay.c b/replay/replay.c
index 6df2abc18c..2d3607998a 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -387,9 +387,8 @@ void replay_finish(void)
     g_free(replay_snapshot);
     replay_snapshot = NULL;
 
-    replay_mode = REPLAY_MODE_NONE;
-
     replay_finish_events();
+    replay_mode = REPLAY_MODE_NONE;
 }
 
 void replay_add_blocker(Error *reason)


