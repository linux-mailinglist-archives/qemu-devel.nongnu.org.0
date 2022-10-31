Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD06137C6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:22:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUiI-0004gb-B3; Mon, 31 Oct 2022 09:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opUhx-00034S-Rw
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opUhp-0005R9-Lh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667222396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiUUE/UfEijUftx7FO6aFz3Ujsm+rfjWtXq1o42Mwbs=;
 b=JoN/aQRepG50JKn6tBT7z/eecZckvZnsJoRRYotFsR8wINc884xg9xp1tDufnQ3T59sqNG
 fjFYMYLouBwGB85d2Li0LCCwOxIc9/Of8zjh8Hc+b/YPJj1ANO6oaXLuRpzPuxb5zl9ENG
 l1NNIXF1uKd8V6adNREk+XK6EDKBPSA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-aRuA7RNuNsKbk-LM1AYfmA-1; Mon, 31 Oct 2022 09:19:52 -0400
X-MC-Unique: aRuA7RNuNsKbk-LM1AYfmA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF3413C0F661;
 Mon, 31 Oct 2022 13:19:51 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62327477F5C;
 Mon, 31 Oct 2022 13:19:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/4] hw/isa: enable TCO watchdog reboot pin strap by default
Date: Mon, 31 Oct 2022 13:19:34 +0000
Message-Id: <20221031131934.425448-5-berrange@redhat.com>
In-Reply-To: <20221031131934.425448-1-berrange@redhat.com>
References: <20221031131934.425448-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The TCO watchdog implementation default behaviour from POV of the
guest OS relies on the initial values for two I/O ports:

  * TCO1_CNT == 0x0

    Since bit 11 (TCO Timer Halt) is clear, the watchdog state
    is considered to be initially running

  * GCS == 0x20

    Since bit 5 (No Reboot) is set, the watchdog will not trigger
    when the timer expires

This is a safe default, because the No Reboot bit will prevent the
watchdog from triggering if the guest OS is unaware of its existance,
or is slow in configuring it. When a Linux guest initializes the TCO
watchdog, it will attempt to clear the "No Reboot" flag, and read the
value back. If the clear was honoured, the driver will treat this as
an indicator that the watchdog is functional and create the geust
watchdog device.

QEMU implements a second "no reboot" flag, however, via pin straps
which overrides the behaviour of the guest controlled "no reboot"
flag:

  commit 5add35bec1e249bb5345a47008c8f298d4760be4
  Author: Paulo Alcantara <pcacjr@gmail.com>
  Date:   Sun Jun 28 14:58:58 2015 -0300

    ich9: implement strap SPKR pin logic

This second 'noreboot' pin was defaulted to high, which also inhibits
triggering of the requested watchdog actions, unless QEMU is launched
with the magic flag "-global ICH9-LPC.noreboot=false".

This is a bad default as we are exposing a watchdog to every guest OS
using the q35 machine type, but preventing it from actually doing what
it is designed to do. What is worse is that the guest OS and its apps
have no way to know that the watchdog is never going to fire, due to
this second 'noreboot' pin.

If a guest OS had no watchdog device at all, then apps whose operation
and/or data integrity relies on a watchdog can refuse to launch, and
alert the administrator of the problematic deployment. With Q35 machines
unconditionally exposing a watchdog though, apps will think their
deployment is correct but in fact have no protection at all.

This patch flips the default of the second 'no reboot' flag, so that
configured watchdog actions will be honoured out of the box for the
7.2 Q35 machine type onwards, if the guest enables use of the watchdog.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/pc.c           | 4 +++-
 hw/isa/lpc_ich9.c      | 2 +-
 tests/qtest/tco-test.c | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 3e86083db3..e814f62fc6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -108,7 +108,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
-GlobalProperty pc_compat_7_1[] = {};
+GlobalProperty pc_compat_7_1[] = {
+    { "ICH9-LPC", "noreboot", "true" },
+};
 const size_t pc_compat_7_1_len = G_N_ELEMENTS(pc_compat_7_1);
 
 GlobalProperty pc_compat_7_0[] = {};
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 66062a344c..f9ce2ee1dc 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -789,7 +789,7 @@ static const VMStateDescription vmstate_ich9_lpc = {
 };
 
 static Property ich9_lpc_properties[] = {
-    DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, true),
+    DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, false),
     DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, false),
     DEFINE_PROP_BIT64("x-smi-broadcast", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_BROADCAST_BIT, true),
diff --git a/tests/qtest/tco-test.c b/tests/qtest/tco-test.c
index 254f735370..caabcac6e5 100644
--- a/tests/qtest/tco-test.c
+++ b/tests/qtest/tco-test.c
@@ -60,7 +60,7 @@ static void test_init(TestData *d)
     QTestState *qs;
 
     qs = qtest_initf("-machine q35 %s %s",
-                     d->noreboot ? "" : "-global ICH9-LPC.noreboot=false",
+                     d->noreboot ? "-global ICH9-LPC.noreboot=true" : "",
                      !d->args ? "" : d->args);
     qtest_irq_intercept_in(qs, "ioapic");
 
-- 
2.37.3


