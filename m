Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDFC3A2966
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:33:34 +0200 (CEST)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI0D-0006Qh-MM
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHji-00072s-Rs
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHjd-0001JI-ET
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623320184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4rQnla47qSsi4ecNnOBQG3ACoJi/wGvpg9dddASoak=;
 b=F+Uvz8lv+pUt7Ci+5BbduVB1dDCLsB0FSJiK5vbOP/92FS6HDAn7nSaZXWMpSe8EDDrxmR
 7FdDeiFgoMVsZ69APQZWsF3fkC2vorG9X6Xy07UQg1guMRKlcOpga34OFN+RYOQQOoTWNj
 RD5W1ScA84EcyU4zmAOIEItK8qeZE8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-92jI3Tb2PPmQYO2_mjzWTQ-1; Thu, 10 Jun 2021 06:16:23 -0400
X-MC-Unique: 92jI3Tb2PPmQYO2_mjzWTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30254100CF76;
 Thu, 10 Jun 2021 10:16:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E623660C04;
 Thu, 10 Jun 2021 10:16:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3843118009C4; Thu, 10 Jun 2021 12:15:53 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] modules: build virtio-9p modular
Date: Thu, 10 Jun 2021 12:15:53 +0200
Message-Id: <20210610101553.943689-5-kraxel@redhat.com>
In-Reply-To: <20210610101553.943689-1-kraxel@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 cfontana@suse.de, jose.ziviani@suse.com, pbonzini@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple target for testing 😊

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/9pfs/virtio-9p-device.c |  2 ++
 hw/9pfs/meson.build        | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 14371a78efd8..9a2df7b5126d 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -265,6 +265,8 @@ static const TypeInfo virtio_device_info = {
     .instance_size = sizeof(V9fsVirtioState),
     .class_init = virtio_9p_class_init,
 };
+module_obj(TYPE_VIRTIO_9P);
+module_arch(TARGET_NAME);
 
 static void virtio_9p_register_types(void)
 {
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 99be5d911968..584e9432ab46 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -1,3 +1,5 @@
+hw_9pfs_modules = {}
+
 fs_ss = ss.source_set()
 fs_ss.add(files(
   '9p-local.c',
@@ -17,4 +19,11 @@ fs_ss.add(files(
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device.c'))
+if config_all_devices.has_key('CONFIG_VIRTIO_9P')
+  virtio_9p_ss = ss.source_set()
+  virtio_9p_ss.add(when: 'CONFIG_VIRTIO_9P',
+                   if_true: files('virtio-9p-device.c'))
+  hw_9pfs_modules += {'virtio-9p-device': virtio_9p_ss}
+endif
+
+target_modules += { 'hw-9pfs': hw_9pfs_modules }
-- 
2.31.1


