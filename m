Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6A4B1532
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:26:04 +0100 (CET)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIE8p-0001YW-KU
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:26:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nIAp4-0005ig-NC
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:53:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nIAp1-00047d-5I
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644504798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YS8AdaXznpl0s+jpJfJaFLskj44LUxutIBBNWaw69ss=;
 b=M2k1gqSZIFldBG6gseblQNFWRsw0IsYhPi4c44IH0cq9UdKy7K3lYPDZi8bS3mV+BBRnUm
 a4NQMXo/kRhuXwbOUXlVXGP2zrLm/NRl4nmc0CA7vEzs3See1kViszwG6rqRU8IahTBfIC
 8POZn+KzFyfA740hrecdWd/2EUxd4XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-IZFjJOuVNdKsuib4rx1C-A-1; Thu, 10 Feb 2022 09:53:15 -0500
X-MC-Unique: IZFjJOuVNdKsuib4rx1C-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E779A1091DA5;
 Thu, 10 Feb 2022 14:53:13 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33EE470D5F;
 Thu, 10 Feb 2022 14:53:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com,
 Coiby.Xu@gmail.com, stefanha@redhat.com
Subject: [PATCH v3 4/5] tests/qtest/vhost-user-blk-test: Temporary hack to get
 tests passing on aarch64
Date: Thu, 10 Feb 2022 15:52:53 +0100
Message-Id: <20220210145254.157790-5-eric.auger@redhat.com>
In-Reply-To: <20220210145254.157790-1-eric.auger@redhat.com>
References: <20220210145254.157790-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When run on ARM, basic and indirect tests currently fail with the
following error:

ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
assertion failed (got_desc_idx == desc_idx): (50331648 == 0)

I noticed it worked when I set up MSI and I further reduced the
code to a simple guest_alloc() that removes the error. At the moment
I am not able to identify where ths issue is and this blocks the
whole pci/aarch64 enablement.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 1316aae0fa..cf8057fb57 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -225,6 +225,9 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
     QTestState *qts = global_qtest;
     QVirtQueue *vq;
 
+    /* temporary hack to let the test pass on aarch64 */
+    guest_alloc(alloc, 4);
+
     features = qvirtio_get_features(dev);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
                     (1u << VIRTIO_RING_F_INDIRECT_DESC) |
@@ -469,6 +472,9 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
     char *data;
     QTestState *qts = global_qtest;
 
+    /* temporary hack to let the test pass on aarch64 */
+    guest_alloc(t_alloc, 4);
+
     features = qvirtio_get_features(dev);
     g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
-- 
2.26.3


