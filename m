Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E71D27F3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 08:36:43 +0200 (CEST)
Received: from localhost ([::1]:45354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ7U2-0002MC-NC
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 02:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.pour@hetzner.com>)
 id 1jZ7PM-0004lf-VK; Thu, 14 May 2020 02:31:52 -0400
Received: from mail.hetzner.company ([2a01:4f8:d0a:203a::1]:50232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.pour@hetzner.com>)
 id 1jZ7PL-0001SJ-LG; Thu, 14 May 2020 02:31:52 -0400
Received: from [2a01:4f8:0:a53b:fd81:523d:dd49:b8d4] (helo=hetzner.com)
 by mail.hetzner.company with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89) (envelope-from <raphael.pour@hetzner.com>)
 id 1jZ7PI-0000UC-Qo; Thu, 14 May 2020 08:31:48 +0200
From: Raphael Pour <raphael.pour@hetzner.com>
To: Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 1/1] qemu-nbd: Close inherited stderr
Date: Thu, 14 May 2020 08:31:12 +0200
Message-Id: <20200514063112.1457125-2-raphael.pour@hetzner.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200514063112.1457125-1-raphael.pour@hetzner.com>
References: <1jYr2L-0004mc-Jj@mail.hetzner.company>
 <20200514063112.1457125-1-raphael.pour@hetzner.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: raphael.pour@hetzner.com
Received-SPF: pass client-ip=2a01:4f8:d0a:203a::1;
 envelope-from=raphael.pour@hetzner.com; helo=mail.hetzner.company
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Raphael Pour <raphael.pour@hetzner.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Close inherited stderr of the parent if fork_process is false.
Otherwise no one will close it. (introduced by e6df58a5)
---
 qemu-nbd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 4aa005004e..a324d21c5e 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -916,7 +916,13 @@ int main(int argc, char **argv)
         } else if (pid == 0) {
             close(stderr_fd[0]);
 
-            old_stderr = dup(STDERR_FILENO);
+            /* Remember parents stderr only if the fork option is set.
+             * The child won't close this inherited fd otherwise.
+             */
+            if (fork_process) {
+              old_stderr = dup(STDERR_FILENO);
+            }
+
             ret = qemu_daemon(1, 0);
 
             /* Temporarily redirect stderr to the parent's pipe...  */
-- 
2.25.4


