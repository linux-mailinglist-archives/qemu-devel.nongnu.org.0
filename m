Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E4E61DC5D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:21:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMq2-0000Cu-Ct; Sat, 05 Nov 2022 13:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMog-0007Y5-JK
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoc-0007l3-Ho
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTCaBLlQvbytTSkLNf8ZYQ/GTlBD1EUv9OQIGVa+ewE=;
 b=TRDbqjJPLmqwPqL37lFTNH3dbtV54y5nGxCqJfO70AA/pY/pyy9pAZUZt27zFEiA5DyOn6
 iF08BocR5K+JiGIglr/r2LzhnYboQJVzJ5UG84GK1j4tmhBGnDOwUu5t59x9Zz4qG875MV
 ikBpSdsUXWwY5JToctnTdY/RoDXbtoU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-LqIBHyEDO-azULraaM4UNw-1; Sat, 05 Nov 2022 13:18:37 -0400
X-MC-Unique: LqIBHyEDO-azULraaM4UNw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso900065wme.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qTCaBLlQvbytTSkLNf8ZYQ/GTlBD1EUv9OQIGVa+ewE=;
 b=eO5DzPNayDctrV1JKwsuB5ikNDDH1cgIO2RqxGOgsYYTFNx5raYgJ6jw4grFDUkPUt
 3+gWYMtldVApz2Dtz9M5OuUSiXeH9aa9tFDPHZpWYrxFdY+GKZqDVDIbymokDfeDjruw
 2trm1EGEG+cGw+8FoFTbUkge1OP8QiPQPKNhS0y50So9xxsa/d9Ms/oiep20Y4EAr6kS
 Lam2gulSC3drAawCWAUPZ4uMx0iw8mM/mMLRwr6UMMuQ8bxAXJ8eIPgtq1ModtO+CGB5
 Myz6ORdzeEP3GkX8fIgt5Uzn4+lrbC3RGb628wMVLIu/cH+oGYKjhmU650qlEBrfnxwx
 eRWQ==
X-Gm-Message-State: ACrzQf1wU57s8OJIdbi/UTcZ6Fl9R/qsB55vyNDGZZJ1elAaTplIQkJ8
 6XrbcppoRdACkCyb4As1q1ZE6Ucn/gKPooV+MYWnUs9fBHCkjFNFO+KO13yayhjN+hjgWAHA+Z6
 KsCp6AS+P2wKC2+Xz8bESW/KEqrupnochOQiUj4M+4lNW4Bar86f4rZym9vIt
X-Received: by 2002:adf:fad2:0:b0:236:5577:eaef with SMTP id
 a18-20020adffad2000000b002365577eaefmr26736150wrs.293.1667668716516; 
 Sat, 05 Nov 2022 10:18:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/P8//8XouE7Q56EvaIG6wudGPjwRamSU0yls6P82XwEE0xUEYla8uoYN77Xb2MO/URs+ssA==
X-Received: by 2002:adf:fad2:0:b0:236:5577:eaef with SMTP id
 a18-20020adffad2000000b002365577eaefmr26736116wrs.293.1667668716163; 
 Sat, 05 Nov 2022 10:18:36 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 c10-20020a05600c0a4a00b003bfaba19a8fsm3064271wmq.35.2022.11.05.10.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:35 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v3 64/81] hw/i386/acpi-build: Remove unused struct
Message-ID: <20221105171116.432921-65-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

From: Bernhard Beschow <shentey@gmail.com>

Ammends commit b23046abe78f48498a423b802d6d86ba0172d57f 'pc: acpi-build:
simplify PCI bus tree generation'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221026133110.91828-2-shentey@gmail.com>
Message-Id: <20221028103419.93398-2-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 960305462c..1ebf14b899 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -121,13 +121,6 @@ typedef struct AcpiMiscInfo {
     unsigned dsdt_size;
 } AcpiMiscInfo;
 
-typedef struct AcpiBuildPciBusHotplugState {
-    GArray *device_table;
-    GArray *notify_table;
-    struct AcpiBuildPciBusHotplugState *parent;
-    bool pcihp_bridge_en;
-} AcpiBuildPciBusHotplugState;
-
 typedef struct FwCfgTPMConfig {
     uint32_t tpmppi_address;
     uint8_t tpm_version;
-- 
MST


