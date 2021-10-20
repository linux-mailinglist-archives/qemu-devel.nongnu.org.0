Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B474343E6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:30:03 +0200 (CEST)
Received: from localhost ([::1]:53982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md2Ik-000235-5w
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26U-0006tD-UP
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:22 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26Q-00012B-Fo
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w17so3283396plg.9
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UakmtpX/ULO2Fxh/+VRPEmYBUzLO6qfGKR5m4Cqlo1Y=;
 b=DmA2mxyA655Ycr+H014vUT4DEXePkf0xbHXfa/VlZTFOfcmzHAUZKwgdy1116FBQOX
 KF+Fd8SlEElIb88rAyI0l2AHv9hapnfZUNx9Gn2zcXHMY5VLgWrDDD1ODfpR+Z7JLgv/
 orVav7pQoaDcZmc2pgpmxzy3WdaVA94NBJ5ykGC6bzTZWu47rlvQJkrQ2belmHApM8IZ
 JhktCnzl1cSfQCte0RO+FvgXuDXHhNusd/9/VBXnd1k9EnArjJZgTq7kU2AKMi54ZJXN
 EZmZmDucNf3NUtbLfSBrpnTa4f5SwuqLDQe/HKbpMjq8QfjEVjVnDILyiMK7EIKpIRs3
 sXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UakmtpX/ULO2Fxh/+VRPEmYBUzLO6qfGKR5m4Cqlo1Y=;
 b=N5jQ5/ACXBGjpeULVGj9wsmN/7QQrL3eg5VDh8hpzmQ4nUU3FPpxHm0vAYa6IOEiS0
 k3lnIcyn1Wge7P6922Dri72zOUXNA/ESHQbzCYp9LZti+HHQnSB/4kFsqKhfct9XgcAo
 Z0OTpbym3y6Hc2MfXB5SnTAekVtcPSrJC7eUS380kuLbuMHg4iCXLQtnxm56peGn3baW
 zEFOyLBnIzpjH2HU54gFdaM9b6BWMwJdMkWcZFGcJeiI9+CehIej5J0t4OFGAP6SN0hP
 7xgo9ybpVGBPfhlGBG+/sVLIIfWqUTdgxaZzAs3fS0Ks9mqrGs9UzxoMVRWWx2BDJ7bg
 YgcA==
X-Gm-Message-State: AOAM530dCivBgpPRAixEdc0VNOeaZyCnXzrGvvRsm+FdSXxtTz/q5h2D
 Ewf04+YNOwMQXz5ogJuosCpZN6qWE4fV+g==
X-Google-Smtp-Source: ABdhPJyukr8eexkohQjfU7mZof4Yna+Vm3H0WyAKryQzSxnhn7/znsYVkzB9uIvxczZfZfQxc1cc/g==
X-Received: by 2002:a17:90b:1e49:: with SMTP id
 pi9mr4413311pjb.144.1634699836020; 
 Tue, 19 Oct 2021 20:17:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/15] target/riscv: Properly check SEW in amo_op
Date: Tue, 19 Oct 2021 20:17:01 -0700
Message-Id: <20211020031709.359469-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're currently assuming SEW <= 3, and the "else" from
the SEW == 3 must be less.  Use a switch and explicitly
bound both SEW and SEQ for all cases.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 61fd82d41a..a102c3687e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -704,18 +704,20 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
         gen_helper_exit_atomic(cpu_env);
         s->base.is_jmp = DISAS_NORETURN;
         return true;
-    } else {
-        if (s->sew == 3) {
-            if (!is_32bit(s)) {
-                fn = fnsd[seq];
-            } else {
-                /* Check done in amo_check(). */
-                g_assert_not_reached();
-            }
-        } else {
-            assert(seq < ARRAY_SIZE(fnsw));
-            fn = fnsw[seq];
-        }
+    }
+
+    switch (s->sew) {
+    case 0 ... 2:
+        assert(seq < ARRAY_SIZE(fnsw));
+        fn = fnsw[seq];
+        break;
+    case 3:
+        /* XLEN check done in amo_check(). */
+        assert(seq < ARRAY_SIZE(fnsd));
+        fn = fnsd[seq];
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
-- 
2.25.1


