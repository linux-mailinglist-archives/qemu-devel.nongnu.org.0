Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553F32D3CF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:03:10 +0100 (CET)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHndF-0001dw-3S
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSt-0007Sy-W0
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSr-00056A-QF
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7NMTV6bmR5ZGs7rrPeQEIjSZR6WZbW34R3Q7b0tqJw=;
 b=gIh2waUdWNsLLZRhUGX4WBzibZllYbUnYSiX7ZiZ2mhJ7xTPnH2FD2RYjO4gBI5/F4Q0rP
 dPrnOj/qeLEZ5c/6RbZsXqIJIMQdj/9+iTbfaG+MmXixLMQGV1iVKzTppTQ6B5gILv09Ss
 Rgp8kZ7TcdXFZ7/ShfU83qWoNDvM0s8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-yBw4t-P-PP2RUTOMQPoH0A-1; Thu, 04 Mar 2021 07:52:19 -0500
X-MC-Unique: yBw4t-P-PP2RUTOMQPoH0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB9E0804168;
 Thu,  4 Mar 2021 12:52:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78E64608BA;
 Thu,  4 Mar 2021 12:52:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3A9FA18000B3; Thu,  4 Mar 2021 09:37:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] ui/gtk: vte: fix sending multiple characeters
Date: Thu,  4 Mar 2021 09:36:59 +0100
Message-Id: <20210304083705.1046645-3-kraxel@redhat.com>
In-Reply-To: <20210304083705.1046645-1-kraxel@redhat.com>
References: <20210304083705.1046645-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Zack Marvel <zpmarvel@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zack Marvel <zpmarvel@gmail.com>

When using the GTK UI with libvte, multicharacter keystrokes are not
sent correctly (such as arrow keys). gd_vc_in should check the
CharBackend's can_receive instead of assuming multiple characters can be
received. This is not an issue for e.g. the SDL UI because
qemu_chr_be_write is called with len=1 for each character (SDL sends
more than once keystroke).

Modify gd_vc_in to call qemu_chr_be_write multiple times if necessary.

Buglink: https://bugs.launchpad.net/qemu/+bug/1407808

Signed-off-by: Zack Marvel <zpmarvel@gmail.com>
Message-Id: <20210221170613.13183-2-zpmarvel@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 79dc2401203a..bad716f136ea 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1786,7 +1786,16 @@ static gboolean gd_vc_in(VteTerminal *terminal, gchar *text, guint size,
         }
     }
 
-    qemu_chr_be_write(vc->vte.chr, (uint8_t  *)text, (unsigned int)size);
+    int remaining = size;
+    uint8_t* p = (uint8_t *)text;
+    while (remaining > 0) {
+        int can_write = qemu_chr_be_can_write(vc->vte.chr);
+        int written = MIN(remaining, can_write);
+        qemu_chr_be_write(vc->vte.chr, p, written);
+
+        remaining -= written;
+        p += written;
+    }
     return TRUE;
 }
 
-- 
2.29.2


