Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D255048D7
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:15:51 +0200 (CEST)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9R8-0001fj-Mg
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xB-0000u0-Nk
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:54 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x9-0003Lx-Ef
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 n11-20020a17090a73cb00b001d1d3a7116bso2625391pjk.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/uFztF2R9mSbyAkaIbJngefgd7536mac94QZAXGuz0=;
 b=xERJDA756fJ3VZkY5DZkGuGfp2LDg5vlQUqtlbbT/YyGE7Ky5H+Fmti4vuYBqtjigR
 IlNYHtVb1RsKUiu9N7tJPEoVWShwHhzYpSeafu0xvjnbtxcWpbLbFaLPI8fs1o0tx9T1
 wUchWRcG8jgg04mDn9L4IiZiZ0QFoLAYPaQv7Kq5Y7F8Y1nVU4Coxi1fGQXx08Amn7Dd
 eAYowdbgp6bZ6TZ0kVnj4BqtKh5Isf/y1iMg09uOvrzbBw/QN/Pb5OCcg5xbomuiYc4K
 az+TLK9dH0dqzy6r+g/9NKz91HWqqOUUFIl9docFXkuOvJele0Ovs8MLcgX05qVLh6Hg
 asnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/uFztF2R9mSbyAkaIbJngefgd7536mac94QZAXGuz0=;
 b=1oc/UDoJFyn+++8CEoqexlrTlRRXETBZ12ZThARRyiC/igMt+pilaTZ3BP9DdepDp4
 dLTmhlVvYhFMFcijaiAZy11MipEFQWNQ+pGurrbBsj3+t5BGkm0xNZ5+8W8b/fEPcObY
 IuUN3L3GCDhem9ceqFdA4J2lE0CAonnX63XJ9UXN2XQRqu+xJL1nIIsHKhk13LsUZ7yz
 Kxvtj40T1Ou+ABIF+hwpsPRhZpfs6Cwx/vZuzchdYPxLaoD40+pc3EbApVhYcMRlDpC5
 HZ7Ov6GDrLavjuSuxVd/Ni3ypyULMIW65GQ30jKaEdBjRnKm7QsJoMKXT6BREx5xUGeD
 oF2g==
X-Gm-Message-State: AOAM530jUQQUDt79uuL81BV06/woKRJzbBDveppZllWvltExB8YC1wYP
 4mbusBssy8rnS/zVOdmjRVV024VpoOIxUg==
X-Google-Smtp-Source: ABdhPJzBEJebcMPclpK6sm1ri2DdiDnW9SA4HEhSKQTgo9BBRm2svVkf38tx78+6C1s5092i82R9Zw==
X-Received: by 2002:a17:90a:b307:b0:1bd:37f3:f0fc with SMTP id
 d7-20020a17090ab30700b001bd37f3f0fcmr14460341pjr.132.1650217489722; 
 Sun, 17 Apr 2022 10:44:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/60] target/arm: Use tcg_constant_i32 in translate.h
Date: Sun, 17 Apr 2022 10:43:49 -0700
Message-Id: <20220417174426.711829-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 050d80f6f9..6f0ebdc88e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -332,16 +332,9 @@ static inline void gen_ss_advance(DisasContext *s)
 static inline void gen_exception(int excp, uint32_t syndrome,
                                  uint32_t target_el)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-    TCGv_i32 tcg_syn = tcg_const_i32(syndrome);
-    TCGv_i32 tcg_el = tcg_const_i32(target_el);
-
-    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
-                                       tcg_syn, tcg_el);
-
-    tcg_temp_free_i32(tcg_el);
-    tcg_temp_free_i32(tcg_syn);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
+                                       tcg_constant_i32(syndrome),
+                                       tcg_constant_i32(target_el));
 }
 
 /* Generate an architectural singlestep exception */
-- 
2.25.1


