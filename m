Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0479D55B968
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 13:53:20 +0200 (CEST)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5nIt-0000lb-29
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 07:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDn-0002fu-2u; Mon, 27 Jun 2022 07:48:03 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDj-0004be-PG; Mon, 27 Jun 2022 07:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656330479; x=1687866479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BBc23RDKbFgVuIFPS2HbRIp0YSV+DPIjFZHpyuEBCfQ=;
 b=nS2sapP0LeDfpAtJO43B0XnFD3ywpK3y/YY/Qofsz0wI4rdyd7tvdbMH
 lwChr0sWiyT1H5lpdXuydZ8WPBSId7BMbpJjfs0yx4oB1XgCxq9Lh/Mxs
 otIt5YUQXByYKfu0H3olwIlxWRQWvybyp0YsFNVR5wolKZ8yRMPzZw5WH
 9bPTm/RLLj4rSL9+YDIb5wI86qk4x8Er2/1YYWy35i/qAg75Ho2QU+Vi6
 EUKKg7WcGZua3aLgVRF2ZGKAgEcBe/VVRx96InSdrzbYYikS6bKiUPjuA
 HFUgfxQ+gvwNjiu4s2ZzK2I2qXpwNd8ByJ0RomeguWjru68OThA3zcHnt g==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650902400"; d="scan'208";a="316298971"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2022 19:47:58 +0800
IronPort-SDR: GV2YG/fyaAd7TrfWYYbBIQzlZ11SLsD56qjnsLcsWzaW2LwCW1mINX3tmIoqUbgHotYtsbmdeg
 ipLSv4cLviO4ykhJFCkUF2DaziynUzdSJIFRqa6sKoj0YRqaZYJiaf/snL+Ny2POxBN3/mdzHE
 3TbFQ4FEWK1UGVpKQ/daNe65HFau+mn5G/JWtfNXxv4mMta6STvCDOrtNlhsqw62hlrWXUKLAD
 m9DkO4wCuEyKN7Nrgqfqo+UlXn1SldDLzIqX7bMHoMYeugVQg5kENJZ3oiZd2dm3NpI+gY2CP4
 MRrNnptgV7hLxFxCeHoFlwRK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 04:10:21 -0700
IronPort-SDR: GZUxPa6QmZD8laxGSP5WGLFoFN0LuA/26yaQLGDdUy3/RjIAzHW5Wi1EanmruDq+WxNZY7hyIG
 S0536XTyf/A+5+JEY/jyPfZxE9JME6EUPSSMbc+oEDuGL9QI/TtDha3CoApPzmUDbyDN4mR2Ve
 YTYrj9YvLEEBneMpPp0SU3LdRvUcwIUmceGIlCWfiatGXpXDuWokiZwvPp5u4iT1mLXBrHf++J
 PSFinmQ9w61glctCQULsfBicSL6RzDIPS/WhsngNn2z1zf1tbfQkp3TfnL8kDXGL5PfOB3k8ki
 mGw=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.108])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Jun 2022 04:47:57 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: damien.lemoal@wdc.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH v2 4/4] hw/nvme: add new never_ready parameter to test the DNR
 bit
Date: Mon, 27 Jun 2022 13:47:31 +0200
Message-Id: <20220627114731.356462-5-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627114731.356462-1-niklas.cassel@wdc.com>
References: <20220627114731.356462-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=170689b83=niklas.cassel@wdc.com; helo=esa1.hgst.iphmx.com
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
index 5404f67480..5f98d4778d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -168,6 +168,12 @@
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
@@ -4156,6 +4162,14 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
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
@@ -4202,7 +4216,11 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
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
@@ -5616,6 +5634,10 @@ static void nvme_set_ready_or_start_timer(NvmeCtrl *n, NvmeNamespace *ns)
 {
     int64_t expire_time;
 
+    if (ns->params.never_ready) {
+        return;
+    }
+
     if (!NVME_CC_CRIME(ldl_le_p(&n->bar.cc)) || ns->params.ready_delay == 0) {
         ns->id_indep_ns.nstat |= NVME_NSTAT_NRDY;
         return;
@@ -6346,6 +6368,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
         }
     }
 
+    n->cc_enable_timestamp = 0;
     n->aer_queued = 0;
     n->aer_mask = 0;
     n->outstanding_aers = 0;
@@ -6389,6 +6412,8 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
 
         nvme_ns_shutdown(ns);
     }
+
+    n->cc_enable_timestamp = 0;
 }
 
 static void nvme_ctrl_per_ns_action_on_start(NvmeCtrl *n)
@@ -6506,6 +6531,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     NVME_CAP_SET_TO(cap, new_cap_timeout);
     stq_le_p(&n->bar.cap, cap);
 
+    n->cc_enable_timestamp = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->page_bits = page_bits;
     n->page_size = page_size;
     n->max_prp_ents = n->page_size / sizeof(uint64_t);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index c1d70183c4..fc12b4e0d3 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -661,6 +661,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
                      false),
     DEFINE_PROP_UINT16("ready_delay", NvmeNamespace, params.ready_delay, 0),
+    DEFINE_PROP_BOOL("never_ready", NvmeNamespace, params.never_ready, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 9d2f13dfdb..292b1acf15 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -127,6 +127,7 @@ typedef struct NvmeNamespaceParams {
     uint64_t zrwafg;
 
     uint16_t ready_delay;
+    bool     never_ready;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
@@ -451,6 +452,7 @@ typedef struct NvmeCtrl {
     int         cq_pending;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
+    uint64_t    cc_enable_timestamp;            /* QEMU clock time */
     uint64_t    starttime_ms;
     uint16_t    temperature;
     uint8_t     smart_critical_warning;
-- 
2.36.1


