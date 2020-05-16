Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86631D6348
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 19:54:16 +0200 (CEST)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ja10p-0007fV-Ri
	for lists+qemu-devel@lfdr.de; Sat, 16 May 2020 13:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ja0tb-0003TA-RQ
 for qemu-devel@nongnu.org; Sat, 16 May 2020 13:46:47 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1ja0tb-0008PU-3B
 for qemu-devel@nongnu.org; Sat, 16 May 2020 13:46:47 -0400
Received: by mail-lj1-x244.google.com with SMTP id f18so5547663lja.13
 for <qemu-devel@nongnu.org>; Sat, 16 May 2020 10:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+crpwaRbz+NuIRuZ2Ykd3V1TrXmhpx6yRUQr18fFhI=;
 b=JTxa+Eko/UlmqtYMzt+pKdqz45MxRJewz/nPeueRXKAzGYAsigeYxSM2ze77Ip67gj
 kz5FlRlwbgGUQWyQlXAjazRQyrMVj5cqo+cIZWGY3D836C53G9K8VxndMDTZJVuZAgU7
 68wJYEIxwToALZHJAvmcpQB3vzhMNnmTOtD4gBI/XTDO8vpyJq3D9ScN6HDv1Xjs/2m/
 SH8xR2GqcbfTgC0MHJx/K2xSDSsZ6kL51pIqyq4vXjtOYWk5TsP3820k21uIkvx6Z6D0
 uxUiugf2l/alXWRDdOjGHn8Tjsqi73KF2jH8+gf2YLQd07RQeICERZjgAQcz97lV30YQ
 btJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y+crpwaRbz+NuIRuZ2Ykd3V1TrXmhpx6yRUQr18fFhI=;
 b=EI6XYxr9IWR7Yjk4Lr4kTZ2QSsrE+xRjulNGigFHnnGHRqn8eSES3PKuTccga1ad1W
 6EaYhusE7sgrnLLZ+2T4XeJM4vSeKpYiojQTnuxKP+1PBCkcpJZtN4ClxaL5W76ogCMV
 ZsZQJUKcnEbiGioSQOyruCFTMS7hlVogErHc72sbTPM6F+jqlPgLT70KzEcJmQgXz8o4
 D2K2Ga8+BwMOSJmSpb3URMroqz9YKVB3GdOrnNhq0FVCcpphHCquk8Y60Yw9nJ2Womqv
 pjPY5f1YdbY0TtJ2d/5Ew07kM0ww0eYsxAmcvttPWOaxl5duDYNKCi790Ebv7uRVCzsg
 1nKw==
X-Gm-Message-State: AOAM531V1xGCAr7sKn8xom2tLTChfQjhTEP3d6n1YZL77aNkHBFaOX5E
 IiflI+gGiMXXKtFIqQP+ETjkO7A0CgE=
X-Google-Smtp-Source: ABdhPJzHIqt+6QHrOZu5MVy1qgs45xDwJP8zijMXZ4TPJ6W1f9BndX/ZzfFOJqZa+lMDYIBxSnmE9w==
X-Received: by 2002:a2e:86d7:: with SMTP id n23mr4170830ljj.123.1589651205452; 
 Sat, 16 May 2020 10:46:45 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id i1sm3024759lja.3.2020.05.16.10.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 10:46:45 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/18] target/mips: fpu: Demacro RINT.<D|S>
Date: Sat, 16 May 2020 19:45:43 +0200
Message-Id: <20200516174548.7631-14-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200516174548.7631-1-aleksandar.qemu.devel@gmail.com>
References: <20200516174548.7631-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lj1-x244.google.com
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
Cc: aleksandar.rikalo@rt-rk.com,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a cosmetic change to enable tools like gcov, gdb,
callgrind, etc. to better display involved source code.

Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index e227e53f70..dae1331f23 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1113,10 +1113,26 @@ uint ## bits ## _t helper_float_ ## name(CPUMIPSState *env,                 \
     return fdret;                                                           \
 }
 
-FLOAT_RINT(rint_s, 32)
-FLOAT_RINT(rint_d, 64)
 #undef FLOAT_RINT
 
+uint64_t helper_float_rint_d(CPUMIPSState *env, uint64_t fs)
+{
+    uint64_t fdret;
+
+    fdret = float64_round_to_int(fs, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return fdret;
+}
+
+uint32_t helper_float_rint_s(CPUMIPSState *env, uint32_t fs)
+{
+    uint32_t fdret;
+
+    fdret = float32_round_to_int(fs, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return fdret;
+}
+
 #define FLOAT_CLASS_SIGNALING_NAN      0x001
 #define FLOAT_CLASS_QUIET_NAN          0x002
 #define FLOAT_CLASS_NEGATIVE_INFINITY  0x004
-- 
2.20.1


