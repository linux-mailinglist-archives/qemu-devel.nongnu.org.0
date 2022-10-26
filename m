Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEEB60E253
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:39:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongVr-0005w9-GI; Wed, 26 Oct 2022 09:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVp-0005rN-Of; Wed, 26 Oct 2022 09:32:05 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVh-0007kS-UE; Wed, 26 Oct 2022 09:31:59 -0400
Received: by mail-ed1-x533.google.com with SMTP id y69so22461290ede.5;
 Wed, 26 Oct 2022 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bRfDr5SFILAQcnsuAkN6VzuhG0H6yTFDwJWwXL/GynY=;
 b=FmsF2UVwdnc/mS/3njy3a6RJSKAnIzpmo6/9ESVaNKemGvFIVBopRwgOyz9AoqmXqg
 +Z1OuyJqGcl3RvEmwUhUo1kevgFaPVlMbiC00eoWlnJ3FwxjwJOxv8XL2inOMW8hQCoL
 qNnuTzmIdeixB3efqB2anZGILcYNvYP9DZSJDC+Zx6u1wyDuM8ZcQG/fmUVteldyd0vl
 j2iIosGR5Kcahf/QW1CTd7cK6SRTLea5HegtlwSC98gCWBlM0x2Y3BJCpfF3IB4CBunG
 eSgzSqe+rWc1EbRbhKUcuXkz32AqLV6Q5Qo42NdiHj50rxaW+uYMlwI1XUhrfMN2u+pJ
 Z4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bRfDr5SFILAQcnsuAkN6VzuhG0H6yTFDwJWwXL/GynY=;
 b=Wm+3uuedvGQCGvUhknEC92o79NVBNGZqoDEWWaF3pgatlvoawkGLLQrr49AQAUy9tc
 D0P94VwqrylLYlivHjMMM9PSPnHxJ9akVtQ85fX/91WYv/urLFwlZAcK5o/+hdUGr31W
 ZiaJozs6lYcK16BVypsP4wC7bCIdIhsqZYzIckPficsjb5uhDsQ+srxEq74P4JSK5gmZ
 GiuubC1miDJc5YW1nUzLxkshbvyIQ0LKOpxXrnomtpgdNXwvbT7F572M+rUPM3krtjAV
 +zQft8xy4aEofBjOe2loi4VIrhw8pBERDeGuycmo16t4UBqa3O4e1TLtvRNIkO/Uo+gx
 XjEA==
X-Gm-Message-State: ACrzQf1jkFpg4Oms4EktFgsgBvALE6iyAQzvDshHUSK8zjRDqBO6W9ti
 ni4ay3Xw1DX8Bn8fgMHsWFnUnU31jSo=
X-Google-Smtp-Source: AMsMyM67G9ljArt/DT1NpfMccJozz9hcw/K6ql+Ds1OE0V0sGU0FKIzmizR36hm1qvYdxfX+V9hABA==
X-Received: by 2002:aa7:de81:0:b0:461:2122:a807 with SMTP id
 j1-20020aa7de81000000b004612122a807mr29775585edv.382.1666791115855; 
 Wed, 26 Oct 2022 06:31:55 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906328d00b00730b3bdd8d7sm3032524ejw.179.2022.10.26.06.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 06:31:55 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/4] hw/i386/acpi-build: Remove unused struct
Date: Wed, 26 Oct 2022 15:31:07 +0200
Message-Id: <20221026133110.91828-2-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221026133110.91828-1-shentey@gmail.com>
References: <20221026133110.91828-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ammends commit b23046abe78f48498a423b802d6d86ba0172d57f 'pc: acpi-build:
simplify PCI bus tree generation'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4f54b61904..b4d9a05760 100644
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
2.38.1


