Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBACE6494E6
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:35:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFj-0006Jf-Gx; Sun, 11 Dec 2022 10:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFh-0006Gl-HO
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:29 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFR-0007Vx-Lu
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:29 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 m6-20020a9d7e86000000b0066ec505ae93so5830652otp.9
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Jm8IvT8OnM6ntzNw++ITlfcs7TcV+gT1sswHnCP9Os=;
 b=u0ZvssAhiAAk9OWwbe8eJL5SCmZz7ZW61x+6ocrg/H+hbTLn+/qtM44m2YM7B0vzYe
 iKjpnVMd9XtwNdeo9jOUgFTUnergEd9tkd5CflQyEnlDiXjXtXWYkQXPopSxsCLjxsWp
 w+IZR9c/eFaDq640uTTl52h3s02KN+kezPOhYwiFPsjUMvjUuKxqI3q+vSpFBTXDAtN3
 KU1CBDN2+YL+q2uChS9giFS7ADF4CrBDCZCpGt4gUD4DIV2FRaZmNmSboUJkFMRC670B
 Qw9rkjIA7C//Nfa+QueThaN1R9fNOQXREDE0EKs2zAUDo5HjPwS1nKWyLqE6z33kAreJ
 Gs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Jm8IvT8OnM6ntzNw++ITlfcs7TcV+gT1sswHnCP9Os=;
 b=KtwEocKhWAjMQcQcO/WVoeW7AWU5MpDhESt8rsQIKMorijwK0gUKz6kHfiv6gCvPdI
 TahOvf0F64ssY1bDVao9xcx1UOqYHtgZY/BzLzfswT6PR/auHvm2nQheDDb47N7oLur5
 KD1G78vhQNBmwwsi3lbfmmtYCnwrwR+MoruxB1zIWngerl/OnpKefaHGu0ZfTVT+K9t4
 pqDWyAMNCxL7e0xRYh0Xr++8X1HrgROl7z207/qocwjNtpzjfs7kTcQCSIGWLh65TzHk
 NDQppnk8Yqc8Duy44P8tas+mR28QrZpAqW3mro+lDLd2m4H4e9dSnHsQdcNgXFOvqOdJ
 kGvA==
X-Gm-Message-State: ANoB5pnuXhWhI7aAxYRJL4M5ZuhOlHIHz637BMPjcv2fR0/Y3tOxdUSd
 ZrAGdgENnA+smC6aFucFi8jWz0vN9U45OeH/Ilg=
X-Google-Smtp-Source: AA0mqf5h+3iEIJJuBSFbLzvjtETA14lUaEKrc+c/nxorZDzXeHZlaVGjABt/bzmUkt89fXZCO4J5Rw==
X-Received: by 2002:a9d:6d82:0:b0:66e:b9f0:b662 with SMTP id
 x2-20020a9d6d82000000b0066eb9f0b662mr5926429otp.25.1670772491708; 
 Sun, 11 Dec 2022 07:28:11 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 06/27] tests/tcg/s390x: Add sam.S
Date: Sun, 11 Dec 2022 09:27:41 -0600
Message-Id: <20221211152802.923900-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


