Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427338C744
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:57:41 +0200 (CEST)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4ii-0006Xe-E7
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk4eK-0005vM-SZ
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk4eI-0007tb-BH
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621601585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRU+uGCTs+4KNsAW5Vo/HZG4V1u3wULdCWXqgWvdMkw=;
 b=YGFtSNTQ9PHeP9v7+/qJeulbN0Pwj8VkzXk5pAxyzIlIoNwV6WGLSpZcZCGewKkIFIpIjO
 gMNZnwxIRwKa9H1Gf/4AfPEm2R6duDPVbnJT/xu4UBMjEPXfj9ic0tq3sqMXrT/ixJ3JZy
 6tpF9A/GFQkt9xkAGVOX0io7yVe5jTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-bYxxyKTMPBmH-QsgIaVCKQ-1; Fri, 21 May 2021 08:53:02 -0400
X-MC-Unique: bYxxyKTMPBmH-QsgIaVCKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D42C71926DA2;
 Fri, 21 May 2021 12:53:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A13C759472;
 Fri, 21 May 2021 12:52:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 51E59180079A; Fri, 21 May 2021 14:51:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] ui/spice-display: check NULL pointer in
 interface_release_resource()
Date: Fri, 21 May 2021 14:51:10 +0200
Message-Id: <20210521125119.3173309-3-kraxel@redhat.com>
In-Reply-To: <20210521125119.3173309-1-kraxel@redhat.com>
References: <20210521125119.3173309-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Yu Lu <ini.universe@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Matteo Cascella <mcascell@redhat.com>

Check rext.info to avoid potential NULL pointer dereference. A similar check
exists in interface_release_resource() in hw/display/qxl.c.

Reported-by: Yu Lu <ini.universe@gmail.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
Message-Id: <20210520105833.183160-1-mcascell@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/spice-display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index d22781a23d06..f59c69882d91 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -561,6 +561,10 @@ static void interface_release_resource(QXLInstance *sin,
     SimpleSpiceCursor *cursor;
     QXLCommandExt *ext;
 
+    if (!rext.info) {
+        return;
+    }
+
     ext = (void *)(intptr_t)(rext.info->id);
     switch (ext->cmd.type) {
     case QXL_CMD_DRAW:
-- 
2.31.1


