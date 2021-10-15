Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B142ECCB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:51:55 +0200 (CEST)
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIwU-0002tx-VB
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyh-000301-TW
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:07 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHye-0004dU-Id
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:07 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 21so5860846plo.13
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3a7sNfbDEfAusqXPwlg9pzFhYDJ+IUrZt+NhV8parMA=;
 b=Af/doY99sG2fj1ik0i9wtbJaw8+aoq8WAvVspnK6JbUJEs5QeLTgPui4zlGRBLgZxP
 WoNeQRjSOK9Nxp/aeQytInnKh57l5Yv2adpm7OgrAblgSM2fS+OeU+Vn5hxMJNFNxLx0
 mkYOtp1ZXlUIa73KOXVlmsC/Bs26wGBhSRNyRV+tRSbucZxzI7bVj76fWCxIbyxp3NuO
 pQsIedDvDxJu+6DPS5q8nwvMNzlepvptg7v1VzfadNSaP429Dsn8UpL8nz+x24d7SMgc
 ZLHGYtcUa90nKTi1iGb5Au/sumpqQ8umEPwVKsJVZDfEsvv8Zow/9tubLgmnpbd/XRz1
 /BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3a7sNfbDEfAusqXPwlg9pzFhYDJ+IUrZt+NhV8parMA=;
 b=MI5wKHZTKc0CYrQPJRsqjAG2/OaoypluAf0SHFIwjXCWPq2rfVpykZAl5iEuS1vw5D
 9nIPGFZu2ANiY2/jyYDrW93C27R7Axv3iQUfAivEQs/i/OfY8Tm+YyTpzQ0Aqwn1oApm
 7sGvWDi2/IdmRjwRp1Fzd+6sVv5KxcRlbzDcF7p1161yeSebVrFJhm55BxbrY4mbOlHw
 wpriM34/iIJ4On5njbayKawIMDa20yiJvJJN3kIXyj1M6eFNOpwDtdr4sHWuxWnM0VBJ
 Ah6//mAxIFdUKVmzzT+slOYqBL4mUHCYRuubqzpA37yQQOGGukF+a+0B/gsoe7ezaqSh
 HEPQ==
X-Gm-Message-State: AOAM532Ua55BvoHrO3cZw8wv2pyvf7Yk7wg9Ok+J9AA83QTR7TztX+s7
 u5ZCTX5rN6vvxrwD6g9daPOC0qr7NugfSKRq
X-Google-Smtp-Source: ABdhPJwtgtDEd8GeegRkO9wKfRKYyMZSo2DxUYw+yx/a/X8QJnyu/4cU8brf8zkKr9Aezo3843jqDg==
X-Received: by 2002:a17:90b:3a88:: with SMTP id
 om8mr11698299pjb.71.1634284203137; 
 Fri, 15 Oct 2021 00:50:03 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:02 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 54/78] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Fri, 15 Oct 2021 15:46:02 +0800
Message-Id: <20211015074627.3957162-62-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0c171a25930..a30da823d25 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2647,7 +2647,14 @@ GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
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


