Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0172C28A0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:48:27 +0100 (CET)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYgE-0001KO-CI
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khYdy-0000s7-QX
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:46:06 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khYdu-0006wR-95
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:46:06 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so2912422wmb.5
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 05:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C2xrswIYQC3MHerh1wrJ1i0Bm0rEq5AoBCCydf63AYQ=;
 b=KGJ6N+gnHC4p7WgaBKxKTSWAyFrMgC3LXrZ1UbVk+meMzDgRW3RgieVRCkBnpQ8Qjm
 RI2j6FTAxpgYqGTe6SQdrfoY4AJYOB3gOVNAyxesUxOWB0gljloRrNLZEAdcL0cgROQN
 Yhr0EMa/OiOu0EusuUTXflcCF7bMG3t590Q8stE19MyKHjv8V9bqQAXfpWPEkWtncmqh
 WEYt9bQXIrz3xnhmLMJlY5wXBLA8RaD4Z7KgVSuiJxlhSGQnzUt8DGcbyzUABXpFDAhB
 JYz5O4o5xii44SJTuXKMPabehBXeDt2hlH8IAiYgVtF6m+l6ks3no7gvlsE0G59WtGTH
 ac9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=C2xrswIYQC3MHerh1wrJ1i0Bm0rEq5AoBCCydf63AYQ=;
 b=il3UvLLrImo6kiR2Y7qU2ZBH/yk9oxIM0QGq/6VPoNIg3cpQYRoAgVLB3hLoMEbZ+k
 XRUi6qo58uCwrGk36xa1JSlaCllWgnpesAv/6THQ/mfGrwJT+w8ey8qTMZeELl6hUoxj
 NYSb8TlSR9ig+J6oSK0Bs7JuVuiUjFNyatDy6QVv0agBRz/h1RvkbXFmmSXXtoMjPw/i
 k07ph90IBM9lxBUe0R6vGkAPB66vPIfqLi6LYuI+k95VzlKB7dsBw3Rt7rEBb0OTis6a
 XwaaOQc4CnDSv7XgIZgzifPSHm+qstw83E2X9KQMQ1QlASSpc+NJ7+XHX104fenLoZtF
 sG+w==
X-Gm-Message-State: AOAM533iR3+vuA8YIQ8G2uwhvTQ+ac7nqr1IxnW7MvbIB+USGdZaUuOC
 CKbVStB5qDqu8udn+xzOE3LRmow3CYo=
X-Google-Smtp-Source: ABdhPJyW35xLXLxXXgJqhg4M3z2cGls94V0ljRdjsJqr397GIdDbfQ9t5vkP9bX8583wPM4ggqo4Ug==
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr4648565wma.48.1606225559244; 
 Tue, 24 Nov 2020 05:45:59 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id n9sm5435719wmd.4.2020.11.24.05.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 05:45:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2?] target/mips/translate: Check R6 reserved encoding
 for Load Linked Word
Date: Tue, 24 Nov 2020 14:45:57 +0100
Message-Id: <20201124134557.569388-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mateja Marjanovic <mateja.marjanovic@rt-rk.com>,
 "Maciej W . Rozycki" <macro@linux-mips.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Release 6 recoded the 'Load Linked Word' using SPECIAL3 opcode,
this opcode (0b110000) is now reserved.

Ref: A.2 Instruction Bit Encoding Tables:

  "6Rm instructions signal a Reserved Instruction exception
   when executed by a Release 6 implementation."

The check was added in commit 4368b29a26e ("target-mips: move
LL and SC instructions") but got lost during latter refactor
in commit d9224450208 ("target-mips: Tighten ISA level checks").

Fixes: d9224450208 ("target-mips: Tighten ISA level checks")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index c64a1bc42e1..b1e7c674d3f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -30993,6 +30993,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
          break;
     case OPC_LL: /* Load and stores */
         check_insn(ctx, ISA_MIPS2);
+        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
-- 
2.26.2


