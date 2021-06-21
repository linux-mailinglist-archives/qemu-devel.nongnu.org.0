Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1649F3AE621
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:36:31 +0200 (CEST)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGM2-0000B8-6I
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1lvGIg-0005V2-Th
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:33:03 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:60744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1lvGIf-0007Ia-6z
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:33:02 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D454121962;
 Mon, 21 Jun 2021 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624267979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=eqRE7qmcA+ACgFVUsG730VxH4AJiybneGdnbtljZOVs=;
 b=CUWTApyQJmggTBFwln+jgbgvOiGjxwfCkiuOADIrGmLNlQA7m3m+n4BwwCWyk4jb1GF9Cj
 KKu0Qye0t+VLT+tVGQExHl/N0MGdrNSv+87lRCZg0qhijMQVeHrNCY5yxc9bJ4aPKSHZCf
 llkQ/HN/l36R88JFGa+e6s1w9CfxNd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624267979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=eqRE7qmcA+ACgFVUsG730VxH4AJiybneGdnbtljZOVs=;
 b=L0GhVgc/C4LJxK6yF7WfvBHJHPSUKLY25GaQi3qbtzqKiWhqPrB6vAzyPD2kjxrLTGAAw5
 jvFW+LVi7FXCa9Bg==
Received: from hawking.suse.de (hawking.suse.de [10.160.4.0])
 by relay2.suse.de (Postfix) with ESMTP id CDCF3A3BAC;
 Mon, 21 Jun 2021 09:32:59 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id C20D344618D; Mon, 21 Jun 2021 11:32:59 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: fill ppid field in /proc/self/stat
X-Yow: I'm having BEAUTIFUL THOUGHTS about the INSIPID WIVES
 of smug and wealthy CORPORATE LAWYERS..
Date: Mon, 21 Jun 2021 11:32:59 +0200
Message-ID: <mvmwnqnef5g.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 974dd46c9a..dababe463c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7940,6 +7940,9 @@ static int open_self_stat(void *cpu_env, int fd)
             gchar *bin = g_strrstr(ts->bprm->argv[0], "/");
             bin = bin ? bin + 1 : ts->bprm->argv[0];
             g_string_printf(buf, "(%.15s) ", bin);
+        } else if (i == 3) {
+            /* ppid */
+            g_string_printf(buf, FMT_pid " ", getppid());
         } else if (i == 27) {
             /* stack bottom */
             g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
-- 
2.31.1

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

