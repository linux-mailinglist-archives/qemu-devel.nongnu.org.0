Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E93E59CA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:20:31 +0200 (CEST)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQkA-0007ss-1g
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDQid-0005py-0j
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDQib-0008SY-Fp
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628597932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8r3eYRdG4xCeVqgSnlzgLLnXlLUpiu0JT/71pkLJV9U=;
 b=MoxLCMuKnjgdsAZB6QYGgclbSEbZoXkyeVjAsuzWXj24nWz1gNRR+rHo8J/De0OQvycg8r
 0fDzX7CMUrooJ6Y6D7X9MeAafx1bty+cjU40PmDNXnY2Lmrlz35hFJ+PezEsgXNeHhIfim
 S4y2jxA04Vq+cqIbNxfmENqBvHcnec8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-97QHzc0lM5u9C5kGKYrzjA-1; Tue, 10 Aug 2021 08:18:50 -0400
X-MC-Unique: 97QHzc0lM5u9C5kGKYrzjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CD59107B7C9;
 Tue, 10 Aug 2021 12:18:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9725227CB4;
 Tue, 10 Aug 2021 12:18:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1110A180090A; Tue, 10 Aug 2021 14:18:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] ui/gtk: retry sending VTE console input
Date: Tue, 10 Aug 2021 14:18:37 +0200
Message-Id: <20210810121840.2525726-2-kraxel@redhat.com>
In-Reply-To: <20210810121840.2525726-1-kraxel@redhat.com>
References: <20210810121840.2525726-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Commit 584af1f1d9 ("ui/gtk: add a keyboard fifo to the VTE
consoles") changed the VTE chardev backend code to rely on the
chr_accept_input() callback function. The code expects a
chr_accept_input() call whenever qemu_chr_be_can_write() bytes
were written. It turns out this is wrong. Some chardev
frontends only call this callback after can_write was 0.

Change the code to send data until the keyboard fifo is empty
or qemu_chr_be_can_write() returns 0.

Fixes: 584af1f1d9 ("ui/gtk: add a keyboard fifo to the VTE consoles")
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210810063257.17411-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 974e4dfc0b5b..cfb0728d1fb4 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1646,16 +1646,14 @@ static void gd_vc_send_chars(VirtualConsole *vc)
 
     len = qemu_chr_be_can_write(vc->vte.chr);
     avail = fifo8_num_used(&vc->vte.out_fifo);
-    if (len > avail) {
-        len = avail;
-    }
-    while (len > 0) {
+    while (len > 0 && avail > 0) {
         const uint8_t *buf;
         uint32_t size;
 
-        buf = fifo8_pop_buf(&vc->vte.out_fifo, len, &size);
+        buf = fifo8_pop_buf(&vc->vte.out_fifo, MIN(len, avail), &size);
         qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
-        len -= size;
+        len = qemu_chr_be_can_write(vc->vte.chr);
+        avail -= size;
     }
 }
 
-- 
2.31.1


