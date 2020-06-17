Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5E1FCBC0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 13:07:20 +0200 (CEST)
Received: from localhost ([::1]:50978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlVuZ-0001at-Gv
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 07:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1jlVqm-0005hr-NV
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:03:24 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:39572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1jlVql-0005KI-4R
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:03:24 -0400
Received: by mail-ej1-x642.google.com with SMTP id f7so1840128ejq.6
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 04:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Adc4PqF6yGgQ3b/CEhSVUuiuBWd/GelfhlOYnoVOqRU=;
 b=vDpckGMdO+elaS3F+uRz+nxDbMjpMJzQpll2H5IVj+o7qW8L6fD7/8C6B3/KC/DoLa
 xJg9svY26OvfOF2iy0AAWWBM4VelXWdEq3/uJOVaTfOcP8EwRI1kxjKx2OfWXyir47Xc
 Axw4nLOVdB8dTLBFBHS1BPSuBRrEtEIjLetxuKMUw89pD5Fq0aW/rNVemEyK7XBdCA2T
 0N29wNmbDqku+BR47PFSk5Zh8ZnrKZcDXXHg45G1/8lAPE5E4S334ikXDAQw9DhmiMvW
 pFjx4Z69trZD0cn6LeBpkZLQkdfeYsLchoLz3VXIrV3V3uast9slGRtzWLvODjzrP6Aa
 CRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Adc4PqF6yGgQ3b/CEhSVUuiuBWd/GelfhlOYnoVOqRU=;
 b=sHPf2aYXoMhhb/krRYo47F427V7yCb6B2iZojlo3wwmdUfWQL4Sd8rToSM4J35QTSc
 BffmvJGMojAULDWIZens7rmvm7B4osRyM62yp2CkGuOGlbReSTHP7u8DEVyX9LOeAiEy
 MEhT+mEQuKufXKQ9tPb7ZNgOwB04Udtll9VqWHbdNzm7ZcNJkimQxi8IWHSkBRDTAB16
 +HDGF6h44UomQ+eMfqKMY5TfcGwXuni4OYC8U70cj/LsQgv+oOPBu9uWDXg3B+wu/8kA
 6RcsnRkIKYChZeY28v2atCtniJgz6Q0i1kK4XiJcZbwXRQLgfJo/ayljXPlDYkbMGeKz
 xZsA==
X-Gm-Message-State: AOAM533M9FeJJlOg4kvxtGMxy2xj67R+zlp5Y3CV24YBP3cNKxfd+KYU
 Bll1o9NEpS3A+5Bu/0Rt7bQYsDC2
X-Google-Smtp-Source: ABdhPJxHOlbThjWsovQ/hadIAIviPUnFCmHr0BMaqgzHYJlkEz0sLSjKAs79aHS+Nk8NNgvn+azpkQ==
X-Received: by 2002:a17:906:c155:: with SMTP id
 dp21mr6764622ejc.92.1592391801562; 
 Wed, 17 Jun 2020 04:03:21 -0700 (PDT)
Received: from jondnuc.lan (IGLD-84-229-154-20.inter.net.il. [84.229.154.20])
 by smtp.gmail.com with ESMTPSA id
 dc8sm11835806edb.10.2020.06.17.04.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 04:03:21 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/3] acpi: i386: Move VMBus DSDT entry to SB
Date: Wed, 17 Jun 2020 14:03:04 +0300
Message-Id: <20200617110304.636666-4-arilou@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200617110304.636666-1-arilou@gmail.com>
References: <20200617110304.636666-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=arilou@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: mail@maciej.szmigiero.name, Jon Doron <arilou@gmail.com>,
 rvkagan@yandex-team.ru, imammedo@redhat.com, pbonzini@redhat.com,
 vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 hw/i386/acpi-build.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 508f5d9dd7..2c97358d5b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1092,7 +1092,6 @@ static Aml *build_vmbus_device_aml(VMBusBridge *vmbus_bridge)
 static void build_isa_devices_aml(Aml *table)
 {
     ISADevice *fdc = pc_find_fdc0();
-    VMBusBridge *vmbus_bridge = vmbus_bridge_find();
     bool ambiguous;
 
     Aml *scope = aml_scope("_SB.PCI0.ISA");
@@ -1113,10 +1112,6 @@ static void build_isa_devices_aml(Aml *table)
         isa_build_aml(ISA_BUS(obj), scope);
     }
 
-    if (vmbus_bridge) {
-        aml_append(scope, build_vmbus_device_aml(vmbus_bridge));
-    }
-
     aml_append(table, scope);
 }
 
@@ -1661,6 +1656,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     PCIBus *bus = NULL;
     TPMIf *tpm = tpm_find();
     int i;
+    VMBusBridge *vmbus_bridge = vmbus_bridge_find();
 
     dsdt = init_aml_allocator();
 
@@ -1675,6 +1671,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(1)));
         aml_append(sb_scope, dev);
+        if (vmbus_bridge) {
+            aml_append(sb_scope, build_vmbus_device_aml(vmbus_bridge));
+        }
         aml_append(dsdt, sb_scope);
 
         build_hpet_aml(dsdt);
@@ -1692,6 +1691,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_UID", aml_int(1)));
         aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
+        if (vmbus_bridge) {
+            aml_append(sb_scope, build_vmbus_device_aml(vmbus_bridge));
+        }
         aml_append(dsdt, sb_scope);
 
         build_hpet_aml(dsdt);
-- 
2.24.1


