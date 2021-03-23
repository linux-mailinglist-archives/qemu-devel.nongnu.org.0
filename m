Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58683346180
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:32:19 +0100 (CET)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi4m-00040z-5N
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzz-0006ZY-JK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzm-0007Ah-0B
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id v4so20976217wrp.13
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qQ5V1NDs1ebp5KV2Gl+GAsF9d/1idJ3pehCUcDnuXTQ=;
 b=oq6ERoy2l5OU0JoWUzrvyHS7qlDYxPhYoQVx5GSa3difJ5LisVqAr1R7aPzBJRucNm
 56w1T91T9D7hJBfu9Q32jbYOEyhTZ4D+fZXG05iAvbpn/NjAhsxRk/XVq295PEuO7mQT
 ieUpq3E/fiRagYO/qGxKHM70It7NBhgLIFqsp/yfZsNrC7LCdmIEIADY8kQOqlOb6wjL
 LGRMO/qx8lYgjt7xAOvqHXhbhZ9Cf9HUNKKzoQ1Ib8sbbf3rDKa/hIDGFyAglSG9vSqG
 5m4ocCAl5KVOWLYxTK4N/Fhm5ud4rWaGEotd/Yz+XXQA7Omh+H85/4o1wpEtGI6oQbNO
 WBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQ5V1NDs1ebp5KV2Gl+GAsF9d/1idJ3pehCUcDnuXTQ=;
 b=cWtqQ+OWwLyWoG2UZ5Uu7CHF47M7cQ9Swf115CLhSZkcFZMw7MidMD9cjrcoq5Stge
 koAJYD1OToe1mv8LNtXfDQKGcyul/6HZmtFqViOyiH5J44mD1ALcOnt+DWA+ADAehlGe
 3iG7jkijE3ul6i8hMQNzxLMyfJ70CSi2apjV2v9AbRMA03NJ4BrMICZYqyMm/T9mXB6d
 0TpCfVvG+zA4m/YjlmrD6+B7Aq2hy3LIGIRHTLzoeO9vcvxEt34YbKaqs544q+ao4TV/
 MUaI39lCpFEIoJxPE0m+HNtvHcUO5Q2pY0aU6wOCSsb/eTQpM5bcRlZHgszJhzlItd3i
 n76Q==
X-Gm-Message-State: AOAM531fJvb3Rd1OcRTdcxDIrG30oiPhGE5rM+70q/BrNph8ZHbKS9uO
 sWryDNvsZuApi7SjyDDbNvY2CtjHael+qPc9
X-Google-Smtp-Source: ABdhPJwOa0l8mrIuIbs25HB93orxToxNxIhTaEN1ficMCjRw+fprGTZpDILo9iAd8ETinS6ouO8fkw==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr4349729wrp.112.1616509616409; 
 Tue, 23 Mar 2021 07:26:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a131sm2861292wmc.48.2021.03.23.07.26.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:26:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] hw/arm/virt: Disable pl011 clock migration if needed
Date: Tue, 23 Mar 2021 14:26:47 +0000
Message-Id: <20210323142653.3538-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323142653.3538-1-peter.maydell@linaro.org>
References: <20210323142653.3538-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Gavin Shan <gshan@redhat.com>

A clock is added by commit aac63e0e6ea3 ("hw/char/pl011: add a clock
input") since v5.2.0 which corresponds to virt-5.2 machine type. It
causes backwards migration failure from upstream to downstream (v5.1.0)
when the machine type is specified with virt-5.1.

This fixes the issue by following instructions from section "Connecting
subsections to properties" in docs/devel/migration.rst. With this applied,
the PL011 clock is migrated based on the machine type.

   virt-5.2 or newer:  migration
   virt-5.1 or older:  non-migration

Cc: qemu-stable@nongnu.org # v5.2.0+
Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20210318023801.18287-1-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/pl011.h | 1 +
 hw/char/pl011.c         | 9 +++++++++
 hw/core/machine.c       | 1 +
 3 files changed, 11 insertions(+)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 33e5e5317b8..dc2c90eedca 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -50,6 +50,7 @@ struct PL011State {
     CharBackend chr;
     qemu_irq irq[6];
     Clock *clk;
+    bool migrate_clk;
     const unsigned char *id;
 };
 
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c5621a195ff..dc85527a5f9 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -322,10 +322,18 @@ static const MemoryRegionOps pl011_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static bool pl011_clock_needed(void *opaque)
+{
+    PL011State *s = PL011(opaque);
+
+    return s->migrate_clk;
+}
+
 static const VMStateDescription vmstate_pl011_clock = {
     .name = "pl011/clock",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = pl011_clock_needed,
     .fields = (VMStateField[]) {
         VMSTATE_CLOCK(clk, PL011State),
         VMSTATE_END_OF_LIST()
@@ -363,6 +371,7 @@ static const VMStateDescription vmstate_pl011 = {
 
 static Property pl011_properties[] = {
     DEFINE_PROP_CHR("chardev", PL011State, chr),
+    DEFINE_PROP_BOOL("migrate-clk", PL011State, migrate_clk, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 257a664ea2e..9935c6ddd56 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -52,6 +52,7 @@ GlobalProperty hw_compat_5_1[] = {
     { "virtio-scsi-device", "num_queues", "1"},
     { "nvme", "use-intel-id", "on"},
     { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
+    { "pl011", "migrate-clk", "off" },
 };
 const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
 
-- 
2.20.1


