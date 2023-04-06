Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5766D9732
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:46:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkP0H-0006KK-Pd; Thu, 06 Apr 2023 08:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark@qpok.net>)
 id 1pkOzt-00066A-9t; Thu, 06 Apr 2023 08:45:50 -0400
Received: from box.qpok.net ([212.71.237.253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mark@qpok.net>)
 id 1pkOzr-00018w-1m; Thu, 06 Apr 2023 08:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=qpok.net; s=mail;
 t=1680785144; bh=djS7Op4pnwVsDeLZ5KuAHBM/nU4vwLVFXbuUGmAv0Yw=;
 h=From:To:Cc:Subject:Date:From;
 b=gIV8DisXUKJ0yFcRxWgAJ8S1gvbLZEA2TmQn1BPTCJu6FPN9vITND/6l9MzxJAP5z
 64QSCZg/VtEXCnRYpMZDclkF78v7E3ySqBvOKGRjhYUwT+bkYLf2zkqaoFa9Ep/Xmr
 OkW4kZFo6DOcC1a+RFTW8vDnq5wj2l2TnpKZRbapLV3tUoAIYx8L0wLo6H3TR0TN5w
 VBILXtf/pIwC0V1xQeE5jyboNOwb8BuoXTjggYF9WzYYd44J4Pq5pHm5dLDJZpKV6U
 7L98vhmUtnT7ppScW8l8mbQCz4D6BGS/jJFuCObAcS8/JLjy1+wIRSTY8pdbhlsSto
 dTKHCu+XzVM/g==
Received: from authenticated-user (box.qpok.net [212.71.237.253])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by box.qpok.net (Postfix) with ESMTPSA id B10FC40180;
 Thu,  6 Apr 2023 13:45:44 +0100 (BST)
From: Mark Somerville <mark@qpok.net>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-trivial@nongnu.org,
 Mark Somerville <mark@qpok.net>
Subject: [PATCH v2] qga: Fix suspend on Linux guests without systemd
Date: Thu,  6 Apr 2023 13:45:31 +0100
Message-Id: <20230406124531.9827-1-mark@qpok.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.71.237.253; envelope-from=mark@qpok.net;
 helo=box.qpok.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Allow the Linux guest agent to attempt each of the suspend methods
(systemctl, pm-* and writing to /sys) in turn.

Prior to this guests without systemd failed to suspend due to
`guest_suspend` returning early regardless of the return value of
`systemd_supports_mode`.

Signed-off-by: Mark Somerville <mark@qpok.net>
---
v1: Identical to this version(!) but missing from qemu-devel... Sincere
    apologies to anyone receiving this patch twice. I ran up against a
    deeply frustrating and depressing SMTP issue which should now be
    resovled.

 qga/commands-posix.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 079689d79a..59e7154af4 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1918,10 +1918,10 @@ static void guest_suspend(SuspendMode mode, Error **errp)
     if (systemd_supports_mode(mode, &local_err)) {
         mode_supported = true;
         systemd_suspend(mode, &local_err);
-    }
 
-    if (!local_err) {
-        return;
+        if (!local_err) {
+            return;
+        }
     }
 
     error_free(local_err);
@@ -1930,10 +1930,10 @@ static void guest_suspend(SuspendMode mode, Error **errp)
     if (pmutils_supports_mode(mode, &local_err)) {
         mode_supported = true;
         pmutils_suspend(mode, &local_err);
-    }
 
-    if (!local_err) {
-        return;
+        if (!local_err) {
+            return;
+        }
     }
 
     error_free(local_err);
-- 
2.40.0


