Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3774D55BE95
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:05:46 +0200 (CEST)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64M4-0007LZ-Rr
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FW-0003Ev-BC
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:55 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FU-0008L7-Jc
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id jb13so10016754plb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjQBlXjjbHpBXE089hJEGJBlz6b/dSudHA99LN0l1yc=;
 b=xCXeg5zhkteR4z5nAJ/sR0LDfQDaEIGXNiE3Erxf2tRLB/VS2xNNvLgTUFUSRjq9Fu
 7u1/AuE+zeiZuUtCe8zBU7ARUKonHFJI/u5dBPcVI+2jeLWcS6A5ibQsiTpP0jStogqo
 xp03JLYUuRcQ7TD9S4dQS4XJRmiwF17U149m239vPjkqVc9b6OBQpc9ONcauLPRUshOA
 fhRT1TgJdAHNkk6ZDN1hE6K391g8zHWPDUHiqOhvqm7iMXFWzsotbAi3oGDYSEuCLPJ7
 u9rPfD5XynkkbA0UXBuSY0QYIBWgmz0eEaI1MyzefgwQ52WiZ3AO1Q1abD+zfSXxY6SZ
 X8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NjQBlXjjbHpBXE089hJEGJBlz6b/dSudHA99LN0l1yc=;
 b=30BJrKJE0Pcm13AP7ZLfIJ+lIjmaYpwgzijM9Zs6oo1O7VSbAUAiEmY3pppYt0Sc+p
 tENONaY2uHnHQ/a/7553geQ/OKCtf29fy8pJFgiQFlMkxbJzFSKl1TIq1ua2k/oDxIqZ
 0Wfuhi+MVK6PTajtXxw/PI+/iZWsJ3FIbx9l94aH1Gfc4cTbS5JTa1e5tkLVrxGdAxtX
 +horATm1Fy9FYuAau2eIOEbJfzhjkK82SjpmJ0ZBZwqZYnDDphgINLoR36O+8eM6rbWw
 3oEusKRVN6bUy7Yo3JqUuDfcubi4ctTkhfibT7CeATDaywa4grsH+9vDr72ivXZr/wSS
 T4bA==
X-Gm-Message-State: AJIora+1/Zqy1GOFZd+DkozHIOuDyJiOZlTDMNqob5Y0hmgVQVZkmXk0
 Cu+fufBCNJfz49Qh8M6DWSC5bEGEHOLPlA==
X-Google-Smtp-Source: AGRyM1sPcVRE9KOtgi6Jt5cMu5D0mbLTuzbJDLVz99lm20X6/QCf4b2XhfwNcp8KYWQLh1KMpWRgjg==
X-Received: by 2002:a17:902:e849:b0:16a:32d9:7226 with SMTP id
 t9-20020a170902e84900b0016a32d97226mr1778008plg.81.1656392091241; 
 Mon, 27 Jun 2022 21:54:51 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 18/60] include/exec: Define errno values in gdbstub.h
Date: Tue, 28 Jun 2022 10:23:21 +0530
Message-Id: <20220628045403.508716-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define constants for the errno values defined by the
gdb remote fileio protocol.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 7413ffeba2..95a8b7b056 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -19,6 +19,28 @@
 #define GDB_O_TRUNC   0x400
 #define GDB_O_EXCL    0x800
 
+/* For gdb file i/o remote protocol errno values */
+#define GDB_EPERM           1
+#define GDB_ENOENT          2
+#define GDB_EINTR           4
+#define GDB_EBADF           9
+#define GDB_EACCES         13
+#define GDB_EFAULT         14
+#define GDB_EBUSY          16
+#define GDB_EEXIST         17
+#define GDB_ENODEV         19
+#define GDB_ENOTDIR        20
+#define GDB_EISDIR         21
+#define GDB_EINVAL         22
+#define GDB_ENFILE         23
+#define GDB_EMFILE         24
+#define GDB_EFBIG          27
+#define GDB_ENOSPC         28
+#define GDB_ESPIPE         29
+#define GDB_EROFS          30
+#define GDB_ENAMETOOLONG   91
+#define GDB_EUNKNOWN       9999
+
 /* For gdb file i/o stat/fstat. */
 typedef uint32_t gdb_mode_t;
 typedef uint32_t gdb_time_t;
-- 
2.34.1


