Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623433310ED
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:35:17 +0100 (CET)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGya-00064R-Da
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lJGwS-0004OX-Ps; Mon, 08 Mar 2021 09:33:04 -0500
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:53340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lJGwQ-0002O8-TY; Mon, 08 Mar 2021 09:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1615213982;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q1bwcy8zs0Y3OOtedWN1SdTn52JflrxXUJhjBz32qYs=;
 b=dWBYxlXEL25jG9QzYd0ux8+Wwu6WkCaxxPLNL+arlAHugH9pZ0Zp7dzJ
 UKY+k3Ad+OFWN7QsRFdJediIGbtTP//Ko34Uu4CA7DNHf6TKWGZFB3l1l
 6HDAfaXPV0ojLpSQ/2LcHhUAtQ9LUvkSyXgvEV8I1jPqKxkul+uFGjShT A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Cyr/TUjEwVfGjW7hRbaKiJa1Ckr9xfodS8EQgLVEM1gUMrkAfx9be9upn8cgb8gLbQX8urcaVU
 rebXD0ABAkaDYMK3UoXdTT8u0RnZ2ljfVX5/Fi+OFVGGlt4/DSrgq1BwpAg19mrJWZvjNQzTgD
 AMIPyx12eIEUeEPmGHSYIbsgiKI28Ss6cq4O5iDxKR6A5KGLnu+Fli/dnwx9RjlyRfjNDascwa
 xjHeFBARuwB8x1Oqu8ZWasTkn0lfa5Y6F8wLK/3jxBXuf6769k5uTPxD+ht0YQg0xPWGKh5Mdr
 +gE=
X-SBRS: 4.0
X-MesageID: 38766920
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; d="scan'208";a="38766920"
To: <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>, Anthony PERARD
 <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, <xen-devel@lists.xenproject.org>,
 <qemu-block@nongnu.org>
Subject: [PATCH] xen-block: Fix removal of backend instance via xenstore
Date: Mon, 8 Mar 2021 14:32:32 +0000
Message-ID: <20210308143232.83388-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

From: Anthony PERARD <anthony.perard@citrix.com>

Whenever a Xen block device is detach via xenstore, the image
associated with it remained open by the backend QEMU and an error is
logged:
    qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use

This happened since object_unparent() doesn't immediately frees the
object and thus keep a reference to the node we are trying to free.
The reference is hold by the "drive" property and the call
xen_block_drive_destroy() fails.

In order to fix that, we call drain_call_rcu() to run the callback
setup by bus_remove_child() via object_unparent().

Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
CCing people whom introduced/reviewed the change to use RCU to give
them a chance to say if the change is fine.
---
 hw/block/xen-block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index a3b69e27096f..fe5f828e2d25 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -972,6 +972,15 @@ static void xen_block_device_destroy(XenBackendInstance *backend,
 
     object_unparent(OBJECT(xendev));
 
+    /*
+     * Drall all pending RCU callbacks as object_unparent() frees `xendev'
+     * in a RCU callback.
+     * And due to the property "drive" still existing in `xendev', we
+     * cann't destroy the XenBlockDrive associated with `xendev' with
+     * xen_block_drive_destroy() below.
+     */
+    drain_call_rcu();
+
     if (iothread) {
         xen_block_iothread_destroy(iothread, errp);
         if (*errp) {
-- 
Anthony PERARD


