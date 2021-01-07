Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C562EE888
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:27:19 +0100 (CET)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdkU-0002zl-My
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgO-0006Wy-2y
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:04 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgM-0004ZK-M1
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:03 -0500
Received: by mail-wr1-x429.google.com with SMTP id y17so7091601wrr.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fW0mwAJFoILMKm9wYoK9XOOf/CSaqeng2a0yxdXuwlk=;
 b=AH6CvUU40CZjmLEhU77ijgxJ0hPcSMVJ2GzOlTsKVCyXCFn5YpBwssc/U0Qs/dA6hn
 G0d9aoDgsdMQhvNtJj+FOu1D6AoghLx7jVtVuZrB3juWVTd/6kOmcUQlTsoVh8QCwF8/
 dK9th7CfpxglazqSCFZEEGkjpywpTrx5RlstQS5rsnMWHGN9VwYfJHutIBLLyU4g1gVN
 XLNCObf8hgaAVGAsdzAKclkUfGIUc80m3ZOe2pMrJ6+Idto37dbwYx7qd1okKyi8EXNv
 UKxvhPOXw+lyHe2I+u9lYHLl7HNcCZpvhT995xNTOOryONIvDtZ4aTEFrBCVbnTuG9kn
 e5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fW0mwAJFoILMKm9wYoK9XOOf/CSaqeng2a0yxdXuwlk=;
 b=MiUwnBJdX9KggWUyLSb2pZT21cIQgiX1JLgoVJ1mlWtpwP3ltZd+a4z4PNXy60lxGu
 yd1IsSJYT2J4seq084aTjGLbREZXKvF4NwsUAfYz1p/TcH2hxcCeBHRkWGtu9oOXt0hh
 mIhNXM5C5q5SwTvRbaPtUvuX80fBvVi9kK7lRmBCjQm08tUTgrSIxHA43jIu3oaVTqPC
 TPdqxKO1kRzDelXB0MZxWhVTm/5y65Njr0ECZXoqpURCw7/r2O1UYbVP4Kl+dwfriKIH
 4Ms4vJ3HjIGMiq3KzZsHRjIyRzxldnrS94zFDXzDkL3o3VOVQ8jC+6a48hrksAKeXrzm
 eTqA==
X-Gm-Message-State: AOAM530Bx8hbXXfYf6XY6UDl9zNeGNhFl7PH9Bf5iuliNEH2pvZUDlfZ
 zRN7ppJgte5K+4gIh50QHju8vSSkg4Y=
X-Google-Smtp-Source: ABdhPJxClHvusZYqPYf/w2zXO0+Cg3NpWMcgUHjWirXKV2TwoH7uxBpXmD1ODQrmjp71U9B2+y3JdQ==
X-Received: by 2002:adf:80ae:: with SMTP id 43mr705077wrl.50.1610058180999;
 Thu, 07 Jan 2021 14:23:00 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s20sm8990109wmj.46.2021.01.07.14.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/66] target/mips: Add CP0 Config0 register definitions for
 MIPS3 ISA
Date: Thu,  7 Jan 2021 23:21:48 +0100
Message-Id: <20210107222253.20382-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS3 and MIPS32/64 ISA use different definitions
for the CP0 Config0 register.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201201132817.2863301-2-f4bug@amsat.org>
---
 target/mips/cpu.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 4cbc31c3e8d..0086f95ea2a 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -828,7 +828,7 @@ struct CPUMIPSState {
 #define CP0EBase_WG 11
     target_ulong CP0_CMGCRBase;
 /*
- * CP0 Register 16
+ * CP0 Register 16 (after Release 1)
  */
     int32_t CP0_Config0;
 #define CP0C0_M    31
@@ -845,6 +845,14 @@ struct CPUMIPSState {
 #define CP0C0_VI   3
 #define CP0C0_K0   0     /*  2..0  */
 #define CP0C0_AR_LENGTH 3
+/*
+ * CP0 Register 16 (before Release 1)
+ */
+#define CP0C0_Impl 16    /* 24..16 */
+#define CP0C0_IC   9     /* 11..9 */
+#define CP0C0_DC   6     /*  8..6 */
+#define CP0C0_IB   5
+#define CP0C0_DB   4
     int32_t CP0_Config1;
 #define CP0C1_M    31
 #define CP0C1_MMU  25    /* 30..25 */
-- 
2.26.2


