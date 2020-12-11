Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E799D2D72B8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:19:24 +0100 (CET)
Received: from localhost ([::1]:36224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kneaB-0006A2-Tp
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneUk-0007Ja-Od
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kneU5-0004je-VV
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607677982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WX/uh++fkK5GD+shjr3nqTBp8r8AkWYmVPiIpRu9py4=;
 b=caJKZM3MQLKM/e5khrbltgPrGMsUZzlEc6dgr18aukBypB7z1WGhZMeQpACf4orVj6S0Uv
 a2JEBeGeyHZSHEFzbKmANPaJ3zyPmW48SZposIRLtRoeh8+VS9KSce16pKmCsBSho6Mr8I
 08EWOGvjeHE8xSK595YylmrahXjhtiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-OsICoaWuNdCfjjnD6wqlkQ-1; Fri, 11 Dec 2020 04:13:00 -0500
X-MC-Unique: OsICoaWuNdCfjjnD6wqlkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4128959
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:12:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B472C5F724;
 Fri, 11 Dec 2020 09:12:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 054E79D9B; Fri, 11 Dec 2020 10:12:51 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] vnc: add pseudo encodings
Date: Fri, 11 Dec 2020 10:12:47 +0100
Message-Id: <20201211091250.1415-6-kraxel@redhat.com>
In-Reply-To: <20201211091250.1415-1-kraxel@redhat.com>
References: <20201211091250.1415-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add #defines for two new pseudo encodings:
 * cursor with alpha channel.
 * extended desktop resize.

https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#pseudo-encodings

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20201208115737.18581-6-kraxel@redhat.com
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


