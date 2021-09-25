Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8A54182EB
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:54:42 +0200 (CEST)
Received: from localhost ([::1]:39982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU94b-0002hu-Ue
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91T-0007Pb-NM
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91S-0004kF-16
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id w29so36381525wra.8
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Bzxb+cyFW2fTjguo4+D1GgUMJzgo2oIaa6x4dhI9M8=;
 b=OXTzlc0l5v/r8uLvsReuOKdN3lsOY9J7V5T3b1v/C2sV26LnTKMFGdwfhFT/8vxdHS
 0Go9INDMsXeMhAECUBjGHlV+KmHKaTRG3whAnRlP340XS5kD21J6RsxmCHDxoJ0xpd0z
 62r8N2JZyHVq7NJ9YGL4ikGLjBRehYLzA4fdxms+0JLckSlv7SzCyGazecRWFfb1ZQq8
 tp/8FyPVL+MvsuUtRHqveeae4+hW3drsKgbfJkAq/StOvPKmhPMePCJG4khmwgPW2K+j
 NNCtNQQG/7l88ca2Z27fPncaDZUz8L+ltujFdzRfBiOn7FAXP/U9CPfg7ndWnEwQ2Cam
 LHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5Bzxb+cyFW2fTjguo4+D1GgUMJzgo2oIaa6x4dhI9M8=;
 b=0dyrFTNXMdIsmNqmCcBLBrQSrN6JYhzzC5yTgVegQVnIk9cWEMBWSQlI5sh5CNwoqV
 j1JaTviWKRzLm2fGH/lPwCf9Citt6w+nr39tUElvfboYc+5IHzt/FJ7Ykje8HUmmAUtE
 bjCZ0iX7wn2R0eKgGUXuitwCmVqiMRmE3WLwkWFE0kptuGG77w3nHswK/3mEroO5AiSh
 mndiMz9pqfJafvpjMe2pHmmo0fQRyLRKFzj0lT0QOqTmNQrVe7AC3F9fs6c4Oa3Rh1nv
 XAiH0qRhVqfzeO9c4K/vHU7BKF7soIUMfwmPvK1aAk4DfIJPb+3itCnVE6S4ia/4Yq52
 9j9w==
X-Gm-Message-State: AOAM532ZpMaw3z1GR8pod6VPaBVf83m6lJx1IEQ4g1V/DzbT4k10cu0c
 Gevsfenyq23xTx7Hs662EgtcY8igK2k=
X-Google-Smtp-Source: ABdhPJzq85pYyiQEMby/nqs+kxyz8pcpHVsgN5LX6GqmttvViHhfZs4diirSV8lBDozrvbI7Ug+nYA==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr17809354wrs.404.1632581484389; 
 Sat, 25 Sep 2021 07:51:24 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j21sm11103624wrd.48.2021.09.25.07.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:51:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/40] accel: Simplify qemu_init_vcpu()
Date: Sat, 25 Sep 2021 16:50:39 +0200
Message-Id: <20210925145118.1361230-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpus_register_accel() already checks for ops->create_vcpu_thread
being non-NULL, so it is pointless to re-check for it in
qemu_init_vcpu().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840b..646326b24fd 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -604,7 +604,10 @@ void cpu_remove_sync(CPUState *cpu)
 void cpus_register_accel(const AccelOpsClass *ops)
 {
     assert(ops != NULL);
-    assert(ops->create_vcpu_thread != NULL); /* mandatory */
+
+    /* Mandatory non-NULL handlers */
+    assert(ops->create_vcpu_thread != NULL);
+
     cpus_accel = ops;
 }
 
@@ -626,7 +629,7 @@ void qemu_init_vcpu(CPUState *cpu)
     }
 
     /* accelerators all implement the AccelOpsClass */
-    g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
+    g_assert(cpus_accel != NULL);
     cpus_accel->create_vcpu_thread(cpu);
 
     while (!cpu->created) {
-- 
2.31.1


