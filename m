Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C200E52F6AA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:18:08 +0200 (CEST)
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCop-0003aO-TM
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbT-00082K-Ba
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:25 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbP-0003zO-2f
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:16 -0400
Received: by mail-pj1-x102c.google.com with SMTP id gg20so9309381pjb.1
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iO8bYt33Tjxv9WbhuJst+fUaLLVWutotkQNg/qYeZ+o=;
 b=zOgAcsH65e8tEgDT1U3HYry9Ssa+0RFHW+Ml5JEbaTmywW9n5tLfuwblJ/MSddLXv/
 Q/lZVVnl6tyD0ndIGhckJ6A6WwDP+Jj9wIQLjVpIZKL1WIRq6Lgg1LoKd+tc8Osg2CNq
 IqQGwo243pqUmRC3slp4pmg0FtpLMhxiV7QcmCvgR8y5dKuFBtXxtBft+WLk6Tm3C/iZ
 bn1Ccj0806BUDt8+46X5xKrkG9cua8skO3xNyqyvQJw6uclOaAJJ4NN3+Rt0Q7c9RYAW
 elLJVNTNIdP2WAg4ZGC4gx7j3faMea82SouzwKfx67GDHJGinEx73Q08y3pvNLskVOt9
 0z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iO8bYt33Tjxv9WbhuJst+fUaLLVWutotkQNg/qYeZ+o=;
 b=BIi7Plebs0gRlop9hZY+lYpFJgfIi+q7hMPjjvpJ0zUcDS9pZOuzdlbnSU2RGUZa9R
 vrHdabUzwWxakM6m/DJN/99YJDl5f904TmamegNfGQuFtDlHtZ7lOXlJp24eig3eb21m
 jyHE53k61/TglswPi9kWfQBMLWvzbAvTWHmBg2rhxP3+YPfU6RhkLtijqDuUXdYtaQEO
 x27RGw/V/WyV5HVogWPxT4tUMwHOcbFoLcqJMgNdFuOCP9UBGt//SSjWk6horu77jC4v
 CZh2uPjk1IaU0nTHnk/Fsm2anrOYhmlmt5zP/pvtAffgnAZ59fzw+GxQ6fCMdNV2fHwY
 TzLQ==
X-Gm-Message-State: AOAM533T4IdyRS1Af+lnCVXiacMf1cj3vTPLCCkTcODZY163kxoAQEw1
 MCPUD3vTAoGNX5raaSjkbdDPDXH9jrcbvw==
X-Google-Smtp-Source: ABdhPJws5HLnGCQxi7aCw4nF8jZjJMdD2H8CRD8H32UwlIEJ/SJCoT4/v+8Q+c8tp8rRdvS404jhyw==
X-Received: by 2002:a17:90a:149:b0:1df:3da1:3549 with SMTP id
 z9-20020a17090a014900b001df3da13549mr13398787pje.90.1653091453882; 
 Fri, 20 May 2022 17:04:13 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 09/49] semihosting: Adjust error checking in common_semi_cb
Date: Fri, 20 May 2022 17:03:20 -0700
Message-Id: <20220521000400.454525-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

The err parameter is non-zero if and only if an error occured.
Use this instead of ret == -1 for determining if we need to
update the saved errno.

This fixes the errno setting of SYS_ISTTY, which returns 0 on
error, not -1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index b00ed2c6d1..88e1c286ba 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -290,7 +290,7 @@ static target_ulong common_semi_syscall_len;
 
 static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    if (ret == (target_ulong)-1) {
+    if (err) {
 #ifdef CONFIG_USER_ONLY
         TaskState *ts = cs->opaque;
         ts->swi_errno = err;
-- 
2.34.1


