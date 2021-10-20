Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A342E43491E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:40:44 +0200 (CEST)
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md91X-0004R0-PH
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i8-0004nY-1v
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i6-0003ja-Gc
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDSmLhCNyhjwq4dSlabAJpt3Pwq7xbTenlNw9fzietw=;
 b=WJkHJmRAulFLJMv9lCYLaHPo55XSzzB1qgVty26a4Tx6Nc1EjA3VwVDZ+o2zKbeuf9Trli
 gUlDRmnRVO4Bj4GrQh7F2GwqDVQ3xeApTyY+msutj9qjtQzH2SDBd1ECY/XFpt2HiOSiIw
 U/y4sDHV+dBPWU2QFMqe2WaO/0FW9LM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-SXsq0n3LO_K9oywTJiWfXg-1; Wed, 20 Oct 2021 06:20:36 -0400
X-MC-Unique: SXsq0n3LO_K9oywTJiWfXg-1
Received: by mail-ed1-f69.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so20536882edv.10
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vDSmLhCNyhjwq4dSlabAJpt3Pwq7xbTenlNw9fzietw=;
 b=ScZtN8wabdxe24G/WgAtOWbhEZr1Xifp1buCMJiQMWOU19R6Xxv9Q/3jQFhLGczVn+
 HtR73dth4Ux7CbRVV4ErYJp1RNS1NtI4WT6JJmh3F0xL+v+xSSDf3XrHoyMcG2Eedggz
 hdZpSiRrB/Jti0uU5WXFEyRuYGap32erec+BzzKZX804gb4PDjza3KWZnzwC+uEeWBKN
 fHy7aGnHmxnp89e3NAhPgeWiSVZxCaGgVXBjIjV+hLGX2BJjsvq6a/sVoxKoGMOF8qvQ
 DnxoaqgU5AtuPvQ5O4Ref4RJbwIlOm3oC3CXzxxRgE9FAk9mnCCa4qqIJuY3abdql/qe
 lGDA==
X-Gm-Message-State: AOAM5329rkEAdoXDx9JeiyMzcoUVIzlztYKXKM9QUQa9gYY4q8lFo86v
 karvFoYE+kbXrc0AaC0UauSZJXq3nDknNuORNWPoqN1VpgOcHGOoEbqLlberEoLnjbn5RCFU29H
 QSlXEDCDAnsValNZ5Gpd39/sfUG8fFvWc7vm1OZ3G+sfxXVRCo3LiMOZE9Kg8
X-Received: by 2002:a17:906:3c51:: with SMTP id
 i17mr45960946ejg.86.1634725235235; 
 Wed, 20 Oct 2021 03:20:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7JRFEWGQ6DDwx+gRfMsI75tVOzEbxYUnSz2T3yGmmGkoM/VdDqyCe11cNXSVUcLrxfbkVcg==
X-Received: by 2002:a17:906:3c51:: with SMTP id
 i17mr45960907ejg.86.1634725234999; 
 Wed, 20 Oct 2021 03:20:34 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id b2sm950425edv.73.2021.10.20.03.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:34 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 28/44] qdev/qbus: remove failover specific code
Message-ID: <20211020101844.988480-29-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Commit f3a850565693 ("qdev/qbus: add hidden device support") has
introduced a generic way to hide a device but it has modified
qdev_device_add() to check a specific option of the failover device,
"failover_pair_id", before calling the generic mechanism.

It's not needed (and not generic) to do that in qdev_device_add() because
this is also checked by the failover_hide_primary_device() function that
uses the generic mechanism to hide the device.

Cc: Jens Freimann <jfreimann@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20211019071532.682717-3-lvivier@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/net/virtio-net.c    | 12 +++++++++++-
 softmmu/qdev-monitor.c | 18 ++++++------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 83642c85b2..3dd2896ff9 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3299,7 +3299,17 @@ static bool failover_hide_primary_device(DeviceListener *listener,
     if (!device_opts) {
         return false;
     }
-    standby_id = qdict_get_try_str(device_opts, "failover_pair_id");
+
+    if (!qdict_haskey(device_opts, "failover_pair_id")) {
+        return false;
+    }
+
+    if (!qdict_haskey(device_opts, "id")) {
+        error_setg(errp, "Device with failover_pair_id needs to have id");
+        return false;
+    }
+
+    standby_id = qdict_get_str(device_opts, "failover_pair_id");
     if (g_strcmp0(standby_id, n->netclient_name) != 0) {
         return false;
     }
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 89c473cb22..4851de51a5 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -639,19 +639,13 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
         }
     }
 
-    if (qdict_haskey(opts, "failover_pair_id")) {
-        if (!qdict_haskey(opts, "id")) {
-            error_setg(errp, "Device with failover_pair_id don't have id");
-            return NULL;
-        }
-        if (qdev_should_hide_device(opts, from_json, errp)) {
-            if (bus && !qbus_is_hotpluggable(bus)) {
-                error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
-            }
-            return NULL;
-        } else if (*errp) {
-            return NULL;
+    if (qdev_should_hide_device(opts, from_json, errp)) {
+        if (bus && !qbus_is_hotpluggable(bus)) {
+            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         }
+        return NULL;
+    } else if (*errp) {
+        return NULL;
     }
 
     if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
-- 
MST


