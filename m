Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27CC4303E6
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 19:22:46 +0200 (CEST)
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbnOP-0001mn-MP
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 13:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGL-00012S-TJ
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:14:27 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGJ-0006Cg-AO
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:14:25 -0400
Received: by mail-pg1-x532.google.com with SMTP id j190so4947443pgd.0
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sefFRWXuAIwA9Hn9aMW9zKhBMiydf7kE/zMEjZquoTs=;
 b=FinqihW5F838ZFLUFQXSASvcn4kgsAE233XQSszP7T8g07v7J2OuLhq70Wn+G3rr0G
 FZerP1aDK4OYppbSaX4mp3Rgc3IWJ0fz+XwcKC6a07PMqc0D3mKUIYhMudGKma0BHIIw
 e3poNEMilyJxRwYxgtvV9DZnUvgMENiJA3A8IygfcIVPrbdueRWxn5u5DHAqs2OnD/j/
 sVv1SFWoZm+EEpYnsPCW+ia2z/BL3cekWXXW0EJG8w4mAfv93vdVvjCLoVFceyjbX8xw
 bJnpPcJqxD+sb9TpH4ktYl/RZVHwzVpv+BWXdMAuPtvCjDuwepvbZa9ybHK7vN9WI5s6
 f8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sefFRWXuAIwA9Hn9aMW9zKhBMiydf7kE/zMEjZquoTs=;
 b=zB+3xzIaGN9+Bi7liQysYTDR/XrbxoT8aZM6buJlFhfiMrZSS0TYjKL1wkDx+lcPdf
 2t0XTH7ZQIqfZD8RvR7zHdjjJsbTNy+ZvQ0CcpzVotu0C5eMyebLaM0BF67qyMOCkvmf
 l3ZfUSvIZIMkSh1OZQUcD7zx7Sat7JAOKuej0JEZl8+8q8JDHs4uVcIOV3DpLJ0GzvtP
 mHYq8F3wC1xUgIxLDJeCI0PCDGtFXsboZCMKJratHh4e2vbxzDQqtq+INHzQr242/AxO
 Si0IwIijB824000I+4bMOqclv9JD/Kgqnt2x4IDSG+D40AgMsvXPr+knvkKKo5Wf19vJ
 z9iw==
X-Gm-Message-State: AOAM531ItrNGV+6g0q8MLQ2WKyVjHrE0OWONHN7nb01z0kIbVTIdSd5C
 UNSyFAgtmBBaIVrCLweSvZEfhPuemJi1IQ==
X-Google-Smtp-Source: ABdhPJytipreVyb9xVymZdp06ulsQoSugUFsDDvJIR5XEIPoKDkdyqq45v+aLQtYD2PutXL9kphxbg==
X-Received: by 2002:a63:b006:: with SMTP id h6mr6913792pgf.366.1634404461409; 
 Sat, 16 Oct 2021 10:14:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/14] target/riscv: Properly check SEW in amo_op
Date: Sat, 16 Oct 2021 10:14:05 -0700
Message-Id: <20211016171412.3163784-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: qemu-riscv@nongnu.org, frank.chang@sifive.com, alistair.francis@wdc.com,
 fabien.portas@grenoble-inp.org, frederic.petrot@univ-grenoble-alpes.fr,
 zhiwei_liu@c-sky.com
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


