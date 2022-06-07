Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F1541EAB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:33:25 +0200 (CEST)
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhlM-0005SA-1z
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5i-0007Gg-6e
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5g-0001Nf-Kr
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:17 -0400
Received: by mail-pg1-x534.google.com with SMTP id r71so17016008pgr.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kx+MEVjvVE2Ahq5JmBhmO/kM2x5CWc0DLkolZoxHrtg=;
 b=TmAe1kqu26MoZ3025tAqmAztniaP7vSJwLu18oFfWJar2vyqhsJMpzLhwbQ9SfCZNd
 F3yHo1q+kes19j/sTixS6NqgZU0xdjPnYY6yqFaJZ19WHdS9THn/UZCgEmWRDTJ9wBPy
 tUL6/1SKAnRm5sDp18WZhDo7QLzNPQX/4uyfsLiqTLCAUXdP5xpVxNoCgkItqJ2A5IQ8
 qU0fBU5YUW3ajS/IEulXgdDkE7sxOMGLGIryCKvhpX6ZIViMps706oZnEPf1iqUO93KO
 tfl+UUG91LzXe+luTrwJ0C+vP1aVbhrvi4lvfzLWmw4TsMlg2Z1ikBnhRjUggQw33Shx
 u7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kx+MEVjvVE2Ahq5JmBhmO/kM2x5CWc0DLkolZoxHrtg=;
 b=2VbRZiRav2eulH0qRL86rD1elVqJJZrAa0azyhN0D+0J27mbpQdiu9TvsckcdGIKcF
 SQj9EcX2wZnMKOTsVHbgJg05+J46moI56wYjlP9dYt+OxomOScbnbVpv+pRB9vt56YWl
 2bE0NRZeFR0MYYfJJV5h+iF2w1sTAq6cjtp2OBe9r/lkWWN8A9fSiM+jRJQ2kDz0C72V
 FlDoBkmdJHIgL7iBNLPYd2iTfPwq14X1Yt2yfO8/NwUBeL6Clw8FqL1okFTW1c6Ztrcc
 75etdbwvkxfaaBWVznHK1pYdccs7Do1EkYmo4xFKnHM+QCRDJ6Rpx/NYOW9dN/nbOrcn
 lB+g==
X-Gm-Message-State: AOAM531nuizymdnWP8pxXra7O5jGa8G8mXo9uaQPdjUXBvUA8cvRJ63Z
 8nCdQ3Ogy8DWkgteDjmt3dhz7R61mK/ueg==
X-Google-Smtp-Source: ABdhPJyEAPuQrxqn9mCdD5WCha2R9mt5x0kOglPF8BM1HMCJacdOJyygXKLQzRrpsCK24sHB0IeyZQ==
X-Received: by 2002:a63:9142:0:b0:3fc:c021:e237 with SMTP id
 l63-20020a639142000000b003fcc021e237mr27412081pge.279.1654634775383; 
 Tue, 07 Jun 2022 13:46:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 18/53] include/exec: Define errno values in gdbstub.h
Date: Tue,  7 Jun 2022 13:45:22 -0700
Message-Id: <20220607204557.658541-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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


