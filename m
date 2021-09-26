Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA6418C0A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:28 +0200 (CEST)
Received: from localhost ([::1]:60504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcrn-0006Do-KA
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdH-0001wj-LI
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:27 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdF-0005uq-Up
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d21so46369819wra.12
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cb3odcmCuQWoFCXt4iYOTDt5qWlPQnfLAh89ZyyxruA=;
 b=VO89epECi1T9+YDxCkWYaV/al/dbXjdef8HSwscPIAQv3YG7q8w9eSSxonVH/y4UNQ
 wYeNa0sK2vX64T0SPIg+k1KklIfrhdoM+ziRNNQp3vVJegmqaL/JTB01LqsOO9M5gQZM
 knz4RshMQ7CXSq7mo5VlIYgJ5vwrgAa4jocCRv5drAI0IxfkItnf9pPHDspDK1kN+H/b
 PvxkQOQIS8rH1IeSDYNYCRj2cwZnKBS/TN0Hcg6m06MO1VJoUMYOH9fKMJtvL7qmhXOI
 /TT4h7QjJUgLt1ZFsDi4YlqFukIYe7NiZHogX3mms6rl5EHJQ92sjNusitcp01kh7XII
 GlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cb3odcmCuQWoFCXt4iYOTDt5qWlPQnfLAh89ZyyxruA=;
 b=CM+c6O8+d3+5HRE3wCF9gOyGh95ZWz64OXxmldwN3Lfd2ZZRiMv/zMOuxzFWtgsTzp
 K9E4dX/LXuy4QKxzh5X3XqWkP9Ndax869SMaXLB8LpSCkaVUFEEopD8080WFxAwYKxlQ
 xVsQ8mwAzuplJKleR9RuzcV70r1yCj4eoKV3ND0IPW9ONROQYKFNUCRw6Oq0pBIabjPs
 4/hF1TXoKhHSALVbCRVpts5r0d1dpoX8lpipGyoJlqw4rM5qCpbmU+IdSqzEhvYqRVr0
 R1OELOtg3of9FEOIR8KDt+XamuKZhXYi+S08QzoHwXKPLbNnhvtzGDhIoriD9erxeXsL
 l5Tw==
X-Gm-Message-State: AOAM5303TYS5nGLjbqtHc2lyklxTOvg/lqVh6VgJB9p1Vp0smkFezBZL
 iD0jvKh0xl8bXD1jpvCochUbSD+pwkU=
X-Google-Smtp-Source: ABdhPJx4Grbu+bnqpZdqpMlMhpH0SxlysDpUNKlhKe6LApT4A0XEZzYaucX9SR+lTa01aRlg9x7z7g==
X-Received: by 2002:adf:e74b:: with SMTP id c11mr24838595wrn.101.1632695304452; 
 Sun, 26 Sep 2021 15:28:24 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 10sm17847838wmi.1.2021.09.26.15.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/40] accel: Simplify cpu_has_work()
Date: Mon, 27 Sep 2021 00:26:50 +0200
Message-Id: <20210926222716.1732932-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all accelerators implement a has_work() handler, we can
simplify cpu_has_work() by removing the non-NULL handler check.

Add an assertion in cpus_register_accel() for future accelerators.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index bb16a25bcef..bbb83d5982a 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,10 +251,7 @@ void cpu_interrupt(CPUState *cpu, int mask)
 
 bool cpu_has_work(CPUState *cpu)
 {
-    if (cpus_accel->has_work && cpus_accel->has_work(cpu)) {
-        return true;
-    }
-    return false;
+    return cpus_accel->has_work(cpu);
 }
 
 static int do_vm_stop(RunState state, bool send_stop)
@@ -613,6 +610,7 @@ void cpus_register_accel(const AccelOpsClass *ops)
 
     /* Mandatory non-NULL handlers */
     assert(ops->create_vcpu_thread != NULL);
+    assert(ops->has_work != NULL);
 
     cpus_accel = ops;
 }
-- 
2.31.1


