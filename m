Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB950B788
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:41:38 +0200 (CEST)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsbR-00050W-Bd
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nhrr2-0001fr-3x
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:53:40 -0400
Received: from mail.ispras.ru ([83.149.199.84]:39354)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nhrr0-0005Ex-Cp
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:53:39 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id E41F2407624D;
 Fri, 22 Apr 2022 11:53:14 +0000 (UTC)
Subject: [PATCH 1/9] replay: fix event queue flush for qemu shutdown
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Fri, 22 Apr 2022 14:53:14 +0300
Message-ID: <165062839471.526882.6289802323800289333.stgit@pasha-ThinkPad-X280>
In-Reply-To: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, philmd@redhat.com, wrampazz@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
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


