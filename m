Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FC526A641
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 15:24:30 +0200 (CEST)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIAwg-00066F-1D
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 09:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kIAeJ-0005ic-NK
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 09:05:33 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kIAeE-0006cK-3n
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 09:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600175125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BeAchod7ps53vr4sJXOnEuKC2INNKW7zOgiBMcrN7mg=;
 b=iHMTMatYgxZWR/cljRmY4I//3kapx9/8REmnvIniEu/k+jB6IAwUuloyH/8FwzJ8fJmrB0
 s7t0q7CXyTyRzZnP0Fd0gVdOVJ5vX0RNgi/FChjZjtL/Q5HEOWmbwkbGzOb4GJFKnDdVru
 J59F5uObIjMng/QawpsekyvBAczmaCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-IXijB3tgMwW1do85EaWOkg-1; Tue, 15 Sep 2020 09:05:21 -0400
X-MC-Unique: IXijB3tgMwW1do85EaWOkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D94A1017DC7;
 Tue, 15 Sep 2020 13:05:20 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-120.ams2.redhat.com
 [10.36.114.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D22E17EB74;
 Tue, 15 Sep 2020 13:05:15 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] virtio: skip legacy support check on machine types less
 than 5.1
Date: Tue, 15 Sep 2020 15:05:14 +0200
Message-Id: <20200915130514.80989-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 05:35:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9b3a35ec82 ("virtio: verify that legacy support is not accidentally
on") added a check that returns an error if legacy support is on, but the
device is not legacy.

Unfortunately some devices were wrongly declared legacy even if they
were not (e.g vhost-vsock).

To avoid migration issues, we disable this error for machine types < 5.1,
but we print a warning.

Cc: qemu-stable@nongnu.org
Fixes: 9b3a35ec82 ("virtio: verify that legacy support is not accidentally on")
Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Suggested-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
 - fixed Cornelia's e-mail address
---
 include/hw/virtio/virtio.h |  1 +
 hw/core/machine.c          |  1 +
 hw/virtio/virtio.c         | 18 ++++++++++++++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 807280451b..ed7cee348b 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -103,6 +103,7 @@ struct VirtIODevice
     bool use_started;
     bool started;
     bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
+    bool disable_legacy_check;
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ea26d61237..b686eab798 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -44,6 +44,7 @@ GlobalProperty hw_compat_5_0[] = {
     { "vmport", "x-signal-unsupported-cmd", "off" },
     { "vmport", "x-report-vmx-type", "off" },
     { "vmport", "x-cmds-v2", "off" },
+    { "virtio-device", "x-disable-legacy-check", "true" },
 };
 const size_t hw_compat_5_0_len = G_N_ELEMENTS(hw_compat_5_0);
 
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e983025217..30ccc43b8c 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3287,6 +3287,8 @@ void virtio_init(VirtIODevice *vdev, const char *name,
  */
 bool virtio_legacy_allowed(VirtIODevice *vdev)
 {
+    bool ret = false;
+
     switch (vdev->device_id) {
     case VIRTIO_ID_NET:
     case VIRTIO_ID_BLOCK:
@@ -3298,10 +3300,20 @@ bool virtio_legacy_allowed(VirtIODevice *vdev)
     case VIRTIO_ID_9P:
     case VIRTIO_ID_RPROC_SERIAL:
     case VIRTIO_ID_CAIF:
+        ret = true;
+    }
+
+    /*
+     * For backward compatibility, we allow legacy mode with old machine types
+     * to get the migration working.
+     */
+    if (!ret && vdev->disable_legacy_check) {
+        warn_report("device is modern-only, but for backward compatibility "
+                    "legacy is allowed");
         return true;
-    default:
-        return false;
     }
+
+    return ret;
 }
 
 hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n)
@@ -3713,6 +3725,8 @@ static Property virtio_properties[] = {
     DEFINE_VIRTIO_COMMON_FEATURES(VirtIODevice, host_features),
     DEFINE_PROP_BOOL("use-started", VirtIODevice, use_started, true),
     DEFINE_PROP_BOOL("use-disabled-flag", VirtIODevice, use_disabled_flag, true),
+    DEFINE_PROP_BOOL("x-disable-legacy-check", VirtIODevice,
+                     disable_legacy_check, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.26.2


