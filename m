Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6353FFF17
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:24:04 +0200 (CEST)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7Ih-0007ar-Tx
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73M-0006Mg-OS
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73L-0000s1-1X
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FntGbVxFK+XtYARw6XcNLA9NRLn2kntvBlBnFrP4mzA=;
 b=Vd51tuVY1Z9HyXLYZPURuG/6O1RUbzks88CePnvgH9EbHUJM65nkHsc+TJjtvV2R8IHmYu
 5zWiWEyym3c+cyybqLXIr7X1BlZOc9FhRFTo77AHADwTvgZi/lOAo3cokzlnvleltaVVeE
 iv3Z7xFMaVqOy9qeJNfAZEsM8nWXsfE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-KdxWngOePBynnNJDB1-8Cg-1; Fri, 03 Sep 2021 07:08:09 -0400
X-MC-Unique: KdxWngOePBynnNJDB1-8Cg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n16-20020a1c7210000000b002ea2ed60dc6so1719320wmc.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FntGbVxFK+XtYARw6XcNLA9NRLn2kntvBlBnFrP4mzA=;
 b=EqXaD+t24iBuiT3LpIAV0pTqt47T/MpmWR9qvOkAc84Ous0oAspB3KBqBXQRN5zDTB
 WfLAe2kp+MtAlhJRisBQN58ztPRkGd+fTkMjP0b+gJ+zbOPeK2WZzXqsUiGl7KdWbeHk
 wtJpOjFxTIhAHlaokaHCBi2b1CrL0RTLuEIwokHzdfyBFH6xYUgCFZN9v2Xn6FJW78/7
 V6p/aIYtu5nxuj3FMaM9WslBrAraa92EFlMzWlL+79AtDJJR1kiJ4Wx+xEtomHY1V9wb
 fcishvpJozZMK6cI1bgCjhCwEjlE9tWRthBaXczzLpXDWlcSvDCcuq0HPia3TsEyCG3d
 bW/g==
X-Gm-Message-State: AOAM532me+f8XV9VU6lTBatflntLSUROlj3ZPfsOnVKkF7qIubnxA4OL
 J0a4uhXFCFtWOsA3M2SxQyyWDA81zxj0iaAebB1pEAZnDJHsnhz06TPTHvJn6QrUdHOBGMV1kWO
 nO2KLNWj4aOFYziympndLGiHtbKyEo1kQV3FH1OjbnSCV2oQ3z/smOB5haLspMcbE
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr7737855wmq.91.1630667288284; 
 Fri, 03 Sep 2021 04:08:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN+kSFBVyveYXn5+sGs4JVUNV4P0ZW7WHxEXMqHi40ecnicQxkfAmkq1xp5ilgKOE4A+RKyg==
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr7737785wmq.91.1630667287932; 
 Fri, 03 Sep 2021 04:08:07 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j207sm4383064wmj.40.2021.09.03.04.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/28] hw/hppa/machine: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:45 +0200
Message-Id: <20210903110702.588291-12-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/hppa/machine.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 2a46af5bc9b..058a81e85dd 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -101,19 +101,19 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
 
     val = cpu_to_le64(MIN_SEABIOS_HPPA_VERSION);
     fw_cfg_add_file(fw_cfg, "/etc/firmware-min-version",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2_qemu(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPPA_TLB_ENTRIES);
     fw_cfg_add_file(fw_cfg, "/etc/cpu/tlb_entries",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2_qemu(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPPA_BTLB_ENTRIES);
     fw_cfg_add_file(fw_cfg, "/etc/cpu/btlb_entries",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2_qemu(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPA_POWER_BUTTON);
     fw_cfg_add_file(fw_cfg, "/etc/power-button-addr",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2_qemu(&val, sizeof(val)), sizeof(val));
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, ms->boot_order[0]);
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
-- 
2.31.1


