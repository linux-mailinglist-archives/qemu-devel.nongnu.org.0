Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7110364E02C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 19:03:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5sZk-0002KW-H4; Thu, 15 Dec 2022 13:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5sZd-00029x-Pd
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 13:03:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5sZb-0000YU-9u
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 13:03:13 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFHhei7007111
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 18:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=zEiXSN6gMyRh6ROguTddLyqrOPXbLHt7InD49x5z1mM=;
 b=o8aWmmBVgf54+5f2/sGLX3W4SSpmrahLRT9t3GkvxbB6Sc9uDo9u7t+hXcJcdeJpXuIM
 BpxNiHLj0KmSZmX36iS7Mzh5CsbzRmQzMVe2WYMsZVAk613HKd/WJun9HvcM+t0bXfF/
 0AZ/5Gznb8fWNmE6PZni7DTTzj9dCBvJeFtVI6YdVKuqW1rUMorlXmG4r13ELDE21Cfc
 CRRZJ64mUTvjipHQWQFVZ/zGakJEhRrNaeDUDJKMXAHEMCuPS+IC4aFKP7D8qEJ2YNLb
 nglPgFk1Pypm81PZtR0plflgknqNR/Ye0c/pr0IRFuc3HbGsjo/VFNNeynTYxlEEpgyS hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg87vghde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 18:03:09 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFHox8i013682
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 18:03:09 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg87vghcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 18:03:09 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFHHfjB005722;
 Thu, 15 Dec 2022 18:03:08 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3meyfe01sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 18:03:07 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BFI36vR36372974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Dec 2022 18:03:06 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 296BD58059;
 Thu, 15 Dec 2022 18:03:06 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77BE558055;
 Thu, 15 Dec 2022 18:03:05 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 15 Dec 2022 18:03:05 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 2/2] tpm: add backend for mssim
Date: Thu, 15 Dec 2022 13:01:25 -0500
Message-Id: <20221215180125.24632-3-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221215180125.24632-1-jejb@linux.ibm.com>
References: <20221215180125.24632-1-jejb@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TIzUCddTtefbKOw2d1e7oe0ym5wvHrTi
X-Proofpoint-ORIG-GUID: k-xQ8KcZU8EeYL8f-taBVaujFTCaAnFd
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_10,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150145
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: James Bottomley <James.Bottomley@HansenPartnership.com>

The Microsoft Simulator (mssim) is the reference emulation platform
for the TCG TPM 2.0 specification.

https://github.com/Microsoft/ms-tpm-20-ref.git

It exports a fairly simple network socket baset protocol on two
sockets, one for command (default 2321) and one for control (default
2322).  This patch adds a simple backend that can speak the mssim
protocol over the network.  It also allows the host, and two ports to
be specified on the qemu command line.  The benefits are twofold:
firstly it gives us a backend that actually speaks a standard TPM
emulation protocol instead of the linux specific TPM driver format of
the current emulated TPM backend and secondly, using the microsoft
protocol, the end point of the emulator can be anywhere on the
network, facilitating the cloud use case where a central TPM service
can be used over a control network.

The implementation does basic control commands like power off/on, but
doesn't implement cancellation or startup.  The former because
cancellation is pretty much useless on a fast operating TPM emulator
and the latter because this emulator is designed to be used with OVMF
which itself does TPM startup and I wanted to validate that.

To run this, simply download an emulator based on the MS specification
(package ibmswtpm2 on openSUSE) and run it, then add these two lines
to the qemu command and it will use the emulator.

    -tpmdev mssim,id=tpm0 \
    -device tpm-crb,tpmdev=tpm0 \

to use a remote emulator replace the first line with

    -tpmdev "{'type':'mssim','id':'tpm0','command':{'type':inet,'host':'remote','port':'2321'}}"

tpm-tis also works as the backend.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>

---

v2: convert to SocketAddr json and use qio_channel_socket_connect_sync()
---
 MAINTAINERS              |   5 +
 backends/tpm/Kconfig     |   5 +
 backends/tpm/meson.build |   1 +
 backends/tpm/tpm_mssim.c | 251 +++++++++++++++++++++++++++++++++++++++
 backends/tpm/tpm_mssim.h |  43 +++++++
 monitor/hmp-cmds.c       |   7 ++
 qapi/tpm.json            |  25 +++-
 7 files changed, 334 insertions(+), 3 deletions(-)
 create mode 100644 backends/tpm/tpm_mssim.c
 create mode 100644 backends/tpm/tpm_mssim.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..a4a3bf9ab4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3046,6 +3046,11 @@ F: backends/tpm/
 F: tests/qtest/*tpm*
 T: git https://github.com/stefanberger/qemu-tpm.git tpm-next
 
+MSSIM TPM Backend
+M: James Bottomley <jejb@linux.ibm.com>
+S: Maintained
+F: backends/tpm/tpm_mssim.*
+
 Checkpatch
 S: Odd Fixes
 F: scripts/checkpatch.pl
diff --git a/backends/tpm/Kconfig b/backends/tpm/Kconfig
index 5d91eb89c2..d6d6fa53e9 100644
--- a/backends/tpm/Kconfig
+++ b/backends/tpm/Kconfig
@@ -12,3 +12,8 @@ config TPM_EMULATOR
     bool
     default y
     depends on TPM_BACKEND
+
+config TPM_MSSIM
+    bool
+    default y
+    depends on TPM_BACKEND
diff --git a/backends/tpm/meson.build b/backends/tpm/meson.build
index 7f2503f84e..c7c3c79125 100644
--- a/backends/tpm/meson.build
+++ b/backends/tpm/meson.build
@@ -3,4 +3,5 @@ if have_tpm
   softmmu_ss.add(files('tpm_util.c'))
   softmmu_ss.add(when: 'CONFIG_TPM_PASSTHROUGH', if_true: files('tpm_passthrough.c'))
   softmmu_ss.add(when: 'CONFIG_TPM_EMULATOR', if_true: files('tpm_emulator.c'))
+  softmmu_ss.add(when: 'CONFIG_TPM_MSSIM', if_true: files('tpm_mssim.c'))
 endif
diff --git a/backends/tpm/tpm_mssim.c b/backends/tpm/tpm_mssim.c
new file mode 100644
index 0000000000..7c10ce2944
--- /dev/null
+++ b/backends/tpm/tpm_mssim.c
@@ -0,0 +1,251 @@
+/*
+ * Emulator TPM driver which connects over the mssim protocol
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2022
+ * Author: James Bottomley <jejb@linux.ibm.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/sockets.h"
+
+#include "qapi/clone-visitor.h"
+#include "qapi/qapi-visit-tpm.h"
+
+#include "io/channel-socket.h"
+
+#include "sysemu/tpm_backend.h"
+#include "sysemu/tpm_util.h"
+
+#include "qom/object.h"
+
+#include "tpm_int.h"
+#include "tpm_mssim.h"
+
+#define ERROR_PREFIX "TPM mssim Emulator: "
+
+#define TYPE_TPM_MSSIM "tpm-mssim"
+OBJECT_DECLARE_SIMPLE_TYPE(TPMmssim, TPM_MSSIM)
+
+struct TPMmssim {
+    TPMBackend parent;
+
+    TpmTypeOptions *opts;
+
+    QIOChannelSocket *cmd_qc, *ctrl_qc;
+};
+
+static int tpm_send_ctrl(TPMmssim *t, uint32_t cmd, Error **errp)
+{
+    int ret;
+
+    cmd = htonl(cmd);
+    ret = qio_channel_write_all(QIO_CHANNEL(t->ctrl_qc), (char *)&cmd, sizeof(cmd), errp);
+    if (ret != 0)
+        return ret;
+    ret = qio_channel_read_all(QIO_CHANNEL(t->ctrl_qc), (char *)&cmd, sizeof(cmd), errp);
+    if (ret != 0)
+        return ret;
+    if (cmd != 0) {
+        error_setg(errp, ERROR_PREFIX "Incorrect ACK recieved on control channel 0x%x\n", cmd);
+        return -1;
+    }
+    return 0;
+}
+
+static void tpm_mssim_instance_init(Object *obj)
+{
+}
+
+static void tpm_mssim_instance_finalize(Object *obj)
+{
+    TPMmssim *t = TPM_MSSIM(obj);
+
+    if (t->ctrl_qc)
+        tpm_send_ctrl(t, TPM_SIGNAL_POWER_OFF, NULL);
+
+    object_unref(OBJECT(t->ctrl_qc));
+    object_unref(OBJECT(t->cmd_qc));
+}
+
+static void tpm_mssim_cancel_cmd(TPMBackend *tb)
+{
+        return;
+}
+
+static TPMVersion tpm_mssim_get_version(TPMBackend *tb)
+{
+    return TPM_VERSION_2_0;
+}
+
+static size_t tpm_mssim_get_buffer_size(TPMBackend *tb)
+{
+    /* TCG standard profile max buffer size */
+    return 4096;
+}
+
+static TpmTypeOptions *tpm_mssim_get_opts(TPMBackend *tb)
+{
+    TPMmssim *t = TPM_MSSIM(tb);
+    TpmTypeOptions *opts;
+
+    opts = QAPI_CLONE(TpmTypeOptions, t->opts);
+
+    return opts;
+}
+
+static void tpm_mssim_handle_request(TPMBackend *tb, TPMBackendCmd *cmd,
+                                     Error **errp)
+{
+    TPMmssim *t = TPM_MSSIM(tb);
+    uint32_t header, len;
+    uint8_t locality = cmd->locty;
+    struct iovec iov[4];
+    int ret;
+
+    header = htonl(TPM_SEND_COMMAND);
+    len = htonl(cmd->in_len);
+
+    iov[0].iov_base = &header;
+    iov[0].iov_len = sizeof(header);
+    iov[1].iov_base = &locality;
+    iov[1].iov_len = sizeof(locality);
+    iov[2].iov_base = &len;
+    iov[2].iov_len = sizeof(len);
+    iov[3].iov_base = (void *)cmd->in;
+    iov[3].iov_len = cmd->in_len;
+
+    ret = qio_channel_writev_all(QIO_CHANNEL(t->cmd_qc), iov, 4, errp);
+    if (ret != 0)
+        goto fail;
+
+    ret = qio_channel_read_all(QIO_CHANNEL(t->cmd_qc), (char *)&len, sizeof(len), errp);
+    if (ret != 0)
+        goto fail;
+    len = ntohl(len);
+    if (len > cmd->out_len) {
+        error_setg(errp, "receive size is too large");
+        goto fail;
+    }
+    ret = qio_channel_read_all(QIO_CHANNEL(t->cmd_qc), (char *)cmd->out, len, errp);
+    if (ret != 0)
+        goto fail;
+    /* ACK packet */
+    ret = qio_channel_read_all(QIO_CHANNEL(t->cmd_qc), (char *)&header, sizeof(header), errp);
+    if (ret != 0)
+        goto fail;
+    if (header != 0) {
+        error_setg(errp, "incorrect ACK received on command channel 0x%x", len);
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    error_prepend(errp, ERROR_PREFIX);
+    tpm_util_write_fatal_error_response(cmd->out, cmd->out_len);
+}
+
+static TPMBackend *tpm_mssim_create(TpmTypeOptions *opts)
+{
+    TPMBackend *be = TPM_BACKEND(object_new(TYPE_TPM_MSSIM));
+    TPMmssim *t = TPM_MSSIM(be);
+    int sock;
+    Error *errp = NULL;
+    TPMmssimOptions *mo = &opts->u.mssim;
+
+    t->opts = opts;
+    if (!mo->has_command) {
+            mo->has_command = true;
+            mo->command = g_new0(SocketAddress, 1);
+            mo->command->type = SOCKET_ADDRESS_TYPE_INET;
+            mo->command->u.inet.host = g_strdup("localhost");
+            mo->command->u.inet.port = g_strdup("2321");
+    }
+    if (!mo->has_control) {
+            mo->has_control = true;
+            mo->control = g_new0(SocketAddress, 1);
+            mo->control->type = SOCKET_ADDRESS_TYPE_INET;
+            mo->control->u.inet.host = g_strdup(mo->command->u.inet.host);
+            mo->control->u.inet.port = g_strdup("2322");
+    }
+
+    t->cmd_qc = qio_channel_socket_new();
+    t->ctrl_qc = qio_channel_socket_new();
+
+    if (qio_channel_socket_connect_sync(t->cmd_qc, mo->command, &errp) < 0)
+        goto fail;
+
+    if (qio_channel_socket_connect_sync(t->ctrl_qc, mo->control, &errp) < 0)
+        goto fail;
+
+    /* reset the TPM using a power cycle sequence, in case someone
+     * has previously powered it up */
+    sock = tpm_send_ctrl(t, TPM_SIGNAL_POWER_OFF, &errp);
+    if (sock != 0)
+        goto fail;
+    sock = tpm_send_ctrl(t, TPM_SIGNAL_POWER_ON, &errp);
+    if (sock != 0)
+        goto fail;
+    sock = tpm_send_ctrl(t, TPM_SIGNAL_NV_ON, &errp);
+    if (sock != 0)
+        goto fail;
+
+    return be;
+
+ fail:
+    object_unref(OBJECT(t->ctrl_qc));
+    object_unref(OBJECT(t->cmd_qc));
+    t->ctrl_qc = NULL;
+    error_prepend(&errp, ERROR_PREFIX);
+    error_report_err(errp);
+    object_unref(OBJECT(be));
+
+    return NULL;
+}
+
+static const QemuOptDesc tpm_mssim_cmdline_opts[] = {
+    TPM_STANDARD_CMDLINE_OPTS,
+    {
+        .name = "command",
+        .type = QEMU_OPT_STRING,
+        .help = "Command socket (default localhost:2321)",
+    },
+    {
+        .name = "control",
+        .type = QEMU_OPT_STRING,
+        .help = "control socket (default localhost:2322)",
+    },
+};
+
+static void tpm_mssim_class_init(ObjectClass *klass, void *data)
+{
+    TPMBackendClass *cl = TPM_BACKEND_CLASS(klass);
+
+    cl->type = TPM_TYPE_MSSIM;
+    cl->opts = tpm_mssim_cmdline_opts;
+    cl->desc = "TPM mssim emulator backend driver";
+    cl->create = tpm_mssim_create;
+    cl->cancel_cmd = tpm_mssim_cancel_cmd;
+    cl->get_tpm_version = tpm_mssim_get_version;
+    cl->get_buffer_size = tpm_mssim_get_buffer_size;
+    cl->get_tpm_options = tpm_mssim_get_opts;
+    cl->handle_request = tpm_mssim_handle_request;
+}
+
+static const TypeInfo tpm_mssim_info = {
+    .name = TYPE_TPM_MSSIM,
+    .parent = TYPE_TPM_BACKEND,
+    .instance_size = sizeof(TPMmssim),
+    .class_init = tpm_mssim_class_init,
+    .instance_init = tpm_mssim_instance_init,
+    .instance_finalize = tpm_mssim_instance_finalize,
+};
+
+static void tpm_mssim_register(void)
+{
+    type_register_static(&tpm_mssim_info);
+}
+
+type_init(tpm_mssim_register)
diff --git a/backends/tpm/tpm_mssim.h b/backends/tpm/tpm_mssim.h
new file mode 100644
index 0000000000..04a270338a
--- /dev/null
+++ b/backends/tpm/tpm_mssim.h
@@ -0,0 +1,43 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * The code below is copied from the Microsoft/TCG Reference implementation
+ *
+ *  https://github.com/Microsoft/ms-tpm-20-ref.git
+ *
+ * In file TPMCmd/Simulator/include/TpmTcpProtocol.h
+ */
+
+#define TPM_SIGNAL_POWER_ON         1
+#define TPM_SIGNAL_POWER_OFF        2
+#define TPM_SIGNAL_PHYS_PRES_ON     3
+#define TPM_SIGNAL_PHYS_PRES_OFF    4
+#define TPM_SIGNAL_HASH_START       5
+#define TPM_SIGNAL_HASH_DATA        6
+        // {uint32_t BufferSize, uint8_t[BufferSize] Buffer}
+#define TPM_SIGNAL_HASH_END         7
+#define TPM_SEND_COMMAND            8
+        // {uint8_t Locality, uint32_t InBufferSize, uint8_t[InBufferSize] InBuffer} ->
+        //     {uint32_t OutBufferSize, uint8_t[OutBufferSize] OutBuffer}
+
+#define TPM_SIGNAL_CANCEL_ON        9
+#define TPM_SIGNAL_CANCEL_OFF       10
+#define TPM_SIGNAL_NV_ON            11
+#define TPM_SIGNAL_NV_OFF           12
+#define TPM_SIGNAL_KEY_CACHE_ON     13
+#define TPM_SIGNAL_KEY_CACHE_OFF    14
+
+#define TPM_REMOTE_HANDSHAKE        15
+#define TPM_SET_ALTERNATIVE_RESULT  16
+
+#define TPM_SIGNAL_RESET            17
+#define TPM_SIGNAL_RESTART          18
+
+#define TPM_SESSION_END             20
+#define TPM_STOP                    21
+
+#define TPM_GET_COMMAND_RESPONSE_SIZES  25
+
+#define TPM_ACT_GET_SIGNALED        26
+
+#define TPM_TEST_FAILURE_MODE       30
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e99447ad68..319f9eeeb6 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -841,6 +841,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
     unsigned int c = 0;
     TPMPassthroughOptions *tpo;
     TPMEmulatorOptions *teo;
+    TPMmssimOptions *tmo;
 
     info_list = qmp_query_tpm(&err);
     if (err) {
@@ -874,6 +875,12 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
             teo = &ti->options->u.emulator;
             monitor_printf(mon, ",chardev=%s", teo->chardev);
             break;
+        case TPM_TYPE_MSSIM:
+            tmo = &ti->options->u.mssim;
+            monitor_printf(mon, ",command=%s:%s,control=%s:%s",
+                           tmo->command->u.inet.host, tmo->command->u.inet.port,
+                           tmo->control->u.inet.host, tmo->control->u.inet.port);
+            break;
         case TPM_TYPE__MAX:
             break;
         }
diff --git a/qapi/tpm.json b/qapi/tpm.json
index d8cbd5ea0e..b773bde2ff 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -5,6 +5,7 @@
 ##
 # = TPM (trusted platform module) devices
 ##
+{ 'include': 'sockets.json' }
 
 ##
 # @TpmModel:
@@ -49,7 +50,7 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ],
+{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator', 'mssim' ],
   'if': 'CONFIG_TPM' }
 
 ##
@@ -64,7 +65,7 @@
 # Example:
 #
 # -> { "execute": "query-tpm-types" }
-# <- { "return": [ "passthrough", "emulator" ] }
+# <- { "return": [ "passthrough", "emulator", "mssim" ] }
 #
 ##
 { 'command': 'query-tpm-types', 'returns': ['TpmType'],
@@ -99,6 +100,22 @@
 { 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
   'if': 'CONFIG_TPM' }
 
+##
+# @TPMmssimOptions:
+#
+# Information for the mssim emulator connection
+#
+# @command: command socket for the TPM emulator
+# @control: control socket for the TPM emulator
+#
+# Since: 7.2.0
+##
+{ 'struct': 'TPMmssimOptions',
+  'data': {
+      '*command': 'SocketAddress',
+      '*control': 'SocketAddress' },
+  'if': 'CONFIG_TPM' }
+
 ##
 # @TpmTypeOptions:
 #
@@ -107,6 +124,7 @@
 # @id: identifier of the backend
 # @type: - 'passthrough' The configuration options for the TPM passthrough type
 #        - 'emulator' The configuration options for TPM emulator backend type
+#        - 'mssim' The configuration options for TPM emulator mssim type
 #
 # Since: 1.5
 ##
@@ -115,7 +133,8 @@
             'id': 'str' },
   'discriminator': 'type',
   'data': { 'passthrough' : 'TPMPassthroughOptions',
-            'emulator': 'TPMEmulatorOptions' },
+            'emulator': 'TPMEmulatorOptions',
+            'mssim': 'TPMmssimOptions' },
   'if': 'CONFIG_TPM' }
 
 ##
-- 
2.35.3


