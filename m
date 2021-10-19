Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4255D432B17
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 02:11:03 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mccic-0003Ki-B8
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 20:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZF-0004k0-7p
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:21 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mccZA-0001fg-V8
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 20:01:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id oa4so13360944pjb.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bokkmTqu3PPB9lUNeGMuiR/uQoelWheprwGuLtvEEIw=;
 b=OUiOPg4+zVJ2nH/6xLZiBrwgcE/K7PCJ037FJdmrKuEU4EkRqlM+FQprzhR5xZ3QpL
 uiGAH29PTfcLMkMtLVTZBBdF08i242pRM+eE7hIel4fX7rjBFoJXuZOtvPsQBT7z/eVr
 1QgjDRfDWMNolkd3HEtlrfnSw1XyCZMocyW9hF0iptDu1K9L+bdiiE+3r10RvH+Q0qzA
 XIeKvsbnHIlYHUW48JtRGoJqeq8Gei6vz/rGAMDccQvaDtNNs29wIkmbAUxKUmjAT7dC
 OAwLBKukrF1lHzvFa4vqzqijqoTTd6DyiEavQ2xoU4l5wDP1YEoN3tmcZKOwCjMpJLuN
 pL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bokkmTqu3PPB9lUNeGMuiR/uQoelWheprwGuLtvEEIw=;
 b=oKHiGj/fZjFgmuQKYq8isPxFUW4UtnCw/6/+GFADAzEN3n1nBsW222OFMQmeefpdv0
 RoH0xvL4lLTHhlmcLkso8l0Ugwx54ih+/6IP/NXs/N7DNcyDwMxKrRMYYCBHfZvSAITn
 3CbDbw3llg4pZEqYbCCnV3Ekw1q2+7OHL39Wb2bOOW/2WaA4dXTkS00ZCn9KMp71KzPj
 ykQ+85norVz+s0LXyWTG1LAy+PN30Hyg77i7h8OFVRvo3X1hCPCftoTcCLwvvg7tMozP
 lqLjQWAAIiMMdzA5oFp8TqFginV4TWdzxAweUuGoeGLo0t3qlEqzRL4Q56SwHTmW9iPK
 3P1A==
X-Gm-Message-State: AOAM533v2Ti8ar1AiREfkAxYKbrUdp5RhsrxO1C732IAjgFVs+LV6xbU
 5AvI/mOA36VheNsMb6BFHE8l6iiDTu40+g==
X-Google-Smtp-Source: ABdhPJyCaRjHx4XMnFlr5Y11TUp4JEUMfmmTfCt9mK3lNgs/oCQCh83fCdCMTOSmQvXXS4DqDytMsA==
X-Received: by 2002:a17:90b:1b42:: with SMTP id
 nv2mr2370959pjb.91.1634601673688; 
 Mon, 18 Oct 2021 17:01:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q14sm3068220pfk.3.2021.10.18.17.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 17:01:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/16] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Mon, 18 Oct 2021 17:00:58 -0700
Message-Id: <20211019000108.3678724-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019000108.3678724-1-richard.henderson@linaro.org>
References: <20211019000108.3678724-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 081a5ca34d..d60279b295 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


