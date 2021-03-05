Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6232EF7D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:59:14 +0100 (CET)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICrB-00088j-GX
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnj-0003w0-As
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnf-0003Mm-TM
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614959735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5tYMPhFZMBSi4y1aG0eRsNQP88oVaKFh1DzlawSbPU=;
 b=D6d491W57G2JmBzLZZZFUhJ5nyat0aZn7DF0vMEHLqmFgAHoZi4VlX7DrAivKX1NKbaEKW
 CEsXpP2ltRg/3jWHYBBCk/aDmNZf3Umkkh5HgAejyzALhhuMn7nBC/ORXITp7OMMQjqigb
 EaGHM/zl9n/eEaaeaagLm+TdK9bQ80A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-ov8eaOJzO-qAsXkc8lFoFw-1; Fri, 05 Mar 2021 10:55:31 -0500
X-MC-Unique: ov8eaOJzO-qAsXkc8lFoFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80F52881280;
 Fri,  5 Mar 2021 15:55:29 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC04360843;
 Fri,  5 Mar 2021 15:55:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/8] hw/s390x: fix build for virtio-9p-ccw
Date: Fri,  5 Mar 2021 16:55:12 +0100
Message-Id: <20210305155517.1604547-4-cohuck@redhat.com>
In-Reply-To: <20210305155517.1604547-1-cohuck@redhat.com>
References: <20210305155517.1604547-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Jakob Naucke <jakob.naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Halil Pasic <pasic@linux.ibm.com>

Commit  2c44220d05 ("meson: convert hw/arch*"), which migrated the old
Makefile.objs to meson.build  accidentally excluded virtio-ccw-9p.c and
thus the virtio-9p-ccw device from the build (and potentially also
included the file virtio-ccw-blk.c twice in the source set). And since
CONFIG_VIRTFS can't be used the way it was used here (see commit
2c9dce0196 ("meson: do not use CONFIG_VIRTFS")), the preconditions have
to be written differently.

Let's fix this!

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Fixes: 2c44220d05 ("meson: convert hw/arch*")
Reported-by: Jakob Naucke <jakob.naucke@ibm.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210218034059.1096078-1-pasic@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 2a7818d94b94..91495b563146 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -40,7 +40,9 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_SCSI', if_true: files('virtio-ccw-scsi.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-ccw-serial.c'))
-virtio_ss.add(when: ['CONFIG_VIRTIO_9P', 'CONFIG_VIRTFS'], if_true: files('virtio-ccw-blk.c'))
+if have_virtfs
+  virtio_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-ccw-9p.c'))
+endif
 virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-ccw.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'))
 s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
-- 
2.26.2


