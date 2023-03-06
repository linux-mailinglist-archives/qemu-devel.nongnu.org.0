Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13B56ABA97
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:00:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ7d7-0003G4-TK; Mon, 06 Mar 2023 04:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1pZ7d2-0003Fk-H2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:59:36 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1pZ7d0-0007Qs-Pp
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:59:35 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8A88721EBF;
 Mon,  6 Mar 2023 09:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678096770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=kuP9Dd1VK28OkNDpdlf2bD/itcTK5vkenqxvGmdv+Vo=;
 b=gunfSoJHvCKdKLjVbGbZnLXzVOOPx825jSJohK9GrE5ywHuyaNSFj3WyMZ3VaXSU5Uu1cd
 ykEy4Jgp2cd7a6WJBgRnQmF4hsd1t4f2nhpXpfOKxRY67/pbiDDVARnPcn7/8NFhM6PJJr
 P/4JGBcXhv7ESlbNUL5SZyJZNNdqo0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678096770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=kuP9Dd1VK28OkNDpdlf2bD/itcTK5vkenqxvGmdv+Vo=;
 b=vjpuDc+Arn4njEmTfVIQ9BQQUHR0XJA1Eu/wTxiagi3J+EJZ/fBTLq3if0ZjLrFeI3+CD3
 ROmVOPe09d419BCg==
Received: from hawking.suse.de (unknown [10.168.4.11])
 by relay2.suse.de (Postfix) with ESMTP id 5AE8A2C141;
 Mon,  6 Mar 2023 09:59:30 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id A7413442EE0; Mon,  6 Mar 2023 10:59:29 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: fill out task state in /proc/self/stat
CC: qemu-devel@nongnu.org
X-Yow: ..  So, if we convert SUPPLY-SIDE SOYBEAN FUTURES into
 HIGH-YIELD T-BILL INDICATORS, the PRE-INFLATIONARY risks
 will DWINDLE to a rate of 2 SHOPPING SPREES per EGGPLANT!!
Date: Mon, 06 Mar 2023 10:59:29 +0100
Message-ID: <mvmedq2kxoe.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=schwab@suse.de;
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

Some programs want to match an actual task state character.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 36fffd36ca..eb4c2c3162 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8127,6 +8127,9 @@ static int open_self_stat(CPUArchState *cpu_env, int fd)
             gchar *bin = g_strrstr(ts->bprm->argv[0], "/");
             bin = bin ? bin + 1 : ts->bprm->argv[0];
             g_string_printf(buf, "(%.15s) ", bin);
+        } else if (i == 2) {
+            /* task state */
+            g_string_assign(buf, "R "); /* we are running right now */
         } else if (i == 3) {
             /* ppid */
             g_string_printf(buf, FMT_pid " ", getppid());
-- 
2.39.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

