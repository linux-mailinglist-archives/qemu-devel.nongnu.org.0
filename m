Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973E61DCA0
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:42:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqo-0000kl-Vq; Sat, 05 Nov 2022 13:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoG-0007J1-Jf
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoF-0007jI-11
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dZ0P9a6IJfyx6sK2ZV/CZP2xR5EwFVjvhoJRBDQTyog=;
 b=H/BV7SXx3o0f/8FGwVPtNRf2gXmItp0jFFtFd208KRQS0iOe+RV5TVtKbkyYLWU+xkyoZz
 0NWGivqpwFFkP5I6Q+xxK5vF1uV37AQDf0tatZks/ph/p+QzFu1/y2SspnLF9tN34rkFAk
 nHyR2mw+bjOGosECtvMzk/BvsPabjY0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-OIcI4-GQMemKHgH7dImnsQ-1; Sat, 05 Nov 2022 13:18:16 -0400
X-MC-Unique: OIcI4-GQMemKHgH7dImnsQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 az40-20020a05600c602800b003cfa26c40easo438782wmb.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZ0P9a6IJfyx6sK2ZV/CZP2xR5EwFVjvhoJRBDQTyog=;
 b=AkoMQlQscjNxSokLQH3f9ZkgIE/SUNVEC6OumX62tdkoM+aDnSF03oQFsquX+9rOLd
 wjPxM5869v0zn5bwT12KerLohePFm2Lemod+le3fS6OgyXEy21F3h/2bv6BIlTmSNuQv
 /SKDXU8i1l7kYuvJnp6TUmXr/nBtWon4qWkmwEihfnQgSyoPYhleyqQcGKU8DJsKlsXy
 9EFrbPH3CuAgsQ5vVerqRm4EVTFXzIbVhUXgXHt0MTyhwMosoEJSy2CMN65xyRb1/jx5
 WnjhBuqzB3LwiBGvKxgRk3Q+NRtLA0zf092IRA2qaxFxzfGv6Q4R62z40Ps5oJlqRRPi
 YRbg==
X-Gm-Message-State: ACrzQf0Y84pj+cS/yeWs4zudM6YvtO0dZ/rhb8TiV+FDttBLujkGfP6N
 4Fn0UbCLfmK670LRawAzWcg44nLG5OLpjxo7pbMoeUEzAj3M9Nhs1j11QX1RcSRropKX5Tup2pc
 S7HtTL/XrZmeMPkNbVZ8SL3eAV3XqA+lhAespSdcfV2EzIt4nUKTjir4DgIB2
X-Received: by 2002:adf:cd87:0:b0:236:6999:240 with SMTP id
 q7-20020adfcd87000000b0023669990240mr26175458wrj.97.1667668694728; 
 Sat, 05 Nov 2022 10:18:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5xeN87r7AvX0MdEVyFlLdJu4e65DaQGOa63sguyghx9tLHQoLhDvWww007O6MHNsmTBFEROg==
X-Received: by 2002:adf:cd87:0:b0:236:6999:240 with SMTP id
 q7-20020adfcd87000000b0023669990240mr26175442wrj.97.1667668694425; 
 Sat, 05 Nov 2022 10:18:14 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c12cb00b003cf75f56105sm3295150wmd.41.2022.11.05.10.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:13 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 57/81] tests: acpi: pc/q35 whitelist DSDT before \_GPE
 cleanup
Message-ID: <20221105171116.432921-58-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-10-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..725a1dc798 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,35 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/DSDT.applesmc",
+"tests/data/acpi/q35/DSDT.pvpanic-isa",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/DSDT.cxl",
+"tests/data/acpi/q35/DSDT.ipmismbus",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
MST


