Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0DD4BACF5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 23:58:30 +0100 (CET)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKpjJ-0002fc-Se
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 17:58:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpf3-0005KM-VQ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:54:06 -0500
Received: from [2a00:1450:4864:20::62f] (port=42928
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKpf1-0003x2-0a
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:54:05 -0500
Received: by mail-ej1-x62f.google.com with SMTP id hw13so10631556ejc.9
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 14:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kph8jPkkP3EhAAX5EP3idyNUbCQCSMjrQBSoZfwf/qg=;
 b=kkbCni/Dz2RA/SKVTd2satAxQVUV4iNqrCG0olyMRhoWmruvTr6/9HhoLXB0RH/4ge
 UZIVlm7PpKfJ2837qXxKTP1dT1mvPZ50/C34a7C7R2znf2ZS9SBbd18Qp6HG7LvedOns
 oc5/48ZmgE0y+3tmMRNHxCHIaSuz0z1eTI4EZ+81UdvFKlCPncK3OsP+KBAP52pA3VAi
 7M5uwn4W9GbvJjwUh8JwsfdC1znlYAzqzV2MUlzeUllGZKPgQTLtS2Ens7QXY7IHbiNe
 n/gDxS1lghNw47mD4xgZxy8SyrJN4Dd7reGpnW44dG3XCrusLOByrGfcj3hXc4N1TPZR
 kB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kph8jPkkP3EhAAX5EP3idyNUbCQCSMjrQBSoZfwf/qg=;
 b=iHVGrfKRujOiAdVuVuhyXf6nvIC89apD3Wu6NdWOSBj/nc8gpJfhRt9eNWQGog5ozt
 fJ37clK+MzInAf5jmfDNRNf6I1cI+ozf6q0Wu8s5MvHKVFR3w+3hd6hsbZkIRqwdA0Nk
 S0Sobj9WGM0F1guNwkX903kWv+DUm9EOT00TUvEKevaFUn9Gr/HVREQUrpQHVdK7wHPF
 mj2uEdm/U/tQbAxzRvK9Mpt1HWP5TrZTVdCyanzgwrCYjPXY3YZHJP9p35GDfGP482D3
 Q/5UqT+H3oBHY0V5jek62V1Ttb/BaGnJ9IvLj6aKsKXQUVXvtn4tVzNSxkbLT5z/CC72
 J5iw==
X-Gm-Message-State: AOAM530SxE6nySr2SRUzhEe0kGFuy+X668UwSWZUc6wKIsfGluriLBn7
 mbDi5GUuusDorX/2j2t9JhmAuk21QC2vHw==
X-Google-Smtp-Source: ABdhPJwYn3yJF50mBAZW4V4RSGFwi/0OrWlH4XPLvYKSCBPaBXVez6Jq5R3uZZfMkcg7x4/oii66vw==
X-Received: by 2002:a17:906:3ac6:b0:6cb:6808:95f9 with SMTP id
 z6-20020a1709063ac600b006cb680895f9mr4199506ejd.375.1645138441453; 
 Thu, 17 Feb 2022 14:54:01 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id mb23sm1598871ejb.62.2022.02.17.14.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 14:54:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio/virtio-balloon: Prefer Object* over void* parameter
Date: Thu, 17 Feb 2022 23:53:50 +0100
Message-Id: <20220217225351.140095-3-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217225351.140095-1-shentey@gmail.com>
References: <20220217225351.140095-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*opaque is an alias to *obj. Using the ladder makes the code consistent with
with other devices, e.g. accel/kvm/kvm-all and accel/tcg/tcg-all. It also
makes the cast more typesafe.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/virtio/virtio-balloon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 9a4f491b54..38732d4118 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -241,7 +241,7 @@ static void balloon_stats_get_all(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
     Error *err = NULL;
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     int i;
 
     if (!visit_start_struct(v, name, NULL, 0, &err)) {
@@ -276,7 +276,7 @@ static void balloon_stats_get_poll_interval(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
 {
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     visit_type_int(v, name, &s->stats_poll_interval, errp);
 }
 
@@ -284,7 +284,7 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
 {
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     int64_t value;
 
     if (!visit_type_int(v, name, &value, errp)) {
@@ -1014,12 +1014,12 @@ static void virtio_balloon_instance_init(Object *obj)
     s->free_page_hint_notify.notify = virtio_balloon_free_page_hint_notify;
 
     object_property_add(obj, "guest-stats", "guest statistics",
-                        balloon_stats_get_all, NULL, NULL, s);
+                        balloon_stats_get_all, NULL, NULL, NULL);
 
     object_property_add(obj, "guest-stats-polling-interval", "int",
                         balloon_stats_get_poll_interval,
                         balloon_stats_set_poll_interval,
-                        NULL, s);
+                        NULL, NULL);
 }
 
 static const VMStateDescription vmstate_virtio_balloon = {
-- 
2.35.1


