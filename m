Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00E569C64
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:04:11 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MUc-0004BM-KH
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLY-0002hp-Rb
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9MLX-0007VN-3j
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657180486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVtlGETNQAE4Io3WeIVdVnBkkrYlbv0/vl0yRdGNvK0=;
 b=KNtiBg4uA/6UcTYTOQO3KZmDlIJvnOYklp3cu2eyhjTu7fmaqtLGRjSwUf3lH4dFMR75J0
 RuJE8NfmMhieuVBJQaJ9N2OU99WS5Km+iB8QqUnfF2+vHEOfcL+g2uslRF20HknPn7jaIt
 3C6fknEi77JqFzSjdrD61p9VE2YwKDg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-uA8GtrfTNWaiFLwKI2zA9g-1; Thu, 07 Jul 2022 03:54:43 -0400
X-MC-Unique: uA8GtrfTNWaiFLwKI2zA9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F40BF2999B21;
 Thu,  7 Jul 2022 07:54:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF35740CF8E5;
 Thu,  7 Jul 2022 07:54:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 08/18] pc-bios/s390-ccw/virtio: Read device config after
 feature negotiation
Date: Thu,  7 Jul 2022 09:54:16 +0200
Message-Id: <20220707075426.1163210-9-thuth@redhat.com>
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

Feature negotiation should be done first, since some fields in the
config area can depend on the negotiated features and thus should
rather be read afterwards.

While we're at it, also adjust the error message here a little bit
(the code is nowadays used for non-block virtio devices, too).

Message-Id: <20220704111903.62400-8-thuth@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
index 4e85a2eb82..d8c2b52710 100644
--- a/pc-bios/s390-ccw/virtio.c
+++ b/pc-bios/s390-ccw/virtio.c
@@ -262,10 +262,6 @@ void virtio_setup_ccw(VDev *vdev)
     rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
     IPL_assert(rc == 0, "Could not write DRIVER status to host");
 
-    IPL_assert(
-        run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false) == 0,
-       "Could not get block device configuration");
-
     /* Feature negotiation */
     for (i = 0; i < ARRAY_SIZE(vdev->guest_features); i++) {
         feats.features = 0;
@@ -278,6 +274,9 @@ void virtio_setup_ccw(VDev *vdev)
         IPL_assert(rc == 0, "Could not set features bits");
     }
 
+    rc = run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false);
+    IPL_assert(rc == 0, "Could not get virtio device configuration");
+
     for (i = 0; i < vdev->nr_vqs; i++) {
         VqInfo info = {
             .queue = (unsigned long long) ring_area + (i * VIRTIO_RING_SIZE),
-- 
2.31.1


