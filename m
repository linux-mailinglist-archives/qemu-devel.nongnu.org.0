Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F366B13477E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 17:17:04 +0100 (CET)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipE11-0006cF-NH
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 11:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1ipDub-0000Xb-Sk
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 11:10:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1ipDua-0000rF-GT
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 11:10:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39340)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1ipDua-0000qF-8O; Wed, 08 Jan 2020 11:10:24 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 008G7q3P030713; Wed, 8 Jan 2020 11:10:21 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xdfmnpjb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2020 11:10:20 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 008G8Ss0033208;
 Wed, 8 Jan 2020 11:10:20 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xdfmnpjaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2020 11:10:20 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 008G8emv008632;
 Wed, 8 Jan 2020 16:10:19 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2xajb6y6tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2020 16:10:19 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 008GAHPU47841716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jan 2020 16:10:17 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD5CA6A04F;
 Wed,  8 Jan 2020 16:10:17 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F1336A058;
 Wed,  8 Jan 2020 16:10:17 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jan 2020 16:10:17 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v8 4/6] tpm_spapr: Support suspend and resume
Date: Wed,  8 Jan 2020 11:10:10 -0500
Message-Id: <20200108161012.1821385-5-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108161012.1821385-1-stefanb@linux.ibm.com>
References: <20200108161012.1821385-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-08_04:2020-01-08,
 2020-01-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001080132
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
 hw/tpm/tpm_spapr.c  | 67 ++++++++++++++++++++++++++++++++++++++++++++-
 hw/tpm/trace-events |  2 ++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index ab184fbb82..cf5c7851e7 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -76,6 +76,9 @@ typedef struct {
 
     unsigned char buffer[TPM_SPAPR_BUFFER_MAX];
 
+    uint32_t numbytes; /* number of bytes in suspend_buffer */
+    unsigned char *suspend_buffer;
+
     TPMBackendCmd cmd;
 
     TPMBackend *be_driver;
@@ -240,6 +243,13 @@ static void tpm_spapr_request_completed(TPMIf *ti, int ret)
 
     /* a max. of be_buffer_size bytes can be transported */
     len = MIN(tpm_cmd_get_size(s->buffer), s->be_buffer_size);
+
+    if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
+        /* defer delivery of response until .post_load */
+        s->numbytes = len;
+        return;
+    }
+
     rc = spapr_vio_dma_write(&s->vdev, be32_to_cpu(crq->data),
                              s->buffer, len);
 
@@ -288,11 +298,13 @@ static void tpm_spapr_reset(SpaprVioDevice *dev)
     SpaprTpmState *s = VIO_SPAPR_VTPM(dev);
 
     s->state = SPAPR_VTPM_STATE_NONE;
+    s->numbytes = 0;
 
     s->be_tpm_version = tpm_backend_get_tpm_version(s->be_driver);
 
     s->be_buffer_size = MIN(tpm_backend_get_buffer_size(s->be_driver),
                             TPM_SPAPR_BUFFER_MAX);
+    s->suspend_buffer = g_realloc(s->suspend_buffer, s->be_buffer_size);
 
     tpm_backend_reset(s->be_driver);
     tpm_spapr_do_startup_tpm(s, s->be_buffer_size);
@@ -309,9 +321,62 @@ static enum TPMVersion tpm_spapr_get_version(TPMIf *ti)
     return tpm_backend_get_tpm_version(s->be_driver);
 }
 
+/* persistent state handling */
+
+static int tpm_spapr_pre_save(void *opaque)
+{
+    SpaprTpmState *s = opaque;
+
+    tpm_backend_finish_sync(s->be_driver);
+
+    if (s->numbytes) {
+        memcpy(s->suspend_buffer, s->buffer, s->numbytes);
+    }
+
+    trace_tpm_spapr_pre_save(s->numbytes);
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
+
+        memcpy(s->buffer, s->suspend_buffer,
+               MIN(s->numbytes, s->be_buffer_size));
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
+    .version_id = 1,
+    .minimum_version_id = 0,
+    .minimum_version_id_old = 0,
+    .pre_save = tpm_spapr_pre_save,
+    .post_load = tpm_spapr_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_SPAPR_VIO(vdev, SpaprTpmState),
+
+        VMSTATE_UINT8(state, SpaprTpmState),
+        VMSTATE_UINT32(numbytes, SpaprTpmState),
+        VMSTATE_VBUFFER_ALLOC_UINT32(suspend_buffer,
+                                     SpaprTpmState, 0, NULL,
+                                     numbytes),
+        /* remember DMA address */
+        VMSTATE_UINT32(crq.data, SpaprTpmState),
+        VMSTATE_END_OF_LIST(),
+    }
 };
 
 static Property tpm_spapr_properties[] = {
diff --git a/hw/tpm/trace-events b/hw/tpm/trace-events
index 9143a8eaa3..5592cec7de 100644
--- a/hw/tpm/trace-events
+++ b/hw/tpm/trace-events
@@ -67,3 +67,5 @@ tpm_spapr_do_crq_get_version(uint32_t version) "response: version %u"
 tpm_spapr_do_crq_prepare_to_suspend(void) "response: preparing to suspend"
 tpm_spapr_do_crq_unknown_msg_type(uint8_t type) "Unknown message type 0x%02x"
 tpm_spapr_do_crq_unknown_crq(uint8_t raw1, uint8_t raw2) "unknown CRQ 0x%02x 0x%02x ..."
+tpm_spapr_pre_save(uint32_t v) "Number of TPM response bytes to deliver after resume: %u"
+tpm_spapr_post_load(void) "Delivering TPM response after resume"
-- 
2.24.1


