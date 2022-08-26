Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A738A5A20CC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 08:20:44 +0200 (CEST)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRShu-0001lx-Ob
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 02:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oRSdo-00087w-3L
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 02:16:32 -0400
Received: from [125.120.144.215] (port=36840 helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oRSdl-00074K-7E
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 02:16:27 -0400
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 48a7596a;
 Fri, 26 Aug 2022 05:16:07 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: P J P <pjp@fedoraproject.org>, Gaoning Pan <pgn@zju.edu.cn>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hcd-ohci: Drop ohci_service_iso_td() if ed->head &
 OHCI_DPTR_MASK is zero
Date: Fri, 26 Aug 2022 13:15:56 +0800
Message-Id: <20220826051557.119570-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 125.120.144.215 (failed)
Received-SPF: softfail client-ip=125.120.144.215;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 65
X-Spam_score: 6.5
X-Spam_bar: ++++++
X-Spam_report: (6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_SOFTFAIL=0.665, SPOOFED_FREEMAIL=1.7,
 SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
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
---
 hw/usb/hcd-ohci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 895b29fb86..72bdde9261 100644
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
2.25.1


