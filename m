Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCB640DF8E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:10:34 +0200 (CEST)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQty5-0000PK-Ch
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLm-0001gc-Qf
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:58 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLd-0002bV-20
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:57 -0400
Received: by mail-pf1-x432.google.com with SMTP id w19so6172939pfn.12
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsDKJ9HWSGf+3RAOS+lcZoApkaAa44EIIs8LfeqvPUs=;
 b=A8o4gkh2HlKqrSiW9/NotWlTZKXNfwGEI+zBRtuRJv8c8BPR48zj+Dc/hAvUQGIkyn
 9LTIyrVmqZLR+W+g4uIY5CZvhU0ocWaLFl8Yis6/gHbGcqMa9yvtzW9DaoORyO5QU67U
 b1mSCHcrM7hiJl3QV+7EDSqxwuYH5/30xmERHzC5tcMCBJRIELF9hNo2CPQC9qEiFpaR
 W4+6H3WMdmnpivzx9LFm6jDWq0KoGrmqiPQoKVV71vasKzzWwsqsxQLgIqvAcMZY6kaG
 OT4FQGWxmhljC7TaOoQceQPVqqKhJKzQbdQbt33GcBMePUxpM98KCKAAGnrUOnhHK4UV
 SFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fsDKJ9HWSGf+3RAOS+lcZoApkaAa44EIIs8LfeqvPUs=;
 b=0ccMB2h7y51niW+n1qyRFxxZ0EOm1//8bPW9/9ToU3j7zG8vtrMLiWk6Zmw1EzZIxT
 BV4b7Ai1Pgsc2F33NDsrVz6gCqm7oMKhK3cSIVx03pn3V7UgDhrpfNOA7tBfM67b7bQN
 05AFMEd4v/Zuu/tb7puaYsk4l2mnp83ZZvgmoPq5H3IsXq0u47w7ag8eTZVz1sPYQ1V1
 zRmTGbQbTRuyg0QDONXGj1WzIIGhajjcREudFhQkFtNxkPqWYCmjcI7nMeujNdAQ+zhp
 Bd3bu7onlBFwwF69ayVN+mr/wFnCX5nhG8t0UStElDLvhLaitaJfU9yopx8FfZpOc5gj
 PWCA==
X-Gm-Message-State: AOAM530ZAVMqz6qb8/o1LVdvegYAtTO8Yg6Y8hDwLMrRNAJMUgTRbEO4
 KGTfQUm9hXh77QdcoO1bFDxzcPn5Nn7Q4g==
X-Google-Smtp-Source: ABdhPJwG/6Mw3hTQ9jX3Wbv2f5XfjX9/Xq2iWf5NNeW2pZF0vryKKYFqv3bZBfEzpdH0FdNjWP11Pg==
X-Received: by 2002:a62:1e42:0:b0:442:2a4b:e0e1 with SMTP id
 e63-20020a621e42000000b004422a4be0e1mr3135843pfe.19.1631806244993; 
 Thu, 16 Sep 2021 08:30:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/35] target/sparc: Remove pointless use of CONFIG_TCG
 definition
Date: Thu, 16 Sep 2021 08:30:17 -0700
Message-Id: <20210916153025.1944763-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The SPARC target only support TCG acceleration. Remove the CONFIG_TCG
definition introduced by mistake in commit 78271684719 ("cpu: tcg_ops:
move to tcg-cpu-ops.h, keep a pointer in CPUClass").

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-27-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 5a8a4ce750..e83e305aa9 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -859,7 +859,6 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 };
 #endif
 
-#ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps sparc_tcg_ops = {
@@ -874,7 +873,6 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .do_unaligned_access = sparc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 {
-- 
2.25.1


