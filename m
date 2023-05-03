Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E306F5309
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:21:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu7ja-0001NJ-CW; Wed, 03 May 2023 04:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pu7jV-0001Jq-R3
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:21:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pu7jR-0002vW-QB
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683102061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuMH/RMynG6FpyWFgp2ZHBxCJ+V8YIpW/nshAl60QIw=;
 b=V+9DZb67whooRaXeoRs/2TBVG5D7qYBK0oyRe0r10dhWxLsgjYSbeI6g4i6ezzNWwYKUfA
 EsQbavbjx/D8ZAXCBcIFp7NSzRBvBTkN2Jsd1U26AptfzTt02F8lvf/cFnD1yJIKo+vOmk
 IkpSz5r+uM2lClZ23Ae1r8jwWOm5+A4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-MbYz9V2mMPWSnJ1Qb7N9xA-1; Wed, 03 May 2023 04:19:24 -0400
X-MC-Unique: MbYz9V2mMPWSnJ1Qb7N9xA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 741601C09500
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 08:19:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.225.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83107C15BAE;
 Wed,  3 May 2023 08:19:23 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Albert Esteve <aesteve@redhat.com>
Subject: [PATCH 4/4] libvhost-user: add write_msg cb to dev struct
Date: Wed,  3 May 2023 10:19:11 +0200
Message-Id: <20230503081911.119168-5-aesteve@redhat.com>
In-Reply-To: <20230503081911.119168-1-aesteve@redhat.com>
References: <20230503081911.119168-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add vu_write_msg_cb type as a member of the VuDev
struct.

In order to interact with the virtio-dmabuf
API, vhost-user backends have available a special
message type that can be sent to the frontend
in Qemu, in order to add, lookup, or remove
entries.

To send these messages and avoid code replication,
backends will need the write_msg method to be exposed
to them, similarly to how the read_msg is for
receiving messages.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c |  1 +
 subprojects/libvhost-user/libvhost-user.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 6b4b721225..c50b353915 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2115,6 +2115,7 @@ vu_init(VuDev *dev,
     dev->sock = socket;
     dev->panic = panic;
     dev->read_msg = read_msg ? read_msg : vu_message_read_default;
+    dev->write_msg = vu_message_write;
     dev->set_watch = set_watch;
     dev->remove_watch = remove_watch;
     dev->iface = iface;
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 784db65f7c..f5d7162886 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -242,6 +242,7 @@ typedef void (*vu_set_features_cb) (VuDev *dev, uint64_t features);
 typedef int (*vu_process_msg_cb) (VuDev *dev, VhostUserMsg *vmsg,
                                   int *do_reply);
 typedef bool (*vu_read_msg_cb) (VuDev *dev, int sock, VhostUserMsg *vmsg);
+typedef bool (*vu_write_msg_cb) (VuDev *dev, int sock, VhostUserMsg *vmsg);
 typedef void (*vu_queue_set_started_cb) (VuDev *dev, int qidx, bool started);
 typedef bool (*vu_queue_is_processed_in_order_cb) (VuDev *dev, int qidx);
 typedef int (*vu_get_config_cb) (VuDev *dev, uint8_t *config, uint32_t len);
@@ -429,6 +430,21 @@ struct VuDev {
      */
     vu_read_msg_cb read_msg;
 
+    /*
+     * @write_msg: custom method to write vhost-user message
+     *
+     * Write data to vhost_user socket fd from the passed
+     * VhostUserMsg *vmsg struct.
+     *
+     * For the details, please refer to vu_message_write in libvhost-user.c
+     * which will be used by default when calling vu_unit.
+     * No custom method is allowed.
+     *
+     * Returns: true if vhost-user message successfully sent, false otherwise.
+     *
+     */
+    vu_write_msg_cb write_msg;
+
     /*
      * @set_watch: add or update the given fd to the watch set,
      * call cb when condition is met.
-- 
2.40.0


