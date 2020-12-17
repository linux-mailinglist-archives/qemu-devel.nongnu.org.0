Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557DD2DD3A9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:05:43 +0100 (CET)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuqc-0007Vv-Cw
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudt-0003NZ-Qw
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:33 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudm-0004uA-8Q
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:33 -0500
Received: by mail-ot1-x32d.google.com with SMTP id q25so27502652otn.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VSoOWcRdYXM6FZg9StjdneQwIVnMWszqCmEN1WyYVtk=;
 b=C9+m/pRa+m3WkmoWxw3xjK9HpZ2DKyBz1RnHy25M+HDyBWRerMI96NgA6Sc8JWpOda
 gQxiFxPEFgE5XvPFdyBptnCuWKcF1XXBodFAHcJKO5GJdG26BMqhX3TU0+WtAkf1nF/M
 F4zmvjDoarwZJJpc66DBRrxHgctoKX3N3N5TCX3GyxqS1lsoi9KhQYziB953WuJFiOr4
 laSDsLdsEOBhLwDBl80aBkleuUxa4h4Tqts5LKnMUMZzCGYqwgGBYjf+s9WAunLsDddO
 Ffvi4TUW8hdDeS6b0uDqvSCVbCqhC1yKPnEQuu5l9oZDz6r2rBDf3ArRWqgtymbnZfTp
 fuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VSoOWcRdYXM6FZg9StjdneQwIVnMWszqCmEN1WyYVtk=;
 b=kBreDfKkKr5Hcbe4b15thlH0dca9V2OwAihxhE5hagucCm4JXR3i/7tImoFRkAhxAA
 GXbdH/6NnbvprGVs4rwC1J0u0ccHDP/KYTW57FkzQ0FR2mWNHSY+un1gpk1m+NW0xKbW
 5BJmtQR3SC3p5BJNCp43yfTjVsHHYHFRmbZF2IPn6N6f2b6iAK2S9VeKStX7KLnMyEox
 aeswdZpPp1wwIjetzsvskePRf1Z3J2LljzAb8J2CGQoT/EUJjVO/h3q18vLJQnAreJQ8
 QoAmVvKEO2AG/DbUXygRAMaZeEW+OrLXYAz/9cGTT1PLS4+VKYS3ZVuTHe2+JxYylOx/
 HPFQ==
X-Gm-Message-State: AOAM530Wv+Ud2f3URCuoKyJbxukzApi7ZeH2aq6zVG9vXcz57/9m0F4x
 Q7X8pDxr2DUb3dcH9RxEV+E3Yy2LmIGHyTpK
X-Google-Smtp-Source: ABdhPJyPD9tuV5edX/io7KeYDZfzfcARV+veusXFmo4HQ4ksfMJW1VrABGNXG5FiQ78cdKLyrOe/LA==
X-Received: by 2002:a9d:a4f:: with SMTP id 73mr29201276otg.238.1608216742956; 
 Thu, 17 Dec 2020 06:52:22 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/23] tcg: Expand TCGTemp.val to 64-bits
Date: Thu, 17 Dec 2020 08:51:57 -0600
Message-Id: <20201217145215.534637-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will reduce the differences between 32-bit and 64-bit hosts,
allowing full 64-bit constants to be created with the same interface.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 2 +-
 tcg/tcg.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 9a9ced3b15..84491b5cf0 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -506,7 +506,7 @@ typedef struct TCGTemp {
     unsigned int mem_allocated:1;
     unsigned int temp_allocated:1;
 
-    tcg_target_long val;
+    int64_t val;
     struct TCGTemp *mem_base;
     intptr_t mem_offset;
     const char *name;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 54619c1cbc..69f748082d 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3122,7 +3122,7 @@ static void dump_regs(TCGContext *s)
                    tcg_target_reg_names[ts->mem_base->reg]);
             break;
         case TEMP_VAL_CONST:
-            printf("$0x%" TCG_PRIlx, ts->val);
+            printf("$0x%" PRIx64, ts->val);
             break;
         case TEMP_VAL_DEAD:
             printf("D");
-- 
2.25.1


