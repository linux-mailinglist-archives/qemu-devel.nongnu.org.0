Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633D4DAA74
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:10:09 +0100 (CET)
Received: from localhost ([::1]:49686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMrI-0005jk-3g
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:10:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgR-0002YI-QE
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:55 -0400
Received: from [2607:f8b0:4864:20::42e] (port=36563
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgQ-0006TY-C1
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:55 -0400
Received: by mail-pf1-x42e.google.com with SMTP id z16so2568217pfh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mnSb1dxSO3Acb9OpkT5IqwkwlD06Fhi2+q3inDP0gio=;
 b=UGpebiJbBC4qCDeXRvgaUrpna9hs+ZZlVYLRiBWDjNoNpxyJQaSanZB0nPE6xaQeEy
 pgIlHAk0N7T/BZEkJPZ9IVAzV6l6BIhvd56IVTi5k5N9gncwDvwMYaZahfR12b4GoQUD
 I8eJ8Hz7vI+/gkPvVO8oqPr9E7pJRIbd1ACnevA7hD0tXAoEsCbJrqO7jbS2RvZb93T8
 6pciwKCktPttrlpKOaTIIhDHO2HhMMtvKrhPfVFmWXcQPr1GybcXXZehCFb3Egqxms4Q
 r2AUeYkLHPgxcf+VT09ibeY+rlIw31tv7hMPt6JEE5ygqb3OX2R8povvmhsvJlIBea5V
 crOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mnSb1dxSO3Acb9OpkT5IqwkwlD06Fhi2+q3inDP0gio=;
 b=FjvU0X6rtbZE8lHanCdsnUA+bxWaJdh4Ay56NP9dBaH0QnCMqJns5erMDDG9Z5oWhP
 QguYcFZtPvUmc3BmfNAE5uv7GBdF43W8aPukRGlRGtH7++2G00cFy/1qqLItomkfq6Uu
 l3MkVBkZUIOQeSSR4j8ghY454QLRzSSpD3/7xGNl4vCv1dxm9iwp8B3rIiF/qOeaoGXO
 rlRDMGL4zUSabWkmjlRAYAvb8Z759PeSCrgPC6bG50TAj9kXaVM1EQ5/KbYpdecUHi51
 q7DWtdceSJdvK1Z6pzFGO/tVZniK//bb2VekRaQz1xk50zsMWa5W0Ot47RW479H7T5DO
 ETqQ==
X-Gm-Message-State: AOAM533Wajna4e1AMfibH/C8oubC2S7GRSy1JQKxPq84hHmJlT9u2EA9
 xvr0Z/2rXAZo1hCYFuKGagMBwVKh7cWb9A==
X-Google-Smtp-Source: ABdhPJyvXTUghb5/g/UZbJ7W9mtlRGodRcBbVXs/VpBAw/+ofTdchBrN7cjnRAimPs+7hQIjc9hgvw==
X-Received: by 2002:a63:f816:0:b0:37f:f252:9f12 with SMTP id
 n22-20020a63f816000000b0037ff2529f12mr27571747pgh.318.1647410333157; 
 Tue, 15 Mar 2022 22:58:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/17] target/m68k: Implement TRAPV
Date: Tue, 15 Mar 2022 22:58:35 -0700
Message-Id: <20220316055840.727571-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 86e5e16f71..6118f9fcfb 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4911,6 +4911,14 @@ DISAS_INSN(trapcc)
     do_trapcc(s, &c);
 }
 
+DISAS_INSN(trapv)
+{
+    DisasCompare c;
+
+    gen_cc_cond(&c, s, 9); /* V set */
+    do_trapcc(s, &c);
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6074,6 +6082,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
+    INSN(trapv,     4e76, ffff, M68000);
     INSN(rtr,       4e77, ffff, M68000);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
-- 
2.25.1


