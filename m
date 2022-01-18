Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899534913D2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 02:57:12 +0100 (CET)
Received: from localhost ([::1]:48590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9dkF-000578-Lm
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 20:57:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZN-0000HQ-0b
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:46:01 -0500
Received: from [2607:f8b0:4864:20::1035] (port=34434
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZL-0007UH-CA
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:45:56 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 d10-20020a17090a498a00b001b33bc40d01so597219pjh.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OUeu6G1UBH4l7+NWJXgOWljjWCHmUKii/qGvdzYI7jQ=;
 b=QaFRa0xnGF7+x2Rpo9+YyuqHmfUs8Zj46XtCKyr+loHNJkS1GcWh0WW+JUjw6dig92
 QLZ4APqUoZ6fmb1qiFJvYS3tGxIaR5jCdZS868/rzDLY1boKrNk2/Q566JcGQlVfB9wx
 qhVqcSCtGdDWVAGZO5JP+oAQpnjIRqmBE/lARDbxzxmOiRq+WfPWiHLglreisc0K0+80
 esLL7xRfH5wENMQJu/ZwVHa/xkLb/FMegsdlU1U8JmjMi/fe7jKNL8Q1sadUiaPU4qc3
 1XxMQVlPXtsmSgthKRojJOHl5wCcmqZkMYJXPKWluY1lQvlSzcL56HTG0K6mLUF7Pfu7
 snqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OUeu6G1UBH4l7+NWJXgOWljjWCHmUKii/qGvdzYI7jQ=;
 b=aI/yz2tHuPNnFS7U87o7AHJO/K5pfThAmjy9jQTU0HaO1+Dpa5q+ahMOUMA62v4kUt
 kBQg4Spu7EMcIagWX70yW0gOPTpOKzCh0VvlRXhh340TUdRiqQ/nt9cTkzSo7XRsS0/Z
 dWVEFeIWKV7IPMlMkNO8M5IHs7SE9qo/wvdymc6mAnxZ2rC4KJRV12dcNJcJqosbYnzX
 tTbKbLAuGSNRAn1bpIw0UgunxNkZVuUmGLpwSY1NuuWVtQFtQs5H7sNtAU5M4tQkqvQx
 Q0h9O4zPtok9VzncgY8E+J37nvVt3ksSM5d5VcxLxr8KzE9gzpM8k90Y5hEFSI190kgA
 w5jw==
X-Gm-Message-State: AOAM531pDPK4LvDrEVGCaDFJ49ZEtg0gAUQRi6Hb/bJ/ZoLEuO1upvye
 aJgyN3ezfOpFwAYXMJmktWvdAz53n3FErydq
X-Google-Smtp-Source: ABdhPJzrhO/eAlx1w1u6shXaTjNal1/h8bYfnxwRUyQvtGYydDUkcJxH/ZB7d7CON8AeLPdmiHBS8g==
X-Received: by 2002:a17:90b:4f4d:: with SMTP id
 pj13mr6008133pjb.63.1642470351288; 
 Mon, 17 Jan 2022 17:45:51 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:50 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/17] target/riscv: rvv-1.0: Add Zve64f support for
 single-width fp reduction insns
Date: Tue, 18 Jan 2022 09:45:10 +0800
Message-Id: <20220118014522.13613-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Vector single-width floating-point reduction operations for EEW=32 are
supported for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 56246a5d88..08f25e3ce4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2937,7 +2937,8 @@ GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
 static bool freduction_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
 
 GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
-- 
2.31.1


