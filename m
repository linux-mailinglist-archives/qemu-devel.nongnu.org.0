Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286E448E50F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:53:03 +0100 (CET)
Received: from localhost ([::1]:38790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HOQ-0002nA-57
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUz-0007jS-O7
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUv-0007Xr-3V
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzx1mCgAyFxkl2UI7PGWEI1Yz1pJXa3jd2QmGoubwZ4=;
 b=WWkrV9b1f//tdeLCTwcfCMqNcpqfQ+zMbPXT6x8VoHThoktMsEF80tODe3PZfeimtp3W+l
 P7cUhDiBfrpMOXDeIM1+DHDqV1lzGYkHcdLVlnfBl2mE1lvAOyFesbM8Ys0KTwzCHbmtyE
 k1El/qn5Jqz7AboxStgyK1N1pEPtIoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-InNVWIaOMl2-UR1hIAg5zw-1; Fri, 14 Jan 2022 01:55:37 -0500
X-MC-Unique: InNVWIaOMl2-UR1hIAg5zw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E02956415E;
 Fri, 14 Jan 2022 06:55:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DFA74EC89;
 Fri, 14 Jan 2022 06:55:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 95AC11800855; Fri, 14 Jan 2022 07:53:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] ui/input-legacy: pass horizontal scroll information
Date: Fri, 14 Jan 2022 07:53:26 +0100
Message-Id: <20220114065326.782420-21-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Dmitry Petrov <dpetroff@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Petrov <dpetroff@gmail.com>

This code seems to be used by vmport hack, passing these values allows
to implement horizontal scroll support even when using vmport.
In case it's not supported horizontal scroll will act as a vertical one.

Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
Message-Id: <20220108153947.171861-6-dpetroff@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/input-legacy.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index 9fc78a639bd4..46ea74e44d6d 100644
--- a/ui/input-legacy.c
+++ b/ui/input-legacy.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qapi/qapi-commands-ui.h"
 #include "ui/console.h"
 #include "keymaps.h"
@@ -179,6 +180,20 @@ static void legacy_mouse_event(DeviceState *dev, QemuConsole *src,
                                     1,
                                     s->buttons);
         }
+        if (btn->down && btn->button == INPUT_BUTTON_WHEEL_RIGHT) {
+            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
+                                    s->axis[INPUT_AXIS_X],
+                                    s->axis[INPUT_AXIS_Y],
+                                    -2,
+                                    s->buttons);
+        }
+        if (btn->down && btn->button == INPUT_BUTTON_WHEEL_LEFT) {
+            s->qemu_put_mouse_event(s->qemu_put_mouse_event_opaque,
+                                    s->axis[INPUT_AXIS_X],
+                                    s->axis[INPUT_AXIS_Y],
+                                    2,
+                                    s->buttons);
+        }
         break;
     case INPUT_EVENT_KIND_ABS:
         move = evt->u.abs.data;
-- 
2.34.1


