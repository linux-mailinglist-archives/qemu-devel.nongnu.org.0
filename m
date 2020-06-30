Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9BE20F151
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 11:14:50 +0200 (CEST)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqCLp-0006QL-8L
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 05:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBh-0002wz-ES
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43021
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBQ-0002yd-Or
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593507844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcxBdk1yR0L0NGPCwHLwfbasPaqRo7Vbg5ITcMbllEc=;
 b=M9Z5jkDzHjMMC6WWiZsOlNas8A7zzkngdP0KPO6Y/hf/XNu9VMrUyQMrVJkPdy8CUUxvQu
 koLkfzMuMZHCx03tpw1KMPCgq/NfmHN/g1+1xPfQ94eO0cOvpbrfONbgY6UKj/04RG3XSU
 SBrIpbgZqaL2+JgAjHposXrgC7Rp+TM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-UB7F9aXdNhWsl7eGaxuNFw-1; Tue, 30 Jun 2020 05:04:01 -0400
X-MC-Unique: UB7F9aXdNhWsl7eGaxuNFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE93883DE30;
 Tue, 30 Jun 2020 09:03:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43E885C1B0;
 Tue, 30 Jun 2020 09:03:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0D1C11384D4; Tue, 30 Jun 2020 11:03:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/26] net/virtio: Fix failover_replug_primary() return
 value regression
Date: Tue, 30 Jun 2020 11:03:26 +0200
Message-Id: <20200630090351.1247703-2-armbru@redhat.com>
In-Reply-To: <20200630090351.1247703-1-armbru@redhat.com>
References: <20200630090351.1247703-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 00:34:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jens Freimann <jfreimann@redhat.com>, qemu-stable@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 150ab54aa6 "net/virtio: fix re-plugging of primary device"
fixed failover_replug_primary() to return false on failure.  Commit
5a0948d36c "net/virtio: Fix failover error handling crash bugs" broke
it again for hotplug_handler_plug() failure.  Unbreak it.

Commit 5a0948d36c4cbc1c5534afac6fee99de55245d12

Fixes: 5a0948d36c4cbc1c5534afac6fee99de55245d12
Cc: Jens Freimann <jfreimann@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Jens Freimann <jfreimann@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index aff67a92df..9bb5578e5d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3129,7 +3129,7 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
         if (err) {
             goto out;
         }
-        hotplug_handler_plug(hotplug_ctrl, n->primary_dev, errp);
+        hotplug_handler_plug(hotplug_ctrl, n->primary_dev, &err);
     }
 
 out:
-- 
2.26.2


