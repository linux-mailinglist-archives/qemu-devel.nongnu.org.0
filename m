Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C844D3FFD18
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:29:05 +0200 (CEST)
Received: from localhost ([::1]:53880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5VP-0007Nu-B2
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5EL-0001vW-1s
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5EJ-0003IG-Jt
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xg9ERNG8oJn46YqK2OO1OnloZ3JphlNPG4Ne2I5BLZI=;
 b=DmT8LctHs0HqAbNe6G0CIplm1vivowzllT2A1/sJww21Lzh3UB4BsCINQHZxbhwLu2WYjw
 SIrpexV1/hHdieG1ZyChlh3b3KkaBJf//hZpJ7DbXlD3eLsosT9riTRA97uz/qFNhiNYjG
 1qtzc3FfvgQa5RFu+sY3Lh2VIhDNNY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-V-zS2TTuObmkzdC4-KPLTA-1; Fri, 03 Sep 2021 05:11:22 -0400
X-MC-Unique: V-zS2TTuObmkzdC4-KPLTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00A0C835DE0;
 Fri,  3 Sep 2021 09:11:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3C5A610F0;
 Fri,  3 Sep 2021 09:11:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 08/21] vhost-vdpa: fix leaking of vhost_net in
 vhost_vdpa_add()
Date: Fri,  3 Sep 2021 17:10:18 +0800
Message-Id: <20210903091031.47303-9-jasowang@redhat.com>
In-Reply-To: <20210903091031.47303-1-jasowang@redhat.com>
References: <20210903091031.47303-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lulu@redhat.com, gdawar@xilinx.com, eperezma@redhat.com, elic@nvidia.com,
 lingshan.zhu@intel.com, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 3213e69d63..b43df00a85 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -110,6 +110,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
 err:
     if (net) {
         vhost_net_cleanup(net);
+        g_free(net);
     }
     return -1;
 }
-- 
2.25.1


