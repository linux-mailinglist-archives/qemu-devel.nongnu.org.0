Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F23400487
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:08:13 +0200 (CEST)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDbo-0006x5-0O
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHM-00018C-PD
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHL-00023i-9w
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jTTyRIRdKRcyyksDhIQtsIfP0HdMwBPVkpA2Kky8G4=;
 b=GvzZPvKA9MtQDAH2G4/y3FmoKPXrZ7Z50mzK01fO6OT0CET9IUUjGpJZ/2QD+FRan6z1vw
 2uUVKvY6z2sCaWpxGbK58Ka5+xJPfhw6RM36A4VD1PwgSz7N09Wjw99a6cp8SPoahFOUUW
 52xcw3GEOjnfZJSyEkYr3P0gJdIVHFw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-ZgS3NmUyMku0wgS8tITllA-1; Fri, 03 Sep 2021 13:47:01 -0400
X-MC-Unique: ZgS3NmUyMku0wgS8tITllA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso53350wmi.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5jTTyRIRdKRcyyksDhIQtsIfP0HdMwBPVkpA2Kky8G4=;
 b=D5lkt20A1kY5gXtav/eDYEAV2Xx21eCJCjI1SMB4GPqvpGVKKr6de1RZP0sxbxk376
 uoCDEBpg2yWj3AoDGmdKP/MoV6QPVeNYCobgDlm6VZuT6aOzTMu43a6hVNPfd2ICvpaq
 P2t9L+6B9aJgJ2AjqqNOTWDNDvMQZLONItmFeUn7G+uIpC4DhjcLoGh33NPjC8VZUVZq
 U9BcX8atHXu/FWVJiPv5r8vuCWBogGiM9Q5araG1yYMyFD70RIyuNQ8FLrXms6mtFZla
 Bw/tnOCrKGjMpmKDtB5qmUH1DMzbItHzv2wwY0cxewpbGsJEZi27/xXsralRmZpWKBIr
 H//w==
X-Gm-Message-State: AOAM532j3v9p7fDH2mPcU3TYA+yJU26pDErDhD6zfNz9aIrL6Tz30c++
 ay/wN3FY//wXxAXeT7j9pVg2JSeXWAYrY1mYi2jD3r6ksEdMPu+hdcO6x18JQgzBEUuDQY4YryT
 nb77U/t90PfuDpjlm4EsEsgJDeO3+C4uww1C1nAyOh/UpebAiZ8xKZSehpeRIq87z
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr274638wrv.87.1630691220333;
 Fri, 03 Sep 2021 10:47:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSKLJ/7MkFkd9pUXcCv0S3F42xYhGiHMWvbaSxRWPoc5stUMLvYZIuRP+TOp+ExWxzGTKDEg==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr274603wrv.87.1630691220144;
 Fri, 03 Sep 2021 10:47:00 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d145sm85215wmd.3.2021.09.03.10.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/28] net/colo: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:02 +0200
Message-Id: <20210903174510.751630-21-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
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

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/colo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index 3a3e6e89a0c..c04a7fe6dbb 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -159,7 +159,7 @@ Packet *packet_new(const void *data, int size, int vnet_hdr_len)
 {
     Packet *pkt = g_slice_new0(Packet);
 
-    pkt->data = g_memdup(data, size);
+    pkt->data = g_memdup2(data, size);
     pkt->size = size;
     pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     pkt->vnet_hdr_len = vnet_hdr_len;
@@ -214,7 +214,7 @@ Connection *connection_get(GHashTable *connection_track_table,
     Connection *conn = g_hash_table_lookup(connection_track_table, key);
 
     if (conn == NULL) {
-        ConnectionKey *new_key = g_memdup(key, sizeof(*key));
+        ConnectionKey *new_key = g_memdup2(key, sizeof(*key));
 
         conn = connection_new(key);
 
-- 
2.31.1


