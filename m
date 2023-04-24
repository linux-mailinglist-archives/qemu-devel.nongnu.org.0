Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224FF6EC5B5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:54:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqoyb-0006dG-Bx; Mon, 24 Apr 2023 01:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxF-0005Qx-4C
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:38 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox8-0004Uk-H7
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so2313289f8f.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314888; x=1684906888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RzQZ5WVAoEKvcmnzgqGk5zASE/mhxboQtmOP6HVA4UQ=;
 b=inprkCKQ2eq4l4tV+Zf9One1wQTA7s6dXhx/w/lCK20zineyln5fst2bgj18TcYpu5
 DRZFzARzRthcIjn6y7n8iaeHogPe/fcjWZmFSso9w9S5k1twhOJagetX+7meIYl6D8XE
 AlZ52bb3Zo0x1iVd+u9VJ4uc23a0/FYOYyBkVwuqwpI08d+NagZ0L/uPoUPGLiCNgFo+
 IDQ/k45mKeJ58D6r9SxtaaKnOQaJaeZrxVrEMjIqm+pbTIsI7qqxkiqxBeWF4/EP9Yp2
 vJqVD7pzanXCQVhVHw8Y7qB1XzzexpsWVdeG1a9x0cjgLZaSekzdGfYWxmVLU83ot2aq
 T3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314888; x=1684906888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RzQZ5WVAoEKvcmnzgqGk5zASE/mhxboQtmOP6HVA4UQ=;
 b=KNq8wsq8Uu+nOOjhyb1xbaVj5UKZABRM6Pbh3lUrUVl8fkY2RBLbw0kFx6G5AEOIyx
 c+NOCSeDh3kVDmNrEU3isgpFj14CBUcdslNwWFDDGd9o10qme0Iaa+/+8F+Z0/1S7RK1
 WYUfSwF7xgmCcPzWZxRBxCtFKvCsYd9mA/2cTHWUfYKfnNJtimFsW5/1VwXB+gziEI/b
 0JjeHL3FCp3QfytbchQInx6K6Ff35J7obMCr9jLvk77p+18vS9WGP+9KiuMbfjoRUeug
 3SPTt6Tlu4M8f7U6jlYu4W4hsuWhcjD7lQNmiFst5mY+A8ys1zgJwAAx55qv5AFkCJeR
 di5w==
X-Gm-Message-State: AAQBX9duPy8+rusmuxaIgkIUvYGbkIrVVF/SyGNE5fgMgvalrm0oZPc3
 v//SWFgohABDGnhRiXvsCYkA444JbFh+OrPS/DcRMQ==
X-Google-Smtp-Source: AKy350Z1bBGzjELkWtJIkCnJFsq+DqBmKNKI2FB8m5q8xyb12Cc+aXxZCfVqu4QR7aChCx6q47N/Kg==
X-Received: by 2002:a5d:6e0a:0:b0:304:7929:470d with SMTP id
 h10-20020a5d6e0a000000b003047929470dmr1973859wrz.53.1682314887942; 
 Sun, 23 Apr 2023 22:41:27 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 37/57] tcg: Widen helper_*_st[bw]_mmu val arguments
Date: Mon, 24 Apr 2023 06:40:45 +0100
Message-Id: <20230424054105.1579315-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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

While the old type was correct in the ideal sense, some ABIs require
the argument to be zero-extended.  Using uint32_t for all such values
is a decent compromise.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h | 10 +++++++---
 accel/tcg/cputlb.c     |  6 +++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 2ba22bd5fe..684e394b06 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -55,15 +55,19 @@ tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
 tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr);
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+/*
+ * Value extended to at least uint32_t, so that some ABIs do not require
+ * zero-extension from uint8_t or uint16_t.
+ */
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..665c41fc12 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2503,7 +2503,7 @@ full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_UB);
 }
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr)
 {
     full_stb_mmu(env, addr, val, oi, retaddr);
@@ -2516,7 +2516,7 @@ static void full_le_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_LEUW);
 }
 
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_le_stw_mmu(env, addr, val, oi, retaddr);
@@ -2529,7 +2529,7 @@ static void full_be_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_BEUW);
 }
 
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_be_stw_mmu(env, addr, val, oi, retaddr);
-- 
2.34.1


