Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D99B64E3F7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 23:47:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5wz9-0004Dv-9G; Thu, 15 Dec 2022 17:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1p5wz6-0004Cl-An
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 17:45:48 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1p5wz4-00013F-7U
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 17:45:48 -0500
Received: by mail-qt1-x833.google.com with SMTP id z12so1375549qtv.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 14:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4UKIbi1R3u58Zta3ve6XBWjacdOmfsNHlDjxeu/iIsY=;
 b=yaDMK9F7eZepvz2DeK4BdAtEKgC4n+6R5zPhXGlEdKnF4ORs1vCA1gpLV3S1aVk1z9
 bsJkz9zDIRr/asbRfb7IZ73zlwvtBuo/FOh5lxo70HVtGvq4VSwqKdhaAr0JKErKfYHf
 Gp43Nosc/eM6tMunVQpW5quaex5J+sVAkCS8nUv9ZgFXShrz1uilt02T6f2PEvFdJmSH
 1ZRW728l5QV3W5y+2g3P5ajHrXtaOK20C2ztOHIA9BhqC8PUGaY5T3MSe1z4TvWtKlCF
 J3beDex3yhVK/Xy9iVdIrLp0zaDTSn5+1tMzm7axDITV6u+ZGJo5u89ak5OSqsm9YLq4
 evyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4UKIbi1R3u58Zta3ve6XBWjacdOmfsNHlDjxeu/iIsY=;
 b=TM5AUpTxd8KW4w5OtW8oUJEBfmHz1hxbKmARXK4UJQtkZNCB/5vTA+D7XibKrN33IS
 txp1HQH3MnFJMM6NaBZSYrN5SWIhUvfIaFoWKqebcS+P+zL0UicES5gbUT3LebTWwefH
 T59N++/4ZpunzSehp68QvwqVDfTKoF1qAKunVnDebpsf6tj1dpthOv+IInvrGUmBb2Ip
 wrp9pxcEhHRXtPPQ5OnWMJyFKxkItXp3Cm6qr01b6VqVsxYtuX3QAxn1cZO7kg4Urcg4
 DQSynJBxaMm6+ztCY8rjyULKSVmyKhiIL2WgOnwFd8tZJkC8FRJGF0CwYv5tOmwlhoMA
 JtPA==
X-Gm-Message-State: ANoB5pnHA1RvWwmZQ/eUjqre5EM7Ced2zTtx0IKH8piqqhaI9tyxtFHn
 vk8fRZnjEfcJSwgdrmVRCjkbW2vVOHawSTTs
X-Google-Smtp-Source: AA0mqf4lsbULmgIeoByf68iEsPgXgcE0vYwNZjfWkqruONcw0SsI87Y37iFu+A2PudCS7rc5lNX9NA==
X-Received: by 2002:ac8:7ef2:0:b0:3a8:20e:2bb with SMTP id
 r18-20020ac87ef2000000b003a8020e02bbmr35660241qtc.6.1671144344569; 
 Thu, 15 Dec 2022 14:45:44 -0800 (PST)
Received: from localhost.localdomain
 (pool-72-80-155-134.nycmny.fios.verizon.net. [72.80.155.134])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a05620a0d8400b006fba44843a5sm173445qkl.52.2022.12.15.14.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 14:45:44 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH 1/2] target/riscv: Fix up masking of vsip/vsie accesses
Date: Thu, 15 Dec 2022 17:45:40 -0500
Message-Id: <20221215224541.1423431-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=abrestic@rivosinc.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The current logic attempts to shift the VS-level bits into their correct
position in mip while leaving the remaining bits in-tact. This is both
pointless and likely incorrect since one would expect that any new, future
VS-level interrupts will get their own position in mip rather than sharing
with their (H)S-level equivalent. Fix this, and make the logic more
readable, by just making off the VS-level bits and shifting them into
position.

This also fixes reads of vsip, which would only ever report vsip.VSSIP
since the non-writable bits got masked off as well.

Fixes: d028ac7512f1 ("arget/riscv: Implement AIA CSRs for 64 local interrupts on RV32")
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 target/riscv/csr.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..984548bf87 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1975,22 +1975,15 @@ static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,
                                  uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t rval, vsbits, mask = env->hideleg & VS_MODE_INTERRUPTS;
+    uint64_t rval, mask = env->hideleg & VS_MODE_INTERRUPTS;
 
     /* Bring VS-level bits to correct position */
-    vsbits = new_val & (VS_MODE_INTERRUPTS >> 1);
-    new_val &= ~(VS_MODE_INTERRUPTS >> 1);
-    new_val |= vsbits << 1;
-    vsbits = wr_mask & (VS_MODE_INTERRUPTS >> 1);
-    wr_mask &= ~(VS_MODE_INTERRUPTS >> 1);
-    wr_mask |= vsbits << 1;
+    new_val = (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
+    wr_mask = (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
 
     ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
     if (ret_val) {
-        rval &= mask;
-        vsbits = rval & VS_MODE_INTERRUPTS;
-        rval &= ~VS_MODE_INTERRUPTS;
-        *ret_val = rval | (vsbits >> 1);
+        *ret_val = (rval & mask) >> 1;
     }
 
     return ret;
@@ -2191,22 +2184,16 @@ static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
                                  uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t rval, vsbits, mask = env->hideleg & vsip_writable_mask;
+    uint64_t rval, mask = env->hideleg & VS_MODE_INTERRUPTS;
 
     /* Bring VS-level bits to correct position */
-    vsbits = new_val & (VS_MODE_INTERRUPTS >> 1);
-    new_val &= ~(VS_MODE_INTERRUPTS >> 1);
-    new_val |= vsbits << 1;
-    vsbits = wr_mask & (VS_MODE_INTERRUPTS >> 1);
-    wr_mask &= ~(VS_MODE_INTERRUPTS >> 1);
-    wr_mask |= vsbits << 1;
-
-    ret = rmw_mip64(env, csrno, &rval, new_val, wr_mask & mask);
+    new_val = (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
+    wr_mask = (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
+
+    ret = rmw_mip64(env, csrno, &rval, new_val,
+                    wr_mask & mask & vsip_writable_mask);
     if (ret_val) {
-        rval &= mask;
-        vsbits = rval & VS_MODE_INTERRUPTS;
-        rval &= ~VS_MODE_INTERRUPTS;
-        *ret_val = rval | (vsbits >> 1);
+        *ret_val = (rval & mask) >> 1;
     }
 
     return ret;
-- 
2.25.1


