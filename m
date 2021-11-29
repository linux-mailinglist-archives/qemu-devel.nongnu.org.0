Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29CF460D44
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:28:07 +0100 (CET)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXKo-0006u4-WC
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1Z-000215-TX
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:08:15 -0500
Received: from [2607:f8b0:4864:20::431] (port=42511
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1Y-0000jc-FS
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:08:13 -0500
Received: by mail-pf1-x431.google.com with SMTP id u80so15303383pfc.9
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iy4/ZG97pAI1fkdp/C0EbommRaCD38by4LIqf25MsPA=;
 b=IMG+G8+9gd+Jk+u+ebLB1gbrGaUWAVFw0DvBG4H2oRGDyn5p8nb04GwL6f8qhUG6NL
 rpcyn8dtMCZzo2W4LQ7nCHZbYz/Y9AIk8j1Hxap6y8e3m+lipEY2MR6mBYK0MHW73e6Q
 11ZFN3wOgopHOAYCT3bNiSwet3LhbOPm8/OFtUV9oMgDVBYEUuoDW+n/iRR50KDeQXbO
 GwnYwY+J1fvAz+WVbzorrgnLSOzi0mOIkJXx2bYoQ5Lm7HoC9eElOniIHxwgNA4M0/vG
 d1UIHlitvOnVA0Mj4zVeZa+M1cMBXlOAgWDGViXBndoe+/cSwulovkE2xBhdWdYU3tF3
 uf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iy4/ZG97pAI1fkdp/C0EbommRaCD38by4LIqf25MsPA=;
 b=VjIV8fyMOip/Ut8CE+aRyCy5MZGHOZqhD0khvtXaW7G0UqKfwGuZIXoflNDhCxLWyY
 jzot/qmOSNA/ybk8KQNdgay65CyIjYOcQujbJ4hsxfqR+27e8zyHag9RGkFPdyLv3mRm
 1ubFhIQ9M7a6y5FmErv6IMDZPgIp6qlKY08qyRcLHwUREG1ZnBwes20AoR64QAJsGlHB
 6EkIcKHQKPccJyQXYEagVr1nwToGed8Q0Wltrx8wcZS4EVWUJpCVLSgoPSU6fMHOZBvh
 4z5shLIuck3iwXWMPb45hRdorRMnpjQ0W4gsAK8Kt5mAxTJYOH37EYfUKOtL59Tw/rHo
 RYHw==
X-Gm-Message-State: AOAM531qnegpP4vBJCjcXSxeCLRVZPwuRbRe38O28bmNlaWGIY5NTvqu
 bT3sW8FQwxPzl73T7xRk3E5q7zXb1r7IbqHr
X-Google-Smtp-Source: ABdhPJzwPKzINnjgbp4aVTJsPw9r9xiyHJ71Hdnum1frmn1C4x0kaSDAm0xQK75ptvxG/dSZDserJg==
X-Received: by 2002:a63:864a:: with SMTP id x71mr33113073pgd.129.1638155291157; 
 Sun, 28 Nov 2021 19:08:11 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:10 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 54/77] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Mon, 29 Nov 2021 11:03:14 +0800
Message-Id: <20211129030340.429689-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 998247d71d9..b43234ed3ff 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2648,7 +2648,14 @@ GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_widen_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8);
+}
+
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
 
 /*
  *** Vector Mask Operations
-- 
2.25.1


