Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823F62038C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:14:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAyn-0004Xd-Eo; Mon, 07 Nov 2022 17:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAyl-0004TC-BE
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAyj-0007C9-P0
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTCaBLlQvbytTSkLNf8ZYQ/GTlBD1EUv9OQIGVa+ewE=;
 b=PchPYtAXep4PUgmmkC3jLFLDgFBEI1vaS+SRsfC+OOiN1f0+CVNg/1jpyOilquE3DoD/iC
 qSs0AK3WEn+HOkHOOBuqE36/ZPUaOSvtRnshp5zLgX0RQJgfGshEIr+F4uAmeJRsG/cseI
 GpFrRsS+P/BeA8Nr0sRKQPRnvH5lbdo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-gtedyAzWNqOBsplbpa5L3A-1; Mon, 07 Nov 2022 17:52:28 -0500
X-MC-Unique: gtedyAzWNqOBsplbpa5L3A-1
Received: by mail-qk1-f200.google.com with SMTP id
 j13-20020a05620a410d00b006e08208eb31so11324724qko.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qTCaBLlQvbytTSkLNf8ZYQ/GTlBD1EUv9OQIGVa+ewE=;
 b=yWyKIjp8EUZaP5Ahy1UwZ4KJqn8GsseaA+DIBNJ/LqIBGMb4rMZADB/muXWohmoXyT
 NfYLE5d7Eo4JndVEsPkVDuM2zGgf0PfP7kfaUm7XiO5jRr7V/jVS3r2yeNPGL445N9KW
 CY4LPpwl1S+eI9KSFkk58rXWi1I0j5WidqHc7o9/HET8siIUo1ZpjLyGC0E0hhR/ahxB
 J1lfusyC5jk9CLqrj51fzLm6ahMT8GFn2OKSSTOT4u2wfS41Bf8cnummbKpr18sWP75n
 PnuMlL9/B1Q5mdlgNaZ7J4NgXnLk5anVy/oC0rVhIOVwfHNn5qbmLpm/ZI/zWiD4Au6u
 nwaw==
X-Gm-Message-State: ACrzQf0FQFA+LKd35hlA2bCSDcifoXIN25HR5Pswhk6GAFddYRuTB946
 kor/TNG+taZICg+FZFeb15Lbx+Z0S5WGD0uxMKdpurqhluaBZqTLWc16OIFivcO/zqxKruUhXeF
 TcR+4Fm+6NQ/z6qBpmgRmRlOlJSkAEmCXBsKiUmX24BU4mCnvQQvfhrVXwmW5
X-Received: by 2002:ad4:574a:0:b0:4bb:691a:80f9 with SMTP id
 q10-20020ad4574a000000b004bb691a80f9mr46029512qvx.14.1667861547832; 
 Mon, 07 Nov 2022 14:52:27 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4zsNl00OpcTB4DAgWBz9TeblpRKOfEx0VqTQcVe/3vFRYdGWjekj86SrTUKNNJrMVTBWzRhw==
X-Received: by 2002:ad4:574a:0:b0:4bb:691a:80f9 with SMTP id
 q10-20020ad4574a000000b004bb691a80f9mr46029483qvx.14.1667861547528; 
 Mon, 07 Nov 2022 14:52:27 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 az36-20020a05620a172400b006ce9e880c6fsm7965721qkb.111.2022.11.07.14.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:52:27 -0800 (PST)
Date: Mon, 7 Nov 2022 17:52:22 -0500
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
Subject: [PULL v4 59/83] hw/i386/acpi-build: Remove unused struct
Message-ID: <20221107224600.934080-60-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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


