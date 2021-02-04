Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6AF30F6A0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:44:40 +0100 (CET)
Received: from localhost ([::1]:47182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7goA-0006kW-Va
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jason@zx2c4.com>) id 1l7gjO-00030V-0N
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:39:42 -0500
Received: from mail.zx2c4.com ([104.131.123.232]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jason@zx2c4.com>) id 1l7gjK-0002Oj-7a
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1612453173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dr4rQZbGbc/VL5lm5IbTJmHVcud2noviZG6/MiSOg98=;
 b=Fq4YgKLN6iyBnScWaLcJn0c4/5IgFsgdSa2QvYFKmCX0d+iGqUGvHy1y0/5TavdIQS9BWY
 RwQkv2G09i0SnkbL1HiHc/iLyvZ6s4Kswh0POwHuMV7OzrWpVpoftFNetn1uSRHG2k9LMC
 SU/7e9BO4JypXW+WPu3oJpj4uoAnPCs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8ba96afa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 4 Feb 2021 15:39:32 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: add TARGET_SO_{DOMAIN,PROTOCOL}
Date: Thu,  4 Feb 2021 16:39:25 +0100
Message-Id: <20210204153925.2030606-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=104.131.123.232; envelope-from=Jason@zx2c4.com;
 helo=mail.zx2c4.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These were defined for other platforms but mistakenly left out of mips
and generic, so this commit adds them to the places missing. Then it
makes them be translated in getsockopt.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 linux-user/generic/sockbits.h | 3 +++
 linux-user/mips/sockbits.h    | 2 ++
 linux-user/syscall.c          | 6 ++++++
 3 files changed, 11 insertions(+)

diff --git a/linux-user/generic/sockbits.h b/linux-user/generic/sockbits.h
index e44733c601..b3b4a8e44c 100644
--- a/linux-user/generic/sockbits.h
+++ b/linux-user/generic/sockbits.h
@@ -55,4 +55,7 @@
 #define TARGET_SO_ACCEPTCONN           30
 
 #define TARGET_SO_PEERSEC              31
+
+#define TARGET_SO_PROTOCOL             38
+#define TARGET_SO_DOMAIN               39
 #endif
diff --git a/linux-user/mips/sockbits.h b/linux-user/mips/sockbits.h
index 0f022cd598..562cad88e2 100644
--- a/linux-user/mips/sockbits.h
+++ b/linux-user/mips/sockbits.h
@@ -40,6 +40,8 @@
 #define TARGET_SO_SNDTIMEO     0x1005  /* send timeout */
 #define TARGET_SO_RCVTIMEO     0x1006  /* receive timeout */
 #define TARGET_SO_ACCEPTCONN   0x1009
+#define TARGET_SO_PROTOCOL     0x1028  /* protocol type */
+#define TARGET_SO_DOMAIN       0x1029  /* domain/socket family */
 
 /* linux-specific, might as well be the same as on i386 */
 #define TARGET_SO_NO_CHECK     11
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 34760779c8..264b3265b1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2832,6 +2832,12 @@ get_timeout:
         case TARGET_SO_ACCEPTCONN:
             optname = SO_ACCEPTCONN;
             goto int_case;
+        case TARGET_SO_PROTOCOL:
+            optname = SO_PROTOCOL;
+            goto int_case;
+        case TARGET_SO_DOMAIN:
+            optname = SO_DOMAIN;
+            goto int_case;
         default:
             goto int_case;
         }
-- 
2.30.0


