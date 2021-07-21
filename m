Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185B3D091F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:44:35 +0200 (CEST)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65y6-0007Q2-0f
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65ve-0004x7-6O
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:02 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vc-0005Ka-Ql
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:01 -0400
Received: by mail-pl1-x62a.google.com with SMTP id b12so471440plh.10
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=geDxZApSmUqLJlF8yeLXrKLXpspgtXWGcFizFU4A/+s=;
 b=d0LRJRxy5wQYTQMGvkIbqouGclGE4cppIZV1Bi5MM/6vcRSDaxL4gKq8W0ioOqCSbt
 aL2qWmqSK5qYSvYyXZsImceKt4VoicMOi0qNMETj93nH05ozvIfyTQbWkiuZ6QZoDbkn
 NJ8X9x8TvRfQZVai7tc2mm+NbglodjywD9XeIf0WzW+Zq4g9N51e3ZEs3FHrZ+w7je2D
 AmmX3LWC/ZxvVL2cpjr0BTnD6Z3qL0nULlb8yCoBJ3IuIlYX6fZPBzlabSCPE415nasv
 JOxJzk3/yBc7iAJ6KuAU+DjBg1QljMp8KZdmOfADv1xVn3AOCbRduJ+Swf9/HkS6dEV7
 H2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=geDxZApSmUqLJlF8yeLXrKLXpspgtXWGcFizFU4A/+s=;
 b=N0KZ0lmM5KAMGEJebDUBMIp6Th9+ihyZPFGfQVVQj8z+CJ6HnJcqrBRibl99S7Q+DD
 J5oI/W3T3ferveMvEu1kJ6liJMgKpGEX4j5dzoXpwJ64g3toEN2c44tx+eD0YAcbAyAT
 OUHTqiGfsCuCuu0tYj1RtEzvncUeeqwXY0DvgDlLTIWz/bGFf8ixrkUdMukGDxjx+WQl
 lf9WP7HuvCQnWaFAo84o6/ONYvQBWh/xAgXlfKNn8COFSYsoGeyLqgwkZ1zIQaKpR0Qf
 ojWikXiQCf3b1Gg4ApFRkfm88nDDTnsFkbINIXD7MQ0il3h11Zi2YSoF0IVnhRnCZye/
 x4Fw==
X-Gm-Message-State: AOAM533eSYFITb1nMaq4YA6UGECRK+pJVWNVoJBkmlaJutylZXkobPjx
 osA6v0fFSy3vGqIn3kb+gAuG3+uVcBJJJg==
X-Google-Smtp-Source: ABdhPJzSMSxiskq9lnsAhTKqi5Getaj3Fs9CJS1eMNa1kk9NcqkiipzRJr/W1lh20DlgRuOp0BAdzg==
X-Received: by 2002:a17:90a:e513:: with SMTP id
 t19mr34084096pjy.104.1626849719468; 
 Tue, 20 Jul 2021 23:41:59 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.41.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:41:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 01/23] accel/tcg: Handle gdb singlestep in cpu_tb_exec
Date: Tue, 20 Jul 2021 20:41:33 -1000
Message-Id: <20210721064155.645508-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Currently the change in cpu_tb_exec is masked by the debug exception
being raised by the translators.  But this allows us to remove that code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index fc895cf51e..313f0b748e 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -383,6 +383,17 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
             cc->set_pc(cpu, last_tb->pc);
         }
     }
+
+    /*
+     * If gdb single-step, and we haven't raised another exception,
+     * raise a debug exception.  Single-step with another exception
+     * is handled in cpu_handle_exception.
+     */
+    if (unlikely(cpu->singlestep_enabled) && cpu->exception_index == -1) {
+        cpu->exception_index = EXCP_DEBUG;
+        cpu_loop_exit(cpu);
+    }
+
     return last_tb;
 }
 
-- 
2.25.1


