Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE13C648FE3
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 18:12:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p43Mz-0000CM-9Q; Sat, 10 Dec 2022 12:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p43Mt-000084-I2
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 12:10:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p43Mp-00067J-Qi
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 12:10:31 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BABKxfO009710
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 17:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dP9GwVrOp2Sz6WqNceRYyVFA+Y7sfqsvZKddhmMl0f8=;
 b=mrnLQTPACq8SlofFwHoNdV5b0ZsvsW/2MUL9AiUnFnOxHUW6prg7hUXuVlD6PSMxiFp8
 GZr76+OyVJ0oWun76/qNTI9cIvn8OUyw8JWZN0kVya57Gbw9y9Wx+KqJ5kcUGdKC4h/d
 YOV43VOmC8jF+F2lUA6RvQA/ts8bHzIA9fJULKhPWRpniD2N3HgAA9ZPIejqKPjpi7vv
 rYIFfeQAxD9fIkL2y2EezhRolxb56qwoMbICKmlmc0FkTKqhfrirkFfbngPx/DjIg+Oa
 JPUEyfhx0JFZMU0/ndYADZaAHVN8zaLXIHPmD00FIf8nkdwBqqIPmzivTnjBqkSTBOUF QQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mcjrd2cnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 17:10:23 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BAGeVBk004398
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 17:10:22 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mchr633db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 17:10:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BAHAKcq2032290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 10 Dec 2022 17:10:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DB037805F;
 Sat, 10 Dec 2022 18:25:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A31E7805C;
 Sat, 10 Dec 2022 18:25:55 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.25.229])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 10 Dec 2022 18:25:55 +0000 (GMT)
Message-ID: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
Subject: [PATCH] tpm: add backend for mssim
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.ibm.com>
Date: Sat, 10 Dec 2022 12:10:18 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t5Pf76m_biiI2q_pbRuGAyb61qR7JcRJ
X-Proofpoint-ORIG-GUID: t5Pf76m_biiI2q_pbRuGAyb61qR7JcRJ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-10_06,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212100155
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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

    -tpmdev mssim,it=tpm0,host=remote.host,port=4455,ctrl=4457 \

tpm-tis also works as the backend.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>
---
 backends/tpm/Kconfig     |   5 +
 backends/tpm/meson.build |   1 +
 backends/tpm/tpm_mssim.c | 266 +++++++++++++++++++++++++++++++++++++++
 backends/tpm/tpm_mssim.h |  43 +++++++
 monitor/hmp-cmds.c       |   6 +
 qapi/tpm.json            |  35 +++++-
 6 files changed, 353 insertions(+), 3 deletions(-)
 create mode 100644 backends/tpm/tpm_mssim.c
 create mode 100644 backends/tpm/tpm_mssim.h

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
index 0000000000..6864b1fbc0
--- /dev/null
+++ b/backends/tpm/tpm_mssim.c
@@ -0,0 +1,266 @@
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
+    TPMmssimOptions opts;
+
+    QIOChannel *cmd_qc, *ctrl_qc;
+};
+
+static int tpm_send_ctrl(TPMmssim *t, uint32_t cmd, Error **errp)
+{
+    int ret;
+
+    cmd = htonl(cmd);
+    ret = qio_channel_write_all(t->ctrl_qc, (char *)&cmd, sizeof(cmd), errp);
+    if (ret != 0)
+        return ret;
+    ret = qio_channel_read_all(t->ctrl_qc, (char *)&cmd, sizeof(cmd), errp);
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
+    tpm_send_ctrl(t, TPM_SIGNAL_POWER_OFF, NULL);
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
+    TpmTypeOptions *opts = g_new0(TpmTypeOptions, 1);
+
+    opts->type = TPM_TYPE_MSSIM;
+    opts->u.mssim.data = QAPI_CLONE(TPMmssimOptions, &t->opts);
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
+    ret = qio_channel_writev_all(t->cmd_qc, iov, 4, errp);
+    if (ret != 0)
+        goto fail;
+
+    ret = qio_channel_read_all(t->cmd_qc, (char *)&len, sizeof(len), errp);
+    if (ret != 0)
+        goto fail;
+    len = ntohl(len);
+    if (len > cmd->out_len) {
+        error_setg(errp, "receive size is too large");
+        goto fail;
+    }
+    ret = qio_channel_read_all(t->cmd_qc, (char *)cmd->out, len, errp);
+    if (ret != 0)
+        goto fail;
+    /* ACK packet */
+    ret = qio_channel_read_all(t->cmd_qc, (char *)&header, sizeof(header), errp);
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
+static TPMBackend *tpm_mssim_create(QemuOpts *opts)
+{
+    TPMBackend *be = TPM_BACKEND(object_new(TYPE_TPM_MSSIM));
+    TPMmssim *t = TPM_MSSIM(be);
+    InetSocketAddress cmd_s, ctl_s;
+    int sock;
+    const char *host, *port, *ctrl;
+    Error *errp = NULL;
+
+    host = qemu_opt_get(opts, "host");
+    if (!host)
+        host = "localhost";
+    t->opts.host = g_strdup(host);
+
+    port = qemu_opt_get(opts, "port");
+    if (!port)
+        port = "2321";
+    t->opts.port = g_strdup(port);
+
+    ctrl = qemu_opt_get(opts, "ctrl");
+    if (!ctrl)
+        ctrl = "2322";
+    t->opts.ctrl = g_strdup(ctrl);
+
+    cmd_s.host = (char *)host;
+    cmd_s.port = (char *)port;
+
+    ctl_s.host = (char *)host;
+    ctl_s.port = (char *)ctrl;
+
+    sock = inet_connect_saddr(&cmd_s, &errp);
+    if (sock < 0)
+        goto fail;
+    t->cmd_qc = QIO_CHANNEL(qio_channel_socket_new_fd(sock, &errp));
+    if (errp)
+        goto fail;
+    sock = inet_connect_saddr(&ctl_s, &errp);
+    if (sock < 0)
+        goto fail_unref_cmd;
+    t->ctrl_qc = QIO_CHANNEL(qio_channel_socket_new_fd(sock, &errp));
+    if (errp)
+        goto fail_unref_cmd;
+
+    /* reset the TPM using a power cycle sequence, in case someone
+     * has previously powered it up */
+    sock = tpm_send_ctrl(t, TPM_SIGNAL_POWER_OFF, &errp);
+    if (sock != 0)
+        goto fail_unref;
+    sock = tpm_send_ctrl(t, TPM_SIGNAL_POWER_ON, &errp);
+    if (sock != 0)
+        goto fail_unref;
+    sock = tpm_send_ctrl(t, TPM_SIGNAL_NV_ON, &errp);
+    if (sock != 0)
+        goto fail_unref;
+
+    return be;
+ fail_unref:
+    object_unref(OBJECT(t->ctrl_qc));
+ fail_unref_cmd:
+    object_unref(OBJECT(t->cmd_qc));
+ fail:
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
+        .name = "host",
+        .type = QEMU_OPT_STRING,
+        .help = "name or IP address of host to connect to (deault localhost)",
+    },
+    {
+        .name = "port",
+        .type = QEMU_OPT_STRING,
+        .help = "port number for standard TPM commands (default 2321)",
+    },
+    {
+        .name = "ctrl",
+        .type = QEMU_OPT_STRING,
+        .help = "control port for TPM commands (default 2322)",
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
index 01b789a79e..f4cd030eab 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -841,6 +841,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
     unsigned int c = 0;
     TPMPassthroughOptions *tpo;
     TPMEmulatorOptions *teo;
+    TPMmssimOptions *tmo;
 
     info_list = qmp_query_tpm(&err);
     if (err) {
@@ -874,6 +875,11 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
             teo = ti->options->u.emulator.data;
             monitor_printf(mon, ",chardev=%s", teo->chardev);
             break;
+        case TPM_TYPE_MSSIM:
+            tmo = ti->options->u.mssim.data;
+            monitor_printf(mon, ",host=%s,port=%s,ctl=%s", tmo->host,
+                           tmo->port, tmo->host);
+            break;
         case TPM_TYPE__MAX:
             break;
         }
diff --git a/qapi/tpm.json b/qapi/tpm.json
index 4e2ea9756a..d92065043e 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -49,7 +49,7 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ],
+{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator', 'mssim' ],
   'if': 'CONFIG_TPM' }
 
 ##
@@ -64,7 +64,7 @@
 # Example:
 #
 # -> { "execute": "query-tpm-types" }
-# <- { "return": [ "passthrough", "emulator" ] }
+# <- { "return": [ "passthrough", "emulator", "mssim" ] }
 #
 ##
 { 'command': 'query-tpm-types', 'returns': ['TpmType'],
@@ -99,6 +99,24 @@
 { 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
   'if': 'CONFIG_TPM' }
 
+##
+# @TPMmssimOptions:
+#
+# Information for the mssim emulator connection
+#
+# @host: host name or IP address to connect to
+# @port: port for the standard TPM commands
+# @ctrl: control port for TPM state changes
+#
+# Since: 7.2.0
+##
+{ 'struct': 'TPMmssimOptions',
+  'data': {
+      'host': 'str',
+      'port': 'str',
+      'ctrl': 'str' },
+  'if': 'CONFIG_TPM' }
+
 ##
 # @TPMPassthroughOptionsWrapper:
 #
@@ -117,6 +135,15 @@
   'data': { 'data': 'TPMEmulatorOptions' },
   'if': 'CONFIG_TPM' }
 
+##
+# @TPMmssimOptionsWrapper:
+#
+# Since: 7.2.0
+##
+{ 'struct': 'TPMmssimOptionsWrapper',
+  'data' : { 'data': 'TPMmssimOptions' },
+  'if': 'CONFIG_TPM' }
+
 ##
 # @TpmTypeOptions:
 #
@@ -124,6 +151,7 @@
 #
 # @type: - 'passthrough' The configuration options for the TPM passthrough type
 #        - 'emulator' The configuration options for TPM emulator backend type
+#        - 'mssim' The configuration options for TPM emulator mssim type
 #
 # Since: 1.5
 ##
@@ -131,7 +159,8 @@
   'base': { 'type': 'TpmType' },
   'discriminator': 'type',
   'data': { 'passthrough' : 'TPMPassthroughOptionsWrapper',
-            'emulator': 'TPMEmulatorOptionsWrapper' },
+            'emulator': 'TPMEmulatorOptionsWrapper',
+            'mssim': 'TPMmssimOptionsWrapper' },
   'if': 'CONFIG_TPM' }
 
 ##
-- 
2.35.3



