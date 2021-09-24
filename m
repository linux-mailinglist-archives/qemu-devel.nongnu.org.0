Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6355416F49
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:43:04 +0200 (CEST)
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThjT-00070k-DR
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThft-000321-HF
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfr-0006Co-GL
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:20 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i24so9557442wrc.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ka2Zs6W/m1VUMtJW+H1oHcUfryePq3cXFIahmgjrmno=;
 b=EvaFRensYZxh9D5PT9akRhICWZWJ/6eumSUu4f0GcnI+T0iuwWj7HjkXDwIWYVIxnV
 BrEaCV77i2oFP28AQLSnQSne7lR7ifHy+5iVH++n6XBFSu6A3LlBwtAi5XtAqoab2biu
 jVN2Q+bIPnlmG5Xpol3pdgCSuK2mafnh8xZvU6A8GTDNPWeF5wW4tkrtuFB+ipMOV0v6
 Q48579hx0dSgs4Xn3jqNwaBmmVF8WJWl14W9seoGpztq/Z1sj6gOVSATa7mHEHF/S/q/
 L9m4TFLgBOI6XQ2GKTUOoZyF3J9EBirMGMOh5n0Y/VAQSy7VtlKVlIzeaYPCWMTqHqYp
 MQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ka2Zs6W/m1VUMtJW+H1oHcUfryePq3cXFIahmgjrmno=;
 b=wZYdL7TUmcp24b/vd6Y9fc0/h7FpZOppUALIMVVZ/W8KpoYNr7E8Ri6Xs53Y3LV0rd
 KhX0mSESaIJOtLZ7mzDoFa+0d3e2bDMqcv1qPCQ257DN0XDXVtdGOQ4nMM4F9lDcJEgY
 gnuEmfKi0eqi/L6T6foCVFEWZOTZ2Y7wIUYkSmGI0ovLCMZ2qLdVY8pzUIuO2RjwHnxe
 b11fei8YQEPVv1V7p8Y5yUi4cPlXkNvHibMEi/4ZhtZLkeYKpvu8WvlLHm32ruwtH11/
 1p/eYFBw1uD/H9RDdF6HJVAkmMs+DRJXSDHvvBwrl7hkWtgrn/KoJ/kOTg3ZOH+q8FX3
 eTdQ==
X-Gm-Message-State: AOAM530foWVkT1Q/1QvNcnNspSPZ9qqIlqzPgXGxVlOf1MtIAvT9WxRf
 OdQwlAjiXq5teVD2fq71tT+EWZ3dN6Y=
X-Google-Smtp-Source: ABdhPJxzjmqTC5K7mNYDuSfrC51vDvMquYGGU0SuXIsSr7WzqPVqQy8zk4b1Iq3JxKArB7cgB+AEEw==
X-Received: by 2002:adf:e783:: with SMTP id n3mr1369078wrm.37.1632476358111;
 Fri, 24 Sep 2021 02:39:18 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 20sm12861271wme.46.2021.09.24.02.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/40] accel: Introduce AccelOpsClass::has_work()
Date: Fri, 24 Sep 2021 11:38:13 +0200
Message-Id: <20210924093847.1014331-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

Introduce an accelerator-specific has_work() handler.
Eventually call it from cpu_has_work().

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 5 +++++
 softmmu/cpus.c             | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 032f6979d76..de83f095f20 100644
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
index accb20f0589..85b06d3e685 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -258,6 +258,9 @@ bool cpu_has_work(CPUState *cpu)
     if (cc->has_work && cc->has_work(cpu)) {
         return true;
     }
+    if (cpus_accel->has_work && cpus_accel->has_work(cpu)) {
+        return true;
+    }
     return false;
 }
 
-- 
2.31.1


