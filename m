Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3E1769C1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 02:01:25 +0100 (CET)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8vw3-0008MW-RQ
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 20:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45317)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vko-0002UK-Ip
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkn-0004S8-HE
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:46 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45564)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkn-0004Rn-Bg
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:45 -0500
Received: by mail-pg1-x52e.google.com with SMTP id m15so653933pgv.12
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 16:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=foL1rvg06jdseiz3kkx95J3iuXxsSW7EjXYznpdqJsc=;
 b=LwqXWUsFHtaBgSBxNNecbMQNvMLS4eLgoy4sQtaLaTq0bBELtJc/MtV3wnT7PYoKe1
 pLWVp3BphCpELzM48Ti1O6WO/IQJM+h45+L7OYfGXc+t9DBdhI6p+qLixywCUuRfhjdK
 nBHde3Zz/p6XMcFfELUTvBxwOHKPNi8mvfO5oV9XhtD7P9ihFXJC2m42sdo+ZQjR+H76
 nFsWO1JOKSmT0tuKGllS6DoOrjtzSJFG3vKbYaihk1O72QL7UD+80cnW5cRKo24v3oM/
 XvANi7xM5qmv7BlS+OF1zBVgWtResAhlNWZEK7+HhaOe3I6ryNfnRf1rwvGW60wwop3W
 9pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=foL1rvg06jdseiz3kkx95J3iuXxsSW7EjXYznpdqJsc=;
 b=aBRjZIVt9qCDlQw3xTZey/cqnknG/bEgEnfYw1vAkYWBFFzB5I7/4BhPCqv+dyaVOF
 uMrfHpbcePC5GSvrDhT049tgjP+hzYeGve/DEOW5NIrhsjPS2g9jnvXRhVRme9WS/zRi
 b/b3SgNtv6ZNuRwsOozkLt4xGMteDViVKGLgKv0AATMM0yHnohM26FKJc2a8TrFCQzGn
 yMK0NWVxy3TkQyqdDY3eWkaXPlX6yFryYbdQFeGOPG0w5ppEfioa7c/wlpIk5kE9X0ZL
 RJzBRcv+b1pGRoE2NK6Tsd3GA3wUxokWvIYoZOBBk2Uyy9HRUZ+tiei0mzxLcZo3dyZX
 xLyw==
X-Gm-Message-State: ANhLgQ0FYMu8OZeTICL99ZRZGUNb6MrvVg0b77aNt9bS+scEPgTjLbSD
 /BHyGvGGJYHPqXgr22JI8LsV0Q==
X-Google-Smtp-Source: ADFU+vuXitAuijf8CFzKlkrlhhkS+oWk5gRwG/zgIBm8kCE2tVCnCmA8pXPYS5dLdAteD4Z42sA+0w==
X-Received: by 2002:a62:1b13:: with SMTP id b19mr1570914pfb.200.1583196584310; 
 Mon, 02 Mar 2020 16:49:44 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 7sm97169pjm.35.2020.03.02.16.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:43 -0800 (PST)
Subject: [PULL 26/38] target/riscv: Disable guest FP support based on virtual
 status
Date: Mon,  2 Mar 2020 16:48:36 -0800
Message-Id: <20200303004848.136788-27-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52e
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

When the Hypervisor extension is in use we only enable floating point
support when both status and vsstatus have enabled floating point
support.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 895b6ca25d..d9a29d702a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -99,6 +99,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 bool riscv_cpu_fp_enabled(CPURISCVState *env)
 {
     if (env->mstatus & MSTATUS_FS) {
+        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_FS)) {
+            return false;
+        }
         return true;
     }
 
-- 
2.25.0.265.gbab2e86ba0-goog


