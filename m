Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6D6E15F4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:36:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3bz-0003i9-7L; Thu, 13 Apr 2023 16:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bs-0003fG-FX; Thu, 13 Apr 2023 16:32:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bn-0003i1-TR; Thu, 13 Apr 2023 16:32:00 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7D0C64012D;
 Thu, 13 Apr 2023 23:31:51 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 0871895;
 Thu, 13 Apr 2023 23:31:50 +0300 (MSK)
Received: (nullmailer pid 2344325 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:50 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 01/21] qga: Drop dangling reference to
 QERR_QGA_LOGGING_DISABLED
Date: Thu, 13 Apr 2023 23:31:13 +0300
Message-Id: <20230413203143.2344250-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Markus Armbruster <armbru@redhat.com>

slog()'s function comment advises to use QERR_QGA_LOGGING_DISABLED.
This macro never existed.  The reference got added in commit
e3d4d25206a "guest agent: add guest agent RPCs/commands" along with
QERR_QGA_LOGGING_FAILED, so maybe that one was meant.  However,
QERR_QGA_LOGGING_FAILED was never actually used, and was removed in
commit d73f0beadb5 "qerror.h: Remove unused error classes".

Drop the dangling reference.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230207075115.1525-9-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
(cherry picked from commit c40233593ed5732de1676412527e42431e33e62c)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/commands.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 7ff551d092..6cf978322e 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -32,9 +32,8 @@
 #define GUEST_FILE_READ_COUNT_MAX (48 * MiB)
 
 /* Note: in some situations, like with the fsfreeze, logging may be
- * temporarilly disabled. if it is necessary that a command be able
- * to log for accounting purposes, check ga_logging_enabled() beforehand,
- * and use the QERR_QGA_LOGGING_DISABLED to generate an error
+ * temporarily disabled. if it is necessary that a command be able
+ * to log for accounting purposes, check ga_logging_enabled() beforehand.
  */
 void slog(const gchar *fmt, ...)
 {
-- 
2.30.2


