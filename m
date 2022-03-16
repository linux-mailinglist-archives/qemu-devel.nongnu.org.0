Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD034DAA84
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:15:41 +0100 (CET)
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMwe-0003Lh-Nn
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:15:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgW-0002tu-Po
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:59:00 -0400
Received: from [2607:f8b0:4864:20::435] (port=42558
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgV-0006Uk-BT
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:59:00 -0400
Received: by mail-pf1-x435.google.com with SMTP id g19so2513963pfc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xHtUxL7CUQJX7r2KCi36AJwWM+Hpww6frztwUIExIEM=;
 b=c4Bj3hUtBd0LzD1TMQRURdvn22Veadd8xzhGj0lmzIdvneY7Cei2YWNm1JiB2ELe3n
 bPgRcLyV8F9RLj6woy+As4AtTb5VZIn9YcEBKuqrUTVKiciWAGkYf96utrAq3noTohF8
 TY2OA/bvJHavFTtuy7bt8Hc9UR9qwhiz3EJByjU3SrndMc/PEyTbb06ddAvkgyFoysg1
 9Tm//7JSMvOuSDxcgBenPEMGia5NGY4rlexlQ9WL+pZ6Q7eG0vYFdkFcgr74px63igpd
 fkMq9HTSjR4UEchJkSaEG38LhuajlECnKBKlRzNLpmlZVqh6bdEPdXRG2aOKRN+vqIyC
 I5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xHtUxL7CUQJX7r2KCi36AJwWM+Hpww6frztwUIExIEM=;
 b=BWpr3ccT0EC5h/9ck+30ZOXHIiPw6FRwqrot3twhJN3/vRLolGfVp8x7WB3c8d0dlq
 3pix7x9Dn7RlRm3KHzuh67ircBBLFGotFpe7PvabhMnWka4vOKU4BWsn9OHf3Ikhp5vv
 q7yYfw6rAAxdvCuAYodCfPVCvmWo8RpiaUDb58Tb543eUJ0M9A2l62SoPvPv9s9IH/R5
 9UY1lWyCP1qi28Z6D3OOj+j3SC2SuBZAM/hneHedpP5poQsMA3FSaFuTc3iQj7LiK2wb
 hzhjFDY14zUTaOllnVuOoSzZMXCm/OiSaEcqkaI1TWkGrxfde27FlYLhhjOBF8gMf59r
 VB4Q==
X-Gm-Message-State: AOAM530+R2i7P9C1qPc3qNoxZc3pTYuoyyc56MdVskIV6/TrDs5Norfg
 SOq9sD/TAFYvQg8JkgAximon4STORWVXqQ==
X-Google-Smtp-Source: ABdhPJwpAPRHi8nKa8EyKTYiiUmliGHurlEY9Y7iTml9M8vjI+iUTW0WQYYgVdX/87vp6RpY3b3/Tg==
X-Received: by 2002:a63:5051:0:b0:374:5fd0:f131 with SMTP id
 q17-20020a635051000000b003745fd0f131mr27485079pgl.431.1647410338246; 
 Tue, 15 Mar 2022 22:58:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/17] target/m68k: Mark helper_raise_exception as noreturn
Date: Tue, 15 Mar 2022 22:58:40 -0700
Message-Id: <20220316055840.727571-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Also mark raise_exception_ra and raise_exception, lest we
generate a warning about helper_raise_exception returning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/helper.h    | 2 +-
 target/m68k/op_helper.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index f016c4c1c2..c9bed2b884 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -109,7 +109,7 @@ DEF_HELPER_3(set_mac_extu, void, env, i32, i32)
 DEF_HELPER_2(flush_flags, void, env, i32)
 DEF_HELPER_2(set_ccr, void, env, i32)
 DEF_HELPER_FLAGS_1(get_ccr, TCG_CALL_NO_WG_SE, i32, env)
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 DEF_HELPER_FLAGS_3(bfffo_reg, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 0de4743d01..374fdcad87 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -532,7 +532,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #endif /* !CONFIG_USER_ONLY */
 
-static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
+static void QEMU_NORETURN
+raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
 
@@ -540,7 +541,7 @@ static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
     cpu_loop_exit_restore(cs, raddr);
 }
 
-static void raise_exception(CPUM68KState *env, int tt)
+static void QEMU_NORETURN raise_exception(CPUM68KState *env, int tt)
 {
     raise_exception_ra(env, tt, 0);
 }
-- 
2.25.1


