Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1ED2F2CF9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:36:09 +0100 (CET)
Received: from localhost ([::1]:44480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzH20-000728-3A
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDE-0006Vz-LZ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:40 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDD-0008JB-4z
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:40 -0500
Received: by mail-pg1-x532.google.com with SMTP id 30so1082413pgr.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fY+GcOrASDOiYUT5LG3k1EJZKOqbSJ8XapXzLlPlL3Y=;
 b=PD09wG1I2j+3wPuGVaOFbs8wTyi7KtAElczAhUctMj2SiNvOoyNhN9yUWiFdtSlW7+
 jHsSvXQYD0qPt2+H6/IrmfI4XblLJDPo2c9/juQJ3hGW7nwxI0NtlyHpSrBddlGkx7KI
 qwU6Py/R5K4xwt+tw+bdMM8ffICLXwEU2BN52ZX0ISHNLzJN/6+HC/xCs+2Dq1vO2NOe
 vks3fHExzPM83M9Ypw/KEerAfcF/v81YetTwkdvQTP6oiFzuaG685V0AiDLcdJVVt2/4
 vo04rE4OxmKyfjAD6RVzNxkOzSFIfhL31zmr4h9tuIj2y8PZ/k7uENxaL0hOsTOPGo3t
 FY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fY+GcOrASDOiYUT5LG3k1EJZKOqbSJ8XapXzLlPlL3Y=;
 b=lqyYeK5cOgo2cCvRkdmyNhJ3Bafnl3cW3Ld1y5EV85/vm1YwFwpf5TT6DRuk3gfedl
 uRGmla1s4F81JRmi/sLqu254jGHB7av0I3OmBh+oQ7mppns6UQ95K0LvT133wA1fSHxZ
 ehvu+U9fAAgbTJskZmkgs/0k6iKx6/ruZb6pQta6oN36Vr5s9/LBm1B3DcvD1sgLNXJp
 aivkShKv8B6/A+vsH+SBz3eTdzB0HZwLhc4+7X4GKuyb/pjgye2cx6/v4GMLYQexGUvS
 zOb2o2+Nz3a+bEU7W0zOA6IROFE/FR2ws8njV3An8jefQszreptDB6B3s4LtbACwW4e6
 5WPA==
X-Gm-Message-State: AOAM531g+0rFSX/SAgeMvJY8OGGHAjhuEdYgjAkGnU6uDe1aYvRZxMLf
 qmNzLTwm/3F8DPQLxXiPVIm4i9XFt+GzOdS9
X-Google-Smtp-Source: ABdhPJw0NiHjG7WcaRWvnXCUWYbf18KwIaKY9xmOcR+hY3QEAmoBf1GLOFVLjYqH/2HlyKq1kubBSA==
X-Received: by 2002:a63:ec4f:: with SMTP id r15mr3904568pgj.344.1610444617686; 
 Tue, 12 Jan 2021 01:43:37 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 53/72] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Tue, 12 Jan 2021 17:39:27 +0800
Message-Id: <20210112093950.17530-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
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
index c4ccccb0370..49889a7706b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2877,7 +2877,14 @@ GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
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
2.17.1


