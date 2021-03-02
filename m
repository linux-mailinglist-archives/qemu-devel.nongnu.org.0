Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017AC32A8B2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:03:10 +0100 (CET)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9MS-0000DP-UZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HL-0002Sx-GH
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:51 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HJ-0007Xu-Rl
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:51 -0500
Received: by mail-pg1-x530.google.com with SMTP id t25so14354701pga.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myPurBGQOJ9HRp/gWQglk2sYpbZ88UPxyO7dwBmpmMU=;
 b=fmZkbOnYawAdkOF7sk7wzSQGcR0VRtmZsALiro0upU06EGlblkw8nLvWpOVvNQuCg2
 d/j1fAdat4CjP6fC2Uwo2pP9iVF5a16xxa//D4xg4Vt8GgA5z3qKhW9LznWGw7lgsVMg
 39QbrVtpTMEmQH1cZ9hLvy+LuRqWr9zjt2rQUKEoeCbd7DNFDPvUq2lib1e2iIoCIWC+
 tIKq32UtdriFXXAiETczRmcR5bXr8tUtjFLVUHMbmYG1/UENd9HxrOzmprnBkV9eT24n
 +geMWoIHLjREmMhXn4puS5twr/MbcRP4C1//sjUzvY2gL8Nyu2JZNv9o01l9BvHn6raJ
 C1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myPurBGQOJ9HRp/gWQglk2sYpbZ88UPxyO7dwBmpmMU=;
 b=fccjRN0f4wdqq/hHJZR9OyjnKIknq31d7VeJDN6drFeysGhsi15jrFLngKksFQjiIE
 55BVtBPWi4VzhA/pKqreV5wDfj4lcXXA0UfTNEolLi1DbHpN/1Ad8DF52geR6hNpp3yu
 KVFclF79PQ/r9Qx0+dS1OuLSr7Uxhu/pCVe0ihcKqqCcDZ1+FV/dhpa+h6g03fEfoETB
 WWSc23ASYbhOLgQzOu9zcwPH/FZeZpm8/SFPV2CSBpMyUrVb1fsqHlraDJ3f4vPhKzYm
 BSGq6xGyW0xumiyHyA9AEb0EnVtqnRSKX9yQmpoD/ozh5YpHcvNM/GwoF5UcVbBN/Z0Z
 yaTQ==
X-Gm-Message-State: AOAM532DxdGs5mMXWDYaEX14gZoMEsgqwQDsMskvQ63ogOzPjw9eAVhn
 qTocqQP4Omngn9QwODrOelvbbOFtXeoMNg==
X-Google-Smtp-Source: ABdhPJxaijNWBp/8edIbKm4kgqgiP3xRaUA8ajxueqizdScqGtEbzOjIKW5LlsDrybdieLFdqx92Sg==
X-Received: by 2002:a62:1b48:0:b029:1ed:a400:9c52 with SMTP id
 b69-20020a621b480000b02901eda4009c52mr4316540pfb.14.1614707868509; 
 Tue, 02 Mar 2021 09:57:48 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/27] tcg: Split out tcg_raise_tb_overflow
Date: Tue,  2 Mar 2021 09:57:19 -0800
Message-Id: <20210302175741.1079851-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow other places in tcg to restart with a smaller tb.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 63a12b197b..bbe3dcee03 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -346,6 +346,12 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
     s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
+/* Signal overflow, starting over with fewer guest insns. */
+static void QEMU_NORETURN tcg_raise_tb_overflow(TCGContext *s)
+{
+    siglongjmp(s->jmp_trans, -2);
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
@@ -1310,8 +1316,7 @@ static TCGTemp *tcg_temp_alloc(TCGContext *s)
     int n = s->nb_temps++;
 
     if (n >= TCG_MAX_TEMPS) {
-        /* Signal overflow, starting over with fewer guest insns. */
-        siglongjmp(s->jmp_trans, -2);
+        tcg_raise_tb_overflow(s);
     }
     return memset(&s->temps[n], 0, sizeof(TCGTemp));
 }
-- 
2.25.1


