Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0729F37A309
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:10:07 +0200 (CEST)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOOz-00069n-UI
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lgOJZ-0008Kd-Fx
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:04:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lgOJW-0003VS-VW
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620723865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uJFN3Vu11ESptQjRXHBcJvEcfhlt4yXhtlN2Xlnop0g=;
 b=KKK7Pe8w3C9aslrol8FvIZCSiLPd9aaxVzXxiV+rhGr/bNgHEP9V5fmKOdxbCyG+RZx9c9
 eC6kt2TDsJgwjIZrgxZATRLzh3srQQYm4j6z87BALB6JpnAwrbVHcZE6k1jvzhwCDh+YrD
 z/22lRojGxUnvUmWQj1MGC9/wJd12rQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-7kuHRmFfMSWPbZjpJJ9YmQ-1; Tue, 11 May 2021 05:04:22 -0400
X-MC-Unique: 7kuHRmFfMSWPbZjpJJ9YmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F578801AD9;
 Tue, 11 May 2021 09:04:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3CB19C44;
 Tue, 11 May 2021 09:04:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 448DF1800876; Tue, 11 May 2021 11:04:19 +0200 (CEST)
Date: Tue, 11 May 2021 11:04:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v5 4/9] ui/vdagent: core infrastructure
Message-ID: <20210511090419.nl6akk43mt4g5rua@sirius.home.kraxel.org>
References: <20210505060901.828658-1-kraxel@redhat.com>
 <20210505060901.828658-5-kraxel@redhat.com>
 <CAJ+F1CKJyE3P7DX6tewSBHUBrqsc_h5CNZi95VpT9bGu=eVgFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKJyE3P7DX6tewSBHUBrqsc_h5CNZi95VpT9bGu=eVgFQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +/* ------------------------------------------------------------------ */
> > +/* send messages                                                      */
> > +
> > +static void vdagent_send_buf(VDAgentChardev *vd, void *ptr, uint32_t
> > msgsize)
> > +{
> > +    uint8_t *msgbuf = ptr;
> > +    uint32_t len, pos = 0;
> > +
> > +    while (pos < msgsize) {
> > +        len = qemu_chr_be_can_write(CHARDEV(vd));
> > +        if (len > msgsize - pos) {
> > +            len = msgsize - pos;
> > +        }
> > +        qemu_chr_be_write(CHARDEV(vd), msgbuf + pos, len);
> > +        pos += len;
> > +    }
> >
> 
> This looks like it could easily busy loop. Have you thought about fixing
> this?

Incremental fix [ to be squashed ]

take care,
  Gerd

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 64213aa25a06..efa98725fb22 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -3,7 +3,9 @@
 #include "include/qemu-common.h"
 #include "chardev/char.h"
 #include "hw/qdev-core.h"
+#include "qemu/buffer.h"
 #include "qemu/option.h"
+#include "qemu/units.h"
 #include "ui/clipboard.h"
 #include "ui/console.h"
 #include "ui/input.h"
@@ -16,6 +18,7 @@
 
 #define VDAGENT_MOUSE_DEFAULT true
 #define VDAGENT_CLIPBOARD_DEFAULT false
+#define VDAGENT_BUFFER_LIMIT (1 * MiB)
 
 struct VDAgentChardev {
     Chardev parent;
@@ -32,6 +35,7 @@ struct VDAgentChardev {
     uint32_t msgsize;
     uint8_t *xbuf;
     uint32_t xoff, xsize;
+    Buffer outbuf;
 
     /* mouse */
     DeviceState mouse_dev;
@@ -124,18 +128,20 @@ static const char *type_name[] = {
 /* ------------------------------------------------------------------ */
 /* send messages                                                      */
 
-static void vdagent_send_buf(VDAgentChardev *vd, void *ptr, uint32_t msgsize)
+static void vdagent_send_buf(VDAgentChardev *vd)
 {
-    uint8_t *msgbuf = ptr;
-    uint32_t len, pos = 0;
+    uint32_t len;
 
-    while (pos < msgsize) {
+    while (!buffer_empty(&vd->outbuf)) {
         len = qemu_chr_be_can_write(CHARDEV(vd));
-        if (len > msgsize - pos) {
-            len = msgsize - pos;
+        if (len == 0) {
+            return;
         }
-        qemu_chr_be_write(CHARDEV(vd), msgbuf + pos, len);
-        pos += len;
+        if (len > vd->outbuf.offset) {
+            len = vd->outbuf.offset;
+        }
+        qemu_chr_be_write(CHARDEV(vd), vd->outbuf.buffer, len);
+        buffer_advance(&vd->outbuf, len);
     }
 }
 
@@ -150,16 +156,22 @@ static void vdagent_send_msg(VDAgentChardev *vd, VDAgentMessage *msg)
 
     msg->protocol = VD_AGENT_PROTOCOL;
 
+    if (vd->outbuf.offset + msgsize > VDAGENT_BUFFER_LIMIT) {
+        return;
+    }
+
     while (msgoff < msgsize) {
         chunk.port = VDP_CLIENT_PORT;
         chunk.size = msgsize - msgoff;
         if (chunk.size > 1024) {
             chunk.size = 1024;
         }
-        vdagent_send_buf(vd, &chunk, sizeof(chunk));
-        vdagent_send_buf(vd, msgbuf + msgoff, chunk.size);
+        buffer_reserve(&vd->outbuf, sizeof(chunk) + chunk.size);
+        buffer_append(&vd->outbuf, &chunk, sizeof(chunk));
+        buffer_append(&vd->outbuf, msgbuf + msgoff, chunk.size);
         msgoff += chunk.size;
     }
+    vdagent_send_buf(vd);
 }
 
 static void vdagent_send_caps(VDAgentChardev *vd)
@@ -550,6 +562,7 @@ static void vdagent_chr_open(Chardev *chr,
                                                    &vdagent_mouse_handler);
     }
 
+    buffer_init(&vd->outbuf, "vdagent-outbuf");
     *be_opened = true;
 }
 
@@ -702,6 +715,13 @@ static int vdagent_chr_write(Chardev *chr, const uint8_t *buf, int len)
     return ret;
 }
 
+static void vdagent_chr_accept_input(Chardev *chr)
+{
+    VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(chr);
+
+    vdagent_send_buf(vd);
+}
+
 static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
 {
     VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(chr);
@@ -748,6 +768,7 @@ static void vdagent_chr_class_init(ObjectClass *oc, void *data)
     cc->open             = vdagent_chr_open;
     cc->chr_write        = vdagent_chr_write;
     cc->chr_set_fe_open  = vdagent_chr_set_fe_open;
+    cc->chr_accept_input = vdagent_chr_accept_input;
 }
 
 static const TypeInfo vdagent_chr_type_info = {
-- 
2.31.1


