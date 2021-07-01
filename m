Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A793B8E1D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 09:20:23 +0200 (CEST)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyqzm-000326-Cb
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 03:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lyqyN-0001WZ-KF
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lyqyK-0005z4-PA
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625123930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qXIFIINbNbQOBSYeGe9c4eKms71YO5mQrNsuNZFqDTc=;
 b=UZqwDwJKcVmmJlmLHdQ5Ct/VIQC/zxggR5HNDchCOaa1dry6pQ1YIFFaoAsUgF6OAo1cQ5
 wDMORnHUFS0vqHf4bhFohcYiPXNpBx28eEd2GnfGTscs3/iT6rG7jKGs2MGP0KoWBxPCsI
 zA3fa3voApQq3Z/7SmtqBkQTHHfCjWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-62QF9QzRNBa8SeDGQBP1Mw-1; Thu, 01 Jul 2021 03:18:49 -0400
X-MC-Unique: 62QF9QzRNBa8SeDGQBP1Mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB7F4102CB73
 for <qemu-devel@nongnu.org>; Thu,  1 Jul 2021 07:18:48 +0000 (UTC)
Received: from localhost (unknown [10.36.110.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E44D1A26A;
 Thu,  1 Jul 2021 07:18:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/display: report an error if virgl initialization failed
Date: Thu,  1 Jul 2021 11:18:36 +0400
Message-Id: <20210701071837.738897-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Currently, virgl initialization error are silently ignored.

This is likely going to crash later on, as the device isn't fully
initialized then.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/virtio-gpu-virgl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 092c6dc380..46b56f94d9 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -605,6 +605,7 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 
     ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
     if (ret != 0) {
+        error_report("virgl could not be initialized: %d", ret);
         return ret;
     }
 
-- 
2.29.0


