Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743495FA389
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:45:35 +0200 (CEST)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxmP-0004hN-IM
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdF-0003zU-7f
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcz-0007TJ-TK
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BlHcYu74UwkxKBo2ey1MBoltBMhBVKcIr1id+vxwvXY=;
 b=UoqkAoQtwa9v6ks8AbRrQISzwRCZlTS9UBIKfnvZyjuqk7BN/8FdsDerk/sytefyeQYXxm
 kAuMWMwAkzcj0LPAmLxzUdX5p2oiHDQlPT2M7ZwYyHylnAkazGbz1CD2OZ/+xyAZzqteCw
 6kRYKduQ9KeEYiGlvU4ILPY23iTROCQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-MTjA-EbeMhaQFz1q2h22zw-1; Mon, 10 Oct 2022 13:31:44 -0400
X-MC-Unique: MTjA-EbeMhaQFz1q2h22zw-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c339200b003bf24961658so7288591wmp.6
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BlHcYu74UwkxKBo2ey1MBoltBMhBVKcIr1id+vxwvXY=;
 b=DaUkCWWQl2/Yq1NcKSSnMYIWib8pV99XL9TXHO+ADaqYIXviRwEEofWO40iX+2a/NA
 UCxA7bFflpFmD4uTm/B0VQi2oOgmhGv+81zyeNgFA3gjVkMwXZMemMTd+HQeJET2QMeW
 z2F1FMN5lEL8VjhX5YCyfnlCWXjnAKkX8zpCa1stiOjLoBfvnFoscuWc1oDKiV6/AKoN
 /KWDFPmUINNKVCDPrVVIXLbEiZNBHJqus0pOPXEU8/zmJDEFjeBfwXllqbO6LIathvo8
 pmR3JSqZw2dcZJ0xiD1b2GfFTEhowqTUxzF3i8Co1RKfO95/ScW0ozoNRJz2BVgX084s
 tOqQ==
X-Gm-Message-State: ACrzQf3/ZkVcphYq529T+yb/gqluvoT40WXkoT+EVf4UVQJK9r0g/vI1
 kcbjCBhRZDws5wKpR5H7Y/g17LZub6TRzqjFQbBSBH1wyGxgBnHR2kzn92SK1koL1cZwWmcWiq5
 T6akK46DrNYR0YOXu8o7w2Au/wSVgHL7LFjS+kKpJPVEe/+arKsayryzGaY6d
X-Received: by 2002:a5d:43c8:0:b0:22e:632a:9bbf with SMTP id
 v8-20020a5d43c8000000b0022e632a9bbfmr12039723wrr.481.1665423102854; 
 Mon, 10 Oct 2022 10:31:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77YkdIxnSoiY5xO1T1VvPK3EzCO9M+U2sMr6d3ikd+e+q9xDImrxNk+Isc1gqAcvKyKesvWw==
X-Received: by 2002:a5d:43c8:0:b0:22e:632a:9bbf with SMTP id
 v8-20020a5d43c8000000b0022e632a9bbfmr12039706wrr.481.1665423102587; 
 Mon, 10 Oct 2022 10:31:42 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 co11-20020a0560000a0b00b00228d52b935asm9618110wrb.71.2022.10.10.10.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:42 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 40/55] acpi: x86: deduplicate HPET AML building
Message-ID: <20221010172813.204597-41-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

HPET AML doesn't depend on piix4 nor q35, move code buiding it
to common scope to avoid duplication.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0355bd3dda..67b532f5a5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1467,9 +1467,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
-        if (misc->has_hpet) {
-            build_hpet_aml(dsdt);
-        }
         build_piix4_isa_bridge(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
@@ -1515,9 +1512,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(dsdt, sb_scope);
 
-        if (misc->has_hpet) {
-            build_hpet_aml(dsdt);
-        }
         build_q35_isa_bridge(dsdt);
         if (pm->pcihp_bridge_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
@@ -1528,6 +1522,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
     }
 
+    if (misc->has_hpet) {
+        build_hpet_aml(dsdt);
+    }
+
     if (vmbus_bridge) {
         sb_scope = aml_scope("_SB");
         aml_append(sb_scope, build_vmbus_device_aml(vmbus_bridge));
-- 
MST


