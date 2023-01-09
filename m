Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC7663118
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:13:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRk-00031t-DU; Mon, 09 Jan 2023 15:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRd-0002uA-VA
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:34 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRa-0007OD-N0
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:33 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so12049511pjb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Jm8IvT8OnM6ntzNw++ITlfcs7TcV+gT1sswHnCP9Os=;
 b=HczyxnSG1cF3PnQGsi52Gld1no8ZC6NNK9Yta5ipxLu4TSYu0jIaqeAR+fWaoWPrBS
 v40cagqJBXHuzDVRqUOmm1jsAPzRqTrYIqa+VP8SsDPCW4Bc+MA5Q7mmyooEtC5YAig0
 u84TXqluJVK8JoddqpZVnuQwqhA1GvSsqvc6ZlSs0CfoJMRhdtQa78cFUGwMqjjtUfUD
 8Mmerl00BdedGZA0exoWCCobNOgZdYYjK8ricp+q8sdWtU+lsCbLQmDi4Br4cvn6gjCJ
 azJ+v/dSmhOsoN3IfWcXbbH/qDRnEnfg9uri55V4xSltLDRibh/6aWi6XjxXamT7aXxe
 Me8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Jm8IvT8OnM6ntzNw++ITlfcs7TcV+gT1sswHnCP9Os=;
 b=BLx6ud5bHpbgHDsrPn1wqxKZazwclE5oFD0BGP7GlXO7fIB/2X6DQ9yARB3D47xM0o
 NYP6aMY0hQG1iH1Vaf+ng+rW71435iTgDFYccNNSvPQq6k9coy6hBp9lj6IJ8gPpkS6e
 F0NLNTTEM84CHxgcknHPlPQrPRrvYxHp8edB1T6mVs91gF44LXHQnJEqsOfZMEhlcauY
 Ji2oGVsOXY/qvtXEop5xO9NNnAlD8ZWx9wj2HJjJOdCcwxcHbiAeBVgBUpLGSTpUaCoi
 ekj95WEnJ0XKhD5QfsmT1v7YHlK5WzJMndN1idJG4T37AHb1s1tmIXRYrLHsTWLxCZOX
 TxgQ==
X-Gm-Message-State: AFqh2kpxhehMBPLGW9iqdmSSBxD5pHKeHS9KXaCrOJAPgb9FxQlF2Sus
 EYee593oX9vlh33ZtRuPJoNNzAWkwALfoXIq
X-Google-Smtp-Source: AMrXdXudnuJA8HARCOB71U3SPBxSynwAFC+zWtdst2WdUYBIKIEDiNWc67N68t2D7GLK5REcdn52hQ==
X-Received: by 2002:a17:90b:19cc:b0:226:cdcf:da83 with SMTP id
 nm12-20020a17090b19cc00b00226cdcfda83mr15746645pjb.46.1673294909345; 
 Mon, 09 Jan 2023 12:08:29 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 06/27] tests/tcg/s390x: Add sam.S
Date: Mon,  9 Jan 2023 12:07:58 -0800
Message-Id: <20230109200819.3916395-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221129015328.55439-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/sam.S                   | 67 +++++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 tests/tcg/s390x/sam.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 295df08491..d6ca8d7342 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -8,3 +8,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 
 TESTS += unaligned-lowcore
 TESTS += bal
+TESTS += sam
diff --git a/tests/tcg/s390x/sam.S b/tests/tcg/s390x/sam.S
new file mode 100644
index 0000000000..4cab2dd200
--- /dev/null
+++ b/tests/tcg/s390x/sam.S
@@ -0,0 +1,67 @@
+/* DAT on, home-space mode, 64-bit mode */
+#define DAT_PSWM 0x400c00180000000
+#define VIRTUAL_BASE 0x123456789abcd000
+
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1d0                         /* program new PSW */
+    .quad 0,pgm_handler
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lctlg %c13,%c13,hasce
+    lpswe dat_psw
+start_dat:
+    sam24
+sam24_suppressed:
+    /* sam24 should fail */
+fail:
+    basr %r12,%r0
+    lpswe failure_psw-.(%r12)
+pgm_handler:
+    chhsi program_interruption_code,6  /* specification exception? */
+    jne fail
+    clc suppressed_psw(16),program_old_psw  /* correct location? */
+    jne fail
+    lpswe success_psw
+
+    .align 8
+dat_psw:
+    .quad DAT_PSWM,VIRTUAL_BASE+start_dat
+suppressed_psw:
+    .quad DAT_PSWM,VIRTUAL_BASE+sam24_suppressed
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
+hasce:
+    /* DT = 0b11 (region-first-table), TL = 3 (2k entries) */
+    .quad region_first_table + (3 << 2) + 3
+    .align 0x1000
+region_first_table:
+    .org region_first_table + ((VIRTUAL_BASE >> 53) & 0x7ff) * 8
+    /* TT = 0b11 (region-first-table), TL = 3 (2k entries) */
+    .quad region_second_table + (3 << 2) + 3
+    .org region_first_table + 0x800 * 8
+region_second_table:
+    .org region_second_table + ((VIRTUAL_BASE >> 42) & 0x7ff) * 8
+    /* TT = 0b10 (region-second-table), TL = 3 (2k entries) */
+    .quad region_third_table + (2 << 2) + 3
+    .org region_second_table + 0x800 * 8
+region_third_table:
+    .org region_third_table + ((VIRTUAL_BASE >> 31) & 0x7ff) * 8
+    /* TT = 0b01 (region-third-table), TL = 3 (2k entries) */
+    .quad segment_table + (1 << 2) + 3
+    .org region_third_table + 0x800 * 8
+segment_table:
+    .org segment_table + ((VIRTUAL_BASE >> 20) & 0x7ff) * 8
+    /* TT = 0b00 (segment-table) */
+    .quad page_table
+    .org segment_table + 0x800 * 8
+page_table:
+    .org page_table + ((VIRTUAL_BASE >> 12) & 0xff) * 8
+    .quad 0
+    .org page_table + 0x100 * 8
-- 
2.34.1


