Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4012CD468
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:16:12 +0100 (CET)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmap-0004zB-5X
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmTG-0003Da-MW
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmTC-0006dm-Uz
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gys/23n4pIXi5Aux/Cqj55XONYqharfxB6pEHFwvkEk=;
 b=TlQOtyl0CVNkaqQOddlfm5uy7KDU/R5EVMQCeMDWo4M21yh8iHIg067JixLEhNDaLLI2q/
 FEyCWXA9J2cOWnenDiyejBzAIb1EPTUdtZhfy1IA1OuyS1XYHWayV3VhX+QmKRD2L9ch0t
 cFQLnJ74w7oV2PnCN8/2KKTI+8BFw2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-iqv87BSdP8GeRjERdv18AA-1; Thu, 03 Dec 2020 06:08:14 -0500
X-MC-Unique: iqv87BSdP8GeRjERdv18AA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13EA2185E496
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 11:08:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E983F60BFA;
 Thu,  3 Dec 2020 11:08:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 388C59D9D; Thu,  3 Dec 2020 12:08:06 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] vnc: add pseudo encodings
Date: Thu,  3 Dec 2020 12:08:01 +0100
Message-Id: <20201203110806.13556-6-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-1-kraxel@redhat.com>
References: <20201203110806.13556-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add #defines for two new pseudo encodings:
 * cursor with alpha channel.
 * extended desktop resize.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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


