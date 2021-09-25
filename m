Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF714182FE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:00:11 +0200 (CEST)
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU99t-0003zL-OW
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91m-0007db-Fw
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91l-00054S-2Q
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t8so36606544wri.1
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ka2Zs6W/m1VUMtJW+H1oHcUfryePq3cXFIahmgjrmno=;
 b=buwpCuSSrgxmyCmmy7Xc7YQ0frby/3qBlNtyt2vmvtKTRBLv2D7XCYfmpxeABvUIHP
 wTWGKy8tmfncTEOsoD04c2mIkSWGa601Sj6PlSSUnXrmdcKLOLdVfRxcK2k6efZEjtmH
 sYGJ0h1dBt1khjd6gVdl5Qo5nDyIjJ/jdcYSayT25q3AAYFB0UXH+yWOmrS2S8fy3YTh
 5hX9F10NmnoEMhXTqf2GuzM3rizARP9iXOAWhCvmIejmJD3VhWu7kQI3xm3pYY8gyIPY
 4dXnJYI3YzSmE4keg/1QyKxFogm8yatnO39X690QJsQ57OXRwlHbCm10nK4gDwlv/+6c
 QPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ka2Zs6W/m1VUMtJW+H1oHcUfryePq3cXFIahmgjrmno=;
 b=o1nbGG1BxsK2Cx4EX4Hj2ynElt8KljSwu9S9XEPeIKUNcQwxvgWZJ4MzDCU3GHlbhS
 BB5pb+kLYURLaQoWL2ziTLGRMcM7R6cEMA7ogIUBpiGZuwNtBbYAjW0RlVmQ+srClYuN
 5MU3siMwa0E/prt7qc9+lKx0PA93UP2WMRAkD4B40d8sbtcmJ+YuIJjv1kqjqzSaa3dG
 zdp3BqRRWHdt4Z+V64qOvY11IDJk9t/0+IWJp+OMqt/EDQo5fUUeO0fTCMq5b8L3zXfh
 IYEK6m0qeSpTLb286SWaauYoxTqI1aPo+FcoPHCUGSLajcgaDD8dmPeOfrpTxiVeYMNI
 yCsw==
X-Gm-Message-State: AOAM5326e5uRURLxB+KfAwksdgDzd+316i/tOdNAtSEm1owbcjL6soCg
 xa4hi/ho+xzsDBtMehPRh2r4QOQSiEg=
X-Google-Smtp-Source: ABdhPJyXRFwftRt+YBP8GlkHAiE6MH6iYZvm1+kXOgMvicF1vO9EMvcFJp6L2CbbquQZuUQEFPenKQ==
X-Received: by 2002:a5d:4006:: with SMTP id n6mr8654106wrp.224.1632581503541; 
 Sat, 25 Sep 2021 07:51:43 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 y6sm11342833wrp.46.2021.09.25.07.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:51:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/40] accel: Introduce AccelOpsClass::has_work()
Date: Sat, 25 Sep 2021 16:50:43 +0200
Message-Id: <20210925145118.1361230-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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


