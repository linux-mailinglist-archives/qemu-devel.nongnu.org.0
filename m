Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586B16CEC4C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 17:01:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phXHZ-0001v7-1M; Wed, 29 Mar 2023 11:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1phXHW-0001uc-6r
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:00:10 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1phXHT-0002tH-W0
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:00:09 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A7EAF219DF;
 Wed, 29 Mar 2023 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680102006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=413ueEYEmyt27Rm1rW4LT1zCrXreN2d/eBN9gifhJc0=;
 b=h14/y7l9JmYnfZsvA2ar17cdHv6MCSWx3PHYVb1jR9426T9orsc+wXSKsq13HiKUUyxTbZ
 IUHH91J5IdZJHbdDBUvgh0BJ6NKnzUO3H8qeMmpuK+vjTiEQvIuTHlfhDOiQwdM8AQ522z
 vW2WVgMyM5ZRpYj7HBc0+b2uyJHlJgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680102006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=413ueEYEmyt27Rm1rW4LT1zCrXreN2d/eBN9gifhJc0=;
 b=0XUev+9GLS3GxX268VjmytYW+zROtxcuNLtZTpowC+/YoaB5VFFGm2HNG8JUrbfUbosnAi
 RZBAp2Vn23Pl1YAQ==
Received: from hawking.suse.de (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id 8FE582C188;
 Wed, 29 Mar 2023 15:00:06 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id 4C9A44A0378; Wed, 29 Mar 2023 17:00:06 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v3] linux-user,
 bsd-user: preserve incoming order of environment
 variables in the target
CC: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel@nongnu.org
X-Yow: Where does it go when you flush?
Date: Wed, 29 Mar 2023 17:00:06 +0200
Message-ID: <mvmlejfsivd.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=schwab@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Do not reverse the order of environment variables in the target environ
array relative to the incoming environ order.  Some testsuites depend on a
specific order, even though it is not defined by any standard.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 bsd-user/main.c   | 10 +++++++++-
 linux-user/main.c | 10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 89f225dead..eff834e8d8 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -298,8 +298,16 @@ int main(int argc, char **argv)
 
     envlist = envlist_create();
 
-    /* add current environment into the list */
+    /*
+     * add current environment into the list
+     * envlist_setenv adds to the front of the list; to preserve environ
+     * order add from back to front
+     */
     for (wrk = environ; *wrk != NULL; wrk++) {
+        continue;
+    }
+    while (wrk != environ) {
+        wrk--;
         (void) envlist_setenv(envlist, *wrk);
     }
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 4b18461969..f0173ceefa 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -690,8 +690,16 @@ int main(int argc, char **argv, char **envp)
 
     envlist = envlist_create();
 
-    /* add current environment into the list */
+    /*
+     * add current environment into the list
+     * envlist_setenv adds to the front of the list; to preserve environ
+     * order add from back to front
+     */
     for (wrk = environ; *wrk != NULL; wrk++) {
+        continue;
+    }
+    while (wrk != environ) {
+        wrk--;
         (void) envlist_setenv(envlist, *wrk);
     }
 
-- 
2.40.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

