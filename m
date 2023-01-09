Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013C4661C15
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBr-0000pC-CI; Sun, 08 Jan 2023 20:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBp-0000oY-5Q
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:05 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBn-0001Yt-K6
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:04 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 cp9-20020a17090afb8900b00226a934e0e5so10009180pjb.1
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dS32zfSBu/kF12OtOcGjeLh3cT3wgUbDUauEFguZfiU=;
 b=Ln7q9+BC/VMn01rCztqz8ipqrvE2JcnUmu9wup0BzXje5QjcGrZjk1ha8lwpdxbo8Y
 QDOOWlooXT8/rgHTdSTDp8dqGg7Bmw1AWTDWUSUMUhi3ynVAPlvVpVZFSecl2LdMUHmx
 j/mh1HITIe6SZxFBsaPYMUchoNQCmOhZQMf8H2+cgvPNP2GEsQ+byIww9gSdSgzoiHDK
 wXCG/0HFsl4+s5wfU8/vcy5HoI/Aboj2avZHXkQcR29TTz9UYxNYqiHj9POHwtvmTB80
 5GhF3XUKCDAbyC3kyA8JyK6A7473Q+VlqmY/hXKaRP6jc6ptpOCCg3lo3tBTK+1wpd7A
 GBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dS32zfSBu/kF12OtOcGjeLh3cT3wgUbDUauEFguZfiU=;
 b=MWgJ8NbH7RH5YXWfs5S9iQpyZrnar7FdNKsMHMpU7zupJ75xXaBakwRt4Ah1pFS8+D
 zeOHHCba0SSPfVQVEIJslxPQ5KOYgRrChN5QFxhpBZrDWEVgc6ip91YrLcW6dopMC6p3
 yQjjbTR9kISyJNZzeAInpzI6edrjNW7JldyZ85n3WXgtJMD84zpoQYS0s+U7oO6kDfWX
 ULjqSrbLFMskzq2ApKHVCD11alc7Ukv6jJdbQu3NCuwiEz678ef2/5buauHKrmBHCgMg
 7BDGwy/BRBVfZ1wD8DkLHnBI7bH+nA0EL5gXT3Dvp7iq4TEdnDKcS87bR4ke7VJZTL/h
 m6dw==
X-Gm-Message-State: AFqh2kroVRv4zlk9RgL9Mlp+pKFBSFOTTlmlGQPeNJHp6Nlyqu1CFEcC
 zN57SVZ37qCDYatgBy/d9geH/OU1llHNXFRn
X-Google-Smtp-Source: AMrXdXu/6TIQYz4r6qNGSXKY/wL0D7TPnVlv7HBDokjyFx42XbI29F4ZSJvh05xlMrGVWVQJs70Bmw==
X-Received: by 2002:a17:902:b413:b0:189:6ab3:9e64 with SMTP id
 x19-20020a170902b41300b001896ab39e64mr62154821plr.34.1673228582266; 
 Sun, 08 Jan 2023 17:43:02 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:43:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/22] tcg: Always define tb_target_set_jmp_target
Date: Sun,  8 Jan 2023 17:42:40 -0800
Message-Id: <20230109014248.2894281-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Install empty versions for !TCG_TARGET_HAS_direct_jump hosts.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc   | 6 ++++++
 tcg/mips/tcg-target.c.inc  | 6 ++++++
 tcg/riscv/tcg-target.c.inc | 6 ++++++
 tcg/tci/tcg-target.c.inc   | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b8f3b0c634..b21dd561fa 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1964,6 +1964,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index e54df4128b..0b5e100cb1 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1977,6 +1977,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index ee6759f787..e6a3915859 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1310,6 +1310,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f2ac356900..54779d86d9 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -603,6 +603,12 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
-- 
2.34.1


