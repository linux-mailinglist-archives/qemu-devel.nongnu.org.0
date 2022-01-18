Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D650C4913E4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:04:14 +0100 (CET)
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9dr4-0005Ux-0C
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:04:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZG-0000FF-1e
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:45:55 -0500
Received: from [2607:f8b0:4864:20::633] (port=35636
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZC-0007Sq-3b
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:45:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id u15so23025795ple.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1+LHi+MwDv8WRRjPrUiQv8yGNTdHo3x15N4GYRkE264=;
 b=lGnhMSzuLXuwpt47U7mQs3yTtuBUf/1bfKoUd4z360YmaBdZr/2Mszkl0pSXivHu4u
 Rd+ADhTmdrznUmVfmN5iorlru1S4hvVj6M0IXe9foK2Onk21EUxsfSqnPzk0XOl4oFzo
 gID7i/xHuZjgX71GxLwairoKh4C/epbS1f2ip+ncLabt+9oTYwbH2TkeAiM692lhQn0e
 HEWNaSmgIZdagaLo/s1kCQXTeMlTFc0X7fHYvVuy0vY0p3AzJwPyBt1SPw6Opwj+aQOa
 vrBSyr89NxHg8lRSMoQJOAW53fQ/QuaNW16fdVuzpzxFf0LB9t3uTq7UagWvtYgE+vYJ
 iUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1+LHi+MwDv8WRRjPrUiQv8yGNTdHo3x15N4GYRkE264=;
 b=TrjFTb6/uLbCTtLQRtgK3LjZ4rCTDEkyoXostSzWLu21Nqp8nICf+RWfRLktWImEGD
 BoSHIGuvWJ5c650DBN65fh8nZonUVNJQwznML17Gj0APQACUK+K9RbcgX6XFvg84RSIY
 2RvKZN4KQwmlmiA3NPpSqNsW5bSKflZ7x4j6ClLFSN/xUTRfuEEYbgH3JFoxz6Oh3qdz
 JaNtgsbecnxgxg9v8hE+W7+oU15IEGW28PRDfCH68aDXy7ToGdK9eCAReG20+iOpukU+
 sO0QVRDfSaWFGl1BCEkQiQUQw0K7+TBXGktZWAgEYrQNRq//vx3li28H4ZpuIX3OgknL
 0H9Q==
X-Gm-Message-State: AOAM531vOntiz0+9n+76iLjim1qm7OyGElFDCdO8oRk53kRnaAIvQIGy
 UHLRzU8qoDzmmp4EghCOIPu8QyxTlckJbQen
X-Google-Smtp-Source: ABdhPJymyYvZTAnScNlEYMGkGZ1+HpzxbHClfmbgKpIIP2rtTZ8Xl1m50Lz7Vm/jdjZLtKZFlNSJFA==
X-Received: by 2002:a17:902:a9c3:b0:14a:d1dc:303 with SMTP id
 b3-20020a170902a9c300b0014ad1dc0303mr1775386plr.86.1642470344423; 
 Mon, 17 Jan 2022 17:45:44 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:43 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/17] target/riscv: rvv-1.0: Add Zve64f support for
 vsmul.vv and vsmul.vx insns
Date: Tue, 18 Jan 2022 09:45:08 +0800
Message-Id: <20220118014522.13613-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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

All Zve* extensions support all vector fixed-point arithmetic
instructions, except that vsmul.vv and vsmul.vx are not supported
for EEW=64 in Zve64*.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e64dddda28..8e493b7933 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2123,8 +2123,31 @@ GEN_OPIVX_TRANS(vasub_vx,  opivx_check)
 GEN_OPIVX_TRANS(vasubu_vx,  opivx_check)
 
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
-GEN_OPIVV_TRANS(vsmul_vv, opivv_check)
-GEN_OPIVX_TRANS(vsmul_vx,  opivx_check)
+
+static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector fixed-point arithmetic
+     * instructions, except that vsmul.vv and vsmul.vx are not supported
+     * for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivv_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
+static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector fixed-point arithmetic
+     * instructions, except that vsmul.vv and vsmul.vx are not supported
+     * for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivx_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
+GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
+GEN_OPIVX_TRANS(vsmul_vx,  vsmul_vx_check)
 
 /* Vector Single-Width Scaling Shift Instructions */
 GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
-- 
2.31.1


