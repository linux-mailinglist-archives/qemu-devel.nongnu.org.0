Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE552F73E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 03:02:33 +0200 (CEST)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDVo-0005hq-LP
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 21:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc6-0008CB-BS
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbv-00042m-FE
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:50 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p8so8949934pfh.8
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xEiQkbmkP3Pvevruu+pGV3TN8GeAApZMdugII/EnImY=;
 b=qZaGPRzD/idX/MG9PMfe4gX4E+cE6HujhAB3uSA5Pny4YwEH55kpFA2hgIw6OzNWZ8
 E5i14n8Z1eaQUE+q3ssGoY7os9gDZfRcMJ4EY2mVHimuvnc/iJBbK+dQoGCi6lE4f3iX
 QCK650O5aJN+niYeKw7BFXh/zrlWl0l911le+BAU9OvO8vX+Q7H7Xv23Vk4CIN8gm3FB
 Jz9YNgsE1LPZHF8RVyjJbww1G0Tr1Mo3ZSZKJYTzgZP0mJmNQQB9I82JfmXmLvHY1Yr+
 wKR81cZ5Qy5qN1kmJoO3iYiblK1lOBYbQdHsWggC9tXcLfgy1evggMezWn/6y8nu7fan
 eRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xEiQkbmkP3Pvevruu+pGV3TN8GeAApZMdugII/EnImY=;
 b=39WrIK0dtBnSJ9iloKeSzZAOWFzvdVBOQBPFrK/KpJyDzbcd53YBRXlKoh7lBkNqw3
 x43dRHhmO4fDrg+De5uRhmsklcwy8RJqk8bvUT9IDCalYJdO8JoidjssdSJ/Ar5mnr0r
 rDDNn1Zqr1xoH54M0/sqaBm15F8rNTDdQancVkG7PiMRF1sAuSr7xcLsufOYr/Zee/u0
 K3gA2EX0CNjB53DTcUQ6WgY3ZbcmSVRb/SxHFF7NVVxp0hECIskM9sfcKTEJJxxN/MnE
 rGU2BbuJn0jDlBHctzqGqYmtfIOr8jNcwZ8SkUu50gOoEO+WbF1ers8iRQQmNn/IpMlj
 buzw==
X-Gm-Message-State: AOAM530DqdkACU276Dr+bFA17BCBxaQdWhXY+qYHzQyJRl/p0pS1Zif1
 iRfDUs+EBWxssVEwR3DboZdg3F2/m/5m6g==
X-Google-Smtp-Source: ABdhPJxWV7GbxOdJgyCU8Dmm0k2oH4PSG2esZnRBQiN1IFH8vqZj1jyoxg2F1lZLmTFylJO4YZWe2g==
X-Received: by 2002:a63:202:0:b0:3f2:75a7:cd28 with SMTP id
 2-20020a630202000000b003f275a7cd28mr10621770pgc.537.1653091483019; 
 Fri, 20 May 2022 17:04:43 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 37/49] semihosting: Fix docs comment for
 qemu_semihosting_console_inc
Date: Fri, 20 May 2022 17:03:48 -0700
Message-Id: <20220521000400.454525-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The implementation of qemu_semihosting_console_inc does not
defer to gdbstub, but only reads from the fifo in console.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 0238f540f4..4f6217bf10 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -41,11 +41,10 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
  * qemu_semihosting_console_inc:
  * @env: CPUArchState
  *
- * Receive single character from debug console. This may be the remote
- * gdb session if a softmmu guest is currently being debugged. As this
- * call may block if no data is available we suspend the CPU and will
- * re-execute the instruction when data is there. Therefore two
- * conditions must be met:
+ * Receive single character from debug console.  As this call may block
+ * if no data is available we suspend the CPU and will re-execute the
+ * instruction when data is there. Therefore two conditions must be met:
+ *
  *   - CPUState is synchronized before calling this function
  *   - pc is only updated once the character is successfully returned
  *
-- 
2.34.1


