Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B7C69D2E3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB6n-0004lW-4R; Mon, 20 Feb 2023 13:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6Q-0004XE-2t
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:30 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6L-00045u-0q
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:29 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 il18-20020a17090b165200b0023127b2d602so2371526pjb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7m/m4b71FLelzEcXA/0IWs26yxi4/hxYSZhMkqCxBNA=;
 b=MBYBM9hY8/10BlsQ3s+S/fB+FNkm1ZT7gNMpNm11DF1Q5RhmBQCecZYKyfHnSgKsMd
 GfB5EWxlMkkuTTl6Nqt0zthyCXmnxLJcPnadZd0tA9NvCcJ3kQBkhO0BYzEfudOd6Kl5
 oMXXOFWV+umhUQhnV/eGejTMykh3puU8rQv/93QSuwtgVY1La79ZJMLyiFqdkgLYHiQA
 BWsZk1ARO3mUz1ktjOhAx430GT1JLnZERTYN3ru6LanP8+BqKZHgPXFMOV/+ek0JE5cE
 C/ijGIRyw9enhhNrDI5zppt4blAThV5x4+9Yh1AMGhLp3gumxY3RSY8rNrkChryC6NQy
 HAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7m/m4b71FLelzEcXA/0IWs26yxi4/hxYSZhMkqCxBNA=;
 b=AmZDOjNxQIc5rTj0P8CMuv6ZP+0RU4ZIsiVGCbtHvUmT+CY5/h2GTdK7du99147I5Z
 XRHBYhVg3d7XwUPduVFDpG87lQGkTAeoLmlhhwGz5PbOr2d7fVdEDhTA27LTJiQg9R2O
 IhGBEVQpEUwb5FaShBaV6Q2fHMFMRmUEb1ag/8fJTewMUSJVLaprVqC2fHa0xINC/O8G
 BGZvT30uzCHrl6uigLIwmYkuyiwY/PXFZcRgs+kXAGOwlGo9f7omjKRcDvQrwsUKMwo8
 xfbfjYhEt+e9MPgGFiiIkCEL3qASAg82E3XMUXPq27AwFqWZKlZT2/Z2hizH4FQRaVsL
 cnhA==
X-Gm-Message-State: AO0yUKUFTrRwqSAlpyPWR6N3oqCg4Uxrv0aVpxxmaGr8FeXToGI4gcPB
 pIcSRIIypwUCxooIGvavv7PQVTdpNN3TZZ6XpCc=
X-Google-Smtp-Source: AK7set9xLf2D5e2Fe3MPVeGuQuazbFvAK4cHBIfVbXvJjMuCkZ+qttzSHV/at2RsUeEJlVEjP1Jn4Q==
X-Received: by 2002:a17:902:cec2:b0:19a:821b:486 with SMTP id
 d2-20020a170902cec200b0019a821b0486mr4181929plg.45.1676918467819; 
 Mon, 20 Feb 2023 10:41:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 06/27] tests/tcg/s390x: Add sam.S
Date: Mon, 20 Feb 2023 08:40:31 -1000
Message-Id: <20230220184052.163465-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
index bcbe9367ef..725b6c598d 100644
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


