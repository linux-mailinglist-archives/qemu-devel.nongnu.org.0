Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C6508649
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:47:52 +0200 (CEST)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7sF-0006pw-7T
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eQ-0001PR-K2
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eK-0006rQ-Ox
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650450807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kjYXNut4AoVVjH8FYHZGy5DwSVR7/wMYrfiaIjtkhg=;
 b=i/1QsEIZzWmbReAR2fG8mCJ2Jc+ed8zOlBcSqSOncti0dlapD0N320QV4Wpo/OHiEv+KEk
 NTlicuZFvgW9jdmHB2ptV7bZ1xXLgavGKaF7odrbfFTxnmSoO1cTN9mfu5apacV5dGpEud
 SqDUWnZHXjtLAsnjHf2UN4ALjiTPYUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-4w7VezKsNhmb8zR3F7y2iw-1; Wed, 20 Apr 2022 06:33:24 -0400
X-MC-Unique: 4w7VezKsNhmb8zR3F7y2iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D34803533;
 Wed, 20 Apr 2022 10:33:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BE55C44AE1;
 Wed, 20 Apr 2022 10:33:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/7] tests/qtest: properly initialise the vring used idx
Date: Wed, 20 Apr 2022 12:33:06 +0200
Message-Id: <20220420103309.264479-5-thuth@redhat.com>
In-Reply-To: <20220420103309.264479-1-thuth@redhat.com>
References: <20220420103309.264479-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Eric noticed while attempting to enable the vhost-user-blk-test for
Aarch64 that that things didn't work unless he put in a dummy
guest_malloc() at the start of the test. Without it
qvirtio_wait_used_elem() would assert when it reads a junk value for
idx resulting in:

  qvirtqueue_get_buf: idx:2401 last_idx:0
  qvirtqueue_get_buf: 0x7ffcb6d3fe74, (nil)
  qvirtio_wait_used_elem: 3000000/0
  ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used_elem: assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
  Bail out! ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used_elem: assertion failed (got_desc_idx == desc_idx): (50331648 == 0)

What was actually happening is the guest_malloc() effectively pushed
the allocation of the vring into the next page which just happened to
have clear memory. After much tedious tracing of the code I could see
that qvring_init() does attempt initialise a bunch of the vring
structures but skips the vring->used.idx value. It is probably not
wise to assume guest memory is zeroed anyway. Once the ring is
properly initialised the hack is no longer needed to get things
working.

Thanks-to: John Snow <jsnow@redhat.com> for helping debug
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220406173356.1891500-1-alex.bennee@linaro.org>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/libqos/virtio.c b/tests/qtest/libqos/virtio.c
index 6fe7bf9555..fba9186659 100644
--- a/tests/qtest/libqos/virtio.c
+++ b/tests/qtest/libqos/virtio.c
@@ -260,6 +260,8 @@ void qvring_init(QTestState *qts, const QGuestAllocator *alloc, QVirtQueue *vq,
 
     /* vq->used->flags */
     qvirtio_writew(vq->vdev, qts, vq->used, 0);
+    /* vq->used->idx */
+    qvirtio_writew(vq->vdev, qts, vq->used + 2, 0);
     /* vq->used->avail_event */
     qvirtio_writew(vq->vdev, qts, vq->used + 2 +
                    sizeof(struct vring_used_elem) * vq->size, 0);
-- 
2.27.0


