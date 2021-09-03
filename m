Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA6F3FFF29
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:27:05 +0200 (CEST)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7Lc-0005Xs-LQ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73U-0006YR-2h
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73S-0000yD-HU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DAHpDs712oI1Di1eaFqrdG2Typ24HrNYG4qVZsBh0cw=;
 b=OTAWoo+/Lv1PaK9hp39LKj+kMmwwqL/xm1cRRo7o69GgIpqIMNYFcJZU6k1VWu+91g6g2e
 P7nPvPHNuDn+OZr6h7lQMYNhr2mK3lRXzZxv8QzMxTCtnkVlrluB2vOcjmZN0SXgceX4+k
 ARYaZ9D3bpFt0Rgt68nbjbQD2DCUv9U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-e5tTtPj0NmicydQWid-7mQ-1; Fri, 03 Sep 2021 07:08:15 -0400
X-MC-Unique: e5tTtPj0NmicydQWid-7mQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m16-20020a7bca50000000b002ee5287d4bfso1833281wml.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DAHpDs712oI1Di1eaFqrdG2Typ24HrNYG4qVZsBh0cw=;
 b=MmqQna9mpvo4KFNCL2gupaOtgs0lUCClgmMSfrp4yPcqGaW51xyKVHmTF8geOKHoqm
 kxL4jUZYPeD/Jo8Tq/FpzeSDmeGCTFgizicLQh6BbkBPTQy4QqFhtD6FaeIUFj0BXEWD
 1VkjU5XftOvlnKnOii6ne/jP/4B9fpdhPj8zj4q2QWTRCbOQf5muJHVnPqEaiEUqzDw7
 1tW/CfP9URqzi0eFtOLaJzJoJ9iv8Zy/sziDQSffryhwxNlLH+pZ3K1Yqw1VD/LbIlYL
 UU4zaAasx5A+mHoZ33Y9/yIUnDu3y/oROvPF1N/SVzS0iP0WrRB/ow2KYkDl9HzNWszz
 ny0A==
X-Gm-Message-State: AOAM533BDlH54kkXO8vbVYu1gm+QcEv9f/BDA/inZlHJfl5YeEJl0xlX
 pZi5f/ZsNN6LC6Ts2vI350UGB5hgcx1fom2OLasGzlQy1AzYtc/OVS+Zhag8axyx49AYE/78vGy
 IvZHzgLbWqsXyidJuiSRgwGuNmmONlu848EFenwgoHPGbx2AUFUNTmQBivrXsgCTi
X-Received: by 2002:adf:db83:: with SMTP id u3mr3485719wri.363.1630667293760; 
 Fri, 03 Sep 2021 04:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhSQcK5FJTs0sGhQbUmpLfHDCygADufnlCA9XiiEfi1zCH7QtVMSqQu/dZo926/mNxJx5weg==
X-Received: by 2002:adf:db83:: with SMTP id u3mr3485647wri.363.1630667293467; 
 Fri, 03 Sep 2021 04:08:13 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y21sm4191900wmc.11.2021.09.03.04.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/28] hw/i386/multiboot: Replace g_memdup() by
 g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:46 +0200
Message-Id: <20210903110702.588291-13-philmd@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/i386/multiboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 9e7d69d4705..f536e3c8c96 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -387,7 +387,7 @@ int load_multiboot(FWCfgState *fw_cfg,
     mb_debug("           mb_mods_count = %d", mbs.mb_mods_count);
 
     /* save bootinfo off the stack */
-    mb_bootinfo_data = g_memdup(bootinfo, sizeof(bootinfo));
+    mb_bootinfo_data = g_memdup2_qemu(bootinfo, sizeof(bootinfo));
 
     /* Pass variables to option rom */
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ENTRY, mh_entry_addr);
-- 
2.31.1


