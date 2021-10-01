Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2941F159
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:38:35 +0200 (CEST)
Received: from localhost ([::1]:45916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKcM-0005Yh-GQ
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXv-0006P2-Ds
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:59 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXr-0007i5-W7
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:59 -0400
Received: by mail-qt1-x830.google.com with SMTP id e16so9263484qte.13
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EV1fPTa0lXnvbJma6gub7tRNpsvH6qdwOzVJWph7xd4=;
 b=v9bMNXM6XE5BqGoZDAZbvUG69jnAhfBlG2ZzFH4dd1ockfWFS7ToooVGvWexlPYBIM
 iE+oxzBBgeQtvLtPUIeTWFkVieCoDHtNltX7uZ3/xEm0kgQSvrHio/0Q2j4fZWZb5WM+
 Shpg6TRcy+A5SyyTuXVTxGDrW1D2hFPe1m2O6uyRvH1S1HteHzh0YxsWm/XqUBkQVUwh
 5qQGqfYKA4QMh2RFNpc7vkLJMno1ulwSXrCBdjrhTyAkN3Zg2DoyKa3kTvP3/hHtdCxf
 uhlsKwyMrWV4Co6SwU2nzF3xgQJ8/wDY8mf9TdaVHVTdWRUyPcEnVbS2VxA41zN2Hpuw
 tv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EV1fPTa0lXnvbJma6gub7tRNpsvH6qdwOzVJWph7xd4=;
 b=zVs0EDLxI1i7jmx2qWG/H89Ko2XhCOz9ZUfbgK8agLkz62cQ9DuI8cy+vhTfK6mzRW
 UleiQlZwdSX+JOp/DQUPeIoh8+lGc8HpdaiJeJFfDy48tRCAeL2V58C04l95ehMlH/Y9
 /j8jAqJDRtsaW2V1JYPWErj8vVcDHnV7QBWC18i8nXEGAOCh39l37T4bQB/DltxiElzQ
 HDG5LS33DXXdwEHXpegJjgkfaQwj0WjY5dNEc+G3H8ArRB2Aas3pJBvWEzRARPTyupZ1
 Wf4SZLdNWiQk8mZ6Q2UgleOUvHY4zNE+ZiIJVOei1mUrYl6Srq4sPSwUh6DnaV0mYY4+
 yzEg==
X-Gm-Message-State: AOAM530cuaDowLBrr8r9f2lezm0+z5fTeNY7wE2DAIhRPdoLtK+B9L+S
 mjopuql5b62Bb1NNjqlRdQj+gfG8xdPVEg==
X-Google-Smtp-Source: ABdhPJywvAtcsEKHSgyfRdFEcEUWpnK0PWOHFF0iqgirPCfyiCDCPuGSbwwKJLQF+VO2a+/FcM1NaQ==
X-Received: by 2002:ac8:6e8f:: with SMTP id c15mr13715605qtv.179.1633102435078; 
 Fri, 01 Oct 2021 08:33:55 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] linux-user/elfload: Rename ARM_COMMPAGE to HI_COMMPAGE
Date: Fri,  1 Oct 2021 11:33:42 -0400
Message-Id: <20211001153347.1736014-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arm will no longer be the only target requiring a commpage,
but it will continue to be the only target placing the page
at the high end of the address space.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5f9e2141ad..dc4ababedd 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -388,11 +388,11 @@ enum {
 
 /* The commpage only exists for 32 bit kernels */
 
-#define ARM_COMMPAGE (intptr_t)0xffff0f00u
+#define HI_COMMPAGE (intptr_t)0xffff0f00u
 
 static bool init_guest_commpage(void)
 {
-    void *want = g2h_untagged(ARM_COMMPAGE & -qemu_host_page_size);
+    void *want = g2h_untagged(HI_COMMPAGE & -qemu_host_page_size);
     void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
 
@@ -2160,8 +2160,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     return sp;
 }
 
-#ifndef ARM_COMMPAGE
-#define ARM_COMMPAGE 0
+#ifndef HI_COMMPAGE
+#define HI_COMMPAGE 0
 #define init_guest_commpage() true
 #endif
 
@@ -2361,7 +2361,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
     }
 
     loaddr &= -align;
-    if (ARM_COMMPAGE) {
+    if (HI_COMMPAGE) {
         /*
          * Extend the allocation to include the commpage.
          * For a 64-bit host, this is just 4GiB; for a 32-bit host we
@@ -2372,14 +2372,14 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         if (sizeof(uintptr_t) == 8 || loaddr >= 0x80000000u) {
             hiaddr = (uintptr_t) 4 << 30;
         } else {
-            offset = -(ARM_COMMPAGE & -align);
+            offset = -(HI_COMMPAGE & -align);
         }
     }
 
     addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
     if (addr == -1) {
         /*
-         * If ARM_COMMPAGE, there *might* be a non-consecutive allocation
+         * If HI_COMMPAGE, there *might* be a non-consecutive allocation
          * that can satisfy both.  But as the normal arm32 link base address
          * is ~32k, and we extend down to include the commpage, making the
          * overhead only ~96k, this is unlikely.
@@ -2400,7 +2400,7 @@ static void pgb_dynamic(const char *image_name, long align)
      * All we need is a commpage that satisfies align.
      * If we do not need a commpage, leave guest_base == 0.
      */
-    if (ARM_COMMPAGE) {
+    if (HI_COMMPAGE) {
         uintptr_t addr, commpage;
 
         /* 64-bit hosts should have used reserved_va. */
@@ -2410,7 +2410,7 @@ static void pgb_dynamic(const char *image_name, long align)
          * By putting the commpage at the first hole, that puts guest_base
          * just above that, and maximises the positive guest addresses.
          */
-        commpage = ARM_COMMPAGE & -align;
+        commpage = HI_COMMPAGE & -align;
         addr = pgb_find_hole(commpage, -commpage, align, 0);
         assert(addr != -1);
         guest_base = addr;
-- 
2.25.1


