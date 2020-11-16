Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150182B424C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:12:51 +0100 (CET)
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecRG-0003mO-2V
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPI-000227-Bz
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPG-00029A-31
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605525045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wbeC9Kz0dPymbWbmPj+jAGwKtxzC8BoamxYS8e1wy4=;
 b=hK3iiwWuR0X6gaokzPmpYXBx4PiSARH+1r+IcXgalN4d/DrDVADO/HGGoYRtF8bSXI4VDk
 GAhCdP8h4HXgK+RvhuzJtoWeZZrKQ3Z0OK4GAynN8JQfx1qiXbEoyONMaXTphXajEzhija
 GCocFuhaBsW/ZbIuFexrPyqZmRbr158=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-PESk_AvjPamw0t_rsL7zGA-1; Mon, 16 Nov 2020 06:10:41 -0500
X-MC-Unique: PESk_AvjPamw0t_rsL7zGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BE22100855A
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 11:10:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45EC85D9CC;
 Mon, 16 Nov 2020 11:10:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4FE6A9D99; Mon, 16 Nov 2020 12:10:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] usb-storage: fill csw on cancel
Date: Mon, 16 Nov 2020 12:10:34 +0100
Message-Id: <20201116111036.12820-5-kraxel@redhat.com>
In-Reply-To: <20201116111036.12820-1-kraxel@redhat.com>
References: <20201116111036.12820-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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

When scsi requests are canceled fill the csw
(command status word) accordingly.

Buglink: https://bugs.launchpad.net/qemu/+bug/1901981
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20201105134112.25119-5-kraxel@redhat.com
---
 hw/usb/dev-storage.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 360e8ca8f2bd..f0f005869d25 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -327,6 +327,10 @@ static void usb_msd_request_cancelled(SCSIRequest *req)
     trace_usb_msd_cmd_cancel(req->tag);
 
     if (req == s->req) {
+        s->csw.sig = cpu_to_le32(0x53425355);
+        s->csw.tag = cpu_to_le32(req->tag);
+        s->csw.status = 1; /* error */
+
         scsi_req_unref(s->req);
         s->req = NULL;
         s->scsi_len = 0;
-- 
2.27.0


