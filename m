Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2114409C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 16:37:14 +0100 (CET)
Received: from localhost ([::1]:56826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itvab-0007Kt-S3
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 10:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1itvTP-0007n8-US
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:29:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1itvTM-0003s4-Ev
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:29:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48652
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1itvTM-0003rB-9G; Tue, 21 Jan 2020 10:29:44 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LFDZci183114; Tue, 21 Jan 2020 10:29:39 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xmg3b537s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 10:29:39 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00LFEve1193466;
 Tue, 21 Jan 2020 10:29:38 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xmg3b537c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 10:29:38 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00LFSCnK014879;
 Tue, 21 Jan 2020 15:29:38 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 2xksn64nx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 15:29:38 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00LFTb1D37618110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 15:29:37 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 745FE2805E;
 Tue, 21 Jan 2020 15:29:37 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51BDE2805A;
 Tue, 21 Jan 2020 15:29:37 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jan 2020 15:29:37 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v9 3/6] tpm_spapr: Support TPM for ppc64 using CRQ based
 interface
Date: Tue, 21 Jan 2020 10:29:32 -0500
Message-Id: <20200121152935.649898-4-stefanb@linux.ibm.com>
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
 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=1
 lowpriorityscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001210123
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

Implement support for TPM on ppc64 by implementing the vTPM CRQ interface
as a frontend. It can use the tpm_emulator driver backend with the external
swtpm.

The Linux vTPM driver for ppc64 works with this emulation.

This TPM emulator also handles the TPM 2 case.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 docs/specs/tpm.txt   |  20 ++-
 hw/tpm/Kconfig       |   6 +
 hw/tpm/Makefile.objs |   1 +
 hw/tpm/tpm_spapr.c   | 379 +++++++++++++++++++++++++++++++++++++++++++
 hw/tpm/trace-events  |  12 ++
 include/sysemu/tpm.h |   3 +
 qapi/tpm.json        |   6 +-
 7 files changed, 423 insertions(+), 4 deletions(-)
 create mode 100644 hw/tpm/tpm_spapr.c

diff --git a/docs/specs/tpm.txt b/docs/specs/tpm.txt
index 9c8cca042d..9c3e67d8a7 100644
--- a/docs/specs/tpm.txt
+++ b/docs/specs/tpm.txt
@@ -34,6 +34,12 @@ The CRB interface makes a memory mapped IO region in the area 0xfed40000 -
 QEMU files related to TPM CRB interface:
  - hw/tpm/tpm_crb.c
 
+
+pSeries (ppc64) machines offer a tpm-spapr device model.
+
+QEMU files related to the SPAPR interface:
+ - hw/tpm/tpm_spapr.c
+
 = fw_cfg interface =
 
 The bios/firmware may read the "etc/tpm/config" fw_cfg entry for
@@ -281,7 +287,7 @@ swtpm socket --tpmstate dir=/tmp/mytpm1 \
   --log level=20
 
 Command line to start QEMU with the TPM emulator device communicating with
-the swtpm:
+the swtpm (x86):
 
 qemu-system-x86_64 -display sdl -accel kvm \
   -m 1024 -boot d -bios bios-256k.bin -boot menu=on \
@@ -289,6 +295,18 @@ qemu-system-x86_64 -display sdl -accel kvm \
   -tpmdev emulator,id=tpm0,chardev=chrtpm \
   -device tpm-tis,tpmdev=tpm0 test.img
 
+In case a pSeries machine is emulated, use the following command line:
+
+qemu-system-ppc64 -display sdl -machine pseries,accel=kvm \
+  -m 1024 -bios slof.bin -boot menu=on \
+  -nodefaults -device VGA -device pci-ohci -device usb-kbd \
+  -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
+  -tpmdev emulator,id=tpm0,chardev=chrtpm \
+  -device tpm-spapr,tpmdev=tpm0 \
+  -device spapr-vscsi,id=scsi0,reg=0x00002000 \
+  -device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x3,drive=drive-virtio-disk0,id=virtio-disk0 \
+  -drive file=test.img,format=raw,if=none,id=drive-virtio-disk0
+
 
 In case SeaBIOS is used as firmware, it should show the TPM menu item
 after entering the menu with 'ESC'.
diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
index 4c8ee87d67..66a570aac1 100644
--- a/hw/tpm/Kconfig
+++ b/hw/tpm/Kconfig
@@ -22,3 +22,9 @@ config TPM_EMULATOR
     bool
     default y
     depends on TPMDEV
+
+config TPM_SPAPR
+    bool
+    default n
+    select TPMDEV
+    depends on PSERIES
diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
index de0b85d02a..85eb99ae05 100644
--- a/hw/tpm/Makefile.objs
+++ b/hw/tpm/Makefile.objs
@@ -4,3 +4,4 @@ common-obj-$(CONFIG_TPM_TIS) += tpm_tis.o
 common-obj-$(CONFIG_TPM_CRB) += tpm_crb.o
 common-obj-$(CONFIG_TPM_PASSTHROUGH) += tpm_passthrough.o
 common-obj-$(CONFIG_TPM_EMULATOR) += tpm_emulator.o
+obj-$(CONFIG_TPM_SPAPR) += tpm_spapr.o
diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
new file mode 100644
index 0000000000..1db9696ae0
--- /dev/null
+++ b/hw/tpm/tpm_spapr.c
@@ -0,0 +1,379 @@
+/*
+ * QEMU PowerPC pSeries Logical Partition (aka sPAPR) hardware System Emulator
+ *
+ * PAPR Virtual TPM
+ *
+ * Copyright (c) 2015, 2017, 2019 IBM Corporation.
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
+     OBJECT_CHECK(SpaprTpmState, (obj), TYPE_TPM_SPAPR)
+
+typedef struct TpmCrq {
+    uint8_t valid;  /* 0x80: cmd; 0xc0: init crq */
+                    /* 0x81-0x83: CRQ message response */
+    uint8_t msg;    /* see below */
+    uint16_t len;   /* len of TPM request; len of TPM response */
+    uint32_t data;  /* rtce_dma_handle when sending TPM request */
+    uint64_t reserved;
+} TpmCrq;
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
+#define TPM_SPAPR_BUFFER_MAX                 4096
+
+typedef struct {
+    SpaprVioDevice vdev;
+
+    TpmCrq crq; /* track single TPM command */
+
+    uint8_t state;
+#define SPAPR_VTPM_STATE_NONE         0
+#define SPAPR_VTPM_STATE_EXECUTION    1
+#define SPAPR_VTPM_STATE_COMPLETION   2
+
+    unsigned char *buffer;
+
+    TPMBackendCmd cmd;
+
+    TPMBackend *be_driver;
+    TPMVersion be_tpm_version;
+
+    size_t be_buffer_size;
+} SpaprTpmState;
+
+/*
+ * Send a request to the TPM.
+ */
+static void tpm_spapr_tpm_send(SpaprTpmState *s)
+{
+    if (trace_event_get_state_backends(TRACE_TPM_SPAPR_SHOW_BUFFER)) {
+        tpm_util_show_buffer(s->buffer, s->be_buffer_size, "To TPM");
+    }
+
+    s->state = SPAPR_VTPM_STATE_EXECUTION;
+    s->cmd = (TPMBackendCmd) {
+        .locty = 0,
+        .in = s->buffer,
+        .in_len = MIN(tpm_cmd_get_size(s->buffer), s->be_buffer_size),
+        .out = s->buffer,
+        .out_len = s->be_buffer_size,
+    };
+
+    tpm_backend_deliver_request(s->be_driver, &s->cmd);
+}
+
+static int tpm_spapr_process_cmd(SpaprTpmState *s, uint64_t dataptr)
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
+static inline int spapr_tpm_send_crq(struct SpaprVioDevice *dev, TpmCrq *crq)
+{
+    return spapr_vio_send_crq(dev, (uint8_t *)crq);
+}
+
+static int tpm_spapr_do_crq(struct SpaprVioDevice *dev, uint8_t *crq_data)
+{
+    SpaprTpmState *s = VIO_SPAPR_VTPM(dev);
+    TpmCrq local_crq;
+    TpmCrq *crq = &s->crq; /* requests only */
+    int rc;
+    uint8_t valid = crq_data[0];
+    uint8_t msg = crq_data[1];
+
+    trace_tpm_spapr_do_crq(valid, msg);
+
+    switch (valid) {
+    case SPAPR_VTPM_VALID_INIT_CRQ_COMMAND: /* Init command/response */
+
+        /* Respond to initialization request */
+        switch (msg) {
+        case SPAPR_VTPM_INIT_CRQ_RESULT:
+            trace_tpm_spapr_do_crq_crq_result();
+            memset(&local_crq, 0, sizeof(local_crq));
+            local_crq.valid = SPAPR_VTPM_VALID_INIT_CRQ_COMMAND;
+            local_crq.msg = SPAPR_VTPM_INIT_CRQ_RESULT;
+            spapr_tpm_send_crq(dev, &local_crq);
+            break;
+
+        case SPAPR_VTPM_INIT_CRQ_COMPLETE_RESULT:
+            trace_tpm_spapr_do_crq_crq_complete_result();
+            memset(&local_crq, 0, sizeof(local_crq));
+            local_crq.valid = SPAPR_VTPM_VALID_INIT_CRQ_COMMAND;
+            local_crq.msg = SPAPR_VTPM_INIT_CRQ_COMPLETE_RESULT;
+            spapr_tpm_send_crq(dev, &local_crq);
+            break;
+        }
+
+        break;
+    case SPAPR_VTPM_VALID_COMMAND: /* Payloads */
+        switch (msg) {
+        case SPAPR_VTPM_TPM_COMMAND:
+            trace_tpm_spapr_do_crq_tpm_command();
+            if (s->state == SPAPR_VTPM_STATE_EXECUTION) {
+                return H_BUSY;
+            }
+            memcpy(crq, crq_data, sizeof(*crq));
+
+            rc = tpm_spapr_process_cmd(s, be32_to_cpu(crq->data));
+
+            if (rc == H_SUCCESS) {
+                crq->valid = be16_to_cpu(0);
+            } else {
+                local_crq.valid = SPAPR_VTPM_MSG_RESULT;
+                local_crq.msg = SPAPR_VTPM_VTPM_ERROR;
+                local_crq.len = cpu_to_be16(0);
+                local_crq.data = cpu_to_be32(SPAPR_VTPM_ERR_COPY_IN_FAILED);
+                spapr_tpm_send_crq(dev, &local_crq);
+            }
+            break;
+
+        case SPAPR_VTPM_GET_RTCE_BUFFER_SIZE:
+            trace_tpm_spapr_do_crq_tpm_get_rtce_buffer_size(s->be_buffer_size);
+            local_crq.valid = SPAPR_VTPM_VALID_COMMAND;
+            local_crq.msg = SPAPR_VTPM_GET_RTCE_BUFFER_SIZE |
+                            SPAPR_VTPM_MSG_RESULT;
+            local_crq.len = cpu_to_be16(s->be_buffer_size);
+            spapr_tpm_send_crq(dev, &local_crq);
+            break;
+
+        case SPAPR_VTPM_GET_VERSION:
+            local_crq.valid = SPAPR_VTPM_VALID_COMMAND;
+            local_crq.msg = SPAPR_VTPM_GET_VERSION | SPAPR_VTPM_MSG_RESULT;
+            local_crq.len = cpu_to_be16(0);
+            switch (s->be_tpm_version) {
+            case TPM_VERSION_1_2:
+                local_crq.data = cpu_to_be32(1);
+                break;
+            case TPM_VERSION_2_0:
+                local_crq.data = cpu_to_be32(2);
+                break;
+            default:
+                g_assert_not_reached();
+                break;
+            }
+            trace_tpm_spapr_do_crq_get_version(be32_to_cpu(local_crq.data));
+            spapr_tpm_send_crq(dev, &local_crq);
+            break;
+
+        case SPAPR_VTPM_PREPARE_TO_SUSPEND:
+            trace_tpm_spapr_do_crq_prepare_to_suspend();
+            local_crq.valid = SPAPR_VTPM_VALID_COMMAND;
+            local_crq.msg = SPAPR_VTPM_PREPARE_TO_SUSPEND |
+                            SPAPR_VTPM_MSG_RESULT;
+            spapr_tpm_send_crq(dev, &local_crq);
+            break;
+
+        default:
+            trace_tpm_spapr_do_crq_unknown_msg_type(crq->msg);
+        }
+        break;
+    default:
+        trace_tpm_spapr_do_crq_unknown_crq(valid, msg);
+    };
+
+    return H_SUCCESS;
+}
+
+static void tpm_spapr_request_completed(TPMIf *ti, int ret)
+{
+    SpaprTpmState *s = VIO_SPAPR_VTPM(ti);
+    TpmCrq *crq = &s->crq;
+    uint32_t len;
+    int rc;
+
+    s->state = SPAPR_VTPM_STATE_COMPLETION;
+
+    /* a max. of be_buffer_size bytes can be transported */
+    len = MIN(tpm_cmd_get_size(s->buffer), s->be_buffer_size);
+    rc = spapr_vio_dma_write(&s->vdev, be32_to_cpu(crq->data),
+                             s->buffer, len);
+
+    if (trace_event_get_state_backends(TRACE_TPM_SPAPR_SHOW_BUFFER)) {
+        tpm_util_show_buffer(s->buffer, len, "From TPM");
+    }
+
+    crq->valid = SPAPR_VTPM_MSG_RESULT;
+    if (rc == H_SUCCESS) {
+        crq->msg = SPAPR_VTPM_TPM_COMMAND | SPAPR_VTPM_MSG_RESULT;
+        crq->len = cpu_to_be16(len);
+    } else {
+        error_report("%s: DMA write failure", __func__);
+        crq->msg = SPAPR_VTPM_VTPM_ERROR;
+        crq->len = cpu_to_be16(0);
+        crq->data = cpu_to_be32(SPAPR_VTPM_ERR_COPY_OUT_FAILED);
+    }
+
+    rc = spapr_tpm_send_crq(&s->vdev, crq);
+    if (rc) {
+        error_report("%s: Error sending response", __func__);
+    }
+}
+
+static int tpm_spapr_do_startup_tpm(SpaprTpmState *s, size_t buffersize)
+{
+    return tpm_backend_startup_tpm(s->be_driver, buffersize);
+}
+
+static const char *tpm_spapr_get_dt_compatible(SpaprVioDevice *dev)
+{
+    SpaprTpmState *s = VIO_SPAPR_VTPM(dev);
+
+    switch (s->be_tpm_version) {
+    case TPM_VERSION_1_2:
+        return "IBM,vtpm";
+    case TPM_VERSION_2_0:
+        return "IBM,vtpm20";
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tpm_spapr_reset(SpaprVioDevice *dev)
+{
+    SpaprTpmState *s = VIO_SPAPR_VTPM(dev);
+
+    s->state = SPAPR_VTPM_STATE_NONE;
+
+    s->be_tpm_version = tpm_backend_get_tpm_version(s->be_driver);
+
+    s->be_buffer_size = MIN(tpm_backend_get_buffer_size(s->be_driver),
+                            TPM_SPAPR_BUFFER_MAX);
+
+    tpm_backend_reset(s->be_driver);
+    tpm_spapr_do_startup_tpm(s, s->be_buffer_size);
+}
+
+static enum TPMVersion tpm_spapr_get_version(TPMIf *ti)
+{
+    SpaprTpmState *s = VIO_SPAPR_VTPM(ti);
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
+    DEFINE_SPAPR_PROPERTIES(SpaprTpmState, vdev),
+    DEFINE_PROP_TPMBE("tpmdev", SpaprTpmState, be_driver),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void tpm_spapr_realizefn(SpaprVioDevice *dev, Error **errp)
+{
+    SpaprTpmState *s = VIO_SPAPR_VTPM(dev);
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
+    s->buffer = g_malloc(TPM_SPAPR_BUFFER_MAX);
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
+    k->dt_name = "vtpm";
+    k->dt_type = "IBM,vtpm";
+    k->get_dt_compatible = tpm_spapr_get_dt_compatible;
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
+    .instance_size = sizeof(SpaprTpmState),
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
index 357c9e9a84..9143a8eaa3 100644
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
2.24.1


