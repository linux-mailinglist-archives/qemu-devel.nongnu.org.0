Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB230E9B8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:54:36 +0100 (CET)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tqs-0005l8-W1
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiN-0004k4-7K
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:47 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiL-0003jB-BL
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:46 -0500
Received: by mail-pl1-x633.google.com with SMTP id b8so869457plh.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SP+dSNoCSW/u6ABPE/2oquCEK8adb2mItiXQWA/oP48=;
 b=rIVz8A2Q3OkvbEYRbfC5vbM4owPmPE7eX6sTZfu5/YAExfsSh5qfcqNWcyNi2VFU6h
 dyvjOUTYsNO9LMnkwbTygoww44tpkqXnQZC4l3sLGrk8giD2C9tzG/eKZNGV9SlnD/rB
 bvjsd1mbmoetK2dK+KO6HGEgGHA5/pmJvPVGQVAo9cW5P8wBg28gHu+YP8OFNcmW4ipq
 3kHJfrNT/iVZlLv5Q9X2ByKOWU016YhGRmjIGWwlw+HL/FfFDOdoskKZ8kgbsbr4kqRL
 Ke0TtIjA65dPHOK/Y9KH42YVSn0f+qqboqGweU2KOJcCY+OY52b3hzlhTGpTx7MRjZLB
 HCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SP+dSNoCSW/u6ABPE/2oquCEK8adb2mItiXQWA/oP48=;
 b=qCuf2priFhq18tiNleo2r4YV2LRl2yJrOSnmp8IHYbZSjuSq0LUlYoxTxx6fvNTvJC
 dYcm5UkIXmTfkqm+deWsZLB2ug82J7O35VYo2+9wJoZaNGKkj/XKP/DNydG81P5RECh5
 rnfJwA8Sk+2xYlQJ4cTjGlEzhXgUTKFJmX5Flj2t5nNVPSKTutC9Vr9hub3aYbIr6Aeh
 Bwkzll6aMfAJ0rccqzbZP4Q8c1InOGw246ORpM+366CjAMxcwUTtyoOQYXBsxXeFacm6
 +B3zJK81IvLIsnZ3iMny6NYsr+2rCPk4KMuAGDKCbRScTzjZGHjYSPrsROClNxKeHsPW
 pM0g==
X-Gm-Message-State: AOAM530PnrU/gzqe9lEAMBqfv5thmA8lEoCaG8wIMsF97NqvR5lR9QBR
 bMJH4YE9kAojiK3hdbB5aflJ70zRT4PZUfRM
X-Google-Smtp-Source: ABdhPJwW2qiSZLUtqIiaMuQN3AACNiT8TiEA/z23UAEoJl29PN5+LTKU2wKDxie++TlXSYl8Mc/0mA==
X-Received: by 2002:a17:90a:4dc5:: with SMTP id
 r5mr5846098pjl.114.1612403142387; 
 Wed, 03 Feb 2021 17:45:42 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/93] tcg/tci: Merge INDEX_op_ld16u_{i32,i64}
Date: Wed,  3 Feb 2021 15:43:51 -1000
Message-Id: <20210204014509.882821-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eliminating a TODO for ld16u_i32.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c31be1a1f4..b64d611ec9 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -593,8 +593,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
-        case INDEX_op_ld16u_i32:
-            TODO();
+        CASE_32_64(ld16u)
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
             break;
         case INDEX_op_ld16s_i32:
             t0 = *tb_ptr++;
@@ -858,12 +861,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld16u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
-            break;
         case INDEX_op_ld16s_i64:
             TODO();
             break;
-- 
2.25.1


