Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79362D2A49
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:07:47 +0100 (CET)
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbmU-0001ts-QR
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcx-0001bE-5U
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcu-00055z-Dz
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607428671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7aTeJjzKsK69nA0G4xgsx94wshRcjiFdffLBIFSChI=;
 b=Ct2jhlcztrJzxK2e3dfjEMTFe5dU4vhhFBjo6N/GzulzGQWlvCNTmFtTw+bPln2WDLlxxa
 Qv9AUHOJLZlPah1i+uSrCIYF019IenaNHxx54WcEeHJuaK7Ar0mT74QciOJ03OcvwTTrLA
 dYeSK5zGTrjHTLMO06sb5oaA8daMYL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-s8xKgUjEPEOcAOZy7v2_fQ-1; Tue, 08 Dec 2020 06:57:49 -0500
X-MC-Unique: s8xKgUjEPEOcAOZy7v2_fQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B354110054FF
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 11:57:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 433BB5D6AB;
 Tue,  8 Dec 2020 11:57:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 50F639D9B; Tue,  8 Dec 2020 12:57:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] vnc: add pseudo encodings
Date: Tue,  8 Dec 2020 12:57:33 +0100
Message-Id: <20201208115737.18581-6-kraxel@redhat.com>
In-Reply-To: <20201208115737.18581-1-kraxel@redhat.com>
References: <20201208115737.18581-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add #defines for two new pseudo encodings:
 * cursor with alpha channel.
 * extended desktop resize.

https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#pseudo-encodings

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vnc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/vnc.h b/ui/vnc.h
index a7fd38a82075..6f5006da3593 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -411,6 +411,8 @@ enum {
 #define VNC_ENCODING_AUDIO                0XFFFFFEFD /* -259 */
 #define VNC_ENCODING_TIGHT_PNG            0xFFFFFEFC /* -260 */
 #define VNC_ENCODING_LED_STATE            0XFFFFFEFB /* -261 */
+#define VNC_ENCODING_DESKTOP_RESIZE_EXT   0XFFFFFECC /* -308 */
+#define VNC_ENCODING_ALPHA_CURSOR         0XFFFFFEC6 /* -314 */
 #define VNC_ENCODING_WMVi                 0x574D5669
 
 /*****************************************************************************
-- 
2.27.0


