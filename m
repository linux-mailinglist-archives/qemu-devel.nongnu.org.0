Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611B5420A8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 03:36:02 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nykc5-0000go-Ao
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 21:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=151ed2091=niklas.cassel@wdc.com>)
 id 1nykVS-0001Qw-3V; Tue, 07 Jun 2022 21:29:10 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=151ed2091=niklas.cassel@wdc.com>)
 id 1nykVQ-0001Ir-6V; Tue, 07 Jun 2022 21:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654651746; x=1686187746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OjCah1WltRoY+yqHfnDl82yaz6jwcP6eJqmBLQtv5Q8=;
 b=pmZDkWY2ubrCZeCULu44UlTh8TLgSQSnoEhTwNtAe+6JCRo4BAQcvIfp
 akuM/FfDsnjhiQ4DXoNzbjOKu+SRk/tVkdkPqseDRyEoUxymcDl9zvacI
 nMZQtjOBjf7rvlpQ2ZgWcumAG2k9gHITjwU9gqFSr1rRjap4Hvinxsphs
 6wvcpyuFiBAKzK8lzyTv1bkFMQG3M7j1nRr9XmJRv0Mn9HKAFWtQzF/rQ
 29TfArKisZj+/OaV3wfw6uNdqBPSWTs7dmgwqubv4e/YibckUu93P8GSF
 0UTK5BSq6nCIeGL9dQ5KrcTvycGeJN+eFwxk3kz+12EW5DPLp+I3tEVvz A==;
X-IronPort-AV: E=Sophos;i="5.91,284,1647273600"; d="scan'208";a="207399241"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2022 09:29:05 +0800
IronPort-SDR: Vw5bHdJOsTSu6nYtzAQ8ecgHGIUnd6rEFglPnyUHiWNMdLe5UwOsjTJMG05dqLBxKrVB6LNBmo
 QuXp0bpw4D6mXWYv4SOR3NWhcFd9CtW/ksnPQB5miUd7DJ13ZDqEZdGXLAn0FoAix1MIL5bTI+
 1M0nU8M5AfFpgOc+KMsEiLrEIOJnJQz4vxmwAJ1oOcJ5fLbJsxJN3TUsU7A+aHn4SrPYahgKHt
 L0tLIA3w78+iegSBV7AMEeO1htl9+eDswwlU/5Xq4Mw364k4+rGQ+ISmyDuylvRZppU0266Vsw
 ZkRjsjBNIcMDNT0XYcC98z9l
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 17:47:55 -0700
IronPort-SDR: sf0va/U10umJ1A2vg5In+yY1HfvrfYBhFT7BOE7F+1CzB6IJ4Lbly3GdjQbdzBdU1JQgcfjRYF
 uLZNKs/RlNQKFhR2PiZKyz81Q0l8UE/XorhTUUUTd5tLn2dI3L5nGGRt1yvWDYo2zI83uej38R
 C0lK2DC1UC33HfW4ImagjM+6JszX7/2889Ua3JRGe/OZKwdTEsFDRkaiVslbNCNP2b+OaMted0
 EyC8wQs8pA9wTZx2hDiMKaraE+xnS0Htm/Ybf4br3FoitmTEupEGApUerrBlh+fz7gukGnlddk
 Ezc=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.64])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2022 18:29:04 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 4/4] hw/nvme: add new never_ready parameter to test the DNR bit
Date: Wed,  8 Jun 2022 03:28:50 +0200
Message-Id: <20220608012850.668695-5-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608012850.668695-1-niklas.cassel@wdc.com>
References: <20220608012850.668695-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=151ed2091=niklas.cassel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  Niklas Cassel <niklas.cassel@wdc.com>
From:  Niklas Cassel via <qemu-devel@nongnu.org>

Since we verify that "ready_delay" parameter has to be smaller than CRWMT,
we know that the namespace will always become ready.
Therefore the "Namespace Not Ready" status code will never have the DNR
bit set.

Add a new parameter "never_ready" that can be used to emulate a namespace
that never gets ready, such that the DNR bit gets set after CRWMT amount
of time.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/nvme/ctrl.c | 28 +++++++++++++++++++++++++++-
 hw/nvme/ns.c   |  1 +
 hw/nvme/nvme.h |  2 ++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 66d96714c3..5ec22ff13d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -134,6 +134,12 @@
  *   before being marked ready. Only applicable if CC.CRIME is set by the user.
  *   The value is in units of 500 milliseconds (to be consistent with `crwmt`).
  *
+ * - `never_ready`
+ *   This parameter specifies that a namespace should never be marked as ready.
+ *   When `crwmt` amount of time has passed after enabling the controller,
+ *   status code "Namespace Not Ready" will have the DNR bit set. If specified
+ *   together with `ready_delay`, `never_ready` will take precedence.
+ *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
  * In this case, the following namespace properties are available to configure
  * zoned operation:
@@ -4118,6 +4124,14 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
+static bool nvme_ready_has_passed_timeout(NvmeCtrl *n)
+{
+    int64_t current_time = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    int64_t elapsed_time = current_time - n->cc_enable_timestamp;
+
+    return elapsed_time > n->params.crwmt * 500;
+}
+
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
@@ -4164,7 +4178,11 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     }
 
     if (!(ns->id_indep_ns.nstat & NVME_NSTAT_NRDY)) {
-        return NVME_NS_NOT_READY;
+        uint16_t ret = NVME_NS_NOT_READY;
+        if (ns->params.never_ready && nvme_ready_has_passed_timeout(n)) {
+            ret |= NVME_DNR;
+        }
+        return ret;
     }
 
     if (ns->status) {
@@ -5537,6 +5555,10 @@ static void nvme_set_ready_or_start_timer(NvmeCtrl *n, NvmeNamespace *ns)
 {
     int64_t expire_time;
 
+    if (ns->params.never_ready) {
+        return;
+    }
+
     if (!NVME_CC_CRIME(ldl_le_p(&n->bar.cc)) || ns->params.ready_delay == 0) {
         ns->id_indep_ns.nstat |= NVME_NSTAT_NRDY;
         return;
@@ -5979,6 +6001,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
+    n->cc_enable_timestamp = 0;
 }
 
 static void nvme_ctrl_shutdown(NvmeCtrl *n)
@@ -6000,6 +6023,8 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
 
         nvme_ns_shutdown(ns);
     }
+
+    n->cc_enable_timestamp = 0;
 }
 
 static void nvme_ctrl_per_ns_action_on_start(NvmeCtrl *n)
@@ -6109,6 +6134,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     NVME_CAP_SET_TO(cap, new_cap_timeout);
     stq_le_p(&n->bar.cap, cap);
 
+    n->cc_enable_timestamp = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->page_bits = page_bits;
     n->page_size = page_size;
     n->max_prp_ents = n->page_size / sizeof(uint64_t);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index c4e9f0e5c8..89c31658de 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -658,6 +658,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
                      false),
     DEFINE_PROP_UINT16("ready_delay", NvmeNamespace, params.ready_delay, 0),
+    DEFINE_PROP_BOOL("never_ready", NvmeNamespace, params.never_ready, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index c9934d0097..6ff9725f21 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -122,6 +122,7 @@ typedef struct NvmeNamespaceParams {
     uint64_t zrwafg;
 
     uint16_t ready_delay;
+    bool     never_ready;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -436,6 +437,7 @@ typedef struct NvmeCtrl {
     int         cq_pending;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
+    uint64_t    cc_enable_timestamp;            /* QEMU clock time */
     uint64_t    starttime_ms;
     uint16_t    temperature;
     uint8_t     smart_critical_warning;
-- 
2.36.1


