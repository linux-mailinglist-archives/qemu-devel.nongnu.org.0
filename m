Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464E546404
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 12:42:11 +0200 (CEST)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzc5i-0003Qt-K0
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 06:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzapn-0008NQ-Js
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzapl-0001kf-3F
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654852895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obSiKgR2g439N1NCymTkGuD5ZtC+AWQDUPf1CsA55V4=;
 b=hA3kdRG41dq3VSyEmww4oZM9MolSstjLvykIbyMqi6+Ujy6NhzX/7dP+nxhsuifggNflRH
 msrbMqE2eZRg8nCvXTMX4x2gm+BIxHt3IawBwFIEHR+DVHYwk13HQorYY3tVbSeVPlvpmb
 OJy4+7iuOTkzY9xQR3P89MeGCpWXG90=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-IJrpUXNAP_GdSGR8Vldk4g-1; Fri, 10 Jun 2022 05:21:32 -0400
X-MC-Unique: IJrpUXNAP_GdSGR8Vldk4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFB9A811E75;
 Fri, 10 Jun 2022 09:21:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D1FC1121314;
 Fri, 10 Jun 2022 09:21:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E3E72180063C; Fri, 10 Jun 2022 11:20:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Arnout Engelen <arnout@bzzt.net>
Subject: [PULL 11/17] hw/usb/hcd-ehci: fix writeback order
Date: Fri, 10 Jun 2022 11:20:37 +0200
Message-Id: <20220610092043.1874654-12-kraxel@redhat.com>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Arnout Engelen <arnout@bzzt.net>

The 'active' bit passes control over a qTD between the guest and the
controller: set to 1 by guest to enable execution by the controller,
and the controller sets it to '0' to hand back control to the guest.

ehci_state_writeback write two dwords to main memory using DMA:
the third dword of the qTD (containing dt, total bytes to transfer,
cpage, cerr and status) and the fourth dword of the qTD (containing
the offset).

This commit makes sure the fourth dword is written before the third,
avoiding a race condition where a new offset written into the qTD
by the guest after it observed the status going to go to '0' gets
overwritten by a 'late' DMA writeback of the previous offset.

This race condition could lead to 'cpage out of range (5)' errors,
and reproduced by:

./qemu-system-x86_64 -enable-kvm -bios $SEABIOS/bios.bin -m 4096 -device usb-ehci -blockdev driver=file,read-only=on,filename=/home/aengelen/Downloads/openSUSE-Tumbleweed-DVD-i586-Snapshot20220428-Media.iso,node-name=iso -device usb-storage,drive=iso,bootindex=0 -chardev pipe,id=shell,path=/tmp/pipe -device virtio-serial -device virtconsole,chardev=shell -device virtio-rng-pci -serial mon:stdio -nographic

(press a key, select 'Installation' (2), and accept the default
values. On my machine the 'cpage out of range' is reproduced while
loading the Linux Kernel about once per 7 attempts. With the fix in
this commit it no longer fails)

This problem was previously reported as a seabios problem in
https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/OUTHT5ISSQJGXPNTUPY3O5E5EPZJCHM3/
and as a nixos CI build failure in
https://github.com/NixOS/nixpkgs/issues/170803

Signed-off-by: Arnout Engelen <arnout@bzzt.net>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ehci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 33a8a377bd95..d4da8dcb8d15 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2011,7 +2011,10 @@ static int ehci_state_writeback(EHCIQueue *q)
     ehci_trace_qtd(q, NLPTR_GET(p->qtdaddr), (EHCIqtd *) &q->qh.next_qtd);
     qtd = (uint32_t *) &q->qh.next_qtd;
     addr = NLPTR_GET(p->qtdaddr);
-    put_dwords(q->ehci, addr + 2 * sizeof(uint32_t), qtd + 2, 2);
+    /* First write back the offset */
+    put_dwords(q->ehci, addr + 3 * sizeof(uint32_t), qtd + 3, 1);
+    /* Then write back the token, clearing the 'active' bit */
+    put_dwords(q->ehci, addr + 2 * sizeof(uint32_t), qtd + 2, 1);
     ehci_free_packet(p);
 
     /*
-- 
2.36.1


