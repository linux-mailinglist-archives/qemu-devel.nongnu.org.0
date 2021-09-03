Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A933FFF31
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:29:16 +0200 (CEST)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7Nh-0002te-Ry
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74D-0000DP-AY
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74A-0001nd-6V
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LOA6vxWsxNeyRV6PCApiN2cj9fcdeFYW29H3LS1FGk=;
 b=XOmt4Cha/bbgxq0+mjtpUiQwXx3Ax70QpMsFDB4Qv4OdQZEeDQBI8dbgPwyn8+bKM+IWoK
 bWO8I+1oeOQfol/pyv4XEg6C6AUPrMxZT6R2GMtTSys+wWJmBL0Y/Xkp5mTyhBJkjJsde+
 FjXqtgEov9L6BJO0MkpKrjylYrn3Oys=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-PSt42AH5MrSgLmHo19z8uA-1; Fri, 03 Sep 2021 07:09:00 -0400
X-MC-Unique: PSt42AH5MrSgLmHo19z8uA-1
Received: by mail-wr1-f69.google.com with SMTP id
 h15-20020adff18f000000b001574654fbc2so1460632wro.10
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6LOA6vxWsxNeyRV6PCApiN2cj9fcdeFYW29H3LS1FGk=;
 b=tu6ESsX+6u2MAMeT7TESbmWA41tGV7McJc/5a4h9804lrETzioWEtYjLVPRRHt47hM
 hP4jhrJmZ7aZxWhNROVxfMORtWSjJnOd9xoyVAHGPxhonNTIzhFYi2Td6ylG6AjBuEq2
 5ikcyQaTVr3PIM1NV457Mo4fuaisrO6RIuJM06YHO7JvMXBconza3mEu6kvxKZF0QJxa
 01OO4S2eAmV2HBsqLT4/V8m8xbxWylhO9lDUbn0nsvqb7F4MIVfRH61dxWovhUJQa8he
 AWbnpAR5zzLJpzGo9P/DL1wNTvs9PH/N1FGU43wVgXPFjlHdYcZ1t8ANBQnoRNHrOrpI
 oSTg==
X-Gm-Message-State: AOAM531TJbbD2iRvfvBwqDHMRPEOIqCOqdsuc8Vu+6KTlWZPSQB+hqeL
 +ogIeamTx44IPyjzvg4VAtXK5/tlHyZ0mx0i7K7pURpmzovupCCgkcgXGm2c7rX1mmJG+tYF01B
 /P2wCm31w9fcNwkzKSzn3CMtxl9IcR1NNA1QjTrLbUaMtLsESvNKF5/1gZqKWzr37
X-Received: by 2002:adf:c54a:: with SMTP id s10mr3382759wrf.405.1630667339158; 
 Fri, 03 Sep 2021 04:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzopBsfgspfdDlrpZUpsr41FgOxa6kgWftrebygxzUBuKUb/fPiR/qlP4CZMfiKI3MKwkKmA==
X-Received: by 2002:adf:c54a:: with SMTP id s10mr3382702wrf.405.1630667338948; 
 Fri, 03 Sep 2021 04:08:58 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 e2sm4370145wra.40.2021.09.03.04.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/28] net/colo: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:54 +0200
Message-Id: <20210903110702.588291-21-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

packet_new() is called from packet_enqueue() with size being 32-bit
(of type SocketReadState::packet_len).

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/colo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index 3a3e6e89a0c..cfe37b19eac 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -159,7 +159,7 @@ Packet *packet_new(const void *data, int size, int vnet_hdr_len)
 {
     Packet *pkt = g_slice_new0(Packet);
 
-    pkt->data = g_memdup(data, size);
+    pkt->data = g_memdup2_qemu(data, size);
     pkt->size = size;
     pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     pkt->vnet_hdr_len = vnet_hdr_len;
@@ -214,7 +214,7 @@ Connection *connection_get(GHashTable *connection_track_table,
     Connection *conn = g_hash_table_lookup(connection_track_table, key);
 
     if (conn == NULL) {
-        ConnectionKey *new_key = g_memdup(key, sizeof(*key));
+        ConnectionKey *new_key = g_memdup2_qemu(key, sizeof(*key));
 
         conn = connection_new(key);
 
-- 
2.31.1


