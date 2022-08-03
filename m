Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B025891A1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:42:08 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJINj-0008Ab-PJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJII8-0001tX-R8
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJII4-0000Fd-4q
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659548175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bq04tONNl/ykWgpL1Uyrw51luSKdbIbA68o5zFH45Gg=;
 b=SQTJ/8qVYxH2wFQvmRtnAjWtMS4WIsKXbTYvEIjaMCS6774i/phS2aUQAWaJE/1gQizHrj
 WJGhc/9HSRjKHJgXyvs+FsqiXKpoxhgcScyTdHYhZC1P90p1w88DiuZ49zKk+Cku5QSDvl
 Lag/5vu9WB/CYbKFwTusy9CaVpBXPrw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-TW_oDHkTP4KittC_JcuiIg-1; Wed, 03 Aug 2022 13:36:11 -0400
X-MC-Unique: TW_oDHkTP4KittC_JcuiIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D25C811766;
 Wed,  3 Aug 2022 17:36:11 +0000 (UTC)
Received: from localhost (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66D08403164;
 Wed,  3 Aug 2022 17:36:10 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Amit Shah <amit@kernel.org>,
 Laurent Vivier <lvivier@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 1/2] virtio: document vdc->get_features() callback
Date: Wed,  3 Aug 2022 13:36:05 -0400
Message-Id: <20220803173606.965926-2-stefanha@redhat.com>
In-Reply-To: <20220803173606.965926-1-stefanha@redhat.com>
References: <20220803173606.965926-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..8d27fe1824 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -120,9 +120,29 @@ struct VirtioDeviceClass {
     /* This is what a VirtioDevice must implement */
     DeviceRealize realize;
     DeviceUnrealize unrealize;
+
+    /**
+     * get_features:
+     * @vdev: the VirtIODevice
+     * @requested_features: existing device feature bits from
+     *                      vdev->host_features
+     * @errp: pointer to error object
+     *
+     * Get the device feature bits.
+     *
+     * The ->get_features() function typically sets always-on device feature
+     * bits as well as conditional feature bits that require some logic to
+     * compute.
+     *
+     * Device feature bits can also be set in vdev->host_features before this
+     * function is called using DEFINE_PROP_BIT64() qdev properties.
+     *
+     * Returns: the final device feature bits to store in vdev->host_features.
+     */
     uint64_t (*get_features)(VirtIODevice *vdev,
                              uint64_t requested_features,
                              Error **errp);
+
     uint64_t (*bad_features)(VirtIODevice *vdev);
     void (*set_features)(VirtIODevice *vdev, uint64_t val);
     int (*validate_features)(VirtIODevice *vdev);
-- 
2.37.1


