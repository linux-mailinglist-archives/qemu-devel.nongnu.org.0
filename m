Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90440DE39
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:37:08 +0200 (CEST)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtRi-0001Du-J3
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLP-0001Dw-54
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:35 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLK-0002O5-W9
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:32 -0400
Received: by mail-pl1-x62b.google.com with SMTP id 5so4101993plo.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kZ2VcPtLko9Bov3EWMO38HipWq5pDjJDr/5HXHOEyEY=;
 b=U/kmVse9pnGo3yBBJVKIvJTwXw+EOBLtslNLebgeXsm1WkQFnKo4hMXwNggux30wcq
 WjLSHaMtnzL72OXhFIeHyAOfxzNXprClw56i88xPU8G7+AlG67ICuOSKpZLlcoDIAA2O
 UJoDYolq4RL0Aa7SO7cV0R/+YIDOUg/UmnphJzs2Tb1Au4t/mAtTd1AD4vpIXY37mBC0
 GDzv9+I8DuIagn8LXnOmtXHfhLxDeQDBwJUnq/nFGgWObNes5AY++j04mYmFA60Bo9s3
 4fGu4LtNJ3egwlMjpWs868IHKNpDvXk4CMbjI6ZbWoYVX3fsOP7PrgBQbJmZwNZQiFlZ
 8POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZ2VcPtLko9Bov3EWMO38HipWq5pDjJDr/5HXHOEyEY=;
 b=nn5AjmZ+MgB8EreP0fkuZ5ysDdD8U6KfA2NngyN7zh60pxVdyY+Kvyu6r7VgL4d5o3
 TRdS7teVautL5z4Z5EAurJOeVvjnSXzO27OEx99F+tyI0ggAK3cPwy1wzDJeWczzcmS+
 0lgOKj4a0sHb2lqw1lY/22NjNTfyHmoBItRzb9aH9VMVnPEaLasoEbTx+In3aX6fog9+
 rquLu9sbb7gxKl4rJYlZYCcNhHMV9XpRZlK4+3KMl2MWpNvup4ckCwF3cwQwCpjZ64QX
 Zf5VzS/doknuVu23dv4NpaIqKFG3zRmF2/vDOS5xMSGLfSObpLJSqjx8to4LFPEjwQVP
 mSzg==
X-Gm-Message-State: AOAM53223eYCpOmytltAme718tXJ16meTUoP5Rj5deyoDcSpEe06RqZy
 w1nKwqtGlwCq1GeDb71IjXFNgnK0TlNUcg==
X-Google-Smtp-Source: ABdhPJywfLyHbPGHACadRmY8z00MH4H6g5luzemVJEYhPraROo8p8m+S9USV5MGJ76RrYy1CCV5o4g==
X-Received: by 2002:a17:90a:1610:: with SMTP id
 n16mr15525033pja.59.1631806229600; 
 Thu, 16 Sep 2021 08:30:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/35] sysemu: Introduce AccelOpsClass::has_work()
Date: Thu, 16 Sep 2021 08:29:55 -0700
Message-Id: <20210916153025.1944763-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Introduce an accelerator-specific has_work() handler.
Eventually call it from cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-5-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/sysemu/accel-ops.h | 5 +++++
 softmmu/cpus.c             | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 032f6979d7..de83f095f2 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -31,6 +31,11 @@ struct AccelOpsClass {
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
 
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
+
     void (*synchronize_post_reset)(CPUState *cpu);
     void (*synchronize_post_init)(CPUState *cpu);
     void (*synchronize_state)(CPUState *cpu);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7e2cb2c571..2a61dfd628 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -255,6 +255,9 @@ bool cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (cpus_accel->has_work) {
+        return cpus_accel->has_work(cpu);
+    }
     g_assert(cc->has_work);
     return cc->has_work(cpu);
 }
-- 
2.25.1


