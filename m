Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EDF230237
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 08:00:56 +0200 (CEST)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0IfX-0004iJ-Re
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 02:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k0Icv-0001IF-11
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 01:58:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42413
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k0Ict-0007Ak-CX
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 01:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595915890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=CGeSDBMl3BFyH1Hw0ys+QbRfN+ErqYRaEUNFg8limbg=;
 b=TXSYyWseZeowOH4SlzsarXfo60L5UgtUZW9lyPwyWHSmBX1FrsaHmvOwYWcKmpujjpjwNo
 C93FAA/W8Jzs4XphnmzC3nM0ADudPHC4rKb5HSFJIyIXgHR++ePXmkLpfX1mSBI5yMuIkR
 cIc8dVzFWuq2P2SAyx7jQwZQgPPIHuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-IVwM-EkHPCKM9P8RDwq38A-1; Tue, 28 Jul 2020 01:58:06 -0400
X-MC-Unique: IVwM-EkHPCKM9P8RDwq38A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 129C558;
 Tue, 28 Jul 2020 05:58:05 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-130.pek2.redhat.com
 [10.72.13.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 621581001281;
 Tue, 28 Jul 2020 05:58:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 1/4] virtio-pci: fix wrong index in virtio_pci_queue_enabled
Date: Tue, 28 Jul 2020 13:57:55 +0800
Message-Id: <1595915878-22568-2-git-send-email-jasowang@redhat.com>
In-Reply-To: <1595915878-22568-1-git-send-email-jasowang@redhat.com>
References: <1595915878-22568-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 23:55:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuri Benditovich <yuri.benditovich@daynix.com>

https://bugzilla.redhat.com/show_bug.cgi?id=1702608

Fixes: f19bcdfedd53 ("virtio-pci: implement queue_enabled method")
Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ada1101..2b1f9cc 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1113,7 +1113,7 @@ static bool virtio_pci_queue_enabled(DeviceState *d, int n)
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
 
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
-        return proxy->vqs[vdev->queue_sel].enabled;
+        return proxy->vqs[n].enabled;
     }
 
     return virtio_queue_enabled(vdev, n);
-- 
2.7.4


