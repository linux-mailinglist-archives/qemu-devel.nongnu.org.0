Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA50633A00
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:25:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQRG-0008Hs-WA; Tue, 22 Nov 2022 05:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRD-0008Gk-Md
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRC-0004lr-63
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669112612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9emkX+AdNEa+IfHb+6zLMULHpi99heqhQVMILfG/WCA=;
 b=U+3ooT21FbCrzTlYzNRRP3nhPS07E1vnfIAXPwba1PpMPg/D7aEdZhvk2+SFP6fgEvBb4b
 dOb+NJrAVS15tf2lVBZQ3aVZBmYJKxTa6gnnxUuBbbOjmsnLK3RjN8ws4JdErh03JOHyBS
 mqae6HN2jyuRz0eaHCAjouXt1gdnVH4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-IL-8bOApNjCNVYU04bhglQ-1; Tue, 22 Nov 2022 05:23:31 -0500
X-MC-Unique: IL-8bOApNjCNVYU04bhglQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i133-20020a1c3b8b000000b003cffc0a69afso8387188wma.9
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:23:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9emkX+AdNEa+IfHb+6zLMULHpi99heqhQVMILfG/WCA=;
 b=hZ12UJqU3ezRfTHHdrjF3bc29SDbouWBgmnrAI48/9+xYOZZQ+TADx/D7282DVHYjU
 zY5wPN2cd7nPzqaZsAJy2K1oVYUlJspgMp37ElF7gs8TqPT5RUduuLJL8v34Lh6zECQE
 3WXkH0hh4fqOB0qpw2lhE5bxSj+fPnD9sHg4LO2F2phzwnHuEa28AvxpDMfBtHId3Eco
 9t3i3kFM1ZxeixXXNWqolTfTgK7fe5s+NY/YZF8dlfQeyGZbrArc4yr0zYE0HG6B35su
 2D56EVOZf7frUDX/V51DTjXFasTNOxLwhnruCxSBR1Qu/KDx4U7VSya52GP+NZlccAEA
 b4lA==
X-Gm-Message-State: ANoB5plhFoYxJ8Mq++gmBfnEWDLWeeiE+hLccFiqZ/0KYObO7ZLWXDVw
 YHB3NQmo01+4wyfnt9htmgCfOo3bv53N/I+8+RfxLM2JN92u+tOGZt5tjutxmXmmGiI2+2cMciA
 TplnKce9plH3QdwlYyW1oHMmhEVJUxN7+U8zJB30iRvpKfwZV9lvuJlum3SWp
X-Received: by 2002:a5d:4c48:0:b0:241:bd2c:bef with SMTP id
 n8-20020a5d4c48000000b00241bd2c0befmr7831024wrt.304.1669112610077; 
 Tue, 22 Nov 2022 02:23:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52YVis13KCl01u05Ag0htLTe9gWALRW2LH9s8jNi/MmsrdmkCK1lXVHT/Rz7rV9Cuf/17/2g==
X-Received: by 2002:a5d:4c48:0:b0:241:bd2c:bef with SMTP id
 n8-20020a5d4c48000000b00241bd2c0befmr7831007wrt.304.1669112609736; 
 Tue, 22 Nov 2022 02:23:29 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 v16-20020adfe4d0000000b00241d32ab1casm6500002wrm.89.2022.11.22.02.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:23:29 -0800 (PST)
Date: Tue, 22 Nov 2022 05:23:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 2/8] tests: acpi: whitelist DSDT before moving PRQx to _SB scope
Message-ID: <20221122102227.6603-3-mst@redhat.com>
References: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122102227.6603-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221121153613.3972225-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a4587652dd 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,37 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.core-count2",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


