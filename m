Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BA698AC3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:59:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTM-0003X8-MN; Wed, 15 Feb 2023 21:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTI-0003VR-PU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:08 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTH-0005is-4d
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:08 -0500
Received: by mail-pg1-x529.google.com with SMTP id e1so406775pgg.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V4V1gK7l/X0jR5MaeGeYdL9LeHtcxKxh5We6ThF9P1U=;
 b=TrPWFXMsAiCkA4p371n2A6qXRuDhQ0MFNwv82NytilZ83cU0t7FATGtwB9oNo1dOaD
 WlxX+PIwO9DLe6rQmgjhpvl8nOkwR7+uDVDl+PZeJsWjdt3KYwjKn5j/GJEX0xHWzxJR
 lMsmkGgYa6n6DFzoiN/KDvqPbyYyT0A/CcoruFZc8bybyllT1z5mhTrRSA/UT03E1PA9
 U3H6UV/EpY/pJEPcZMtKQSy0IFw8xXtibC7bS/8LzMmFherZH0DdJwHvdMqvtTW13w0h
 ygDQuRq+vtQbe3dl6ibPsnBq2xWSQut9J4s1UfGoyq41CRTSm+xAlhtPEUnsnOJRhZWA
 xBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4V1gK7l/X0jR5MaeGeYdL9LeHtcxKxh5We6ThF9P1U=;
 b=BpvwTaBfbLRyQzlc0gY3/Zjv2hjoBXG3TtddDX+pRJHFW2uKSD0cW8BnMC5YX7bpO2
 cNuGmr+TmJOVhJx1x1p2aMaGhr9QdWWFFz2rEoxB4DG/sdTIFidPnqpDv/YRXAjgkTyq
 brAQ7AmREXKMr1ghKH2G0WwIMl34opFARmWDzsrufG1nDLuNJsjsgr/BJSAY7Os8nYyt
 73n6uTd+CTM4llTeJg4j8Uh6ogXUWnIm8CQiRG+Ysb5ocvzc8ORRaUHAnorYEi+maHEp
 /6Rav7XEMWZxbFmOkE9JWXgze9U7wUmspgaiBPwzyF3YzLTrZ4G1T7lYDTdU3iZw/B/2
 t9qQ==
X-Gm-Message-State: AO0yUKXLa3f7H0F2s45EB9qkPAiEBghyGbBAeAzhUPI70m0LBHFTrw2X
 suMDirExrhZPC60L+8kGJEUF0RM+reSBpEo2QBQ=
X-Google-Smtp-Source: AK7set9pEKXU8YP51L9zrx5Qss/6A4nDf3CQ6HrQyMLSlMuzpheUTQJqWR8QUKf6sb92x2Y7gAEEHg==
X-Received: by 2002:a62:1a58:0:b0:5a8:bdae:caa7 with SMTP id
 a85-20020a621a58000000b005a8bdaecaa7mr3512652pfa.14.1676516286358; 
 Wed, 15 Feb 2023 18:58:06 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/30] tcg/aarch64: Detect have_lse, have_lse2 for darwin
Date: Wed, 15 Feb 2023 16:57:27 -1000
Message-Id: <20230216025739.1211680-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These features are present for Apple M1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index d144d1a769..1a295791b4 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -16,6 +16,9 @@
 #ifdef __linux__
 #include <asm/hwcap.h>
 #endif
+#ifdef CONFIG_DARWIN
+#include <sys/sysctl.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -2916,6 +2919,27 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     }
 }
 
+#ifdef CONFIG_DARWIN
+static bool sysctl_for_bool(const char *name)
+{
+    int val = 0;
+    size_t len = sizeof(val);
+
+    if (sysctlbyname(name, &val, &len, NULL, 0) == 0) {
+        return val != 0;
+    }
+
+    /*
+     * We might in ask for properties not present in older kernels,
+     * but we're only asking about static properties, all of which
+     * should be 'int'.  So we shouln't see ENOMEM (val too small),
+     * or any of the other more exotic errors.
+     */
+    assert(errno == ENOENT);
+    return false;
+}
+#endif
+
 static void tcg_target_init(TCGContext *s)
 {
 #ifdef __linux__
@@ -2923,6 +2947,10 @@ static void tcg_target_init(TCGContext *s)
     have_lse = hwcap & HWCAP_ATOMICS;
     have_lse2 = hwcap & HWCAP_USCAT;
 #endif
+#ifdef CONFIG_DARWIN
+    have_lse = sysctl_for_bool("hw.optional.arm.FEAT_LSE");
+    have_lse2 = sysctl_for_bool("hw.optional.arm.FEAT_LSE2");
+#endif
 
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
-- 
2.34.1


