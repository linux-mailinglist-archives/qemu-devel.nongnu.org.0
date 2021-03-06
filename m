Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954932FD92
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:42:15 +0100 (CET)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIegg-00073O-6r
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebD-0006zS-7K
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:35 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb3-0002xJ-GF
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:34 -0500
Received: by mail-pj1-x102d.google.com with SMTP id kx1so1071894pjb.3
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y3W2C4gQqJ3gt54X13AfM/Luzq4svOq0hI3JMg2PfDU=;
 b=QAw15lxDhRBK0U0IRHVt5xlMrJn0Wigh+CbvSu9twgAwXLgBxBQZcsqbevXYhoINMx
 jjfSirTfO06LBCLBtHfP8k28WRE15dqFh8c2jmT3An0g3tzP9rpi7DPljHFRsT6jTX9h
 C5rDSLqqP0BxXCO7Rb27ee5dIZmQ3d1rDG+ZWdJBKhh+ah1ku6VYIVR5Q/6tDJFVvdQ5
 BDc7s2GJHHe9MQN0a9hKwPmb72NkKlATGPacLxS9ugYs+tKQQgF0ALWOeY6qE41m4eXu
 UWmrqbDddx19TCVY2z+JGGneBVGyO4PaIpzzfXwFc7iRTomTfpqNrvnM+WnzDmfM6vjm
 uwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y3W2C4gQqJ3gt54X13AfM/Luzq4svOq0hI3JMg2PfDU=;
 b=PN3I1dBEHira6/vsbbnyYxo3TvXk+17YxNKXNYnyZOd4tDftOD8G65B7oJ82wcBDR3
 88DKhObZOerteXolBhOnxoyEj6keRR7FSGzLIa6CnMsou6V54m4jJGRsnBO0RA7iywOz
 jju8Hm5A1eOh65/rb5fTdF++eZhrMXb4Z3VanUpwm79Y1EjoThe5HDniJZvuUCq4gwbW
 WZ7WJrc2lDLVdDLTQo7tblipTfEhw00EvjHJIBkOTAUjDb2aaB7HV07rciPv6ut0rBVJ
 +c+BTokzxn4X6UOu/d7ccUP4VZtFVtNLXgSaOLXlRKzkXf3gjDM+3I9R91/6B2NoEQj8
 fk+A==
X-Gm-Message-State: AOAM533Srw4Y9cvR/fCyyxzXv2YU7kHhoVZROa0wwDA0Mbbpe275fyv6
 F9wnC6mb3W4IOvsLsnKuEUHfdTHQ6NR3Iw==
X-Google-Smtp-Source: ABdhPJyVVNJvDCVLq+VLhxhALfYz702DPhA543fomAM810qn34hxxoKXiW8j6KzqP94AkANGdDqxXQ==
X-Received: by 2002:a17:902:6a88:b029:e3:cd8a:3a92 with SMTP id
 n8-20020a1709026a88b02900e3cd8a3a92mr14159870plk.22.1615066583753; 
 Sat, 06 Mar 2021 13:36:23 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/27] tcg/tci: Merge identical cases in generation (exchange
 opcodes)
Date: Sat,  6 Mar 2021 13:35:54 -0800
Message-Id: <20210306213613.85168-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 2/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210218232840.1760806-3-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index ea42775cb0..1896efd100 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -520,28 +520,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
-    case INDEX_op_bswap16_i64:  /* Optional (TCG_TARGET_HAS_bswap16_i64). */
-    case INDEX_op_bswap32_i64:  /* Optional (TCG_TARGET_HAS_bswap32_i64). */
-    case INDEX_op_bswap64_i64:  /* Optional (TCG_TARGET_HAS_bswap64_i64). */
-    case INDEX_op_not_i64:      /* Optional (TCG_TARGET_HAS_not_i64). */
-    case INDEX_op_neg_i64:      /* Optional (TCG_TARGET_HAS_neg_i64). */
-    case INDEX_op_ext8s_i64:    /* Optional (TCG_TARGET_HAS_ext8s_i64). */
-    case INDEX_op_ext8u_i64:    /* Optional (TCG_TARGET_HAS_ext8u_i64). */
-    case INDEX_op_ext16s_i64:   /* Optional (TCG_TARGET_HAS_ext16s_i64). */
-    case INDEX_op_ext16u_i64:   /* Optional (TCG_TARGET_HAS_ext16u_i64). */
-    case INDEX_op_ext32s_i64:   /* Optional (TCG_TARGET_HAS_ext32s_i64). */
-    case INDEX_op_ext32u_i64:   /* Optional (TCG_TARGET_HAS_ext32u_i64). */
-    case INDEX_op_ext_i32_i64:
-    case INDEX_op_extu_i32_i64:
 #endif /* TCG_TARGET_REG_BITS == 64 */
-    case INDEX_op_neg_i32:      /* Optional (TCG_TARGET_HAS_neg_i32). */
-    case INDEX_op_not_i32:      /* Optional (TCG_TARGET_HAS_not_i32). */
-    case INDEX_op_ext8s_i32:    /* Optional (TCG_TARGET_HAS_ext8s_i32). */
-    case INDEX_op_ext16s_i32:   /* Optional (TCG_TARGET_HAS_ext16s_i32). */
-    case INDEX_op_ext8u_i32:    /* Optional (TCG_TARGET_HAS_ext8u_i32). */
-    case INDEX_op_ext16u_i32:   /* Optional (TCG_TARGET_HAS_ext16u_i32). */
-    case INDEX_op_bswap16_i32:  /* Optional (TCG_TARGET_HAS_bswap16_i32). */
-    case INDEX_op_bswap32_i32:  /* Optional (TCG_TARGET_HAS_bswap32_i32). */
+
+    CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
+    CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
+    CASE_32_64(ext8s)    /* Optional (TCG_TARGET_HAS_ext8s_*). */
+    CASE_32_64(ext8u)    /* Optional (TCG_TARGET_HAS_ext8u_*). */
+    CASE_32_64(ext16s)   /* Optional (TCG_TARGET_HAS_ext16s_*). */
+    CASE_32_64(ext16u)   /* Optional (TCG_TARGET_HAS_ext16u_*). */
+    CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
+    CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
+    CASE_64(ext_i32)
+    CASE_64(extu_i32)
+    CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
+    CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
+    CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         break;
-- 
2.25.1


