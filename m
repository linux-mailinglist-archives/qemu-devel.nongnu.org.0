Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1B43067CC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:27:02 +0100 (CET)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uD5-0005hD-De
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8g-0001Ar-CB
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:18 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8e-0006GR-OI
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id z6so3574272wrq.10
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gC5PlB4hjqAvtWqskaMHj+n0ZuQPzFbL27s012MYxIQ=;
 b=H5xE26xeRn1Ith5Fs+yQgnliYA7j5mkeJshEczdDBWudhW1pZXHSQDWmRpz7K7Rz/Y
 FUTnzkwHTn8RcHJMWZWI13W6HO5xsO/vOq0SdBbgBnvUk8P1UzvU5vSV3/qf8ku9KhuA
 ZPNT18QABIH9PvOer9A4yv0aZsy6/mpwI+5mLAZCZUw9v3Fp0lAVYeMdMRoFsalEc1Z7
 Xp5Mq7SP7zhnSmRLoIw5tM41Tnf/uJN+vyjUQXKgFg0efNgzr5nHWDoRWXuKKo9DiyeJ
 zSjs4oxEAezdY8UR+V/M3OMbO1mHBpsUGyaQh8RGXVbLNpLhGgFhWZK5BUELmi4QRCon
 bq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gC5PlB4hjqAvtWqskaMHj+n0ZuQPzFbL27s012MYxIQ=;
 b=DO6+5/HwODZmtG5TmOrZqHb7DZz+a88omR64f7wpVoKfigwRNgA3z/th5KyUgnQVGo
 8yQNhHLC5yljCwqxEPt7NdkbPOY6TDnGuB4hobhWOKyIzRIofDVUk+AgkxRieKk2ntc5
 yAXk3qWOStBWWGWfRGshUUAwvreRi7FbORptFsAeEPYiS5MLxo1hWIbZAIsQtwgabqDo
 AQ6k1/FS8DAkdjd/KNO57PVJvAvF7JLVkpaFqthViiNPh8ZAViJ0kab/sfVrLgRZEBZU
 DmaOVgcEFY0eH2nvs/VoGJEaiWHt/TU1O1dQyG7b+ncqhmRrXvOwm4q7aLKFFwKlVTRL
 f8HQ==
X-Gm-Message-State: AOAM533Rs/yYyP97PzThQ250GnB8x+061Qj8uISa44qv8b09yCJhzmfC
 zOElENBSbzH57ZoyZMITSLYXThwlI+U=
X-Google-Smtp-Source: ABdhPJyqDtskjb6l69TFXwJi9XzYBjXAvCNGGskflme52gmYkDhTNy1BkZrJR4xw6IbzQZdBdlTq9A==
X-Received: by 2002:adf:fbd2:: with SMTP id d18mr13597474wrs.222.1611789734879; 
 Wed, 27 Jan 2021 15:22:14 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l84sm3980079wmf.17.2021.01.27.15.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:22:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/sh4: Let get_physical_address() use MMUAccessType
 access_type
Date: Thu, 28 Jan 2021 00:21:50 +0100
Message-Id: <20210127232151.3523581-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127232151.3523581-1-f4bug@amsat.org>
References: <20210127232151.3523581-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

superh_cpu_tlb_fill() already provides a access_type variable of
type MMUAccessType, and it is passed along, but casted as integer
and renamed 'rw'.
Simply replace 'int rw' by 'MMUAccessType access_type'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 737938d2fd1..fad5f906ef6 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -331,14 +331,14 @@ static int find_utlb_entry(CPUSH4State * env, target_ulong address, int use_asid
 */
 static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                            int *prot, target_ulong address,
-                           int rw, int mmu_idx)
+                           MMUAccessType access_type, int mmu_idx)
 {
     int use_asid, n;
     tlb_t *matching = NULL;
 
     use_asid = !(env->mmucr & MMUCR_SV) || !(env->sr & (1u << SR_MD));
 
-    if (rw == MMU_INST_FETCH) {
+    if (access_type == MMU_INST_FETCH) {
         n = find_itlb_entry(env, address, use_asid);
         if (n >= 0) {
             matching = &env->itlb[n];
@@ -371,11 +371,11 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
         if (n >= 0) {
             matching = &env->utlb[n];
             if (!(env->sr & (1u << SR_MD)) && !(matching->pr & 2)) {
-                n = (rw == MMU_DATA_STORE)
+                n = (access_type == MMU_DATA_STORE)
                     ? MMU_DTLB_VIOLATION_WRITE : MMU_DTLB_VIOLATION_READ;
-            } else if ((rw == MMU_DATA_STORE) && !(matching->pr & 1)) {
+            } else if ((access_type == MMU_DATA_STORE) && !(matching->pr & 1)) {
                 n = MMU_DTLB_VIOLATION_WRITE;
-            } else if ((rw == MMU_DATA_STORE) && !matching->d) {
+            } else if ((access_type == MMU_DATA_STORE) && !matching->d) {
                 n = MMU_DTLB_INITIAL_WRITE;
             } else {
                 *prot = PAGE_READ;
@@ -384,7 +384,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                 }
             }
         } else if (n == MMU_DTLB_MISS) {
-            n = (rw == MMU_DATA_STORE)
+            n = (access_type == MMU_DATA_STORE)
                 ? MMU_DTLB_MISS_WRITE : MMU_DTLB_MISS_READ;
         }
     }
@@ -398,7 +398,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
 
 static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                                 int *prot, target_ulong address,
-                                int rw, int mmu_idx)
+                                MMUAccessType access_type, int mmu_idx)
 {
     /* P1, P2 and P4 areas do not use translation */
     if ((address >= 0x80000000 && address < 0xc0000000) || address >= 0xe0000000) {
@@ -406,9 +406,9 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                 && (address < 0xe0000000 || address >= 0xe4000000)) {
             /* Unauthorized access in user mode (only store queues are available) */
             qemu_log_mask(LOG_GUEST_ERROR, "Unauthorized access\n");
-            if (rw == MMU_DATA_LOAD) {
+            if (access_type == MMU_DATA_LOAD) {
                 return MMU_DADDR_ERROR_READ;
-            } else if (rw == MMU_DATA_STORE) {
+            } else if (access_type == MMU_DATA_STORE) {
                 return MMU_DADDR_ERROR_WRITE;
             } else {
                 return MMU_IADDR_ERROR;
@@ -432,7 +432,7 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
     }
 
     /* We need to resort to the MMU */
-    return get_mmu_address(env, physical, prot, address, rw, mmu_idx);
+    return get_mmu_address(env, physical, prot, address, access_type, mmu_idx);
 }
 
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-- 
2.26.2


