Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFA730E9E6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:05:56 +0100 (CET)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U1r-0003CK-Cq
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiP-0004nr-Ts
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:49 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiO-0003o5-BY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:49 -0500
Received: by mail-pg1-x52b.google.com with SMTP id j2so1057658pgl.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06+ir6ny4Ln0oN97wv1SB2Wg0mLnpqdVB1qEhcqxE0Q=;
 b=CIJ6L2za/Ld2FKI+1PRjFlC2hbXMicLJz9qeHkuxjjF0Uts1UCo0YiKkR5GuGRzO0h
 eeM6A4goor7ZF8P/Eg/uEoN8VlhPHQOHEGZOdBDB1gjnqatgB8IvGZJY9cg36QS2/TTq
 qqKjFIk7+PSFfHBOKmwt0jY3F9/8sRKUG29U2pzB3/Ln38j1Z8Nl4UuglMM4gSfJah65
 oiVF+9fIZNqZDZfcb1yWJbPjIwxSg2Mfg8b9S6wd8yXSOXkLXkanLvqUrkyLxe+5nc0Q
 /gru/GEEWOFIGKV7FnmiY7us7Z+PuvEwxA6uVht0Y99h+tddW9gJLSsDcKqsYUZhWjEl
 cZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06+ir6ny4Ln0oN97wv1SB2Wg0mLnpqdVB1qEhcqxE0Q=;
 b=IEzYJyN0G1A/HE6lQ6dxyKz8xAhEJIIYcWuLwNpQS3c25BsFUzy4Fst6DtUUQrFn7p
 pCnOBeCk7qui0rT2IO4cCkHGV2rYU/Tcm4j5ogH96DKUU3Pb9xYuoGIo6MGfTi2y2ZRy
 afNWeXbvRhvOFJ5HYmobbq9Yz3v0toR6Kx257mWf13ZhXRl2Rf36Q6wkHtEPWS4ZvYAS
 DnWhgT5al5qod/FFTgx77t8AIPsaydwTzqrKkN+UWWwRBA2Gk6oaIHeM3pmH1OEQehpg
 ju2OU26/zu5/eFkMu0RqXHyXa5jHLjqQyVAdqfLwom8OamzdWdq8/KwXihqmiUYTz2A8
 sZHw==
X-Gm-Message-State: AOAM533hE7xqkT9tQT7tflNCKpBrEeHmBcAcvUl727to/9dOBRzhLgyz
 qMNYLL2fbICCyM98RtvhthwgXC/sFk2v11Xj
X-Google-Smtp-Source: ABdhPJxAg8xXhsDYN+jvBGqmtGHWg08WRYKy0KUSu2dZU2dr2ZS6POGisJdTWQnKJATvnc/K4FOmgw==
X-Received: by 2002:a65:408c:: with SMTP id t12mr6563037pgp.157.1612403147125; 
 Wed, 03 Feb 2021 17:45:47 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/93] tcg/tci: Merge INDEX_op_st8_{i32,i64}
Date: Wed,  3 Feb 2021 15:43:54 -1000
Message-Id: <20210204014509.882821-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 55863f76a7..6819c97792 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -612,7 +612,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
-        case INDEX_op_st8_i32:
+        CASE_32_64(st8)
             t0 = tci_read_r8(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -874,12 +874,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
-        case INDEX_op_st8_i64:
-            t0 = tci_read_r8(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint8_t *)(t1 + t2) = t0;
-            break;
         case INDEX_op_st16_i64:
             t0 = tci_read_r16(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


