Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295F5EA07D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:38:27 +0200 (CEST)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclVK-0001qU-H3
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpl-0005CS-RD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpj-0003mJ-RF
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=At+dbiBtzojIId+CkWfr7mFw/GiOsUbaxmGmx4H6iSE=;
 b=XvPLyd9dguP4Xsn0ID8Ls5Y+YxkS0lMOzZS0vW2WblUQwOFML4W0MQRneLFsUQyAYKU9Np
 wSOSN67P/DH9kUCnGYhoKa2GOBwfYH7lvfFiXKgBsoAxQPmBQ6BOFaBZ4pDCzuJEJrJoLP
 gOs5DpvWB9U+Rw7ElUSvmbKj5e39BHQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-3rN6RVl8Mc2Rn2mrBRyVzQ-1; Mon, 26 Sep 2022 05:55:24 -0400
X-MC-Unique: 3rN6RVl8Mc2Rn2mrBRyVzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F2DE29AB44D;
 Mon, 26 Sep 2022 09:55:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD4572084836;
 Mon, 26 Sep 2022 09:55:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9C26C18030B5; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, Gaoning Pan <pgn@zju.edu.cn>
Subject: [PULL 12/25] hcd-ohci: Drop ohci_service_iso_td() if ed->head &
 OHCI_DPTR_MASK is zero
Date: Mon, 26 Sep 2022 11:54:56 +0200
Message-Id: <20220926095509.3759409-13-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Qiang Liu <cyruscyliu@gmail.com>

An abort happens in ohci_frame_boundary() when ohci->done is 0 [1].

``` c
static void ohci_frame_boundary(void *opaque)
{
    // ...
    if (ohci->done_count == 0 && !(ohci->intr_status & OHCI_INTR_WD)) {
        if (!ohci->done)
            abort(); <----------------------------------------- [1]
```

This was reported in https://bugs.launchpad.net/qemu/+bug/1911216/,
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03613.html, and
https://gitlab.com/qemu-project/qemu/-/issues/545. I can still reproduce it with
the latest QEMU.

This happends due to crafted ED with putting ISO_TD at physical address 0.

Suppose ed->head & OHCI_DPTR_MASK is 0 [2], and we memset 0 to the phyiscal
memory from 0 to sizeof(ohci_iso_td). Then, starting_frame [3] and frame_count
[4] are both 0. As we can control the value of ohci->frame_number (0 to 0x1f,
suppose 1), we then control the value of relative_frame_number to be 1 [6]. The
control flow goes to [7] where ohci->done is 0. Have returned from
ohci_service_iso_td(), ohci_frame_boundary() will abort() [1].

``` c
static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
{
    // ...
    addr = ed->head & OHCI_DPTR_MASK; // <--------------------- [2]

    if (ohci_read_iso_td(ohci, addr, &iso_td)) {   // <-------- [3]
        // ...

    starting_frame = OHCI_BM(iso_td.flags, TD_SF); // <-------- [4]
    frame_count = OHCI_BM(iso_td.flags, TD_FC);    // <-------- [5]
    relative_frame_number = USUB(ohci->frame_number, starting_frame);
                                                   // <-------- [6]
    if (relative_frame_number < 0) {
        return 1;
    } else if (relative_frame_number > frame_count) {
        // ...
        ohci->done = addr;                         // <-------- [7]
        // ...
    }
```

As only (afaik) a guest root user can manipulate ED, TD and the physical memory,
this assertion failure is not a security bug.

The idea to fix this issue is to drop ohci_service_iso_td() if ed->head &
OHCI_DPTR_MASK is 0, which is similar to the drop operation for
ohci_service_ed_list() when head is 0. Probably, a similar issue is in
ohci_service_td(). I drop ohci_service_td() if ed->head & OHCI_DPTR_MASK is 0.

Fixes: 7bfe577702 ("OHCI USB isochronous transfers support (Arnon Gilboa)")
Reported-by: Gaoning Pan <pgn@zju.edu.cn>
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/545
Buglink: https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg03613.html
Buglink: https://bugs.launchpad.net/qemu/+bug/1911216
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
Message-Id: <20220826051557.119570-1-cyruscyliu@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ohci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 895b29fb8657..72bdde92617c 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -571,6 +571,11 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed)
 
     addr = ed->head & OHCI_DPTR_MASK;
 
+    if (addr == 0) {
+        ohci_die(ohci);
+        return 1;
+    }
+
     if (ohci_read_iso_td(ohci, addr, &iso_td)) {
         trace_usb_ohci_iso_td_read_failed(addr);
         ohci_die(ohci);
@@ -858,6 +863,11 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
     int completion;
 
     addr = ed->head & OHCI_DPTR_MASK;
+    if (addr == 0) {
+        ohci_die(ohci);
+        return 1;
+    }
+
     /* See if this TD has already been submitted to the device.  */
     completion = (addr == ohci->async_td);
     if (completion && !ohci->async_complete) {
-- 
2.37.3


