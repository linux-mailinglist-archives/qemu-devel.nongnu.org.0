Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8AE211279
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 20:20:12 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqhL8-00032s-Gb
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 14:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqhJF-000249-AI
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 14:18:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27600
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqhJC-0002sR-O4
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 14:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593627489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=NsTlQXv/1lVA4yowhV6xXFM+EjkuGwf9ZLFWHvHOph0=;
 b=RyVoNVEIZjaIlhri/uNT2UlSDKowFh4i48j+adHISxQL/PYifBEh2Al43k4A62JQu61soA
 dApHmPdNb3pxjWZylzq26bCENzrHeEu8HhWcf1cHGutS3wEUpMPt/+Y5/wem8cIZGnZZ5/
 Ljae5TxiPc1rQ2gsqt/DzDOGF1NyEDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-4xZ0gxsMPgaROOg0nJw01Q-1; Wed, 01 Jul 2020 14:18:06 -0400
X-MC-Unique: 4xZ0gxsMPgaROOg0nJw01Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2491A0BDD
 for <qemu-devel@nongnu.org>; Wed,  1 Jul 2020 18:18:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA21771662;
 Wed,  1 Jul 2020 18:18:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A678D16E16; Wed,  1 Jul 2020 20:18:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui: fix vc_chr_write call in text_console_do_init
Date: Wed,  1 Jul 2020 20:18:01 +0200
Message-Id: <20200701181801.27935-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 00:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

In case the string doesn't fit into the buffer snprintf returns the size
it would need, so len can be larger than the buffer.  Fix this by simply
using g_strdup_printf() instead of a static buffer.

Reported-by: Wenxiang Qian <leonwxqian@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 865fa3263597..5ba0f21831cb 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2184,12 +2184,12 @@ static void text_console_do_init(Chardev *chr, DisplayState *ds)
     text_console_resize(s);
 
     if (chr->label) {
-        char msg[128];
-        int len;
+        char *msg;
 
         s->t_attrib.bgcol = QEMU_COLOR_BLUE;
-        len = snprintf(msg, sizeof(msg), "%s console\r\n", chr->label);
-        vc_chr_write(chr, (uint8_t *)msg, len);
+        msg = g_strdup_printf("%s console\r\n", chr->label);
+        vc_chr_write(chr, (uint8_t *)msg, strlen(msg));
+        g_free(msg);
         s->t_attrib = s->t_attrib_default;
     }
 
-- 
2.18.4


