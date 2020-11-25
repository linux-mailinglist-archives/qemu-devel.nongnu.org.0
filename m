Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7692C37EB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:12:22 +0100 (CET)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khmAH-0003RG-Qw
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4z-0004mM-Em
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:53 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4w-000626-Jm
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:53 -0500
Received: by mail-pg1-x544.google.com with SMTP id t37so1186462pga.7
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CeRrpuz8AyToTR5rNqSx2nYuSkShEOKR3hSvhU0d5PE=;
 b=acPV/Ah429b3YcECViVoxv+ryYJKhc4SL5NQI6ZIKrNgoT0izAyAnTe9Z2/k1s1fsD
 1I80CcVYJmvnok+Rmxy5CfieRDTamaUC4n6eKvBQgKYw1hXzwNG/J1hP8sKv5ccsS1A8
 iwB+rN4+lSHA8+vq9pvqAI75Nllva5kV+zI66MiKDwfH4U7a6vIR6fHE67cOjMzuYLe7
 U76WjTTF/bVBvtWFwuSwj/TCCrGUxcoHKyRXU66TfVFnLVCx+ZYZ+x8drKtGdrTGbv/Y
 gXVRcZShWsWcqkes0oZoOcL3p30KJeTP/EYcotZpWJK4Kc7id5vZAN0O2jWY9OMOHey0
 V8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CeRrpuz8AyToTR5rNqSx2nYuSkShEOKR3hSvhU0d5PE=;
 b=AEBSIdU80xIiuPU/fKM+gB91jgbNBSOA6BbXRH9pIBbLdRZdQFVczK21GJwIzIZROJ
 9XbuLTHmVgT/Z6HniiFifHqx4HZRYvLo/rx/lFrR7WkrBfn23WVg6Q8VdaHUTWYk3dXj
 H2vXRvExKJrnvM7txwRHOrj0vfjUaGeQpBFmyKPQglPK3nEvMkMaFWRLBXnII9m+JZOC
 NMDjFjJpwhED+lZPiguB8cBRFauAmuyxEKEq/kJZWvMFSNrw4Nia2ZtdHHhQIbhA5rEa
 gymTm3BG9n/gQG3gXcpZwvLBVJQvnps5SDi6VZ22G6scJ4WClkz9O5dyGU/jztliPuh1
 A6zA==
X-Gm-Message-State: AOAM530fjk4ztQWgHTtcjAxFpp7EDHCpPpracL94JUusnDszbGK+WSS7
 /M6ks5ft0AcxBtOzb5OFgSOxPf6x6o6/0A==
X-Google-Smtp-Source: ABdhPJwD7iG9xdZhIJbjuntO+lv2P3aKgdHiSq7Ge2piU6PIssduCbu0GpoD+4cd9Y5j2Oo4e1GD0g==
X-Received: by 2002:a17:90a:5d0e:: with SMTP id
 s14mr1843248pji.53.1606277209110; 
 Tue, 24 Nov 2020 20:06:49 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] target/arm: Enforce alignment for LDM/STM
Date: Tue, 24 Nov 2020 20:06:34 -0800
Message-Id: <20201125040642.2339476-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 73b3d8cbbf..fe4400fa6c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7814,7 +7814,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         } else {
             tmp = load_reg(s, i);
         }
-        gen_aa32_st32(s, tmp, addr, mem_idx);
+        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN | s->be_data);
         tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
@@ -7889,7 +7889,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         }
 
         tmp = tcg_temp_new_i32();
-        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN | s->be_data);
         if (user) {
             tmp2 = tcg_const_i32(i);
             gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-- 
2.25.1


