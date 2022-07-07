Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CD569CAD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:09:32 +0200 (CEST)
Received: from localhost ([::1]:38432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MZm-0000QZ-PV
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLa-0002kE-3T
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLY-0007W6-Le
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9J9998Hzsjj1L77yG8zj6+188E2SlID9WdEaxOYgPs=;
 b=gO1ExBtCetIofU+uTeXnVQb4BSxyc+W3R4Nm6di9m/GN2dn4/08ApRt3/JSlaeRUpR+jf5
 go8aEsiL5BQhjOXcXNWJkx2GQmOUddnGHrEmmeBJ1YDZo/6N3lCJUS6faroJnCyy65foLO
 3XBTVxXmYqrLNpIp28gE1n0vawN1l9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-_2VeXVwxMMmlexLRqx30SQ-1; Thu, 07 Jul 2022 03:54:44 -0400
X-MC-Unique: _2VeXVwxMMmlexLRqx30SQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BAB9185A7BA;
 Thu,  7 Jul 2022 07:54:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5752E40CF8E5;
 Thu,  7 Jul 2022 07:54:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Eric Farman <farman@linux.ibm.com>
Subject: [PULL 09/18] pc-bios/s390-ccw/virtio: Beautify the code for reading
 virtqueue configuration
Date: Thu,  7 Jul 2022 09:54:17 +0200
Message-Id: <20220707075426.1163210-10-thuth@redhat.com>
In-Reply-To: <20220707075426.1163210-1-thuth@redhat.com>
References: <20220707075426.1163210-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It looks nicer if we separate the run_ccw() from the IPL_assert()
statement, and the error message should talk about "virtio device"
instead of "block device", since this code is nowadays used for
non-block (i.e. network) devices, too.

Message-Id: <20220704111903.62400-9-thuth@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
index d8c2b52710..f37510f312 100644
--- a/pc-bios/s390-ccw/virtio.c
+++ b/pc-bios/s390-ccw/virtio.c
@@ -289,9 +289,8 @@ void virtio_setup_ccw(VDev *vdev)
             .num = 0,
         };
 
-        IPL_assert(
-            run_ccw(vdev, CCW_CMD_READ_VQ_CONF, &config, sizeof(config), false) == 0,
-            "Could not get block device VQ configuration");
+        rc = run_ccw(vdev, CCW_CMD_READ_VQ_CONF, &config, sizeof(config), false);
+        IPL_assert(rc == 0, "Could not get virtio device VQ configuration");
         info.num = config.num;
         vring_init(&vdev->vrings[i], &info);
         vdev->vrings[i].schid = vdev->schid;
-- 
2.31.1


