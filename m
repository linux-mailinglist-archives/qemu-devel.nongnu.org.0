Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC8144087
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 16:32:08 +0100 (CET)
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itvVe-0001Ab-UX
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 10:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1itvTO-0007mp-CM
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:29:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1itvTM-0003sS-Kt
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:29:46 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16894
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1itvTM-0003rA-GK; Tue, 21 Jan 2020 10:29:44 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LFCOHC164332; Tue, 21 Jan 2020 10:29:39 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xp1v5dcwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 10:29:39 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00LFCSTn164761;
 Tue, 21 Jan 2020 10:29:39 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xp1v5dcwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 10:29:39 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00LFRZG7007529;
 Tue, 21 Jan 2020 15:29:38 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 2xksn6uujf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 15:29:38 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00LFTbRg53215720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 15:29:37 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82D4D28059;
 Tue, 21 Jan 2020 15:29:37 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74E6428060;
 Tue, 21 Jan 2020 15:29:37 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jan 2020 15:29:37 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v9 4/6] tpm_spapr: Support suspend and resume
Date: Tue, 21 Jan 2020 10:29:33 -0500
Message-Id: <20200121152935.649898-5-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200121152935.649898-1-stefanb@linux.ibm.com>
References: <20200121152935.649898-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_04:2020-01-21,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=1 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210123
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.vnet.ibm.com>

Extend the tpm_spapr frontend with VM suspend and resume support.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 hw/tpm/tpm_spapr.c  | 52 ++++++++++++++++++++++++++++++++++++++++++++-
 hw/tpm/trace-events |  2 ++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index 1db9696ae0..8ba561f41c 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -76,6 +76,8 @@ typedef struct {
 
     unsigned char *buffer;
 
+    uint32_t numbytes; /* number of bytes to deliver on resume */
+
     TPMBackendCmd cmd;
 
     TPMBackend *be_driver;
@@ -240,6 +242,14 @@ static void tpm_spapr_request_completed(TPMIf *ti, int ret)
 
     /* a max. of be_buffer_size bytes can be transported */
     len = MIN(tpm_cmd_get_size(s->buffer), s->be_buffer_size);
+
+    if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
+        trace_tpm_spapr_caught_response(len);
+        /* defer delivery of response until .post_load */
+        s->numbytes = len;
+        return;
+    }
+
     rc = spapr_vio_dma_write(&s->vdev, be32_to_cpu(crq->data),
                              s->buffer, len);
 
@@ -288,6 +298,7 @@ static void tpm_spapr_reset(SpaprVioDevice *dev)
     SpaprTpmState *s = VIO_SPAPR_VTPM(dev);
 
     s->state = SPAPR_VTPM_STATE_NONE;
+    s->numbytes = 0;
 
     s->be_tpm_version = tpm_backend_get_tpm_version(s->be_driver);
 
@@ -309,9 +320,48 @@ static enum TPMVersion tpm_spapr_get_version(TPMIf *ti)
     return tpm_backend_get_tpm_version(s->be_driver);
 }
 
+/* persistent state handling */
+
+static int tpm_spapr_pre_save(void *opaque)
+{
+    SpaprTpmState *s = opaque;
+
+    tpm_backend_finish_sync(s->be_driver);
+    /*
+     * we cannot deliver the results to the VM since DMA would touch VM memory
+     */
+
+    return 0;
+}
+
+static int tpm_spapr_post_load(void *opaque, int version_id)
+{
+    SpaprTpmState *s = opaque;
+
+    if (s->numbytes) {
+        trace_tpm_spapr_post_load();
+        /* deliver the results to the VM via DMA */
+        tpm_spapr_request_completed(TPM_IF(s), 0);
+        s->numbytes = 0;
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_spapr_vtpm = {
     .name = "tpm-spapr",
-    .unmigratable = 1,
+    .pre_save = tpm_spapr_pre_save,
+    .post_load = tpm_spapr_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_SPAPR_VIO(vdev, SpaprTpmState),
+
+        VMSTATE_UINT8(state, SpaprTpmState),
+        VMSTATE_UINT32(numbytes, SpaprTpmState),
+        VMSTATE_VBUFFER_UINT32(buffer, SpaprTpmState, 0, NULL, numbytes),
+        /* remember DMA address */
+        VMSTATE_UINT32(crq.data, SpaprTpmState),
+        VMSTATE_END_OF_LIST(),
+    }
 };
 
 static Property tpm_spapr_properties[] = {
diff --git a/hw/tpm/trace-events b/hw/tpm/trace-events
index 9143a8eaa3..439e514787 100644
--- a/hw/tpm/trace-events
+++ b/hw/tpm/trace-events
@@ -67,3 +67,5 @@ tpm_spapr_do_crq_get_version(uint32_t version) "response: version %u"
 tpm_spapr_do_crq_prepare_to_suspend(void) "response: preparing to suspend"
 tpm_spapr_do_crq_unknown_msg_type(uint8_t type) "Unknown message type 0x%02x"
 tpm_spapr_do_crq_unknown_crq(uint8_t raw1, uint8_t raw2) "unknown CRQ 0x%02x 0x%02x ..."
+tpm_spapr_post_load(void) "Delivering TPM response after resume"
+tpm_spapr_caught_response(uint32_t v) "Caught response to deliver after resume: %u bytes"
-- 
2.24.1


