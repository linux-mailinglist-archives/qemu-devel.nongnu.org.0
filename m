Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AB0433BD6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:14:28 +0200 (CEST)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrkx-0003Hd-QL
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyw-0004sK-E9
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:50 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyr-0007Wz-7l
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:50 -0400
Received: by mail-pl1-x633.google.com with SMTP id w17so2057652plg.9
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bokkmTqu3PPB9lUNeGMuiR/uQoelWheprwGuLtvEEIw=;
 b=LfPiU/J7Rk9HLzqW/R6fqFFZXUAHkNXIgDrh+M1Q3XH4UXUOVSqQY91ffjiG4uFBFK
 i6U3ln/K1LPB4b+hn7wDGH+cHR4aTsA041sUpDK2icOr60qbac+pYsRlNHmajeUYYjWc
 oQIesK8NIxlv9us56t/rh/qnWwzxTWEXMc7pYMoKdPxSxZuh9CFnLuU8MB0rRPKAeKK7
 WnmP1n4xEobWSUtO7vEybXeNXfv6lzz0be4WjWxdipoAwPvs0seehTcJLt8LazL+F24l
 p3YcbbNMGMY+rZdwxZ4bDl7yiJ9hr5iFMjJJJwQoggHXvxz6s1eneAuqtqmd7RsfjJvr
 vBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bokkmTqu3PPB9lUNeGMuiR/uQoelWheprwGuLtvEEIw=;
 b=dN8uX6/nDA/55U8NOkK5FzxUXOrAZW3OY+QKVBoVU9+na9f6CxuehuHDtabeqmGuDR
 MgC+Yi872g7jkaHksIIFPd0mPJQFm3k2bXkwzlrwWSbHkSbF+2yxSr58cs+w3wGghU/V
 SBCAOtLXW3rzzcDlrVKphYWJF22OJA/a+g3GvwEJXk4N8u9WwqpSUuMIgs3fkymu2JHp
 aZq9LFHtqn8SOKWMJS4SnEHhDPDpkfF4TLgdhZ6yClfqqZ6r7WMYwkeOD1liIVNvrbeN
 ZjyzAl2bpYz3Bl0VTObHMEAfSB0EQsFsxosrCSPoN8Ss6XtQAKRwE7ZehY31aN126iPQ
 KmQQ==
X-Gm-Message-State: AOAM530kammNxzgOZpJeLAFG0Q65vssiCFCMqNYAuq6EI5R4Wue/8wTq
 X8vxnXB2kDDGpl6s7IQffXPvAhWOYzcnzg==
X-Google-Smtp-Source: ABdhPJzIzOvW4H9iBU54ROvFuflfWZLQTwrXVnpnc/AGURntkSGt4+fRZ/SNkzalkM3l1L7jrLPqxg==
X-Received: by 2002:a17:902:9a43:b0:13f:8f31:101c with SMTP id
 x3-20020a1709029a4300b0013f8f31101cmr26763502plv.76.1634657083903; 
 Tue, 19 Oct 2021 08:24:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/16] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Tue, 19 Oct 2021 08:24:28 -0700
Message-Id: <20211019152438.269077-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


