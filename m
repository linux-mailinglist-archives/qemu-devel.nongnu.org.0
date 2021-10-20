Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F2F4343D3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:23:32 +0200 (CEST)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md2CR-0007hl-LB
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26a-0007Bo-4g
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:28 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26S-00014y-7Y
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so1431230pjb.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8qboDzk3VhEZDOSy2c6q1MVUzAtWHxO1Mi1Ig7NaMDQ=;
 b=DfyNnSHTT7Cm/d/tKa8mjxxWBbLZrnikgG5+brvdze9JnnhrYy/4+23eGCvrOJLcLW
 QetNd797P6zGWYsHbRt/U2ZQdsofRZklO7QO0GgbnuTwTdLuBVJZNGqZU4E2oDY6raWd
 Ey/UdnqCAgavdmcve9oa4BF0i63rBln7R5TWpBNpNDTKp7AZplVZjY9maUdvMSDIRdtY
 WyplSRtrCJDuJB8G8gcFvbOQ+QCwPxVthz3u+IYGwzSD8JdWBcxUetzkfmBoB0Q+fG6M
 bKSFxDZe9HCNsjL0vCpDneVboxUcW194Op/n8EUQ66Sbq7HT+8AQQU09ag6u38O8fiAZ
 MwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8qboDzk3VhEZDOSy2c6q1MVUzAtWHxO1Mi1Ig7NaMDQ=;
 b=Yl+Mp2QWNmGZG8w226pvkHZ3Nk1+pi4SoudxFeEebrOFjZYgEe3bqg9sqCycV+zSJJ
 QQja1fufzaZIbcmaDM7jmpHkQh6oBpy3Qxk5Q0jDbk8yubrSTYZrPhw8RpTeCbC4e8dm
 hKm4Amojc+qroRKjcOXwG8pSXUUrzQmjjfmnZduEb9XpkN+h8cFnKh9R8U05cqoS1SZQ
 /IKor4QvsT1xIphhdFdXVvH3sDpaR7MtI6UpZ3RZUmjnamKbiEGvwB4cRVnruQdVju7n
 I5ZjjfiyKgBWWrUvUOFdJej2QgyD6FWhjco1iM0VYKNipAEYASp+Q5LVR+im6HQXyD6R
 qnHg==
X-Gm-Message-State: AOAM533uf6eHnnxXgb+ulqsAeJNHo+uDdLGOPxo8y7ra65Gdi3MsHALb
 SlW/mOx7xCo8v8xprtKvYXR8sZnzuafceA==
X-Google-Smtp-Source: ABdhPJyU8MLzIqG7H6oQkcGqVOY3ET5DI9Z3a063bEuiZIvb4AvbwH/qrg6zMIjR2vgGCYiw9YPVOg==
X-Received: by 2002:a17:90a:ba88:: with SMTP id
 t8mr4351381pjr.15.1634699838722; 
 Tue, 19 Oct 2021 20:17:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/15] target/riscv: Adjust trans_rev8_32 for riscv64
Date: Tue, 19 Oct 2021 20:17:05 -0700
Message-Id: <20211020031709.359469-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
index 9ef8ab94ad..d6f9e9fc83 100644
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


