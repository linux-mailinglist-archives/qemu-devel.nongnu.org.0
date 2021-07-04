Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE33BAE68
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:50:11 +0200 (CEST)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m07By-0005HS-9P
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070y-0003Y4-PY
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070x-0006mp-6n
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t6so9321840wrm.9
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FN6OTXMHEFJFr00ceuHp4/qEHrZ4IjdpMf6H1iqmh0o=;
 b=AUZx9zmfMvkL0j0BW86VqIcCE15/3UymFw4K+GAIe6xaxSbCR4mjYc5mf88A+fH0hp
 i0r8XhKx4GCs9vlF36WYsPsISY0H3kyk6LFq/Bi3nbD0zsYt7AQnIcFOt6ac6R/7my8a
 +QCPOwj7CsGqCGWoVpcIFCVfuhYr5uZyhaSRUFV3I+euSL2Z+8slHYs6g8F2RrNtXrj3
 E8joCHH7yTTg2xKHYARtSjXDmxX99rcQOUwdI/one4VHlqDpEWJQogGfnm0nWBEtc8tA
 C3JH/qkHjdPCCA0yDpt1aAQRSrONSWZaPJv44yorXbR7WOPkB8R4213zo32QdUCUzMOp
 yO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FN6OTXMHEFJFr00ceuHp4/qEHrZ4IjdpMf6H1iqmh0o=;
 b=q/vuIhyxR5FYRRScx1FsIL9ujlqG87lqKFGudg7Yh7MhbHpm7HG1XrdypOPlH8aADs
 JSBHLjuct558iylZaBjh/PyKOq9+RSn6W7Mos423ZZc9rVvxVe6LyY3fSokmMnKh9gi0
 Ue5OJMheIYmN1OZK0J9gsbuVT5BOAu7C5mfwBXQUUpx6/wkzEu9Fg8Qj1tMqkwXE9RuT
 ++QFuBu+LaXtPDdAkBNabigdkBpxwzQx3L90vAgJ7bZb/r1LLro/gTsrtZpkeqP9Brj1
 9k7FJl4gfyalXMhlwUZUUrqyhF9DaOsbfXZiAlX/Wi9S6P5WN8WHiU3X5j79030dblKU
 ZEwA==
X-Gm-Message-State: AOAM531WB+MteALTIOntO4HeUyforxTW7wwlT4MXADEAlPbmbU4B3fx9
 FDaPotalwc+1cpUt8olr3VqTnDgxYwI=
X-Google-Smtp-Source: ABdhPJygt6f1ixP0zbFPf4sc7bOmerxQSiVEoOXM5JRMY6l39FF2zSvzUx0IpmoU4ISY7XBCAfXJ8w==
X-Received: by 2002:adf:a74a:: with SMTP id e10mr11188230wrd.185.1625423925746; 
 Sun, 04 Jul 2021 11:38:45 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w8sm11268801wrt.83.2021.07.04.11.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/12] linux-user/syscall: Refactor
 target_to_host_errno_table_init()
Date: Sun,  4 Jul 2021 20:37:53 +0200
Message-Id: <20210704183755.655002-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to move the errno handling code out of syscall.c,
first refactor the target_to_host_errno_table[] initialization
as a new init() function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 64bbf331b28..33b7fef12a8 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -509,8 +509,10 @@ static inline int next_free_host_timer(void)
 
 #define ERRNO_TABLE_SIZE 1200
 
-/* target_to_host_errno_table[] is initialized from
- * host_to_target_errno_table[] in syscall_init(). */
+/*
+ * target_to_host_errno_table[] is initialized from
+ * host_to_target_errno_table[] in target_to_host_errno_table_init().
+ */
 static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
 };
 
@@ -637,6 +639,17 @@ static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
 #endif
 };
 
+static void target_to_host_errno_table_init(void)
+{
+    /*
+     * Build target_to_host_errno_table[] table
+     * from host_to_target_errno_table[].
+     */
+    for (int i = 0; i < ERRNO_TABLE_SIZE; i++) {
+        target_to_host_errno_table[host_to_target_errno_table[i]] = i;
+    }
+}
+
 static inline int host_to_target_errno(int err)
 {
     if (err >= 0 && err < ERRNO_TABLE_SIZE &&
@@ -7102,7 +7115,6 @@ void syscall_init(void)
     IOCTLEntry *ie;
     const argtype *arg_type;
     int size;
-    int i;
 
     thunk_init(STRUCT_MAX);
 
@@ -7112,11 +7124,7 @@ void syscall_init(void)
 #undef STRUCT
 #undef STRUCT_SPECIAL
 
-    /* Build target_to_host_errno_table[] table from
-     * host_to_target_errno_table[]. */
-    for (i = 0; i < ERRNO_TABLE_SIZE; i++) {
-        target_to_host_errno_table[host_to_target_errno_table[i]] = i;
-    }
+    target_to_host_errno_table_init();
 
     /* we patch the ioctl size if necessary. We rely on the fact that
        no ioctl has all the bits at '1' in the size field */
-- 
2.31.1


