Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DB42CC3F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 22:56:22 +0200 (CEST)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malIT-0006Vc-Cg
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 16:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDk-0007eR-UU
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:34 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDX-00088h-2N
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:25 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 75so3495914pga.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D7b+ydnd4zMrVyDCywxRov6Sf650NgZr4E9SJVFsXBA=;
 b=dXbDW0NIE255Ziv7RFBPFNjsyhlhjaaNb0LuR4itErhnaWOUQEzx8iHH1oQ2CMBOHH
 afJQRy5B4oSw+R9yPFe6jl1LAzEzw713gMt/RRR7J9wWeyKBQE9ohEAih3t//CAMps74
 tkruXm3kb/j+5sGGXgXcWk1qn71LXlvmqdJ59HyhpHqjaTSAp4OIEXEIDMYVHd6At1k2
 ps4MF9B9i9IKSfhGxyo43qgYC3QVxkleYfSV5tvUrjck01hI33DUUN+vAZQ9nIl7R6uQ
 lFdmbkSi5eju6vgrJuDXU2bq8G5kgSV8ghA20OBaS1brzN2nSGms6YvJnG9WJAJenW1v
 2LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7b+ydnd4zMrVyDCywxRov6Sf650NgZr4E9SJVFsXBA=;
 b=RffmSZ/jtUYmq9ANlheGopTfhoxyNfJUdBmX7Suxc5FIaXsdzCx8musWzRu9QtSOoN
 FV7IxIcLH8YbuV+Af619NoWQWfbNytY0FWC5S78kvlTv17m3aXFQwsEJheDLfIp0oCU1
 4JSrc8VP0x2wEt4ci8jaz+Vyzin3WBTAVaGpJStYrmCfW7UjkBz/ssTFPKG5lFrvFhxJ
 qXUXGgkeOQ7bkAdew8Pcuur/c8EWxPkspqFzt1X8Fo7O5eRGT15Ak4D7aIaLnVis7otJ
 qdJTZhxO5CgECVfQyRbxgVN5xvzH8B86/HitFQXJr950wDNa6uhhMqAglXJlaxfpBKkf
 7jiA==
X-Gm-Message-State: AOAM530KXmBYZmHHsYwd2cpR3F8k5gTWSiYLFmEL190IhqtZNnkaqfMe
 9uMdyHHeNNvmpb3ItTeOWbPibFsfcPk=
X-Google-Smtp-Source: ABdhPJztp8wFqQ6j+yBm3WuhCo1sVbzc9VEpQ9sJ9fHAETBXvixS3qyA9/66JS3p7TYtXSTl4j5h3A==
X-Received: by 2002:a63:9542:: with SMTP id t2mr1128771pgn.428.1634158273387; 
 Wed, 13 Oct 2021 13:51:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/13] target/riscv: Properly check SEW in amo_op
Date: Wed, 13 Oct 2021 13:50:58 -0700
Message-Id: <20211013205104.1031679-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're currently assuming SEW <= 3, and the "else" from
the SEW == 3 must be less.  Use a switch and explicitly
bound both SEW and SEQ for all cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bbc5c93ef1..91fca4a2d1 100644
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


