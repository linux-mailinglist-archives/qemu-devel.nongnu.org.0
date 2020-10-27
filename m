Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1A929AC91
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 13:56:01 +0100 (CET)
Received: from localhost ([::1]:34170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXOW8-0003AU-EV
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 08:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNPh-0001ae-Va
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNPb-0004ac-Bq
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id s9so1515432wro.8
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 04:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zm/BWtPFay7GdlCHKijLT/O1X+N8zyNOG0WbL0hIdxs=;
 b=aNXPMR3tAkfeetvwbNe6kf1ZWrIAb5P8M7AdiqqPrpN7I4qivl3qj4HPl7XUEEiMVE
 KCLSMQdcEH62S/bbqhBhqAu6AUbwdG4uLf/R302ceDXevQIYh2R7pU/ORV7K/pZRqtA1
 fJmOhuanAsAVSp0gOk4gxRUk8viaocesk/h715i8hSMwaAfpc9rCSFTCAWMtVfazisrL
 oWHD7+kavQ4QMQWFRRmLSpX6NKNoD3PUCahfATY6iPWCOPXxaPFKkjgey7xMGkXNcd1F
 IM3+xGJZ2qdtyH+fzl4Q6EogGEt1pq3gjJW9BS7RZ2NXXUtqhJzUmIEBPGzFUgJWpkhY
 23eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zm/BWtPFay7GdlCHKijLT/O1X+N8zyNOG0WbL0hIdxs=;
 b=nlG72oHgQdvcOFJt3VSv6L9K4XbMzOapECjXMYKXAHEMS5JnrlkGJKUKbw7hvUlb8P
 pL/VWMni2902HoGsyDsgPa+MK84xRssTycHtYqyRxX6k5kft2x7Ade1XZclP4Fgn/n+9
 rrl1qeAYz3bvxQFwQjCr/QJW0Ah6BP+mdEVmQ0Xx1rhSPNpg6VZwc37LkE+65qbwdEV2
 oV5HOUYHPzS+3nG731s0Sii+2k8xsmcrUz7UYO1y2v318vps3ALmn5pJlp2nJUUtD/Fd
 yctWuLYqAaI4b8CDoB3Aa0fxzPewtga980Edb1e2PCo6XqjbXejubu2Qctt1J/0QNUU9
 TJJA==
X-Gm-Message-State: AOAM533+31UO2kgTcdoT2NLhaXUr4KECRMLJ6rvwWG23zhq8VfIo/OJ3
 wHj0NivBAWFSKkyNuVMvXgI5Ji/Xk7eacA==
X-Google-Smtp-Source: ABdhPJy5C3JYmP+Bb2Kt6qUpw2Kci2E6jnT5Z/pl3KtSaUmT2qdl3s8Q8GFJmrzIn5OKMOO3jtjx9Q==
X-Received: by 2002:adf:e30e:: with SMTP id b14mr2246467wrj.195.1603799109530; 
 Tue, 27 Oct 2020 04:45:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 32sm1712203wro.31.2020.10.27.04.45.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 04:45:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/48] hw/arm/bcm2836: Introduce BCM283XClass::core_count
Date: Tue, 27 Oct 2020 11:44:13 +0000
Message-Id: <20201027114438.17662-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027114438.17662-1-peter.maydell@linaro.org>
References: <20201027114438.17662-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The BCM2835 has only one core. Introduce the core_count field to
be able to use values different than BCM283X_NCPUS (4).

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201024170127.3592182-4-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/bcm2836.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 8f921d8e904..c5d46a8e805 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -23,6 +23,7 @@ typedef struct BCM283XClass {
     /*< public >*/
     const char *name;
     const char *cpu_type;
+    unsigned core_count;
     hwaddr peri_base; /* Peripheral base address seen by the CPU */
     hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
     int clusterid;
@@ -39,7 +40,7 @@ static void bcm2836_init(Object *obj)
     BCM283XClass *bc = BCM283X_GET_CLASS(obj);
     int n;
 
-    for (n = 0; n < BCM283X_NCPUS; n++) {
+    for (n = 0; n < bc->core_count; n++) {
         object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
                                 bc->cpu_type);
     }
@@ -149,6 +150,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
     BCM283XClass *bc = BCM283X_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    bc->core_count = BCM283X_NCPUS;
     bc->peri_base = 0x3f000000;
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0xf;
@@ -163,6 +165,7 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
     BCM283XClass *bc = BCM283X_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
+    bc->core_count = BCM283X_NCPUS;
     bc->peri_base = 0x3f000000;
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0x0;
-- 
2.20.1


