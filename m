Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A73B758A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:32:53 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFjI-0005ZR-RJ
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyFhW-0004N5-Rz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:31:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyFhR-0007Me-O2
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624980655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/BJRwPmysJAosFMTq9SBPhJYpgpkx/XiSzbxfAFX1no=;
 b=BOOs0voCf+nMRy8MxfG9soitHDt77BwlDFObRt9S8wEN8JFBRC4Oqb0iaj7woVsXqnzz/O
 tSoE8qAcAxs0qPyTgMAUXMREKs9Af6isgZ0yWJuBOVdigBkQCKTxzInfnAzPMIgbXmg/r5
 X/lc1azCNuEuMdpUl1YiQUlNpN7cWOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-F8R2tKTKOninjvdzdZZdVg-1; Tue, 29 Jun 2021 11:29:48 -0400
X-MC-Unique: F8R2tKTKOninjvdzdZZdVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B9DF100C625
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 15:29:47 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-114-217.ams2.redhat.com
 [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D23260C13;
 Tue, 29 Jun 2021 15:29:38 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: failover: reset partially_hotplugged
Date: Tue, 29 Jun 2021 17:29:37 +0200
Message-Id: <20210629152937.619193-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
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
Cc: Jason Wang <jasowang@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the card is plugged back, reset the partially_hotplugged flag to false

Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1787194
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/net/virtio-net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index bd7958b9f0ee..16d20cdee52a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3234,6 +3234,7 @@ static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
         }
         hotplug_handler_plug(hotplug_ctrl, dev, &err);
     }
+    pdev->partially_hotplugged = false;
 
 out:
     error_propagate(errp, err);
-- 
2.31.1


