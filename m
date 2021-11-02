Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0764432C6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:33:08 +0100 (CET)
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwii-0006f9-2Q
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwci-0006Or-AJ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcR-0002am-SV
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ut8NfEL2xC3MAi3C01zupa2EuTIP39swd/L1JHDpcAo=;
 b=Umv6RqLr5Rvo/M+EsLHf1CwL4BSqfS8LDinrBvKj8SNFUafynN6bmgDT0FyWfGm/K90qR9
 fZlUhEcIjFxUtUmhHaUyKkcvQdIXZFWcGWcxzOCRCwN1pPikMSdKHLW6TRjGFlZ9ik1Up3
 Nd/WrYTV1CYFHfGFF4TGwDpm0eqcZOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-G6mR9I_TNQumfH5XZ7eofg-1; Tue, 02 Nov 2021 12:26:38 -0400
X-MC-Unique: G6mR9I_TNQumfH5XZ7eofg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 071581B2C980;
 Tue,  2 Nov 2021 16:26:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7528310016F2;
 Tue,  2 Nov 2021 16:26:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F23101801B2D; Tue,  2 Nov 2021 17:26:19 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] ui/console: remove chardev frontend connected test
Date: Tue,  2 Nov 2021 17:26:17 +0100
Message-Id: <20211102162619.2760593-9-kraxel@redhat.com>
In-Reply-To: <20211102162619.2760593-1-kraxel@redhat.com>
References: <20211102162619.2760593-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

The test if the chardev frontend is connected in
kbd_put_keysym_console() is redundant, because the call
to qemu_chr_be_can_write() in kbd_send_chars() tests
the connected condition again.

Remove the redundant test whether the chardev frontend
is connected.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20210916192239.18742-3-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index dda1e6861d6a..29a3e3f0f51c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -28,10 +28,11 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qemu/fifo8.h"
+#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/timer.h"
-#include "chardev/char-fe.h"
+#include "chardev/char.h"
 #include "trace.h"
 #include "exec/memory.h"
 #include "io/channel-file.h"
@@ -1126,7 +1127,6 @@ static void kbd_send_chars(QemuConsole *s)
 void kbd_put_keysym_console(QemuConsole *s, int keysym)
 {
     uint8_t buf[16], *q;
-    CharBackend *be;
     int c;
     uint32_t num_free;
 
@@ -1170,12 +1170,9 @@ void kbd_put_keysym_console(QemuConsole *s, int keysym)
         if (s->echo) {
             vc_chr_write(s->chr, buf, q - buf);
         }
-        be = s->chr->be;
-        if (be && be->chr_read) {
-            num_free = fifo8_num_free(&s->out_fifo);
-            fifo8_push_all(&s->out_fifo, buf, MIN(num_free, q - buf));
-            kbd_send_chars(s);
-        }
+        num_free = fifo8_num_free(&s->out_fifo);
+        fifo8_push_all(&s->out_fifo, buf, MIN(num_free, q - buf));
+        kbd_send_chars(s);
         break;
     }
 }
-- 
2.31.1


