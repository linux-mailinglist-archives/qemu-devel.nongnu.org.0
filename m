Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C626307198
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:37:01 +0100 (CET)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52nU-0001L4-IP
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52as-0005zE-Tt
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:58 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ar-0005is-CF
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:58 -0500
Received: by mail-pg1-x530.google.com with SMTP id s23so2527598pgh.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRd34LGil31wVPd8eDU4MGOPOaZrbwDGq6Woxhcr11M=;
 b=W0WQfTedontnwR/hqHUVDWqXb3UJTt03lxP8AVnBAQOlqBfiZSRvsG5ImpETyrZeVC
 7+E3NOsljg6Wg78OuiK0IMLVdIkXuF6egPYZePNcH/mLjtPMnB3KTn6shOvAsCLxjcvU
 FXjK/L+N79I5PVawSOfYYAEdEeAq5nYVNteBLvn99C6qU8xyZawhmym/OIuXKqKcHk5x
 dnQsCw8Qd7xNTETJEPENyQwOheHlYq1cfjvGsH4d2A7MMp7jGRM9vWw2gyLx91SFIRws
 u6V/Y1fxTYBqoE2por6HSetJf/WNj8SENMlJ1huWKbZ4eoo917HB+89M7u35zx+nrnmy
 dtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRd34LGil31wVPd8eDU4MGOPOaZrbwDGq6Woxhcr11M=;
 b=rHTz24wEd15kuIclZ3tXvoXib7KZkeuvg2an1m7achHEjULRZKKmZUiD/yL0kqmsuG
 I0Tgi4Aua5Q72k/SvBTPy+ZJpnketpJXwMuuMml9SdbV3hk5qqGPTGyodlN4qz3PtGFO
 M5ljxxTIB6jfEEBA8ShhpqG6nXLRgyhNlDo1GAsqozP5emDPmimhA0JdOinPvCQV6wzA
 CJGwAd08kptU6/bxEH+ddOOTVXdo24Hjy0QTjc2NoAMXP8zwyqV8i3mBPTTy1hvv2cuN
 eYGjZTTeprZnwRJUd5RcmFLZlfbMjw983Wq6Vm+Ut9qz3jHhjIbb2iNsQEtIEItqXsBO
 d+zA==
X-Gm-Message-State: AOAM530nK/Rl9m67o0U/vA63CpCJBF8pOelgZZ0atWxbwc43T0Dbp+kd
 z9kgO8KHArIVg6Mhm5pshZGbsxwaj3W7lRAj
X-Google-Smtp-Source: ABdhPJzqLbLWP1pS5WHq6VZnU0cboLF2z2HU0a//EL17Tc0YxNjTGeJ/irjDA122RjeKWcGNk8AZ5Q==
X-Received: by 2002:aa7:8ed2:0:b029:1b9:7c87:8f44 with SMTP id
 b18-20020aa78ed20000b02901b97c878f44mr14942375pfr.49.1611822236134; 
 Thu, 28 Jan 2021 00:23:56 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/23] tcg/tci: Merge INDEX_op_ld16u_{i32,i64}
Date: Wed, 27 Jan 2021 22:23:21 -1000
Message-Id: <20210128082331.196801-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eliminating a TODO for ld16u_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 7d11982eb2..d197803dca 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -585,7 +585,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
         case INDEX_op_ld16u_i32:
-            TODO();
+        case INDEX_op_ld16u_i64:
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
             break;
         case INDEX_op_ld16s_i32:
             t0 = *tb_ptr++;
@@ -849,12 +853,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld16u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
-            break;
         case INDEX_op_ld16s_i64:
             TODO();
             break;
-- 
2.25.1


