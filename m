Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E655BED4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:41:09 +0200 (CEST)
Received: from localhost ([::1]:39408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64uK-0006JW-TF
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63G2-0003WG-BQ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:26 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63G0-00009v-2G
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:25 -0400
Received: by mail-pf1-x42e.google.com with SMTP id a15so10914775pfv.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BeS68NN3ViIVt950y4ivDmAvcVcb3oQ70+IeLQ73SLs=;
 b=jwGBVqhwFq3YqIFYlA19VFZ78Yp0mFy6lQ6e+XCYwsX1PsDtwfbOXDJRFKVWVLITZb
 oTPR4PG4WTFCisEr6CpNzQS9WUC1zxuz9/pDOdt9IU7BQ0ED/G4qcr+VIJtwtTPlcDZm
 TUMBwFYkT0T+Plcd6ib438HF2ABJ5hEarlAz/YuAQdbMWOiE6ILsaWtuUh9X9EP5+JRc
 1ODQ2WuzcqW7jLJQuWqpkz7I2QB+RaNremaXTwEzU2UksmTcZLsIpPf+J7lVg0463ZKL
 XAoBhJhwX/JnsmLxSYKZAbEFbKxp0p4JxkbxwBz7YsZwSCn7N+e44jBXSaHNF8fWkE7v
 ADUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BeS68NN3ViIVt950y4ivDmAvcVcb3oQ70+IeLQ73SLs=;
 b=lsTmC8aL7UEOwAdhPEvf9nqnb1jEtJXwmgQ13Asg53dpIXyLzCYmaUW9B4Qy0KqUrz
 QK0uGv7FRrc5zRVD5IsHdpF/dLwpFOHgc/zvqD33+SZnM5v/uF+VOV5qS5hdhZEx6lNq
 HdxyqNmiylRc6PYivmtZ9ke+E+XetwzCoTia0cwtrpxcMwaBO1BzL27AKmr/TuGVc6yY
 HSg5adtVZIYyziMb3s0fpTYgeEnf2i/0O/B3RS+kkmeSWW1hBrRA7nTk2glA9Ts8qwQ9
 paXDG3i1C2yf9QVWhGoFpfppN1OM8k7zqQ40mnuPXeOBIugTIwLUIxZ4bihzWSCSty6p
 ASig==
X-Gm-Message-State: AJIora+cYxqRslRu7oOMU44z+IelsR9aYSHdH5xvk5A0lkAoYaIybNDI
 KyrW2sFiqW6Kr1AVJNnR2dd7VkETi0Ss9Q==
X-Google-Smtp-Source: AGRyM1vY9erzRHV5CKxfc55qcbJb9CpHZLB76PJYPcRFhP2hQvZXFWiLAFL9wlrlLFGp1YDX1LqpaA==
X-Received: by 2002:a63:7d45:0:b0:40b:e6ad:8e80 with SMTP id
 m5-20020a637d45000000b0040be6ad8e80mr16354704pgn.59.1656392122573; 
 Mon, 27 Jun 2022 21:55:22 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 31/60] semihosting: Bound length for semihost_sys_{read,write}
Date: Tue, 28 Jun 2022 10:23:34 +0530
Message-Id: <20220628045403.508716-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Fixes a minor bug in which a 64-bit guest on a 32-bit host could
truncate the length.  This would only ever cause a problem if
there were no bits set in the low 32, so that it truncates to 0.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/syscalls.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 5cb12d6adc..eefbae74f1 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -283,6 +283,14 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
 void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                           GuestFD *gf, target_ulong buf, target_ulong len)
 {
+    /*
+     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
+     * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
+     * idea to do this unconditionally.
+     */
+    if (len > INT32_MAX) {
+        len = INT32_MAX;
+    }
     switch (gf->type) {
     case GuestFDGDB:
         gdb_read(cs, complete, gf, buf, len);
@@ -313,6 +321,14 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                            GuestFD *gf, target_ulong buf, target_ulong len)
 {
+    /*
+     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
+     * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
+     * idea to do this unconditionally.
+     */
+    if (len > INT32_MAX) {
+        len = INT32_MAX;
+    }
     switch (gf->type) {
     case GuestFDGDB:
         gdb_write(cs, complete, gf, buf, len);
-- 
2.34.1


