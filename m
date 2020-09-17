Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E744B26DF23
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 17:09:35 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIvXS-00040j-TW
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 11:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kIvPS-0001cI-Fp
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 11:01:18 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kIvPP-0000zQ-EL
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 11:01:17 -0400
Received: by mail-pl1-x641.google.com with SMTP id j7so1258260plk.11
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WIzwySGHusyyqcxBP6wP/5K/w/rrBhlYTKtBQXK9Uy8=;
 b=P3dFdibyVXyQ4ZKwOW+e6o6AkASN67WG+tqCQTD7NBpVWSlu2xB3Jbu1nELQXme+ts
 QzM60iOmlbhD2Qc6qygJ95Zb+xHeEKe1JPHAWpT6pHTqi1lQQ7L3nh+2hNUcpGAfbIhZ
 khdKsoW6T9AqNTLRLkfL708GEjIjoaugw/KV/pK74ex0R/c4Tsn9CGmZ8JE1ZfUN9kbr
 ZARcciGVNR5ktaGgR0xNTeGtw7zEXDJrk1/xCn0EeyF+wJURveDjSa6aXUpKszDADytl
 uQD00y/ZesIBCwhAMyqmvr5wQubdBtXJc13+jEmKKeg8z7q2ElVT5Q7fOssL2Ir4kCXx
 y2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WIzwySGHusyyqcxBP6wP/5K/w/rrBhlYTKtBQXK9Uy8=;
 b=jXpGtg2WEmwrogT7YNPkTh0PofPXDgtoTFGrg2uYnwazRqDWmpgjh307SpdWL85iiU
 FKihPrNAH4j8o6XLas2LyP8OgxzfbIqLT8nWMOTZ0IpfBeGxc0HazZi66uH1g+yMYxdr
 2DiMQS2yBCCJMEtP7LWFZprtgdFNfUqMmhGkRfADv5CQ03tgUHs5OCE49Q0K6OgXygTX
 IVBnqXU8eoiQvzWPmB+0CXP8LcNS5u3xKZ2eJ7OBwHQFaP9mvajIHE6JQlXO+mRJkWqP
 ++7wDupYpypD2yObk5J0zU0DhsnKaj5kwlqkvO1XhpMxhJecuV+rH/LzsgotFbLsO+Dx
 cjRg==
X-Gm-Message-State: AOAM532AsnPr7G0jaBfQfuRbCrLR61NQa/lv0XSjsGhRIIlE1CrSRoIX
 iZruwHU97Xahvf1Tcms3/uG0zXXkXfwsrXZN
X-Google-Smtp-Source: ABdhPJx/Y5yMQiAkKXklavjR5qvGYdlgWxyMnN9qtT1mOQESJaYnZZrZpjyKq7hqVeVnKMzIDQISKg==
X-Received: by 2002:a17:902:bb82:b029:d1:e5e7:bde6 with SMTP id
 m2-20020a170902bb82b02900d1e5e7bde6mr11658102pls.70.1600354870841; 
 Thu, 17 Sep 2020 08:01:10 -0700 (PDT)
Received: from localhost.localdomain ([115.96.151.231])
 by smtp.googlemail.com with ESMTPSA id e10sm17674374pgb.45.2020.09.17.08.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 08:01:10 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 04/12] Fix a gap where acpi_pcihp_find_hotplug_bus()
 returns a non-hotpluggable bus
Date: Thu, 17 Sep 2020 20:30:36 +0530
Message-Id: <20200917150044.23159-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917150044.23159-1-ani@anisinha.ca>
References: <20200917150044.23159-1-ani@anisinha.ca>
Received-SPF: none client-ip=2607:f8b0:4864:20::641;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x641.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When ACPI hotplug for the root bus is disabled, the bsel property for that
bus is not set. Please see the following commit:

3d7e78aa7777f ("Introduce a new flag for i440fx to disable PCI hotplug on the
root bus").

As a result, when acpi_pcihp_find_hotplug_bus() is called
with bsel set to 0, it may return the root bus. This can cause devices
attached to the root bus to get hot-unplugged if the user issues the following
set of commmands:

outl 0xae10 0
outl 0xae08 your_slot

Thanks to Julia for pointing this out here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg734548.html

In this patch, we fix the issue in this function by checking if the bus which
is returned by the function is actually hotpluggable. If not, we simply return
NULL. This avoids the scenario where we were returning a non-hotpluggable bus.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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


