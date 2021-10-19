Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE76432AF5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 02:04:27 +0200 (CEST)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcccE-0007wL-Fb
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 20:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZG-0004oT-Hb
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:22 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZB-0001hf-06
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:22 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so638245pjc.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfu2QZ3gpRQ8C8fsN7554x8wxijvHESDqJdXEHq27p8=;
 b=pF9qsYkm+jAYNkcC5qyBCtWEvJLsIEptPifDCNVETkymDhzKKQu3ai6+bw1vQ8IyDx
 ytwwP9/oNEC5pWbhUBSDYH8b3/+yNQ6MLcnBeCoku6iZO2xWO8jDIoFYY6fVMhViGlTH
 D4UhqsTfV+u1hf6v3IUQe6vHCXPZ9F1USYnN3Pv9xp3PJ4q+gvps4eIQK0i16HD2WG3J
 GwW14jPeoqA/a9XtigxZs+wnu6xW56F1o+OPsGtjN6uUHkwqcuoo5bf4/0gFdPfiiq+i
 +PleDMH23DYYo6OcvL2Vo1RE34tmVOVShg+pcz1wSeKm0yXZHhdTCw7wif1PiZw48hBH
 OUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfu2QZ3gpRQ8C8fsN7554x8wxijvHESDqJdXEHq27p8=;
 b=JV8MzDEfxuJQ0/foU7TP1cclvE5N+aI/D3F9kEmmg4Sek+Prlui/SZMTQdzZ+1MCTn
 yNp98zU7QX35cySoRcS+kPwobfRZuS6tkV43j3anMLRVOUAffQuRjF8Ej4v6RKgATT3s
 BffyDNNzq1Jg1J46l1eoKpLW0itHlLrjYP+qTgdcziMl+tJizpL3LWyawKLCA7/yY4Pp
 KvOHDt32iy8K2/ocRalgWpMzmKVMDdRRZPIPuVer5eHjOX5h4ad+cEe2yZ8v6T/xwfFo
 YO2p4e+Qifdv1INEfYfgG4UkquoyarQdqlaY0P5GnxzioVcQEwiHDIK0AIMQGEgBj5lx
 xDuQ==
X-Gm-Message-State: AOAM53178FpKggrj99QsuVdoWaJ7Bhx1Bqy2pDi+MKLKFq23ARYP+XFK
 Dlg3V/xuus0pIDtd/HvvKXZpg3avKYAUXg==
X-Google-Smtp-Source: ABdhPJxApXye4MiFtg2l0EULg272NBEf58RwfN+t5xZsaPfiktx8g3IqUSjsrWRRTFYhcb8ad1ec2Q==
X-Received: by 2002:a17:90a:c795:: with SMTP id
 gn21mr2402194pjb.112.1634601674755; 
 Mon, 18 Oct 2021 17:01:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/16] target/riscv: Properly check SEW in amo_op
Date: Mon, 18 Oct 2021 17:00:59 -0700
Message-Id: <20211019000108.3678724-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index d60279b295..d16446d3bb 100644
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


