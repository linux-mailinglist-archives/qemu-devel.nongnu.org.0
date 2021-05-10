Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817DF378C7C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:56:03 +0200 (CEST)
Received: from localhost ([::1]:36108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5S6-0007Rj-Im
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lg5Q0-00054H-NO
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:53:52 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:62940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lg5Py-0002LK-T6
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1620651230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=luRpTb3ZsBRtDzz5jNYYhXTNfJ+3+seFm54k7RxAH0M=;
 b=IorLLTvDXUpbF0Ql5u29kswnjtPYSnQBFgLMYFyLHMtjvZhMBQ1jNKFw
 +mLWefwN4VaaOR2SdpQqNatDivPdzptwNnvwQq//UuNdHZqzYSd1XBed3
 Ds6zBsYMbL5huZbA4cF2JWYa0X+ypovyOFTD6v+0/zIsn42xs98rAp9Xc E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OZiHAEwjijUrvENaT0OVXNjp8reLCAPLGcQq2ThmZQ9HvuA17R+pyRpzvMPLLSpz8eh57ScLAN
 bqgJ97t6/2vcQmFdLB+eNFw98/a0u2iCnUOsb2En0X0fW368MjXM3+t28Bhclxq4WZ4nMSK2df
 jkFCyj5hrILAX2+mk09a4ldk0RelqiHTSFgNw9WxlEt4yLuY3h73XYBtBIycOizkHGyle6ilfB
 bttJjX3ooVdfodNJPeTnFyKF3bOPBEi+NC4yOviQSR3hIjt7ITTDyjbU5VoD7WqKKgF8XGXMPE
 CEM=
X-SBRS: 5.1
X-MesageID: 43235992
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jfQ64ao9RTgVVkZ3T51Q2FMaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.82,287,1613451600"; d="scan'208";a="43235992"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 2/3] xen: Free xenforeignmemory_resource at exit
Date: Mon, 10 May 2021 13:53:39 +0100
Message-ID: <20210510125340.903323-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510125340.903323-1-anthony.perard@citrix.com>
References: <20210510125340.903323-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=anthony.perard@citrix.com; helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Because Coverity complains about it and this is one leak that Valgrind
reports.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Paul Durrant <paul@xen.org>
Message-Id: <20210430163742.469739-1-anthony.perard@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/xen/xen-hvm.c       | 9 ++++++---
 include/hw/xen/xen_common.h | 6 ++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index c53fa17c50..9b432773f0 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -108,6 +108,7 @@ typedef struct XenIOState {
     shared_iopage_t *shared_page;
     shared_vmport_iopage_t *shared_vmport_page;
     buffered_iopage_t *buffered_io_page;
+    xenforeignmemory_resource_handle *fres;
     QEMUTimer *buffered_io_timer;
     CPUState **cpu_by_vcpu_id;
     /* the evtchn port for polling the notification, */
@@ -1253,6 +1254,9 @@ static void xen_exit_notifier(Notifier *n, void *data)
     XenIOState *state = container_of(n, XenIOState, exit);
 
     xen_destroy_ioreq_server(xen_domid, state->ioservid);
+    if (state->fres != NULL) {
+        xenforeignmemory_unmap_resource(xen_fmem, state->fres);
+    }
 
     xenevtchn_close(state->xce_handle);
     xs_daemon_close(state->xenstore);
@@ -1320,7 +1324,6 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
 static int xen_map_ioreq_server(XenIOState *state)
 {
     void *addr = NULL;
-    xenforeignmemory_resource_handle *fres;
     xen_pfn_t ioreq_pfn;
     xen_pfn_t bufioreq_pfn;
     evtchn_port_t bufioreq_evtchn;
@@ -1332,12 +1335,12 @@ static int xen_map_ioreq_server(XenIOState *state)
      */
     QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
     QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
-    fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
+    state->fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
                                          XENMEM_resource_ioreq_server,
                                          state->ioservid, 0, 2,
                                          &addr,
                                          PROT_READ | PROT_WRITE, 0);
-    if (fres != NULL) {
+    if (state->fres != NULL) {
         trace_xen_map_resource_ioreq(state->ioservid, addr);
         state->buffered_io_page = addr;
         state->shared_page = addr + TARGET_PAGE_SIZE;
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 82e56339dd..a8118b41ac 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -134,6 +134,12 @@ static inline xenforeignmemory_resource_handle *xenforeignmemory_map_resource(
     return NULL;
 }
 
+static inline int xenforeignmemory_unmap_resource(
+    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
+{
+    return 0;
+}
+
 #endif /* CONFIG_XEN_CTRL_INTERFACE_VERSION < 41100 */
 
 #if CONFIG_XEN_CTRL_INTERFACE_VERSION < 41000
-- 
Anthony PERARD


