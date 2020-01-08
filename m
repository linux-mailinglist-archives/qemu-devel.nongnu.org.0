Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A2134251
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 13:54:17 +0100 (CET)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipAqm-00089Y-40
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 07:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60699)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWl-0004Mu-En
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWk-0004aU-CR
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33839)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ipAWk-0004a9-6a
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t2so3239710wrr.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 04:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8UTL2P0i77cpbG9WgGJIiLpRG//RBVj09gdW5qz0I7M=;
 b=mmGI9Fcu75W2Jk1JspvBkG3FOkI+So/7SWMV/JaSsK5F6nRz0qB5usNydujaOO6D+R
 o+tBHpoVvFdkx2yJwITG8KaphmJUDpcpwqbKzTqvGG/VQB/QKbD7CEsIO3eXL+qdsoWk
 5KMI/AfnEm+2w0lx1n42q+EwtMwG5kkoQ4wft8fYHKXOI4x0NT+Mj9+KUCuXsW1JN91l
 Aw4Gbd3BYb39u98Q+KUDr2piynow0mMlvwstTHPKrtAVRUVG6jDuFPACTuvqsLckDh6T
 3AXLZir49gkHY1swtYZqXOARTNwxH4uK9hJ6FvXbjkpPy2dmVweMgh2y7ZVgFcyBmX/4
 Z0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8UTL2P0i77cpbG9WgGJIiLpRG//RBVj09gdW5qz0I7M=;
 b=fZv4tTVDYgnpSd4jaXmWozXRxQt16dlptKxyEeM+PMSCWxaayKBcuCl54qORPdYre2
 klpy3vj4JHPbXOj8ro+3QMem8feexu9M1DAt6ZblnmVbhgnPZFoG5EMtrK3pbIGQ6J7R
 Fsds2RrXH91eqPHjF0JS+W3LtgtdVa5KV8HF+P+nMzLfOIwv9Jz9Jl0lL9UXnwlCr75+
 Xm1s40B3jOYsFHeKqh+o7pEDmwtNDrniH4FAKFWK7CLQ+XAA1TO+htu23tQAG+zFOPwx
 /ebPUnV6TJHvB5AabgRpl89OJWu52qhzPltwwyvbEQmWPqclW1ArN64kQwYF9EGEFEc9
 8rNw==
X-Gm-Message-State: APjAAAU6uK5Va69WItrqPdtaDCmxY/2Pa8UoKE3RQE3812Rt/6nemIPy
 gxOcDg0Ag8Tm34lwoUkoT3uvWU6E
X-Google-Smtp-Source: APXvYqwGEF5qhrQE+5Jqv/0caK4snd5KntTxb+eio3plZGR6zDxoWQYFa6vdapx+0zlU/jS7XU5KRQ==
X-Received: by 2002:a05:6000:1288:: with SMTP id
 f8mr4354857wrx.66.1578486812959; 
 Wed, 08 Jan 2020 04:33:32 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id o4sm4037750wrw.97.2020.01.08.04.33.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 04:33:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/38] virtio-console: Explicit we ignore some QEMUChrEvent in
 IOEventHandler
Date: Wed,  8 Jan 2020 13:32:50 +0100
Message-Id: <1578486775-52247-34-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
References: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit all the events ignored by this frontend, to silent the
following GCC warning:

    CC      hw/char/virtio-console.o
  hw/char/virtio-console.c: In function ‘chr_event’:
  hw/char/virtio-console.c:154:5: error: enumeration value ‘CHR_EVENT_BREAK’ not handled in switch [-Werror=switch]
    154 |     switch (event) {
        |     ^~~~~~
  hw/char/virtio-console.c:154:5: error: enumeration value ‘CHR_EVENT_MUX_IN’ not handled in switch [-Werror=switch]
  hw/char/virtio-console.c:154:5: error: enumeration value ‘CHR_EVENT_MUX_OUT’ not handled in switch [-Werror=switch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20191218172009.8868-11-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/char/virtio-console.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index c13649f..cbb304d 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -162,6 +162,11 @@ static void chr_event(void *opaque, int event)
         }
         virtio_serial_close(port);
         break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
     }
 }
 
-- 
1.8.3.1



