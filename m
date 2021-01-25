Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784C03023C8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:42:53 +0100 (CET)
Received: from localhost ([::1]:55026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3zKe-0007V6-FD
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l3zIh-0006R5-BY
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l3zIf-0002Z9-DT
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611571248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggfnDRPx+QhAyq+WV2v+meUBIyhf1mAhF5MxBrI1Vxk=;
 b=T65NUZen9AFi/0b0N5NYCzMiETFw8q8MFlsKXjtZKM8hlqWMY2UmIdshi/ovdEtviTOR97
 Yer5FNgGGvK2S+HIBOEq+ccfFuiBsuwf1gQBqOKKgSkNO2ltABdEqRPsRh2yEI3+N43K8q
 pgmP5ZVbsBx1OxD4NqEdKgqRAPfOXrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-jkOlUsOAN9e1DLGaWAlXeA-1; Mon, 25 Jan 2021 05:40:46 -0500
X-MC-Unique: jkOlUsOAN9e1DLGaWAlXeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8D2FCC625
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 10:40:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABADF60C0F;
 Mon, 25 Jan 2021 10:40:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2FE6518003B3; Mon, 25 Jan 2021 11:40:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] vnc: send extended desktop resize on update requests
Date: Mon, 25 Jan 2021 11:40:41 +0100
Message-Id: <20210125104041.495274-3-kraxel@redhat.com>
In-Reply-To: <20210125104041.495274-1-kraxel@redhat.com>
References: <20210125104041.495274-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unlike other pseudo-encodings these don't break gtk-vnc
because older versions don't suport the extended desktop
resize extension in the first place.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/vnc.c b/ui/vnc.c
index 2622f82a5a9f..16bb3be770b2 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2046,6 +2046,9 @@ static void framebuffer_update_request(VncState *vs, int incremental,
     } else {
         vs->update = VNC_STATE_UPDATE_FORCE;
         vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
+        if (vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT)) {
+            vnc_desktop_resize_ext(vs, 0);
+        }
     }
 }
 
-- 
2.29.2


