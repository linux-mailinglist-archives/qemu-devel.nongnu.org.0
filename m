Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C905652F6BD
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:24:32 +0200 (CEST)
Received: from localhost ([::1]:43912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCv1-0006om-Ss
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbu-0008B0-Ua
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:46 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbZ-0003yV-5M
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:39 -0400
Received: by mail-pl1-x633.google.com with SMTP id q4so8553498plr.11
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WN+exJ1hbQPzvMVT+L6AO18pYzO8jIYQwhbqxtMuNbU=;
 b=j3mwiRnWOm6xJO4niiOTKABBso0CB+lFjaSPON/oN71B7gjLR/+9ACd+HpY8FppmLI
 zW91gN8az12Y1HzChyG6SWVVKKq+rzWmC8PafJWDIX/HVG7l+iU6cOXFBMv5yrANCkwM
 3j7Jl2MN1hpcYQ8i9ktLk9tsnphyykBoZCpyvyY/04dnxGllrgC9LL89wdFIjyGsP/UV
 1wfpSlyeo/8d/g4J9A2VP8HUv594mnaM3WTkfOzneb2hQW5nBtN5a28saGo1yRlnxUVs
 EZfHwlVQ18WyrkUOOghUJmYMV5fGmeCCU8ONf7pH55OT458zt+12KrU1qaWdWafzPqKV
 IGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WN+exJ1hbQPzvMVT+L6AO18pYzO8jIYQwhbqxtMuNbU=;
 b=MTq7PbamAgn6YBKjnTdOfHCs+PdFh2+6hs3WLZ4vUSYunqBP/IXNeoSOzhs3necZNR
 9pGLaEHn7nRS+pEuTP+gxTGW+6bhTaHkSIFlQn507ellQc7jDE/7EBqHjE+utWd6s4rA
 r37n+2ijNYWAGF+QIDh3BZHA4xXh06awYhiHXu1YoYwm4yuj6Zu5KJ1d+uBO0/1+Adff
 qMwq4eMU5aiDbU6BNUVIW9iAOappsmxdhgb/7aRro+k1gpr0T+EAFeTxgbWdYW0gb5+/
 iCbevAXuR4nonCSg/rC2oF5Kvoo1e0xGlr6NS64qOQSupIK6elvm9BgTGszBK9viSVpO
 ANKg==
X-Gm-Message-State: AOAM530HvaWo0Lu4LprJyfu6JzQKb9b6W0jQ8a+ZSNvhNopp7cROKRoy
 /h4AhYB1Ix/V7Jc69MbqfOhN9Cf/NKwtOA==
X-Google-Smtp-Source: ABdhPJxDdwZhDcH5157a/EUtRaZlbYHqv40gC6aj5rw6a0hmHvHKAlzP65ZCLtBpoZSFiDYU8gRWhw==
X-Received: by 2002:a17:902:ef45:b0:156:1858:71fc with SMTP id
 e5-20020a170902ef4500b00156185871fcmr11692853plx.23.1653091461501; 
 Fri, 20 May 2022 17:04:21 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 16/49] include/exec: Define errno values in gdbstub.h
Date: Fri, 20 May 2022 17:03:27 -0700
Message-Id: <20220521000400.454525-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 33a262a5a3..0a6e0d6eeb 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -20,6 +20,28 @@
 #define GDB_O_TRUNC   0x400
 #define GDB_O_EXCL    0x800
 
+/* For gdb file i/o remove protocol errno values */
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


