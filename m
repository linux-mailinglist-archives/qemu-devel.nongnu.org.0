Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA9334332
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:38:49 +0100 (CET)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1rE-0006lA-PI
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lK1Np-0002dd-6e
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:08:25 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lK1Nm-0006Zk-KY
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:08:24 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id E18A218E;
 Wed, 10 Mar 2021 17:08:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPbAUFdBDCYn; Wed, 10 Mar 2021 17:08:17 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 478E9AC;
 Wed, 10 Mar 2021 17:08:17 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lK1Nf-00EJNC-T8; Wed, 10 Mar 2021 17:08:15 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] baum: Fix crash when Braille output is not available
Date: Wed, 10 Mar 2021 17:08:15 +0100
Message-Id: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Rspamd-Server: hera
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Queue-Id: E18A218E
X-Spamd-Result: default: False [5.00 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; BAYES_SPAM(0.00)[19.23%];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 MID_CONTAINS_FROM(1.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]
Received-SPF: neutral client-ip=185.233.100.1;
 envelope-from=samuel.thibault@ens-lyon.org; helo=hera.aquilenet.fr
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When Braille output is not available, the backend properly reports being
unable to be created, but 5f8e93c3e262 ("util/qemu-timer: Make timer_free()
imply timer_del()") made the timer_free() call now refuse any NULL
parameter. char_braille_finalize thus now has to be more careful with
calling it on baum->cellCount_timer.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 chardev/baum.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 5deca778bc..aca5bf12fb 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -631,7 +631,9 @@ static void char_braille_finalize(Object *obj)
 {
     BaumChardev *baum = BAUM_CHARDEV(obj);
 
-    timer_free(baum->cellCount_timer);
+    if (baum->cellCount_timer) {
+        timer_free(baum->cellCount_timer);
+    }
     if (baum->brlapi) {
         brlapi__closeConnection(baum->brlapi);
         g_free(baum->brlapi);
-- 
2.30.1


