Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E923FFF3A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:30:52 +0200 (CEST)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7PH-0004v6-BQ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73f-0006pJ-IL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73c-00016L-DI
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eD1qqZlm+MV+YIIGwjAnZcGqFrpvQZPW91qRyOYFT9E=;
 b=IvgR3Hu2pVG9GY6o066s3a5jOEFoc4AsyPxZzCe7mQ2Na4NshrlIvef8A/ktZw08KxyLP9
 oDVeNyi2ms111OHkLAANFW8qvvHT46aXvLXapPnDDMZXDd3RqP2hYfmRaAXkgX1eSxUMaj
 ebaN3Ti9VnKET1IXPIgwlgJHd2BJt2k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-4XwMSePqOu24CcvsMu4GVA-1; Fri, 03 Sep 2021 07:08:27 -0400
X-MC-Unique: 4XwMSePqOu24CcvsMu4GVA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v6-20020adfe4c6000000b001574f9d8336so1459773wrm.15
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eD1qqZlm+MV+YIIGwjAnZcGqFrpvQZPW91qRyOYFT9E=;
 b=V93PhueeNl+mdadKnpAvxS+nFFZRFahi74oPZ6mqZLe04EP/mkV/CZTdzySkwyHtT+
 csXshKSxEtLeRCBKtKeMIlkS8JsF20BZfVhF1br/Lz2WIEmZN30mseIN3bdSjBDOjgXn
 bUbiOa22qOd7HQapq2c8K4HcK9lpV4Tevjwe7Lfi7Ss8TURZOXQRrHEevmwSDh4iGUcQ
 SkB2UYi5obfDDeq4Auq6GmniOOpu/q83HOWDP6Khi4+km8vE8pyyq+Rz4YdrjlT7Ytfw
 5P0HUpVSSXmmzJPXLNkqideZFRIoxu3esyINJEzs0j7Lv4WY5nV0C07xiXatXG8neTAx
 MnmA==
X-Gm-Message-State: AOAM532/QyQAY/VOBCsVquEQsZFkBaseAfBPW2Zgq8BluYulp7bqXRPk
 IF8LCf3bLUpAM6g9Z3Lrf3YbPg1M/wOrjEdZIB7UbVl+LC+E5Ef5SCuwW2ExUHd2div79kGKDNX
 s9d4gvUQl+3ziw+5Brlb4PjE424DmNNo6qxBGNRIQ0M2aWg3xW9iQHiIQVVQ3R4Kh
X-Received: by 2002:a1c:c903:: with SMTP id f3mr7737108wmb.101.1630667305460; 
 Fri, 03 Sep 2021 04:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySTjPFgphZi0Ha8ChgIVmQjp9uZBff9gP4iaRxu5Bv69t9K0UO/ElQXH2XkzX2xYryeljCRA==
X-Received: by 2002:a1c:c903:: with SMTP id f3mr7737046wmb.101.1630667305212; 
 Fri, 03 Sep 2021 04:08:25 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 t64sm3914121wma.48.2021.09.03.04.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/28] hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:48 +0200
Message-Id: <20210903110702.588291-15-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 hw/nvram/fw_cfg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9b8dcca4ead..fefcdeb8241 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -205,7 +205,8 @@ static void fw_cfg_bootsplash(FWCfgState *s)
         /* use little endian format */
         bst_le16 = cpu_to_le16(bst_val);
         fw_cfg_add_file(s, "etc/boot-menu-wait",
-                        g_memdup(&bst_le16, sizeof bst_le16), sizeof bst_le16);
+                        g_memdup2_qemu(&bst_le16, sizeof bst_le16),
+                        sizeof bst_le16);
     }
 
     /* insert splash file if user configurated */
@@ -260,7 +261,7 @@ static void fw_cfg_reboot(FWCfgState *s)
     }
 
     rt_le32 = cpu_to_le32(rt_val);
-    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup(&rt_le32, 4), 4);
+    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup2_qemu(&rt_le32, 4), 4);
 }
 
 static void fw_cfg_write(FWCfgState *s, uint8_t value)
@@ -755,7 +756,7 @@ void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)
     size_t sz = strlen(value) + 1;
 
     trace_fw_cfg_add_string(key, trace_key_name(key), value);
-    fw_cfg_add_bytes(s, key, g_memdup(value, sz), sz);
+    fw_cfg_add_bytes(s, key, g_memdup2_qemu(value, sz), sz);
 }
 
 void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value)
@@ -763,7 +764,7 @@ void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value)
     size_t sz = strlen(value) + 1;
     char *old;
 
-    old = fw_cfg_modify_bytes_read(s, key, g_memdup(value, sz), sz);
+    old = fw_cfg_modify_bytes_read(s, key, g_memdup2_qemu(value, sz), sz);
     g_free(old);
 }
 
-- 
2.31.1


