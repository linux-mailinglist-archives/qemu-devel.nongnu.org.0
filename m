Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E511B8B0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 17:26:13 +0100 (CET)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if4oW-0001sC-GG
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 11:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1if4kK-0006FG-TF
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:21:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1if4kI-0000g2-EP
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:21:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17162
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1if4kI-0000fK-7u; Wed, 11 Dec 2019 11:21:50 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBGDRUK192420; Wed, 11 Dec 2019 11:21:36 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wtbt2a6dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 11:21:35 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBBGFBRm002681;
 Wed, 11 Dec 2019 11:21:35 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wtbt2a6dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 11:21:35 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBBGKdPT025592;
 Wed, 11 Dec 2019 16:21:34 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 2wtdq79bc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 16:21:34 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBGLXQX47710710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 16:21:34 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAFB56E050;
 Wed, 11 Dec 2019 16:21:33 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 371286E052;
 Wed, 11 Dec 2019 16:21:33 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 16:21:32 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-ppc@nongnu.org
Subject: [PACTH v3 1/5] tpm_spapr: Support TPM for ppc64 using CRQ based
 interface
Date: Wed, 11 Dec 2019 11:20:46 -0500
Message-Id: <20191211162050.970199-2-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191211162050.970199-1-stefanb@linux.vnet.ibm.com>
References: <20191211162050.970199-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_04:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 suspectscore=4 phishscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912110137
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

Implement support for TPM on ppc64 by implementing the vTPM CRQ interface
as a frontend. It can use the tpm_emulator driver backend with the external
swtpm.

The Linux vTPM driver for ppc64 works with this emulation.

This TPM emulator also handles the TPM 2 case.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/tpm/Makefile.objs |   1 +
 hw/tpm/tpm_spapr.c   | 405 +++++++++++++++++++++++++++++++++++++++++++
 hw/tpm/trace-events  |  12 ++
 include/sysemu/tpm.h |   3 +
 qapi/tpm.json        |   6 +-
 5 files changed, 424 insertions(+), 3 deletions(-)
 create mode 100644 hw/tpm/tpm_spapr.c

diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
index de0b85d02a..f9f29e0082 100644
--- a/hw/tpm/Makefile.objs
+++ b/hw/tpm/Makefile.objs
@@ -4,3 +4,4 @@ common-obj-$(CONFIG_TPM_TIS) += tpm_tis.o
 common-obj-$(CONFIG_TPM_CRB) += tpm_crb.o
 common-obj-$(CONFIG_TPM_PASSTHROUGH) += tpm_passthrough.o
 common-obj-$(CONFIG_TPM_EMULATOR) += tpm_emulator.o
+obj-$(CONFIG_PSERIES) += tpm_spapr.o
diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
new file mode 100644
index 0000000000..c4a67e2403
--- /dev/null
+++ b/hw/tpm/tpm_spapr.c
@@ -0,0 +1,405 @@
+/*
+ * QEMU PowerPC pSeries Logical Partition (aka sPAPR) hardware System Emulator
+ *
+ * PAPR Virtual TPM
+ *
+ * Copyright (c) 2015, 2017 IBM Corporation.
+ *
+ * Authors:
+ *    Stefan Berger <stefanb@linux.vnet.ibm.com>
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+
+#include "sysemu/tpm_backend.h"
+#include "tpm_int.h"
+#include "tpm_util.h"
+
+#include "hw/ppc/spapr.h"
+#include "hw/ppc/spapr_vio.h"
+#include "trace.h"
+
+#define DEBUG_SPAPR 0
+
+#define VIO_SPAPR_VTPM(obj) \
+     OBJECT_CHECK(SPAPRvTPMState, (obj), TYPE_TPM_SPAPR)
+
+typedef struct VioCRQ {
+    uint8_t valid;  /* 0x80: cmd; 0xc0: init crq */
+                    /* 0x81-0x83: CRQ message response */
+    uint8_t msg;    /* see below */
+    uint16_t len;   /* len of TPM request; len of TPM response */
+    uint32_t data;  /* rtce_dma_handle when sending TPM request */
+    uint64_t reserved;
+} VioCRQ;
+
+typedef union TPMSpaprCRQ {
+    VioCRQ s;
+    uint8_t raw[sizeof(VioCRQ)];
+} TPMSpaprCRQ;
+
+#define SPAPR_VTPM_VALID_INIT_CRQ_COMMAND  0xC0
+#define SPAPR_VTPM_VALID_COMMAND           0x80
+#define SPAPR_VTPM_MSG_RESULT              0x80
+
+/* msg types for valid = SPAPR_VTPM_VALID_INIT_CRQ */
+#define SPAPR_VTPM_INIT_CRQ_RESULT           0x1
+#define SPAPR_VTPM_INIT_CRQ_COMPLETE_RESULT  0x2
+
+/* msg types for valid = SPAPR_VTPM_VALID_CMD */
+#define SPAPR_VTPM_GET_VERSION               0x1
+#define SPAPR_VTPM_TPM_COMMAND               0x2
+#define SPAPR_VTPM_GET_RTCE_BUFFER_SIZE      0x3
+#define SPAPR_VTPM_PREPARE_TO_SUSPEND        0x4
+
+/* response error messages */
+#define SPAPR_VTPM_VTPM_ERROR                0xff
+
+/* error codes */
+#define SPAPR_VTPM_ERR_COPY_IN_FAILED        0x3
+#define SPAPR_VTPM_ERR_COPY_OUT_FAILED       0x4
+
+#define MAX_BUFFER_SIZE TARGET_PAGE_SIZE
+
+typedef struct {
+    SpaprVioDevice vdev;
+
+    TPMSpaprCRQ crq; /* track single TPM command */
+
+    uint8_t state;
+#define SPAPR_VTPM_STATE_NONE         0
+#define SPAPR_VTPM_STATE_EXECUTION    1
+#define SPAPR_VTPM_STATE_COMPLETION   2
+
+    unsigned char buffer[MAX_BUFFER_SIZE];
+
+    TPMBackendCmd cmd;
+
+    TPMBackend *be_driver;
+    TPMVersion be_tpm_version;
+
+    size_t be_buffer_size;
+} SPAPRvTPMState;
+
+static void tpm_spapr_show_buffer(const unsigned char *buffer,
+                                  size_t buffer_size, const char *string)
+{
+    size_t len, i;
+    char *line_buffer, *p;
+
+    len = MIN(tpm_cmd_get_size(buffer), buffer_size);
+
+    /*
+     * allocate enough room for 3 chars per buffer entry plus a
+     * newline after every 16 chars and a final null terminator.
+     */
+    line_buffer = g_malloc(len * 3 + (len / 16) + 1);
+
+    for (i = 0, p = line_buffer; i < len; i++) {
+        if (i && !(i % 16)) {
+            p += sprintf(p, "\n");
+        }
+        p += sprintf(p, "%.2X ", buffer[i]);
+    }
+    trace_tpm_spapr_show_buffer(string, len, line_buffer);
+
+    g_free(line_buffer);
+}
+
+/*
+ * Send a request to the TPM.
+ */
+static void tpm_spapr_tpm_send(SPAPRvTPMState *s)
+{
+    if (trace_event_get_state_backends(TRACE_TPM_SPAPR_SHOW_BUFFER)) {
+        tpm_spapr_show_buffer(s->buffer, sizeof(s->buffer), "To TPM");
+    }
+
+    s->state = SPAPR_VTPM_STATE_EXECUTION;
+    s->cmd = (TPMBackendCmd) {
+        .locty = 0,
+        .in = s->buffer,
+        .in_len = MIN(tpm_cmd_get_size(s->buffer), sizeof(s->buffer)),
+        .out = s->buffer,
+        .out_len = sizeof(s->buffer),
+    };
+
+    tpm_backend_deliver_request(s->be_driver, &s->cmd);
+}
+
+static int tpm_spapr_process_cmd(SPAPRvTPMState *s, uint64_t dataptr)
+{
+    long rc;
+
+    /* a max. of be_buffer_size bytes can be transported */
+    rc = spapr_vio_dma_read(&s->vdev, dataptr,
+                            s->buffer, s->be_buffer_size);
+    if (rc) {
+        error_report("tpm_spapr_got_payload: DMA read failure");
+    }
+    /* let vTPM handle any malformed request */
+    tpm_spapr_tpm_send(s);
+
+    return rc;
+}
+
+static int tpm_spapr_do_crq(struct SpaprVioDevice *dev, uint8_t *crq_data)
+{
+    SPAPRvTPMState *s = VIO_SPAPR_VTPM(dev);
+    TPMSpaprCRQ local_crq;
+    TPMSpaprCRQ *crq = &s->crq; /* requests only */
+    int rc;
+
+    memcpy(&local_crq.raw, crq_data, sizeof(local_crq.raw));
+
+    trace_tpm_spapr_do_crq(local_crq.raw[0], local_crq.raw[1]);
+
+    switch (local_crq.s.valid) {
+    case SPAPR_VTPM_VALID_INIT_CRQ_COMMAND: /* Init command/response */
+
+        /* Respond to initialization request */
+        switch (local_crq.s.msg) {
+        case SPAPR_VTPM_INIT_CRQ_RESULT:
+            trace_tpm_spapr_do_crq_crq_result();
+            memset(local_crq.raw, 0, sizeof(local_crq.raw));
+            local_crq.s.valid = SPAPR_VTPM_VALID_INIT_CRQ_COMMAND;
+            local_crq.s.msg = SPAPR_VTPM_INIT_CRQ_RESULT;
+            spapr_vio_send_crq(dev, local_crq.raw);
+            break;
+
+        case SPAPR_VTPM_INIT_CRQ_COMPLETE_RESULT:
+            trace_tpm_spapr_do_crq_crq_complete_result();
+            memset(local_crq.raw, 0, sizeof(local_crq.raw));
+            local_crq.s.valid = SPAPR_VTPM_VALID_INIT_CRQ_COMMAND;
+            local_crq.s.msg = SPAPR_VTPM_INIT_CRQ_COMPLETE_RESULT;
+            spapr_vio_send_crq(dev, local_crq.raw);
+            break;
+        }
+
+        break;
+    case SPAPR_VTPM_VALID_COMMAND: /* Payloads */
+        switch (local_crq.s.msg) {
+        case SPAPR_VTPM_TPM_COMMAND:
+            trace_tpm_spapr_do_crq_tpm_command();
+            if (s->state == SPAPR_VTPM_STATE_EXECUTION) {
+                return H_BUSY;
+            }
+            /* this crq is tracked */
+            memcpy(crq->raw, crq_data, sizeof(crq->raw));
+
+            rc = tpm_spapr_process_cmd(s, be32_to_cpu(crq->s.data));
+
+            if (rc == H_SUCCESS) {
+                crq->s.valid = be16_to_cpu(0);
+            } else {
+                local_crq.s.valid = SPAPR_VTPM_MSG_RESULT;
+                local_crq.s.msg = SPAPR_VTPM_VTPM_ERROR;
+                local_crq.s.data = cpu_to_be32(SPAPR_VTPM_ERR_COPY_IN_FAILED);
+                spapr_vio_send_crq(dev, local_crq.raw);
+            }
+            break;
+
+        case SPAPR_VTPM_GET_RTCE_BUFFER_SIZE:
+            trace_tpm_spapr_do_crq_tpm_get_rtce_buffer_size(s->be_buffer_size);
+            local_crq.s.msg |= SPAPR_VTPM_MSG_RESULT;
+            local_crq.s.len = cpu_to_be16(s->be_buffer_size);
+            spapr_vio_send_crq(dev, local_crq.raw);
+            break;
+
+        case SPAPR_VTPM_GET_VERSION:
+            local_crq.s.msg |= SPAPR_VTPM_MSG_RESULT;
+            local_crq.s.len = cpu_to_be16(0);
+            switch (s->be_tpm_version) {
+            case TPM_VERSION_UNSPEC:
+                local_crq.s.data = cpu_to_be32(0);
+                break;
+            case TPM_VERSION_1_2:
+                local_crq.s.data = cpu_to_be32(1);
+                break;
+            case TPM_VERSION_2_0:
+                local_crq.s.data = cpu_to_be32(2);
+                break;
+            }
+            trace_tpm_spapr_do_crq_get_version(be32_to_cpu(local_crq.s.data));
+            spapr_vio_send_crq(dev, local_crq.raw);
+            break;
+
+        case SPAPR_VTPM_PREPARE_TO_SUSPEND:
+            trace_tpm_spapr_do_crq_prepare_to_suspend();
+            local_crq.s.msg |= SPAPR_VTPM_MSG_RESULT;
+            spapr_vio_send_crq(dev, local_crq.raw);
+            break;
+
+        default:
+            trace_tpm_spapr_do_crq_unknown_msg_type(crq->s.msg);
+        }
+        break;
+    default:
+        trace_tpm_spapr_do_crq_unknown_crq(local_crq.raw[0], local_crq.raw[1]);
+    };
+
+    return H_SUCCESS;
+}
+
+static void tpm_spapr_request_completed(TPMIf *ti, int ret)
+{
+    SPAPRvTPMState *s = VIO_SPAPR_VTPM(ti);
+    TPMSpaprCRQ *crq = &s->crq;
+    uint32_t len;
+    int rc;
+
+    s->state = SPAPR_VTPM_STATE_COMPLETION;
+
+    /* a max. of be_buffer_size bytes can be transported */
+    len = MIN(tpm_cmd_get_size(s->buffer), s->be_buffer_size);
+    rc = spapr_vio_dma_write(&s->vdev, be32_to_cpu(crq->s.data),
+                             s->buffer, len);
+
+    if (trace_event_get_state_backends(TRACE_TPM_SPAPR_SHOW_BUFFER)) {
+        tpm_spapr_show_buffer(s->buffer, len, "From TPM");
+    }
+
+    crq->s.valid = SPAPR_VTPM_MSG_RESULT;
+    if (rc == H_SUCCESS) {
+        crq->s.msg = SPAPR_VTPM_TPM_COMMAND | SPAPR_VTPM_MSG_RESULT;
+        crq->s.len = cpu_to_be16(len);
+    } else {
+        error_report("%s: DMA write failure", __func__);
+        crq->s.msg = SPAPR_VTPM_VTPM_ERROR;
+        crq->s.len = cpu_to_be16(0);
+        crq->s.data = cpu_to_be32(SPAPR_VTPM_ERR_COPY_OUT_FAILED);
+    }
+
+    rc = spapr_vio_send_crq(&s->vdev, crq->raw);
+    if (rc) {
+        error_report("%s: Error sending response", __func__);
+    }
+}
+
+static int tpm_spapr_do_startup_tpm(SPAPRvTPMState *s, size_t buffersize)
+{
+    return tpm_backend_startup_tpm(s->be_driver, buffersize);
+}
+
+static void tpm_spapr_update_deviceclass(SpaprVioDevice *dev)
+{
+    SPAPRvTPMState *s = VIO_SPAPR_VTPM(dev);
+    SpaprVioDeviceClass *k = VIO_SPAPR_DEVICE_GET_CLASS(dev);
+
+    switch (s->be_tpm_version) {
+    case TPM_VERSION_UNSPEC:
+        assert(false);
+        break;
+    case TPM_VERSION_1_2:
+        k->dt_name = "vtpm";
+        k->dt_type = "IBM,vtpm";
+        k->dt_compatible = "IBM,vtpm";
+        break;
+    case TPM_VERSION_2_0:
+        k->dt_name = "vtpm";
+        k->dt_type = "IBM,vtpm";
+        k->dt_compatible = "IBM,vtpm20";
+        break;
+    }
+}
+
+static void tpm_spapr_reset(SpaprVioDevice *dev)
+{
+    SPAPRvTPMState *s = VIO_SPAPR_VTPM(dev);
+
+    s->state = SPAPR_VTPM_STATE_NONE;
+
+    s->be_tpm_version = tpm_backend_get_tpm_version(s->be_driver);
+    tpm_spapr_update_deviceclass(dev);
+
+    s->be_buffer_size = MAX(ROUND_UP(tpm_backend_get_buffer_size(s->be_driver),
+                                     TARGET_PAGE_SIZE),
+                            sizeof(s->buffer));
+
+    tpm_backend_reset(s->be_driver);
+    tpm_spapr_do_startup_tpm(s, s->be_buffer_size);
+}
+
+static enum TPMVersion tpm_spapr_get_version(TPMIf *ti)
+{
+    SPAPRvTPMState *s = VIO_SPAPR_VTPM(ti);
+
+    if (tpm_backend_had_startup_error(s->be_driver)) {
+        return TPM_VERSION_UNSPEC;
+    }
+
+    return tpm_backend_get_tpm_version(s->be_driver);
+}
+
+static const VMStateDescription vmstate_spapr_vtpm = {
+    .name = "tpm-spapr",
+    .unmigratable = 1,
+};
+
+static Property tpm_spapr_properties[] = {
+    DEFINE_SPAPR_PROPERTIES(SPAPRvTPMState, vdev),
+    DEFINE_PROP_TPMBE("tpmdev", SPAPRvTPMState, be_driver),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void tpm_spapr_realizefn(SpaprVioDevice *dev, Error **errp)
+{
+    SPAPRvTPMState *s = VIO_SPAPR_VTPM(dev);
+
+    if (!tpm_find()) {
+        error_setg(errp, "at most one TPM device is permitted");
+        return;
+    }
+
+    dev->crq.SendFunc = tpm_spapr_do_crq;
+
+    if (!s->be_driver) {
+        error_setg(errp, "'tpmdev' property is required");
+        return;
+    }
+}
+
+static void tpm_spapr_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SpaprVioDeviceClass *k = VIO_SPAPR_DEVICE_CLASS(klass);
+    TPMIfClass *tc = TPM_IF_CLASS(klass);
+
+    k->realize = tpm_spapr_realizefn;
+    k->reset = tpm_spapr_reset;
+    k->signal_mask = 0x00000001;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->props = tpm_spapr_properties;
+    k->rtce_window_size = 0x10000000;
+    dc->vmsd = &vmstate_spapr_vtpm;
+
+    tc->model = TPM_MODEL_TPM_SPAPR;
+    tc->get_version = tpm_spapr_get_version;
+    tc->request_completed = tpm_spapr_request_completed;
+}
+
+static const TypeInfo tpm_spapr_info = {
+    .name          = TYPE_TPM_SPAPR,
+    .parent        = TYPE_VIO_SPAPR_DEVICE,
+    .instance_size = sizeof(SPAPRvTPMState),
+    .class_init    = tpm_spapr_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_TPM_IF },
+        { }
+    }
+};
+
+static void tpm_spapr_register_types(void)
+{
+    type_register_static(&tpm_spapr_info);
+}
+
+type_init(tpm_spapr_register_types)
diff --git a/hw/tpm/trace-events b/hw/tpm/trace-events
index 89804bcd64..6278a39618 100644
--- a/hw/tpm/trace-events
+++ b/hw/tpm/trace-events
@@ -55,3 +55,15 @@ tpm_tis_pre_save(uint8_t locty, uint32_t rw_offset) "locty: %d, rw_offset = %u"
 
 # tpm_ppi.c
 tpm_ppi_memset(uint8_t *ptr, size_t size) "memset: %p %zu"
+
+# hw/tpm/tpm_spapr.c
+tpm_spapr_show_buffer(const char *direction, size_t len, const char *buf) "direction: %s len: %zu\n%s"
+tpm_spapr_do_crq(uint8_t raw1, uint8_t raw2) "1st 2 bytes in CRQ: 0x%02x 0x%02x"
+tpm_spapr_do_crq_crq_result(void) "SPAPR_VTPM_INIT_CRQ_RESULT"
+tpm_spapr_do_crq_crq_complete_result(void) "SPAPR_VTPM_INIT_CRQ_COMP_RESULT"
+tpm_spapr_do_crq_tpm_command(void) "got TPM command payload"
+tpm_spapr_do_crq_tpm_get_rtce_buffer_size(size_t buffersize) "response: buffer size is %zu"
+tpm_spapr_do_crq_get_version(uint32_t version) "response: version %u"
+tpm_spapr_do_crq_prepare_to_suspend(void) "response: preparing to suspend"
+tpm_spapr_do_crq_unknown_msg_type(uint8_t type) "Unknown message type 0x%02x"
+tpm_spapr_do_crq_unknown_crq(uint8_t raw1, uint8_t raw2) "unknown CRQ 0x%02x 0x%02x ..."
diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 5b541a71c8..15979a3647 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -45,11 +45,14 @@ typedef struct TPMIfClass {
 
 #define TYPE_TPM_TIS                "tpm-tis"
 #define TYPE_TPM_CRB                "tpm-crb"
+#define TYPE_TPM_SPAPR              "tpm-spapr"
 
 #define TPM_IS_TIS(chr)                             \
     object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS)
 #define TPM_IS_CRB(chr)                             \
     object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
+#define TPM_IS_SPAPR(chr)                           \
+    object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)
 
 /* returns NULL unless there is exactly one TPM device */
 static inline TPMIf *tpm_find(void)
diff --git a/qapi/tpm.json b/qapi/tpm.json
index b30323bb6b..63878aa0f4 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -12,11 +12,11 @@
 #
 # @tpm-tis: TPM TIS model
 # @tpm-crb: TPM CRB model (since 2.12)
+# @tpm-spapr: TPM SPAPR model (since 5.0)
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb' ] }
-
+{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ] }
 ##
 # @query-tpm-models:
 #
@@ -29,7 +29,7 @@
 # Example:
 #
 # -> { "execute": "query-tpm-models" }
-# <- { "return": [ "tpm-tis", "tpm-crb" ] }
+# <- { "return": [ "tpm-tis", "tpm-crb", "tpm-spapr" ] }
 #
 ##
 { 'command': 'query-tpm-models', 'returns': ['TpmModel'] }
-- 
2.21.0


