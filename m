Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063E4CD712
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:03:42 +0100 (CET)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9T3-0002u6-OE
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:03:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8rB-0005DE-D9
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8r7-0002D7-7B
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1jIMKVjJSErsCeq5u/YaMwoi1VPhyRsihv2AV/JvcoI=;
 b=YZE++aTQaRnciBBaw8cW2/lbbfIoG7MqN28Xz57VJ2blGpCpJYgN5hSQ4jyTRMCwn9JYAY
 BH5mfyEdzqTgFvM8Aw5G/mO3eXb7hTLyhyarUgcRYpnWHnuJ9Lw8ENIe3jNC0QBzKbUtX9
 +rl6V41LGLCNaybUqfDfqfBvwhCmq4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-E_cQH8c9PECnC5kW_TfQ4w-1; Fri, 04 Mar 2022 09:24:25 -0500
X-MC-Unique: E_cQH8c9PECnC5kW_TfQ4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D547E1854E26;
 Fri,  4 Mar 2022 14:24:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FF9C866EE;
 Fri,  4 Mar 2022 14:24:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 164BF18009B5; Fri,  4 Mar 2022 15:21:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/35] hw/usb/redirect.c: Stop using qemu_oom_check()
Date: Fri,  4 Mar 2022 15:21:11 +0100
Message-Id: <20220304142123.956171-24-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

qemu_oom_check() is a function which essentially says "if you pass me
a NULL pointer then print a message then abort()".  On POSIX systems
the message includes strerror(errno); on Windows it includes the
GetLastError() error value printed as an integer.

Other than in the implementation of qemu_memalign(), we use this
function only in hw/usb/redirect.c, for three checks:

 * on a call to usbredirparser_create()
 * on a call to usberedirparser_serialize()
 * on a call to malloc()

The usbredir library API functions make no guarantees that they will
set errno on errors, let alone that they might set the
Windows-specific GetLastError string.  malloc() is documented as
setting errno, not GetLastError -- and in any case the only thing it
might set errno to is ENOMEM.  So qemu_oom_check() isn't the right
thing for any of these.  Replace them with straightforward
error-checking code.  This will allow us to get rid of
qemu_oom_check().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220226180723.1706285-2-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 5f0ef9cb3b0f..8692ea256109 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1239,7 +1239,11 @@ static void usbredir_create_parser(USBRedirDevice *dev)
 
     DPRINTF("creating usbredirparser\n");
 
-    dev->parser = qemu_oom_check(usbredirparser_create());
+    dev->parser = usbredirparser_create();
+    if (!dev->parser) {
+        error_report("usbredirparser_create() failed");
+        exit(1);
+    }
     dev->parser->priv = dev;
     dev->parser->log_func = usbredir_log;
     dev->parser->read_func = usbredir_read;
@@ -2239,7 +2243,10 @@ static int usbredir_put_parser(QEMUFile *f, void *priv, size_t unused,
     }
 
     usbredirparser_serialize(dev->parser, &data, &len);
-    qemu_oom_check(data);
+    if (!data) {
+        error_report("usbredirparser_serialize failed");
+        exit(1);
+    }
 
     qemu_put_be32(f, len);
     qemu_put_buffer(f, data, len);
@@ -2330,7 +2337,11 @@ static int usbredir_get_bufpq(QEMUFile *f, void *priv, size_t unused,
         bufp->len = qemu_get_be32(f);
         bufp->status = qemu_get_be32(f);
         bufp->offset = 0;
-        bufp->data = qemu_oom_check(malloc(bufp->len)); /* regular malloc! */
+        bufp->data = malloc(bufp->len); /* regular malloc! */
+        if (!bufp->data) {
+            error_report("usbredir_get_bufpq: out of memory");
+            exit(1);
+        }
         bufp->free_on_destroy = bufp->data;
         qemu_get_buffer(f, bufp->data, bufp->len);
         QTAILQ_INSERT_TAIL(&endp->bufpq, bufp, next);
-- 
2.35.1


