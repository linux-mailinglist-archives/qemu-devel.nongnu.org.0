Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089CE31E022
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:23:51 +0100 (CET)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTMU-0008QJ-3R
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTJn-0006JG-1B
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:21:03 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTJl-0006mm-G8
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:21:02 -0500
Received: by mail-pf1-x434.google.com with SMTP id w18so9154407pfu.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTk7Zu1K9am+nHTK4Qgzw1qdbWz4Og49PpMunTWLZww=;
 b=yONhUzE/ZFPuJQCJnBW3TFseiiV2XlrJwXnpZRn4SW3SQ/np4YUKjgOBjVdG6Zo7J6
 DXX61R7yywJ179YZFdvZCSNgwR9ZhO9btLYtlxplNkrPQ2jrrlrK6SlvHytFAaisy+/s
 bL3AkGL7L57UbcHwXqrIPZLaKNy34/2ERxV/A7grRAPTJ94M8pB0M+IgX6l8VK5abEiN
 7nLb/DA2UicFebNiy44ylQOmYuNbI1icmS/UiXuj2KY2gHBcDuCJ7xz2cmuOLGRs9Ru5
 6B/d8FML+8n025eAC2uXJhg5iASRPQHQWikbLRCZGc/OAz8jmsiSjsQe9iXcUHLsyxRF
 mqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTk7Zu1K9am+nHTK4Qgzw1qdbWz4Og49PpMunTWLZww=;
 b=VHku3LZzXdFX+oEjFkZG9TcCChJa1qNgCIQ7Oonldidgiy64E+UPgIOY+/tHyNnIMk
 sdjidNaTgoft7Twty+coZ96w+seuAaYu16KISaB8yWZdwBdqK2NeLb6pmZIsBxW+CQv5
 RQFK/4B98bOnXgtvscqanANsR0b3/+Ga10cqLXYclpK/ILHsPFS0Fmtrcmor++apR8se
 WpqF6M9Lma9UdZ62GmM2SPK/41xbANRXFVJCCj768vUezqtER0fMhs0db2DUY3lioNPY
 qTTZwhxe9eF0vA6Xl7gE8MIEmveOsmjRxeFGaQTKUCabgfZ5jBYmr2uvQSYDoYUeQl9/
 Zf3g==
X-Gm-Message-State: AOAM532QBClx64UwlAfoMTLv5/nZ9mR8HitX6t8nxVktRo/I3ZZVm7PC
 Ik6Zpo+8jp//LaImZ7ePcMdtOtPafPtuow==
X-Google-Smtp-Source: ABdhPJzzet5zmG+XzUYJMrZDjXenqCCqKLdR32ZQ4MPNqbIR6dMqlPcibnPzvZbqc2V0aY5JEEHhOw==
X-Received: by 2002:a63:cd4f:: with SMTP id a15mr934412pgj.105.1613593260075; 
 Wed, 17 Feb 2021 12:21:00 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:20:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/71] tcg: Split out tcg_raise_tb_overflow
Date: Wed, 17 Feb 2021 12:19:27 -0800
Message-Id: <20210217202036.1724901-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow other places in tcg to restart with a smaller tb.

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


