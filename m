Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3D6416F3D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:41:56 +0200 (CEST)
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThiL-0005e7-RK
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfV-0002bW-BR
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:38:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfT-0005rk-PY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:38:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id d6so25365641wrc.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Bzxb+cyFW2fTjguo4+D1GgUMJzgo2oIaa6x4dhI9M8=;
 b=Z+ZVrJA7B+LRhlph252Bs05w8qRernFAcR0uaW2EqZLIaeL87gO8XvD5r4bZvNkp3+
 hX1EJqJbuippSwE2WDYNrROZL+rBetx42PlK+8wrhGeLsOGgUGPblfRoclfGG3tfCD8u
 eBI9iXodHTu4cufWPSR+WxyXzPIObVXP8ArcVDSr/vlzcvRGCwDLdZr/Wgz90lKfUY2X
 VYUokkVXMJ0JPMQprbFAppj22boPdVagE8pWBhyciFYNxDEwamnxrhXfsA4rT/riAhY4
 bbdYIb6pIWaeV5dgSnR9Q0TviODcmzuX3San6zlU6rCX7RAU8jGc5jtP5o00lXg3s9rh
 wKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5Bzxb+cyFW2fTjguo4+D1GgUMJzgo2oIaa6x4dhI9M8=;
 b=5RlNJwvIEWt4WUrI7XfxjwKL0OnuWxLYY3PpJ7Vmumy+TsHH9HQ4hnDLBaz80N93R6
 DZQZbeHQlTa1wxFXMStp7gKWvMJNP3g0pwMVAHADO0JPALeyJDCkrLZGrg+EPUDP2v0M
 hRlyY0VzK6pfR1BPa3+1cazVQWRw+GrU4P6ySVSlN5ZKe0Ou8TgbWIDm9sLE1ShLeQ9O
 eGsWA+GnacFlHKDRoWsDQaLITm9XopDSqBG4eOF/S8wIoQ8O5SypWz6HUmQis2UwWHVp
 RJI/dCoDJ+m8FZQFjgsfOUS+LbKTwAM0nSNaVpeIumXhSBLL/8O/mihqUTaMPFIILTts
 d+Jw==
X-Gm-Message-State: AOAM531jL3CTF/D45Wjt12UAf8wkVcTWtZkllveUnxfwqel65NJP+fbW
 XQqJIJtI0xmjhXSDaX/3oFj+dCnJM7Y=
X-Google-Smtp-Source: ABdhPJyEXLnBJ5FQO1c2ws6DQTUoRXlRdbtMRIFIWPeSVBvWTRWmUt4mhI0LSmwm06Oty6TGQxjWjg==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr10482837wrm.394.1632476334139; 
 Fri, 24 Sep 2021 02:38:54 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 q126sm11435167wma.10.2021.09.24.02.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:38:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/40] accel: Simplify qemu_init_vcpu()
Date: Fri, 24 Sep 2021 11:38:08 +0200
Message-Id: <20210924093847.1014331-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


