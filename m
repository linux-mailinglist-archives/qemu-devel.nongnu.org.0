Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E121D66DF
	for <lists+qemu-devel@lfdr.de>; Sun, 17 May 2020 11:28:12 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaFad-0003yl-41
	for lists+qemu-devel@lfdr.de; Sun, 17 May 2020 05:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaFWw-0004Ax-Lw
 for qemu-devel@nongnu.org; Sun, 17 May 2020 05:24:22 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:41125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaFWv-0001nE-Ub
 for qemu-devel@nongnu.org; Sun, 17 May 2020 05:24:22 -0400
Received: by mail-lj1-x241.google.com with SMTP id v16so2568850ljc.8
 for <qemu-devel@nongnu.org>; Sun, 17 May 2020 02:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u+u2GTLpTwv9NrMPHkakKvWn/ABYNzXl/Rjh49VH7qg=;
 b=nKlABRnAZA+xXDMVxH8qNeFknIo34x1KARIhU0JylHWIfIUl38oyNga1TtXoL/RmCb
 Zeu4gNzEbS/IhyhL/MMz8RAsmIG0J3//u2uN53QaeNnP0tz3EVkOmBOCpxvy5Yq4ZQ7P
 /ALfxH0TaPNolbRiBQvYwfOHDVXmlOg/VCO2wPg9WFl0LCSYtKjIRiHHtwK75wKhwX9m
 xBzkyFIXebrde+vJULUjyXFIkld8WmAFfxHF2iArRtPABI6UlXO/S6NWDDLJl1mEf+CD
 /pj7/8rnsvw+sgt1NMjwvo/yjSsU0QrOxQXzq0FfPzePqZnWOYlOwLwFBRlN8oAMQOpp
 kvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u+u2GTLpTwv9NrMPHkakKvWn/ABYNzXl/Rjh49VH7qg=;
 b=omJCV+0NgpBW3uq8MTKef944WoFIDwn8r0kVHvNPbGMhxTdmdWZESDTEmV2aokE10k
 yE213G6xJoa2QwjINSxTyki//1JTJpkgnDG3ZyR7mr0d9mF1L6aeNJIgMa17YNg1tiIR
 lkSupbMt1EgTbdGfudwXTvMt0bhk5JUQsgpQjzJT6tm51wyjFh5E/LyC+Fppxb/tLFro
 RPzU+diHF/xqCv8rciF6XIe0FwwQILGpwa49kyQEn+zrTMeFFpUsJzpXoJCl1k2dy+gU
 Yblk+gcFdrsKQMYNuAr5fh9sx06GF1wvYpfRBteJgfs0NevJI6QSGCFgF0uX8QDjl5RU
 g8EQ==
X-Gm-Message-State: AOAM5321Den/Zw46osZ7Cke5T3iHWC4v6AgnI7gyevtwW4+FI85dNB4O
 jTpOfEJSUW9a06jNApoJQUI7ufeq9/k=
X-Google-Smtp-Source: ABdhPJzqt8IEByJ6TlRrpzuLtEtjH3L8Cx/COdG5RXtsLz3TJHW1z3KIkMhIsi+WWTSlKIRMbPkZUQ==
X-Received: by 2002:a2e:88d8:: with SMTP id a24mr7257797ljk.224.1589707460334; 
 Sun, 17 May 2020 02:24:20 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id l2sm3872138ljg.89.2020.05.17.02.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 02:24:19 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/19] target/mips: fpu: Demacro DIV.<D|S|PS>
Date: Sun, 17 May 2020 11:23:42 +0200
Message-Id: <20200517092357.1469-5-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200517092357.1469-1-aleksandar.qemu.devel@gmail.com>
References: <20200517092357.1469-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 449e945166..2759c9989d 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1208,7 +1208,6 @@ uint64_t helper_float_ ## name ## _ps(CPUMIPSState *env,           \
     return ((uint64_t)wth2 << 32) | wt2;                           \
 }
 
-FLOAT_BINOP(div)
 #undef FLOAT_BINOP
 
 uint64_t helper_float_add_d(CPUMIPSState *env,
@@ -1319,6 +1318,42 @@ uint64_t helper_float_mul_ps(CPUMIPSState *env,
     return ((uint64_t)wth2 << 32) | wtl2;
 }
 
+uint64_t helper_float_div_d(CPUMIPSState *env,
+                            uint64_t fdt0, uint64_t fdt1)
+{
+    uint64_t dt2;
+
+    dt2 = float64_div(fdt0, fdt1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_div_s(CPUMIPSState *env,
+                            uint32_t fst0, uint32_t fst1)
+{
+    uint32_t wt2;
+
+    wt2 = float32_div(fst0, fst1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint64_t helper_float_div_ps(CPUMIPSState *env,
+                             uint64_t fdt0, uint64_t fdt1)
+{
+    uint32_t fstl0 = fdt0 & 0XFFFFFFFF;
+    uint32_t fsth0 = fdt0 >> 32;
+    uint32_t fstl1 = fdt1 & 0XFFFFFFFF;
+    uint32_t fsth1 = fdt1 >> 32;
+    uint32_t wtl2;
+    uint32_t wth2;
+
+    wtl2 = float32_div(fstl0, fstl1, &env->active_fpu.fp_status);
+    wth2 = float32_div(fsth0, fsth1, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return ((uint64_t)wth2 << 32) | wtl2;
+}
+
 
 /* MIPS specific binary operations */
 uint64_t helper_float_recip2_d(CPUMIPSState *env, uint64_t fdt0, uint64_t fdt2)
-- 
2.20.1


