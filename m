Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23F5FA382
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:42:11 +0200 (CEST)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxj8-0007Tl-Lt
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdD-0003uo-55
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcx-0007Sy-W3
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=32CBbVp680iYoU+SUH6pe2/fRG2LzO4/S5nMJMyYIIw=;
 b=dCeBnTuBXp9yv1WtnacAltq8X4+sLvcvVkJDgGm/AQ7zBdYNwfD40Y/7dZywYhKFJZ6QPD
 2At0ovwTEBgyAH9waEgfT6MsTgU8RzVckier/4A19deAym8l3ZcInALLQJywA6WDckp793
 Jh306oUoyyzAEsrGHnCzeHFmfjpcqrQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-bGdUhLXLNrmJRZOBSNBsbw-1; Mon, 10 Oct 2022 13:31:39 -0400
X-MC-Unique: bGdUhLXLNrmJRZOBSNBsbw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h17-20020adfaa91000000b0022e9f2245c8so2080819wrc.19
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=32CBbVp680iYoU+SUH6pe2/fRG2LzO4/S5nMJMyYIIw=;
 b=1MzgnHHT8vfkpjcUoRw2DhweAMB3rFf7J22t8I95nYroNbOBnJJ2/wsgVGwMshUQJc
 yXlkmBunD0dC3tcDFnDWQWpaeVE9pcRlCyMdljVJqBLDiakudkZYMdI8JKBphy3IC3o+
 4oillLBkJ4R2ImmJaYjcUXAE6w1Zmhfl/v7hSVUi3FokteS2JoP+yVpwgmascv3toR5t
 2kxeTALOHd7BUndiqGcRDKUofHwprMyo72612pm5QUpsebpX6vy/vmblUkTgEUjxchyt
 aCrBcf/EtsFnMXy2Xd8VlhUVVLZG75xEs1FZIvA6SE99F772jccrQTwjBO349/UlnoFD
 s/Eg==
X-Gm-Message-State: ACrzQf2XBGfGENHstKzAJkaVIFpZ173QPRDsGN6um09o1pLJLyu1/On7
 WleEf/5d6mjFkvdfYndzcVKbgNgXn0nncXmU1eSSk4uOfnMryDwoaBJkLVT7xE5hIPE2S13OFXe
 frbW+DDdVyTBuc3QIv7/DuRbKRovEoJQF2LIUgXNISfaqWH6LgU+t8SNOS1jU
X-Received: by 2002:a05:600c:643:b0:3b4:a1fe:d20a with SMTP id
 p3-20020a05600c064300b003b4a1fed20amr20512389wmm.61.1665423098098; 
 Mon, 10 Oct 2022 10:31:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4wjyfKjOAdPviArDWZyi2hLIh/4N1jfli+JDJ+1xnfgl+/BuASDWvfSKiw25KTJ73vQZ9H+w==
X-Received: by 2002:a05:600c:643:b0:3b4:a1fe:d20a with SMTP id
 p3-20020a05600c064300b003b4a1fed20amr20512363wmm.61.1665423097799; 
 Mon, 10 Oct 2022 10:31:37 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c1c0500b003b477532e66sm37346932wms.2.2022.10.10.10.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:37 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 39/55] tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
Message-ID: <20221010172813.204597-40-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a7aa428fab 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,33 @@
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
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


