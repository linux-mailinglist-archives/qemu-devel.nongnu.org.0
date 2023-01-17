Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F566DB8F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjaf-0005cM-EO; Tue, 17 Jan 2023 05:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHjad-0005c8-TR
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHjac-0003PN-Df
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673952793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MXrNgTkNh+1MXsfxk/m4LedxMPsVSjrO2kNC+6esI/I=;
 b=dErXbKKHjwrsEE4S//wXANrRhyZ1Foh8x+Zq2jXwRb4Gx6v1//JtdSvbPKGovggPUiee59
 yL21piog/5ru4XDYYjYoTlCpuhAozcg+Aq0GZRwgU33jwW39tiKCQp8F72ysn7Ju90hPl6
 I/t/RizRgHdmm9rVr/441a3n/DluZSE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-GZ6hefJfMYSGLLCoqUfEhA-1; Tue, 17 Jan 2023 05:53:12 -0500
X-MC-Unique: GZ6hefJfMYSGLLCoqUfEhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E303929AA389;
 Tue, 17 Jan 2023 10:53:11 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 354B040C2064;
 Tue, 17 Jan 2023 10:53:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: mst@redhat.com
Cc: elic@nvidia.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, leiyang@redhat.com
Subject: [PATCH] vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
Date: Tue, 17 Jan 2023 11:53:08 +0100
Message-Id: <20230117105308.1337120-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

VHOST_BACKEND_F_IOTLB_ASID is the feature bit, not the bitmask. Since
the device under test also provided VHOST_BACKEND_F_IOTLB_MSG_V2 and
VHOST_BACKEND_F_IOTLB_BATCH, this went unnoticed.

Fixes: c1a1008685 ("vdpa: always start CVQ in SVQ mode if possible")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
Originally on SUSPEND series, but it is a fix that it is worth to send
and apply individually:
https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg02574.html

---
 net/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1a13a34d35..de5ed8ff22 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -384,7 +384,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
             g_strerror(errno), errno);
         return -1;
     }
-    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
+    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
         !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
         return 0;
     }
--
2.31.1


