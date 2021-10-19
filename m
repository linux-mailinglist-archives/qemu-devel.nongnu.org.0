Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511AB433CAB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:46:22 +0200 (CEST)
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsFp-0007Dd-5z
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqz1-0005BC-Vf
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:56 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcqyu-0007az-Pd
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:55 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v20so13893785plo.7
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=LHWFzxp4yLzmUteDIi1yQFWLmsDtrasHrtgw8oFYMeJMoNUCWK7waiWhe+MvD37lqr
 v0Dir3kqP5qK97qB1x6QJkeeZLzBVWZkLaoDP6G5aGCObs7IsenuDhIGXrCSx5GLIctk
 dFx82qN9K5Q8u7vKpz53rV2lPPD4pbiILqmxt27JkFIqV2TS98AjSj6FIJcaTfz2INE+
 lvazd3roLgqm9fJqkwG1t5zSllK5pZVSIwXKCorCkFfiivF2BMJO2XrPUCRIHAUElfRZ
 plIT/SjzOYjod7HEthqy0Yx9igSLlwSVN3/kQbgFIxluosxAFiX/l2BRaUqN/4N+jBng
 T8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=rJNoK9bueDAjO4mXKckPg3TZgEivS/t3btxQVsEl25k49VMdOTCKn0Wtlp5myk8kWT
 paZCEZ9VuaO0xzzO+vAnfCnbO40/au7mzGQ99xoBvpZC+mzNLBs/XODPH95A9puaw5w0
 hPGC3kFRT4Yrc057G6iMYf3xSdCbqD9Rt0t1q8eL7ZM95kNAYAz3pq/N6CfTVbVe9mFe
 7qBwjCKvxAF9YxJChR4K8o2hrcP+fY37jPCL3vyb/DH5u6XHFlrL8vv3CCNgr7nGKAT+
 J1jawMTKJ6+O1FFi/4mh4UKJYyPPFrJEXhgRgC0rxtINx0XpCD5af0nEIhBHcEO2VBjb
 uCBA==
X-Gm-Message-State: AOAM530zLnVtbTLiKvHa5OoCiXLr3Dvq6kCJZMbUzje3fgNqj7Bk8WEF
 Ik3HV6mw+w1194S6VuHKgbyFKKdkX/I=
X-Google-Smtp-Source: ABdhPJxz43zg3xX5dqyhHxR18n4MxiavfkcVF7KpWbo34EeFeXgXN0w+MLzQ86FJNbZkQTVFaKUqIQ==
X-Received: by 2002:a17:90a:7e90:: with SMTP id
 j16mr448683pjl.139.1634657087519; 
 Tue, 19 Oct 2021 08:24:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm3293814pjt.19.2021.10.19.08.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:24:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/16] target/riscv: Adjust trans_rev8_32 for riscv64
Date: Tue, 19 Oct 2021 08:24:33 -0700
Message-Id: <20211019152438.269077-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019152438.269077-1-richard.henderson@linaro.org>
References: <20211019152438.269077-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

When target_long is 64-bit, we still want a 32-bit bswap for rev8.
Since this opcode is specific to RV32, we need not conditionalize.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 66dd51de49..c62eea433a 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -232,11 +232,16 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
 
+static void gen_rev8_32(TCGv ret, TCGv src1)
+{
+    tcg_gen_bswap32_tl(ret, src1, TCG_BSWAP_OS);
+}
+
 static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
     REQUIRE_32BIT(ctx);
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
+    return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
 }
 
 static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
-- 
2.25.1


