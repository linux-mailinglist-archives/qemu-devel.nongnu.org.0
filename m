Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9209E18049A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 18:17:30 +0100 (CET)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBiVV-0005LN-Lj
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 13:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1jBiTq-0004MA-5E
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:15:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1jBiTo-0002QS-NE
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:15:45 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55405
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1jBiTo-0002IU-Bj
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583860543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MA1QvVPbSt+mcrYGwYFucGjgfnaG8jKnJUY/LMVIkF4=;
 b=hykZf3JiOZJ9fTxguABt9rCiul9aJ4v0xq43FBbuWg824mtV6eydDwj4hSWQLmHxnwmEKP
 7Cj+bpm5+/IqGhuH47fq1jiP5ukRlHCJFpa9xjrNsTtQLEZ/ckqifG5wHNl8uNu1FhOQ3F
 qxy3GhaDtkwPd1WskeD5G644C4niPL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-w1KpZT8CNLuWuzPibIJjdA-1; Tue, 10 Mar 2020 13:15:39 -0400
X-MC-Unique: w1KpZT8CNLuWuzPibIJjdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E8A801E53;
 Tue, 10 Mar 2020 17:15:38 +0000 (UTC)
Received: from gimli.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D32FD8D570;
 Tue, 10 Mar 2020 17:15:33 +0000 (UTC)
Subject: [PATCH] vfio/pci: Use defined memcpy() behavior
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Mar 2020 11:15:33 -0600
Message-ID: <158386047731.30997.5580377889283866404.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: alex.williamson@redhat.com, lersek@redhat.com, longpeng2@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vfio_rom_read() relies on memcpy() doing the logically correct thing,
ie. safely copying zero bytes from a NULL pointer when rom_size is
zero, rather than the spec definition, which is undefined when the
source or target pointers are NULL.  Resolve this by wrapping the
call in the condition expressed previously by the ternary.

Additionally, we still use @val to fill data based on the provided
@size regardless of mempcy(), so we should initialize @val rather
than @data.

Reported-by: Longpeng <longpeng2@huawei.com>
Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5e75a95129ac..b0799cdc28ad 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -859,16 +859,17 @@ static uint64_t vfio_rom_read(void *opaque, hwaddr addr, unsigned size)
         uint16_t word;
         uint32_t dword;
         uint64_t qword;
-    } val;
-    uint64_t data = 0;
+    } val = { 0 };
+    uint64_t data;
 
     /* Load the ROM lazily when the guest tries to read it */
     if (unlikely(!vdev->rom && !vdev->rom_read_failed)) {
         vfio_pci_load_rom(vdev);
     }
 
-    memcpy(&val, vdev->rom + addr,
-           (addr < vdev->rom_size) ? MIN(size, vdev->rom_size - addr) : 0);
+    if (addr < vdev->rom_size) {
+        memcpy(&val, vdev->rom + addr, MIN(size, vdev->rom_size - addr));
+    }
 
     switch (size) {
     case 1:


