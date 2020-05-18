Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1601D8860
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 21:44:10 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jalgE-0004FG-4w
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 15:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaleQ-0002Mr-0Q
 for qemu-devel@nongnu.org; Mon, 18 May 2020 15:42:14 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:44387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaleP-0004QK-BV
 for qemu-devel@nongnu.org; Mon, 18 May 2020 15:42:13 -0400
Received: by mail-lf1-x143.google.com with SMTP id w15so1789530lfe.11
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 12:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PFsEe1qeGnF4uO+MCybzbHkG6H4gczYaK/HdWDtkK9A=;
 b=lZ66SOUKnpv1LJXIRI8J4lVNAU2URwsvP72xcnSbBw2FU6DvQUiWHHsSG3T+e5+r0S
 6dI45bgtFnxN9nJMTNYgDO6TH0Kcdld5FY8R9o/91gcXeJPp/ZL6iTDMTDbVu8qYps6D
 TlAbqIYwRMzes2UTxr5CF1B6u7VarDfMhIDAk5i1LGiyPvs2B5/zG0zmreCownLdN3/8
 xZgcCKlXuz9TQ5fcOGn1zabiaR9KhWjhv+V82x6lNP7PNFP7og0bF8dl28RbaWYjgapS
 mZJMuHIYMV3fFCamMYa2GzPTz7I3GqnrnD/r75ddNegC0DpPNrS07i1sV2JnORb+XLIR
 EVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PFsEe1qeGnF4uO+MCybzbHkG6H4gczYaK/HdWDtkK9A=;
 b=Jxp8Y3w6PPeufBxGo9BdlhfCSnmOZhzgcykv/92UVIiIlpsf41OQ1tBKp42EY0netA
 k3g7ZPAq+R11+eMQzlPRW6iUg09DvNonQLBcYqIWSWCFgaLXtPlkwPs5O0KDCpXS9IbH
 27/I2OQ7mC0DG6b38NzOC+Bbj/yEFhNbWUh2d0VB+R94PHW1OQ9x9UVo66rg/w4nVIUt
 w3oyzF7plo+7fqmGcF9qfiLU8lK3FZ/vcIOnLQLpim3SnrQ/mR4l0leSOCc/WIh2GhAW
 7Zmihx7J9icQ2wSB6TT+5f9+JAlPD6UTIQZuY9HJ6Y/jyaKjkmNPJepRJXJR5haSfycU
 vqKQ==
X-Gm-Message-State: AOAM532LOCtDNtOttSaR2RenurhpA/AL3wI4OiQsDTvPD6s/G/uKESt+
 Gido8YohFfVJUUgEoUnXRKPLuGryuBU=
X-Google-Smtp-Source: ABdhPJxAfQwyiJTNyOTeZT9yX2wrCv6XrWOUpekDpxAXWpWfaK0LvPYBqQjGVW7h5VKiQ9QMwwqGcA==
X-Received: by 2002:a19:651a:: with SMTP id z26mr12350822lfb.195.1589830931680; 
 Mon, 18 May 2020 12:42:11 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id r15sm7593128lfp.34.2020.05.18.12.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 12:42:11 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/22] target/mips: fpu: Demacro SUB.<D|S|PS>
Date: Mon, 18 May 2020 21:41:30 +0200
Message-Id: <20200518194149.16281-4-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200518194149.16281-1-aleksandar.qemu.devel@gmail.com>
References: <20200518194149.16281-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.rikalo@syrmia.com,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a cosmetic change to enable tools like gcov, gdb,
callgrind, etc. to better display involved source code.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 984f3f4dfb..715a872cae 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1208,7 +1208,6 @@ uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,           \
     return ((uint64_t)wth2 << 32) | wt2;                           \
 }
 
-FLOAT_BINOP(sub)
 FLOAT_BINOP(mul)
 FLOAT_BINOP(div)
 #undef FLOAT_BINOP
@@ -1249,6 +1248,42 @@ uint64_t helper_float_add_ps(CPUMIPSState *env,
     return ((uint64_t)wth2 << 32) | wtl2;
 }
 
+uint64_t helper_float_sub_d(CPUMIPSState *env,
+                            uint64_t fdt0, uint64_t fdt1)
+{
+    uint64_t dt2;
+
+    dt2 = float64_sub(fdt0, fdt1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_sub_s(CPUMIPSState *env,
+                            uint32_t fst0, uint32_t fst1)
+{
+    uint32_t wt2;
+
+    wt2 = float32_sub(fst0, fst1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint64_t helper_float_sub_ps(CPUMIPSState *env,
+                             uint64_t fdt0, uint64_t fdt1)
+{
+    uint32_t fstl0 = fdt0 & 0XFFFFFFFF;
+    uint32_t fsth0 = fdt0 >> 32;
+    uint32_t fstl1 = fdt1 & 0XFFFFFFFF;
+    uint32_t fsth1 = fdt1 >> 32;
+    uint32_t wtl2;
+    uint32_t wth2;
+
+    wtl2 = float32_sub(fstl0, fstl1, &env->active_fpu.fp_status);
+    wth2 = float32_sub(fsth0, fsth1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return ((uint64_t)wth2 << 32) | wtl2;
+}
+
 
 /* MIPS specific binary operations */
 uint64_t helper_float_recip2_d(CPUMIPSState *env, uint64_t fdt0, uint64_t fdt2)
-- 
2.20.1


