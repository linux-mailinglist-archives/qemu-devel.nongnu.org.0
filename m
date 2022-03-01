Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5A4C986F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:39:01 +0100 (CET)
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPB91-0006FV-VL
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:38:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAtj-0002yE-73; Tue, 01 Mar 2022 17:23:11 -0500
Received: from [2a00:1450:4864:20::62f] (port=35375
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAth-0003V0-Ft; Tue, 01 Mar 2022 17:23:10 -0500
Received: by mail-ej1-x62f.google.com with SMTP id qk11so34425383ejb.2;
 Tue, 01 Mar 2022 14:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anSVurh0JIkoccgIu5fRrD6ZqVlFqFRz+ls7EZWn0Rg=;
 b=QzY7QB4gNDy1d7Hs74Rumxcu3XT0k+C6iyhuZ8+RDCM2pR0blzy1TSi+/3RLKkxFGu
 aNOgohls5qDbIhDUWDHWcrb3AK53dB97A5RBOyu5dcrm3B1SNQ5n9m2qOql0KxXUOaUi
 WMsfqt8Si/VDakUUyNumeYXvlHEcb8kn0Rnw66FMxfq6mk3u3gdL1FalBhYFylV0RJld
 vswol6RaDpOulDiPYHPV7lJ9YpDZMRYZxNfmysO/NAdQVVzwEKw/46PghQhJZ4IkB54e
 UUVkp3btu4Gkfouekuk2NddPymiiHtAhZiNhUzSVkdt+tvVRws2bh4Zn6f5qVB4jH7vh
 JRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anSVurh0JIkoccgIu5fRrD6ZqVlFqFRz+ls7EZWn0Rg=;
 b=TNRv5kZ6+U/fm6+NA+XEvMCJMf/GC4lIycxO7//SZ1/rZgbianiWueSqrjDc0MVT9k
 BgFhctrCimvPgRHXtwaX8+FFKemDgIC70SzlZ3NTIuh6pPIubRwgX9hNHs53HRKTk/oU
 of0Z7POxFTXXH737nKy0tlItrQqMRnMdhq+t9q94aG/3pRmeRR8qBXH2ptlQimPBnKLe
 z7rdF5KBKJvTZKCa7tTOsS+JahcmQUNd+jeHrv9WPbDSeFy2fHzi5VROnn2rDZ3ztTSr
 BTvWnuwWv1BmpH70zINv2AChE9cghBnrrk3oYsm+vJXrYh8KYxlTzcjywwULZS6zcUce
 EzJg==
X-Gm-Message-State: AOAM532zUmmoqhNXR8ICmR4AeBQFE/zY1pnrLvBhITeBS/FCwR7heHPL
 bvgxrITbIvhz6DOFX9sI5YyvUSUSeaA=
X-Google-Smtp-Source: ABdhPJzdonib301hESOZrPW4SFZxlRxH1y/hNf63n95wMRXX17kw2hvNSZhazoqANVB++tAvaOfmgQ==
X-Received: by 2002:a17:906:4987:b0:6c9:e16a:b5bf with SMTP id
 p7-20020a170906498700b006c9e16ab5bfmr19815050eju.247.1646173387442; 
 Tue, 01 Mar 2022 14:23:07 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 lb14-20020a170907784e00b006d5c0baa503sm5685908ejc.110.2022.03.01.14.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:23:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND] virtio/virtio-balloon: Prefer Object* over void*
 parameter
Date: Tue,  1 Mar 2022 23:23:00 +0100
Message-Id: <20220301222301.103821-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*opaque is an alias to *obj. Using the ladder makes the code consistent with
with other devices, e.g. accel/kvm/kvm-all and accel/tcg/tcg-all. It also
makes the cast more typesafe.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index e6c1b0aa46..163d244eb4 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -242,7 +242,7 @@ static void balloon_stats_get_all(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
     Error *err = NULL;
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     int i;
 
     if (!visit_start_struct(v, name, NULL, 0, &err)) {
@@ -277,7 +277,7 @@ static void balloon_stats_get_poll_interval(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
 {
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     visit_type_int(v, name, &s->stats_poll_interval, errp);
 }
 
@@ -285,7 +285,7 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
 {
-    VirtIOBalloon *s = opaque;
+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
     int64_t value;
 
     if (!visit_type_int(v, name, &value, errp)) {
@@ -1015,12 +1015,12 @@ static void virtio_balloon_instance_init(Object *obj)
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


