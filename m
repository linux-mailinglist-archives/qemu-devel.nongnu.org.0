Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A99541F01
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:42:45 +0200 (CEST)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhuO-00059z-O2
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg92-0005ee-HF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:46 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg8w-0001oh-LY
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:42 -0400
Received: by mail-pf1-x429.google.com with SMTP id 187so16522727pfu.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xEiQkbmkP3Pvevruu+pGV3TN8GeAApZMdugII/EnImY=;
 b=zTHPLVFNO80YZLjzIjA6pJKGZLWgsnvEeD7YAj3TLmjA28mxM+GUlwlQRAsNkr77k+
 jjErKX128EPVNqoywdnHCrVV70PQVB2VUWWrX+ndsw/EH9BkDWSfrd/HzMF6eIZPFdFI
 jBhlVF4+rL81dMdri8jiuZ6uFuMercwxI63WAye0lABTQ/oCbXmk9l5/yb4mJ5z5zOfv
 c6mnoLQyPdrKoDx045DVdTHh6xrrE00F7G6Jez5tvZvgfjq3DKCtcygTHgB3SOnLExfN
 wE0Q6EsN5hpLM+fnjOxNN097Puv26gW8+BBm7JNlVPHEp+m/oOtqKmwcOq+awE9ZZMfR
 jiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xEiQkbmkP3Pvevruu+pGV3TN8GeAApZMdugII/EnImY=;
 b=lgBbsUBmHIPOE3+4ibfTRXxBklUbAM/08roUj4PbmEk6zMZwTgNqKXpezCaw/So6wR
 BKMG2YTEthhZ3yHgQCR83UF0SsrJNrpWMjuwyhY1bKVzuJ9rOZz2DVyXLSeQj4gt5uwT
 kEXCVpjR6pK10o327lJf5lkQGEb4IVysl24yh4nX0m36/T3ycyIqDmATlIqo0yNhVQEI
 svTAea7Hj8UGAlv4j5RQhOvGXTQdHqsDzvIFB/DkYJsTPwPnXDCbY+44R3RzBoZfh7g6
 8U0wHUhdVYZUqM1E7rmT8qMOYVH0tDlozS2vC7hWU1L9J567KUa8hvNvRv4kIW6DXZzR
 4eow==
X-Gm-Message-State: AOAM532nVwRHlL/D010ryfoeU0j/owe1ZFXeAPGhbbvi+Q44p+F6BcC8
 8rByX1n1PAJX3TnNzLk7n6giIEKh01Bskw==
X-Google-Smtp-Source: ABdhPJyWngeVdpwYYeGjNQhD1q2lP6y0GqTuDiDpqbkXl04VNvUVIVMwKMbvz3hn4IaVu5lXwqUAAw==
X-Received: by 2002:a62:544:0:b0:51b:a90d:64d3 with SMTP id
 65-20020a620544000000b0051ba90d64d3mr31372248pff.40.1654634976435; 
 Tue, 07 Jun 2022 13:49:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 41/53] semihosting: Fix docs comment for
 qemu_semihosting_console_inc
Date: Tue,  7 Jun 2022 13:45:45 -0700
Message-Id: <20220607204557.658541-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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


