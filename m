Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC1D515FCA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:11:20 +0200 (CEST)
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrYt-0003gQ-Kq
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrIB-0004nj-AX
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:54:03 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI9-00084O-1L
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:54:03 -0400
Received: by mail-pg1-x533.google.com with SMTP id z21so8821421pgj.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qLuJ3kY0B/Vq78Y89l2hbdJvKBIIYeH0UMXub8wd6WI=;
 b=gQVkNqF3Smny5Ybua0zY9Rz95BZwya97y1092Va/hLnU/oDJODFCW10cX11r/S/hyp
 6MvzHJSrWNX8VddPFMZ5WRuHyoTXGsr/LuZuhMsiTWyBOapYhaLtMqEAFY6Xb8UXwvEI
 YtnLH9UYx/x0MKTvY0mY5BOX1EvoDD6C5j8jvr0oRmjswKf4thohwo+XL0fK5tPbrU/a
 exOAZxf87k3X39Sx2junLj/LxYwtvuV4iGOxGWSxHFAUmXG9fI/TqAYpbrKeUgHVJ7sN
 FVEqbNUIME21VEaa+cBnkFpDqLzD8ib7+EC+p5ujUPa4bTwYv0Qh/PF2//As+CkQzoUR
 hlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qLuJ3kY0B/Vq78Y89l2hbdJvKBIIYeH0UMXub8wd6WI=;
 b=CweUmDF2aK0TgCQpRtMv9JvqKn02znV+0wQkqHgt+UQhWJHm0yIe8N1ekK1ntVxy3g
 cmsXide0K3wvJ8+/ZJjQjtQk6zEOE7JIw5EbCvJStv870Os7xwbdYvnaVEur0PPX1uqF
 cMI1EMBZrkg/Uwqs0OXw08COnEyP2bXm5aws90VJbPB0RL6wsPGEmqeup0Q+OTuC7MMI
 cegDlF6Fc0TsumO1nKf91fqLrlxJN/8Vqk02KZEVqecHYemM4tXcxkc/MrmKx7Ay/EhL
 9bU1oNA+j3riXFyxgrU5lyWNKVG0p9xgluQbL5wWrjiApLhJPh6CpBGSBfLOn226R5V0
 fsAA==
X-Gm-Message-State: AOAM531XMROVhaiPOs75V3uKYZx2uBqH12qW851+KeXDqbAwFVZSCpID
 tx9Q/LKABqkmKJjHWYvBfIP9oshto57BLg==
X-Google-Smtp-Source: ABdhPJyKwXJu6MrC/DTO5/9AEIU9o6q3wUIyy6R3ZxAsbe5nqie+gO9tofXC2dO4PbrhJbOXgvMRUw==
X-Received: by 2002:a05:6a00:1a06:b0:4fc:d6c5:f3d7 with SMTP id
 g6-20020a056a001a0600b004fcd6c5f3d7mr4315325pfv.53.1651341239810; 
 Sat, 30 Apr 2022 10:53:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/17] target/m68k: Mark helper_raise_exception as noreturn
Date: Sat, 30 Apr 2022 10:53:42 -0700
Message-Id: <20220430175342.370628-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
index 61948d92bb..d9937ca8dc 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -532,7 +532,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #endif /* !CONFIG_USER_ONLY */
 
-static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
+G_NORETURN static void
+raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
 
@@ -540,7 +541,7 @@ static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
     cpu_loop_exit_restore(cs, raddr);
 }
 
-static void raise_exception(CPUM68KState *env, int tt)
+G_NORETURN static void raise_exception(CPUM68KState *env, int tt)
 {
     raise_exception_ra(env, tt, 0);
 }
-- 
2.34.1


