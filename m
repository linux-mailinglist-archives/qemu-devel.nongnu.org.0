Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94D3541C76
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:01:25 +0200 (CEST)
Received: from localhost ([::1]:53806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhGO-0000jy-Fs
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5d-0007Du-TL
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:15 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5b-0001Kf-Q6
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:12 -0400
Received: by mail-pg1-x530.google.com with SMTP id h192so10191908pgc.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C3K2YfSefvABy7M7hq8Nd6JC/pCWOqgHqbPOWNo+9Kc=;
 b=LjfYiPv0AWj/xLIpLalJ8xVi5jCODIY9uKhvuVsW58krhM7m9NN0K3ghk4Kx5HfigX
 YcJc7s+GrgW7u1ZQ45jYS5yuOZ6tIKBkixioP/N5AZ9cHAlAK7jQ3TRlqk30eUwstGOU
 GuWlDmT97Eb72L5roT6TB+Zwcc4OOdWaWtEaTolZGCvz/8xCqMJ9lgnkUKA3YBJPnZzv
 PjBBGnW1N5feWAygUK2/Ng3btPZuN1y2y67kUxJKTssTzTA2HaAc+y7++Y3UxfDyIeDd
 /4u09+mcvsm48Ful3VthD8Zmy+bnL0Ujb2g6Mj1tlzVOKe5c0cUAw44CTSm4Bkz0hS3i
 RxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C3K2YfSefvABy7M7hq8Nd6JC/pCWOqgHqbPOWNo+9Kc=;
 b=AhjKjOQNemgg4ygCsAkFvdlFD5qijlEKeG7jibLSYPRVFjZT6y1GObnBe/yddtoDZC
 j5DXg6ElIOjvijIaDK7fZiSr7GVELKenjE0CkSza96pxYfRuWm/fiz59ygL0fhK2g5zL
 ZNYAF3HCSw94P7s9dKe+rrQ2g982x62IpaDCRyA0nDMoXByQwlukz/pgSQslextpcQe+
 shlm85AX4l3VpmBqnq9GRilpPvCQLXrzG6KUQSH6mqfj8yRe6a21J0rS4oXn1/Tw+X7K
 U7+WRKWSjqEZKcgM/JoAG4aCkCSUTc1CohVdKLaxNlzd9qS4y3b9KTMf9RtSdVmGUR6f
 AaOw==
X-Gm-Message-State: AOAM530a/5lpExY5XxFq15s//M39XOaVMw9IzxV0cB+b+WrXt9+snGcS
 iUS10cc+9zj49bQK1l0XYAmjwwMRRTqegg==
X-Google-Smtp-Source: ABdhPJyFXZ/2LOnq1IBGQOULH4fO7fjB3RJlHYRbTZGlRkrjavlg+/GnwhwShDvMgfYJiUJoDNBGpg==
X-Received: by 2002:a63:8743:0:b0:3fe:c9c:b59 with SMTP id
 i64-20020a638743000000b003fe0c9c0b59mr3619423pge.192.1654634769962; 
 Tue, 07 Jun 2022 13:46:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 12/53] semihosting: Clean up common_semi_open_cb
Date: Tue,  7 Jun 2022 13:45:16 -0700
Message-Id: <20220607204557.658541-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
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

Use common_semi_cb to return results instead of calling
set_swi_errno and common_semi_set_ret directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index cc13fcb0ef..6414caa749 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -364,15 +364,13 @@ static int common_semi_open_guestfd;
 static void
 common_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    if (ret == (target_ulong)-1) {
-        errno = err;
-        set_swi_errno(cs, -1);
+    if (err) {
         dealloc_guestfd(common_semi_open_guestfd);
     } else {
         associate_guestfd(common_semi_open_guestfd, ret);
         ret = common_semi_open_guestfd;
     }
-    common_semi_set_ret(cs, ret);
+    common_semi_cb(cs, ret, err);
 }
 
 static target_ulong
-- 
2.34.1


