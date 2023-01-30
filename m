Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAC2681B5B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:25:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMafY-0007cJ-TA; Mon, 30 Jan 2023 15:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMae7-0005wL-IU
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMae5-0007NK-Ud
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dqJJOFXJ1F6ud73ZvwSEnamljkwz4NnNuhBWrKRijHU=;
 b=Rwl5zPHo7UzZPtT2erIYCCtXp7c1O3upEM2oevdGgi1cpV7nEdLEDquaSL0S/PFuzD424G
 7H1yCFWibW0MKO4+rRHKg1Nonnl/0aafD/0le/3cOXY9lxdN6xmaoGd7Yct+aElKiQiYGS
 +7Do7e4FJ/r16UpOFIPxofMk94NQ1YU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-rvyVdBA7PfyIL4miIXOilQ-1; Mon, 30 Jan 2023 15:20:51 -0500
X-MC-Unique: rvyVdBA7PfyIL4miIXOilQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 v8-20020a056402348800b0049e1913bd43so9071421edc.20
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqJJOFXJ1F6ud73ZvwSEnamljkwz4NnNuhBWrKRijHU=;
 b=baZdla7WBAjQBnlwMKg4bnNeTWiaVYZa9k2co3PsLbDL3EhbHYDAIJRuOkBItMGSkN
 hCFMSOJnwCHqYfeFv4uNzsYTfLML1T9HMLwakuC5umTmeU+SpSuHFrFL5ulJtImFqh7m
 nPMACc7vYBZLQ6Q7rKpCXbzeZbEHl0Cqgd2cSTEtSEXf/Hkli7AdbsRDR80SgY/c/IIP
 KG1pCq1Rro850EDOGF2psEOc8LlFbsYuAzJOIUf6TSZE2t6HUmjIWxfaDdovCkGufCAi
 7lCJBspFFLImsnnvSWzxhm3V3DHR9IYYnaQVfwEOHvIEaYxdFev65Iz5OoJz+8qxlpRW
 kmmA==
X-Gm-Message-State: AO0yUKXN2OP0MZ0LPYbuqRqa6FPeGo+rsATvTLbyAtRo60wVr1H8ZBqu
 OMCPPgZHgfQTs6m0aJJxoy/HAMGA5fv3hMHVy10YrCtmlCdVytFRD5P5wCuNR+mrb9l8eKOIqmc
 3LOSIgTJDCu0vbh4jY0u7iHeM5ngGxjay5AsfO+l8uphXw6fwbdZBOlwGMlpz
X-Received: by 2002:a05:6402:3586:b0:4a2:4a89:2331 with SMTP id
 y6-20020a056402358600b004a24a892331mr5336573edc.29.1675110049765; 
 Mon, 30 Jan 2023 12:20:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9KkvEyMb+QkSPXiOG5aRmzVxulF9EIePKVZVXQQtS+GrXxYnMegBCrccVtg2yabTsuM8NV7w==
X-Received: by 2002:a05:6402:3586:b0:4a2:4a89:2331 with SMTP id
 y6-20020a056402358600b004a24a892331mr5336548edc.29.1675110049436; 
 Mon, 30 Jan 2023 12:20:49 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 p15-20020a056402074f00b0046b471596e6sm7372246edy.57.2023.01.30.12.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:48 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 37/56] x86: pcihp: acpi: prepare slot ignore rule to work with
 self describing bridges
Message-ID: <20230130201810.11518-38-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Before switching pci bridges to AcpiDevAmlIf interface, ensure that
ignored slots are handled correctly.
(existing rule works but only if bridge doesn't have AcpiDevAmlIf interface).
While at it rewrite related comments to be less confusing (hopefully).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-28-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6368fcefa3..8045b20713 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -423,14 +423,22 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             hotpluggbale_slot = bsel && dc->hotpluggable &&
                                 !cold_plugged_bridge;
 
-            /*
-             * allow describing coldplugged bridges in ACPI even if they are not
-             * on function 0, as they are not unpluggable, for all other devices
-             * generate description only for function 0 per slot, and for other
-             * functions if device on function provides its own AML
-             */
-            if (func && !bridge_in_acpi && !get_dev_aml_func(DEVICE(pdev))) {
-                continue;
+            if (func) {
+                if (IS_PCI_BRIDGE(pdev)) {
+                    /*
+                     * Ignore only hotplugged PCI bridges on !0 functions, but
+                     * allow describing cold plugged bridges on all functions
+                     */
+                    if (DEVICE(pdev)->hotplugged) {
+                        continue;
+                    }
+                } else if (!get_dev_aml_func(DEVICE(pdev))) {
+                    /*
+                     * Ignore all other devices on !0 functions unless they
+                     * have AML description (i.e have get_dev_aml_func() != 0)
+                     */
+                    continue;
+                }
             }
         } else {
             /*
-- 
MST


