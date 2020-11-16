Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC6E2B4255
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:15:21 +0100 (CET)
Received: from localhost ([::1]:37540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecTg-0007A3-Sk
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPO-0002GX-8E
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPM-0002Bb-Dw
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605525051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNbjmQnzAheJCh3tC87MP6ZnzpiktU0EAoN2o++iZzQ=;
 b=Y/XX56G//u+Acq6k1y3dJik/GLyO43wx6IPV4MmHVRnZH+P22YtUImPNycK09QSJTYy1dl
 nTG2Q6mbSajjXD5457SJON52C6dY2mRRLs+k1F0UkOP+075PgRz0PGvxyhrhk13lA2I6Ae
 VctSLgCOvjahP1smOuzrGEkP8uxFDIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-hFJwj30pN7iajXN2Ttudvg-1; Mon, 16 Nov 2020 06:10:48 -0500
X-MC-Unique: hFJwj30pN7iajXN2Ttudvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B09A1087D60
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 11:10:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 775EA1001E73;
 Mon, 16 Nov 2020 11:10:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 61BB29D9C; Mon, 16 Nov 2020 12:10:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] xhci: move sanity checks
Date: Mon, 16 Nov 2020 12:10:36 +0100
Message-Id: <20201116111036.12820-7-kraxel@redhat.com>
In-Reply-To: <20201116111036.12820-1-kraxel@redhat.com>
References: <20201116111036.12820-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The v variable goes negative for reg < 0x20.  Reorder the code
to first sanity check then calculate v and assign intr to make
sanity checkers happy.

Buglink: https://bugs.launchpad.net/qemu/+bug/1902112
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20201105134112.25119-7-kraxel@redhat.com
---
 hw/usb/hcd-xhci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index d00bb0141dac..6dfb17cbe915 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3010,14 +3010,17 @@ static void xhci_runtime_write(void *ptr, hwaddr reg,
                                uint64_t val, unsigned size)
 {
     XHCIState *xhci = ptr;
-    int v = (reg - 0x20) / 0x20;
-    XHCIInterrupter *intr = &xhci->intr[v];
+    XHCIInterrupter *intr;
+    int v;
+
     trace_usb_xhci_runtime_write(reg, val);
 
     if (reg < 0x20) {
         trace_usb_xhci_unimplemented("runtime write", reg);
         return;
     }
+    v = (reg - 0x20) / 0x20;
+    intr = &xhci->intr[v];
 
     switch (reg & 0x1f) {
     case 0x00: /* IMAN */
-- 
2.27.0


