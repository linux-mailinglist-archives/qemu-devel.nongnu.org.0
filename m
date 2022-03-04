Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A928B4CD6AC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:44:43 +0100 (CET)
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Ag-0004Rg-OM
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:44:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8od-0007oc-RE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:21:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8oa-00007v-42
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqNuyc6/1XT7rQYIy8gcLwnJ3QsYqn/+JsrC/zhuMF0=;
 b=I5dp3/M1g0zFMi92MOLAaoXVY2FKhRpvuK3qCjafISwzOW7voH5IddDQLLche4i3OAu/nv
 YYUGMYShj3s/lCUpzkhb0TF+YRjWkXQQ5TkJzSLvZXj28BD2eXgS/J2SaYGF3lo14Ig5OS
 iBbAQcbrJpXPSgOqNGXLeAd4JDpTTMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-Mm_ldKa_PPO28EQhXnBbdw-1; Fri, 04 Mar 2022 09:21:48 -0500
X-MC-Unique: Mm_ldKa_PPO28EQhXnBbdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AE99FC81;
 Fri,  4 Mar 2022 14:21:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61EB32ED84;
 Fri,  4 Mar 2022 14:21:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D584C1800386; Fri,  4 Mar 2022 15:21:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/35] hw/usb: pacify xhciwmi.exe warning
Date: Fri,  4 Mar 2022 15:20:49 +0100
Message-Id: <20220304142123.956171-2-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Yan Vugenfirer <yvugenfi@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Polozov <pavel.polozov@virtuozzo.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Denis V. Lunev" <den@openvz.org>

xhciwmi.exe is used inside Windows 2022 SVVP tests. This tool called as
'xhciwmi.exe --verify' reports that 'The firmware loaded on this
controller has known bugs and/or compatibility issues'. This is just
a warning but there is no particular sense to ignore it.

This patch just pacifies the tool.

There is a big question whether this change should be put using
machine type mechanics, but at my opinion this would be an overkill.

Signed-off-by: Denis V. Lunev <den@openvz.org>
Tested-by: Pavel Polozov <pavel.polozov@virtuozzo.com>
CC: Yan Vugenfirer <yvugenfi@redhat.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Yan Vugenfirer <yvugenfi@redhat.com>
Message-Id: <20211223095443.130276-1-den@openvz.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 14bdb8967686..0cd0a5e54027 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2523,7 +2523,7 @@ static void xhci_process_commands(XHCIState *xhci)
         case CR_VENDOR_NEC_FIRMWARE_REVISION:
             if (xhci->nec_quirks) {
                 event.type = 48; /* NEC reply */
-                event.length = 0x3025;
+                event.length = 0x3034;
             } else {
                 event.ccode = CC_TRB_ERROR;
             }
-- 
2.35.1


