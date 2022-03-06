Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C514CEBB5
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:26:07 +0100 (CET)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqti-0002Ta-9x
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:26:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqW0-0001LZ-Ap
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:39 -0500
Received: from [2a00:1450:4864:20::42e] (port=38588
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVy-00041i-Sp
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t11so19341086wrm.5
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4vyygDOBnk9bKTxtb+m75TQN1xCbltFK11ClvcGoXRc=;
 b=cdC5ozCHo1AYa+D4A747xx8L7TKxqTSRBKECm5hVWcRonloZ8Axd55QgqP5D1d61yh
 CD6fmDrQO5ZA9LuwyhYeDBz0SIKFZpGamjZJZXqE90SJ/BXpExFCA0gXHN99inaIgUyu
 YnPKtwuB/atkr3YBS33TJosaBkqhyMFfbnsPEnrpquVZJUGp7dZhy9ozxV78SEQaFCkp
 RAG2N34dMjSRi/X3t7gaNSKn3t05gWnqMSkwwtf0fWYwRRX1b/SKjFVCNwDrESDABNU9
 2LqkkL8VqWSh46aHLsUr8HAd9xeVwjZ6zlCByJfy3tlFnmK+PohG1zQT4jwDBXUCugpZ
 vJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4vyygDOBnk9bKTxtb+m75TQN1xCbltFK11ClvcGoXRc=;
 b=Tr+EXs2mVWoodvj6GDRXP5sSrd51DUnCeH1ZAvemAcXslTsRF3Iu2AimW0Ue9usDE6
 /wN0J9wsk7tlM8W4J7yBtoxvKf0PFAf/UiOE9lJJt2+iUiDb1qJI19QYAI0Yg7MUQ+8x
 NxsvRbeGgDDUbttRTopovSbCIGP3pkz8PR0KnWpbYVhoFYTmJc7xp+9ddq8uIbxNl5ho
 X1inswaTAKU3sCrPbPiMHYxhgrPho4rNsNzlhmhB49e90gMQ5KkFlWw6MBfmZgyy/XqD
 Ozqspi3NsvgABPgCZS9q3LQN+iwXBWnxnaHoHblEGB2617cVA1eifm+Q2yLBK38t+eg8
 CVtA==
X-Gm-Message-State: AOAM530PLz04ag3kkC39d2OSsrjS7OFbK5aMkOUgecZohXcwPtr+kVRo
 p22MxCLEY23hLtVjnfsknQrG/vajKRE=
X-Google-Smtp-Source: ABdhPJyk2kWyvD1VVSDXMFoy6h+X8UoF5J0FOrV1xu6dxhLtUE13OZi10QfFlK1eb6oYxE0Ha7fBBg==
X-Received: by 2002:a5d:66c5:0:b0:1f1:d7e3:7068 with SMTP id
 k5-20020a5d66c5000000b001f1d7e37068mr5080724wrw.410.1646571693293; 
 Sun, 06 Mar 2022 05:01:33 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b00381807bd920sm11164766wmq.28.2022.03.06.05.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] exec/gdbstub: Make gdb_exit() / gdb_set_stop_cpu()
 target agnostic
Date: Sun,  6 Mar 2022 13:59:44 +0100
Message-Id: <20220306130000.8104-18-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

gdb_exit() and gdb_set_stop_cpu() prototypes don't have to be
target specific. Remove this limitation to be able to build
softmmu/cpus.c and softmmu/runstate.c once for all targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-19-f4bug@amsat.org>
---
 include/exec/gdbstub.h | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index a024a0350df..89edf94d286 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -45,17 +45,6 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
  */
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
-void gdb_set_stop_cpu(CPUState *cpu);
-
-/**
- * gdb_exit: exit gdb session, reporting inferior status
- * @code: exit code reported
- *
- * This closes the session and sends a final packet to GDB reporting
- * the exit status of the program. It also cleans up any connections
- * detritus before returning.
- */
-void gdb_exit(int code);
 
 #ifdef CONFIG_USER_ONLY
 /**
@@ -165,7 +154,7 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
 #define ldtul_p(addr) ldl_p(addr)
 #endif
 
-#endif
+#endif /* NEED_CPU_H */
 
 /**
  * gdbserver_start: start the gdb server
@@ -177,6 +166,18 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
  */
 int gdbserver_start(const char *port_or_device);
 
+/**
+ * gdb_exit: exit gdb session, reporting inferior status
+ * @code: exit code reported
+ *
+ * This closes the session and sends a final packet to GDB reporting
+ * the exit status of the program. It also cleans up any connections
+ * detritus before returning.
+ */
+void gdb_exit(int code);
+
+void gdb_set_stop_cpu(CPUState *cpu);
+
 /**
  * gdb_has_xml:
  * This is an ugly hack to cope with both new and old gdb.
-- 
2.35.1


