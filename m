Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A79456D3B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:25:43 +0100 (CET)
Received: from localhost ([::1]:36950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo15S-0008Ia-GR
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:25:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mo10t-0003bB-0C
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:21:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mo10r-0006l2-9p
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637317253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTEjc5D10czz/U/02Godm9bNDbiqSXzKead8Qmj/uRM=;
 b=I0TZPIkqdAfh6IiBuHogLqnio3RjwNkkTRjTfkSovjXEy15/5h9gprNMNm0aIhogR71WET
 Hq5gQGz1pYTkzoPkOsUZVUpWHa8DaYv0ECknwNohMz+30zR3sJHPjrmfcF9Jc+xuuW33UL
 Y5VxqLozsJKOESco1MsGPGQzanq+dBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-6gnSXvuhOCefBw4j0JuOYg-1; Fri, 19 Nov 2021 05:20:49 -0500
X-MC-Unique: 6gnSXvuhOCefBw4j0JuOYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC6479F92A;
 Fri, 19 Nov 2021 10:20:48 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F2165C1A1;
 Fri, 19 Nov 2021 10:20:47 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] vdpa: Add dummy receive callbacks
Date: Fri, 19 Nov 2021 11:20:32 +0100
Message-Id: <20211119102033.36149-3-eperezma@redhat.com>
In-Reply-To: <20211119102033.36149-1-eperezma@redhat.com>
References: <20211119102033.36149-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
cases. These assumes a tap device can handle the packets.

If a vdpa device fail to start, it can trigger a sigsegv because of
that. Add dummy receivers that return no progress so it can keep
running.

Fixes: 1e0a84ea49 ("vhost-vdpa: introduce vhost-vdpa net client")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 2e3c22a8c7..4c75b78304 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -170,9 +170,25 @@ static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
     return true;
 }
 
+/** Dummy receive in case qemu falls back to userland tap networking */
+static ssize_t vhost_vdpa_receive_iov(NetClientState *nc,
+                                      const struct iovec *iov, int iovcnt)
+{
+    return 0;
+}
+
+/** Dummy receive in case qemu falls back to userland tap networking */
+static ssize_t vhost_vdpa_receive_raw(NetClientState *nc, const uint8_t *buf,
+                                      size_t size)
+{
+    return 0;
+}
+
 static NetClientInfo net_vhost_vdpa_info = {
         .type = NET_CLIENT_DRIVER_VHOST_VDPA,
         .size = sizeof(VhostVDPAState),
+        .receive_iov = vhost_vdpa_receive_iov,
+        .receive_raw = vhost_vdpa_receive_raw,
         .cleanup = vhost_vdpa_cleanup,
         .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
         .has_ufo = vhost_vdpa_has_ufo,
-- 
2.27.0


