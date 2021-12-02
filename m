Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23D466B57
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 22:02:34 +0100 (CET)
Received: from localhost ([::1]:43278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mstDr-0008Nf-4j
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 16:02:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0z-00009K-49
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:13 -0500
Received: from [2607:f8b0:4864:20::42c] (port=43705
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0x-0005Uy-PA
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:12 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n85so703588pfd.10
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTeHp3U3o19QI3ip/iNIsdusFSPguDlUd5JMsIxKTZk=;
 b=AHZaDECG3zD348NBWSIHCeKf2L9x0XNb8hfpm2KhFwcodXJd6Bblm1YJhC8dhsJynO
 mbkHW5BPlKdL7lTgOZBiR5PWowF7zaG4MPnV6drUo0CKM77oXnz4R1QvqmH26gqxw7/k
 maDSiuFyhUQzjh4caler8snmy2dz+afjNVLNwoJz8oVEbQtj6azIxMxOlKQpPZd+GAmH
 YnCGGPI47vabXWS6FCVaCtYHR9y0rpKF8RanAFTSjQa43aZpJCdjQSkxbedjYycV+33J
 e683KIyZbrU0Ah5qelugtbcMGj9cOVcOjNrvIeM1avrKYryxMr2Xf5kYgoojl859effU
 Nyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTeHp3U3o19QI3ip/iNIsdusFSPguDlUd5JMsIxKTZk=;
 b=G9FjpK9JQ7jYY1OElogsCYkbcCj2iwg0QBjwy8oK9oP302zIgPHXi77oepXT4YusA/
 I7ErH0kIxBA5+sKKQyZy5iaPe6M6reCcvP8qQEgeLkqHa1pr8DU7DPhieLkWqAYIm8Is
 vcKkHD9cnTJSD/mzQt5JruqJvDKW7GcKYNoJ4NvVikgEVnJiTxK0KzvGgbJv7oguLxqd
 fQqsLEqmIvHZpLYU5SL7gz70DI4jpifY8DOP6oRphBsUuLa+JNV0dBDxm/EA3QvR0ISL
 3AV8Y58UZFmSgxVADb95rULg89EyuKdEfGVAOrzcE8P2s7jH1JipS5iWW6hlotDOVwQs
 syZQ==
X-Gm-Message-State: AOAM530Gf5hWRKEvW5VTTDyptNVVt0Qh+IHaS8XnBbOCZ+Icj5MISYY8
 h++smZUpShk+4zVXY2LgYybr95tjWDqdrQ==
X-Google-Smtp-Source: ABdhPJygwSWW2HvLXka3Ji8h+xkS4UkghBorsMgDTidRQdfKWiHwhndqlewXIfYmQ9uGWUZv9Y/v2A==
X-Received: by 2002:a63:7445:: with SMTP id e5mr1247012pgn.504.1638478150005; 
 Thu, 02 Dec 2021 12:49:10 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] target/m68k: Fix stack frame for EXCP_ILLEGAL
Date: Thu,  2 Dec 2021 12:48:57 -0800
Message-Id: <20211202204900.50973-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

According to the M68040 Users Manual, section 8.4.3, Four word
stack frame (format 0), includes Illegal Instruction.  Use the
correct frame format, which does not use the ADDR argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 811b8bd117..10d459f704 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -395,8 +395,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_ILLEGAL:
-        /* FIXME: addr is not only env->pc */
-        do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
+        do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
         break;
 
     case EXCP_CHK:
-- 
2.25.1


