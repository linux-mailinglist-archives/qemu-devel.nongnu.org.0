Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F8305911
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 12:03:12 +0100 (CET)
Received: from localhost ([::1]:51654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ibP-0005lx-5s
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 06:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l4iZg-0004vn-Jr
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:01:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l4iZe-000631-FQ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611745281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKaa82Zwrw2POYqHdqajw2BFsTfH6hkhtwNTVuXlBIE=;
 b=dx/Ju4pxBIEy1FUqZ8he481qig9Om2CUluv4lvi2BNq7aUlCYhoUB8oy3+SJXSb/Qi94wz
 mTvjODasy02fJ6XLqFKSiFKYG8h9OI9PISSR2az2hArprdCAFmwjXZybBHzRFEeBRBxKh1
 Fgt4FfOHIZi/KEyRBIZtX3UV5uh4wS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-QZDWmEzYP6m4Wr-Ao7PVIA-1; Wed, 27 Jan 2021 06:01:19 -0500
X-MC-Unique: QZDWmEzYP6m4Wr-Ao7PVIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 348F0A0C04
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 11:01:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17B2D1F40F;
 Wed, 27 Jan 2021 11:01:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1D01B180039C; Wed, 27 Jan 2021 12:01:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] vnc: send extended desktop resize on update requests
Date: Wed, 27 Jan 2021 12:01:11 +0100
Message-Id: <20210127110113.2111855-3-kraxel@redhat.com>
In-Reply-To: <20210127110113.2111855-1-kraxel@redhat.com>
References: <20210127110113.2111855-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unlike other pseudo-encodings these don't break gtk-vnc
because older versions don't suport the extended desktop
resize extension in the first place.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20210125104041.495274-3-kraxel@redhat.com>
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


