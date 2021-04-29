Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B536EF11
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:43:22 +0200 (CEST)
Received: from localhost ([::1]:33434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcAh6-0005Dn-MO
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcAEV-00011S-Cw
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcAEL-0001K7-AK
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619716411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvIGOKzjvo2npC8jOwDxGZsL8448/SjlGICXbsfeBzE=;
 b=gSgHdyPMqu4hJxOpLI7sP9Fes/qUkoZsag1WhSxf+RjvMDVk5HyzwaJfUjjCkhU79zOtX4
 usZ4+Y1qMnIT7Gx8floWf/m4ILW6UnJcFOwHvnOyhebIjBFSg0qXBcFHg6ClGBT5q9yXqN
 u7BPzfUMpq6Tos1xO9DYfxb8SfCimw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-I6EnhHNBNTmUq374RnojDg-1; Thu, 29 Apr 2021 13:13:26 -0400
X-MC-Unique: I6EnhHNBNTmUq374RnojDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA9F18BB8A5;
 Thu, 29 Apr 2021 17:13:25 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69464100164C;
 Thu, 29 Apr 2021 17:13:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 4/6] vhost-user-blk: Get more feature flags from vhost
 device
Date: Thu, 29 Apr 2021 19:13:14 +0200
Message-Id: <20210429171316.162022-5-kwolf@redhat.com>
In-Reply-To: <20210429171316.162022-1-kwolf@redhat.com>
References: <20210429171316.162022-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den-plotnikov@yandex-team.ru, mst@redhat.com,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VIRTIO_F_RING_PACKED and VIRTIO_F_IOMMU_PLATFORM need to be supported by
the vhost device, otherwise advertising it to the guest doesn't result
in a working configuration. They are currently not supported by the
vhost-user-blk export in QEMU.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1935020
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index f3a45af97c..c7e502f4c7 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -47,6 +47,8 @@ static const int user_feature_bits[] = {
     VIRTIO_RING_F_INDIRECT_DESC,
     VIRTIO_RING_F_EVENT_IDX,
     VIRTIO_F_NOTIFY_ON_EMPTY,
+    VIRTIO_F_RING_PACKED,
+    VIRTIO_F_IOMMU_PLATFORM,
     VHOST_INVALID_FEATURE_BIT
 };
 
-- 
2.30.2


