Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07AE26A782
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 16:48:56 +0200 (CEST)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kICGO-0002Bo-1g
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 10:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kICBS-0005JI-60
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 10:43:50 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kICBP-0003vu-SI
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 10:43:49 -0400
Received: by mail-pf1-x443.google.com with SMTP id o20so2039865pfp.11
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Gel2ySMpTt4f7XUoVi2e2wkLqL2QzwXiN3Z4/PyZJos=;
 b=svY+LoN+NgmP79laG7g2YnwdsRTLumZ5hgdbJouYB8VXiYbX2tZ7c8ZaQaXsrBMaqD
 MN56hEBveAlcnKw3eymGrUJnDRUsPDjPildXuvHpkLeaSteTPtL5Rnjj0E1QoZzWWI/q
 dpaqeBBi9xSVgQ9ahXW9/TctXUASZangIKz2E9WBovvRUuhn7k2q3QtwmPjjkxLpg9u0
 Lkc7u12dr5m1Ctm7eP6Tf1AB5jApASNnuadbqDNDIPDDFaxYu5X8GrtOyByVDcpaG1gQ
 WaEou4Nruu/rE9X8phWSCxFifTG/wObJz9ys2+QH+UIv0W1EjekBV/rDT6N25xYI+AU8
 gCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Gel2ySMpTt4f7XUoVi2e2wkLqL2QzwXiN3Z4/PyZJos=;
 b=U192uOyHM2whilCP/8yOlh3K4dFR7m1bFDwbj+DnS3HTkVxSSBcnUdOL0Q3O+gjgfA
 1mzeI0d22uxkbyNxjLyfQNYC5EuN2E9UtB39UXnH63RIPJuZZiEknKzIIX/C6HS4/D6r
 55kbziaLkGrNdvoqAUQGuHltWj8bQXbXv2wfDW7ZLLy87q35gUIKGRoE1vWPpMB6V1ss
 4i5eVayoiSlitSiq+QZ79ut8DdY7iph5ln4yg0nNPR7LVyFZuAfSUhwE5MaLNJoJDGrh
 37LpZ1Cp5k9bm8iVQ3tHIt3m0Mpv+TVF3+ok0+A69Y/vAFm1sxm13o5nxbMiMtIG8ikp
 fh6A==
X-Gm-Message-State: AOAM530G0ZkipEwhv3wUGohNkUufMOnTH+y6Db2fFBY/Tr38KAqoTor8
 QM2QInkklgNwU4hBI84ufu67G7HHrFDp6gd+
X-Google-Smtp-Source: ABdhPJw608B5WHtzjjOkLLbf+C8171Kzqj06PJk2uPkI9ZRl6VLSNu6AH1cxyLBeY3OcUMw+gMx9/w==
X-Received: by 2002:a05:6a00:1481:b029:142:2501:35d7 with SMTP id
 v1-20020a056a001481b0290142250135d7mr2227272pfu.55.1600181024841; 
 Tue, 15 Sep 2020 07:43:44 -0700 (PDT)
Received: from localhost.localdomain ([115.96.128.178])
 by smtp.googlemail.com with ESMTPSA id r2sm11520693pga.94.2020.09.15.07.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 07:43:44 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] Fix a gap where acpi_pcihp_find_hotplug_bus() returns
 a non-hotpluggable bus
Date: Tue, 15 Sep 2020 20:13:08 +0530
Message-Id: <20200915144314.4997-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915144314.4997-1-ani@anisinha.ca>
References: <20200915144314.4997-1-ani@anisinha.ca>
Received-SPF: none client-ip=2607:f8b0:4864:20::443;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When ACPI hotplug for the root bus is disabled, the bsel property for that
bus is not set. Please see the following commit:

3d7e78aa7777f ("Introduce a new flag for i440fx to disable PCI hotplug on the root bus").

As a result, when acpi_pcihp_find_hotplug_bus() is called
with bsel set to 0, it may return the root bus. This can cause devices attached to
the root bus to get hot-unplugged if the user issues the following set of commmands:

outl 0xae10 0
outl 0xae08 your_slot

Thanks to Julia for pointing this out here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg734548.html

In this patch, we fix the issue in this function by checking if the bus which is
returned by the function is actually hotpluggable. If not, we simply return NULL.
This avoids the scenario where we were returning a non-hotpluggable bus.

This patch is based off of tag v5.10

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/pcihp.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 39b1f74442..32ae8b2c0a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -147,6 +147,21 @@ static PCIBus *acpi_pcihp_find_hotplug_bus(AcpiPciHpState *s, int bsel)
     if (!bsel && !find.bus) {
         find.bus = s->root;
     }
+
+    /*
+     * Check if find.bus is actually hotpluggable. If bsel is set to
+     * NULL for example on the root bus in order to make it
+     * non-hotpluggable, find.bus will match the root bus when bsel
+     * is 0. See acpi_pcihp_test_hotplug_bus() above. Since the
+     * bus is not hotpluggable however, we should not select the bus.
+     * Instead, we should set find.bus to NULL in that case. In the check
+     * below, we generalize this case for all buses, not just the root bus.
+     * The callers of this function check for a null return value and
+     * handle them appropriately.
+     */
+    if (find.bus && !qbus_is_hotpluggable(BUS(find.bus))) {
+        find.bus = NULL;
+    }
     return find.bus;
 }
 
-- 
2.17.1


