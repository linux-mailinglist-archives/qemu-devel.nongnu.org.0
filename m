Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7553C258B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:06:03 +0200 (CEST)
Received: from localhost ([::1]:51792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1r8k-00045y-H9
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1m1r77-0002jj-3c
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:04:21 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:43165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1m1r71-0001L8-5c
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:04:20 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210709140406epoutp01db52060acdd6a3e794f71776c2d50463~QJFy3go_h1664616646epoutp01D
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 14:04:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210709140406epoutp01db52060acdd6a3e794f71776c2d50463~QJFy3go_h1664616646epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1625839446;
 bh=+e9b/nNZ7QlwSaLmAx7m9cpUNELlVOJ0XZ1Q6agVqDk=;
 h=Date:From:To:Cc:Subject:References:From;
 b=JYtPMD8bYIMBN9hZ2dXGMgKxaB7isJPu0BHLDeuc6DxAlFNsMIbqcc/6KDYKicL6r
 DHc7ObSALN+63QpJ/X7qehSKbW/7eaEGH1dd4cibTNmBE5mnClfNtzO2oXK65sjmy3
 Q6BYDoBZCIRM1y6Jfx4OoNgaqx+ssNA9JMox9HIY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210709140404epcas5p4a5f2fb92ea12491aa5a975482f8646d1~QJFxmFuW63142231422epcas5p43;
 Fri,  9 Jul 2021 14:04:04 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.40.195]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4GLvz624l5z4x9Pp; Fri,  9 Jul
 2021 14:04:02 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 05.2F.09476.25758E06; Fri,  9 Jul 2021 23:04:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26~QI-eZ0E0A2064620646epcas5p1m;
 Fri,  9 Jul 2021 13:56:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210709135651epsmtrp13c43d6085968018cba53b7e5ad5632d3~QI-eY2uz13248632486epsmtrp1U;
 Fri,  9 Jul 2021 13:56:51 +0000 (GMT)
X-AuditID: b6c32a49-6b7ff70000002504-0f-60e857529a10
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 85.C4.08289.3A558E06; Fri,  9 Jul 2021 22:56:51 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210709135649epsmtip196e4e1def0c0c50392af0cad12a1bc55~QI-cOGLNI1793717937epsmtip1I;
 Fri,  9 Jul 2021 13:56:49 +0000 (GMT)
Date: Fri, 9 Jul 2021 19:25:45 +0530
From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] hw/nvme: add mi device
Message-ID: <20210709135545.GA11148@test-zns>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBJsWRmVeSWpSXmKPExsWy7bCmpm5Q+IsEgxNLOS3efn3AZnFl/3lG
 i/0Hv7FaPL7zmd1i6Xx9i5ONe1gtJh26xmix5GKqxZTG2+wWa14oW8y7pWxxZcoiZotZ79rZ
 LI737mCxeD3pP6vFzeanbA4CHj/OtbN5nNtxnt1j06pONo8TO1+weDy5tpnJ4/2+q2wefVtW
 MQawR+XYZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gCd
 rqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMDQq0CtOzC0uzUvXS87PtTI0MDAy
 BapMyMl4OuEXW8HdqUwVb884NTAeP87YxcjJISFgIvHp4lHWLkYuDiGB3YwSM7+cYIJwPjFK
 tM3byQjhfGaU+Nk4lw2m5fHOd1BVuxglDl24zgbhPGOU2Nr6lh2kikVAReL2pxNA7RwcbAJG
 Et9bbUHCIgKSEr+7TjOD1DMLXGKS2NF/E6xeWEBf4tmulUwgNq+ArsSeLY+hbEGJkzOfsIDY
 ogLKEge2HQfbLCGwg0Pi9vVNTBAnuUgcu3aWHcIWlnh1fAuULSXxsr+NHaKhmVFi35crLBDO
 BEaJKfPfQXXbS1zc8xfMZhbIlFj+dA/Uo7ISU0+tg4rzSfT+fgJVzyuxYx6MrSrx+MJBqHpp
 idkrP0HFPSR6t75jBbGFBGIl/kzYwzyBUW4Wko9mIVkHYVtJdH5oYp0FDDFmoFHL/3FAmJoS
 63fpL2BkXcUomVpQnJueWmxaYJiXWo4c0ZsYwUlay3MH490HH/QOMTJxMB5ilOBgVhLhNZrx
 LEGINyWxsiq1KD++qDQntfgQoykwhiYyS4km5wPzRF5JvKGpkZmZgaWBqbGFmaGSOO9S9kMJ
 QgLpiSWp2ampBalFMH1MHJxSDUyC8x1Yz5mf+eAVm/ZQm6nqk4/77YZ/PwQzXBJyGhMbnlgb
 uEjy9p5erFyztXKJU6vR8fd312/T7v+WVjCtvnz74swdacbXOWfsOqH07rTRupxf6/i+Pmox
 n3nq7d7gjR8eSjm0R/DwqO1adPfRissC3f+PLVPUeXbwCO9H0+Mr7j+wP1GiXvv3nMZtZ1+7
 h3UKby7X7b+QLt197/K+VOf3vvzmfl3WzSINOavSt9VMt9+0XGGRo+533sNfVvO/Offi3dKE
 V7dl3r2f5F3la7NhjtmPC0md4WXM8++0/DjuVtVRfETo9OcVGx4Krl6yOsKmpM9jFcvltVEM
 rp9u2khZHLst5Z+9o3Za8lTljX5lSizFGYmGWsxFxYkADJ/jUFsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsWy7bCSnO7i0BcJBtf/aVm8/fqAzeLK/vOM
 FvsPfmO1eHznM7vF0vn6Ficb97BaTDp0jdFiycVUiymNt9kt1rxQtph3S9niypRFzBaz3rWz
 WRzv3cFi8XrSf1aLm81P2RwEPH6ca2fzOLfjPLvHplWdbB4ndr5g8XhybTOTx/t9V9k8+ras
 Ygxgj+KySUnNySxLLdK3S+DKmLJ0JWNBz2SmijvHz7A3ME44ytjFyMkhIWAi8XjnO6YuRi4O
 IYEdjBJrNh9jh0hIS+x7eJ0FwhaWWPnvOTtE0RNGieYnzWBFLAIqErc/nQCaxMHBJmAk8b3V
 FiQsIiAp8bvrNDNIPbPAFSaJx/PfMIMkhAX0JZ7tWskEYvMK6Ers2fIYyhaUODnzCdgyZgEz
 iXmbHzKDzGQGOmL5Pw6QsKiAssSBbceZJjDyz0LSMQtJxyyEjgWMzKsYJVMLinPTc4sNC4zy
 Usv1ihNzi0vz0vWS83M3MYLjR0trB+OeVR/0DjEycTAeYpTgYFYS4TWa8SxBiDclsbIqtSg/
 vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6pBiYp4xAX95f6fxffvc4sdezI
 g1t3vrPz3P5z5NahZUJ8aXZ+nC9MZE5puabe0u+vnhaR9+z9PCZz55e7E9cVuWh9UIz498t0
 SnzxzyWZmT8Vo1N/nw9jrBEU/XjZ+Jv7Y9HZ4tFi9xyKGMz770ma2Z+KX3STf+5vyy+aNnd5
 /t2LncOgdkVu3YO7l67X7Uou1T/9ZmvHgZmVPq4z3jmxHq/fWma1RO+A7DNRx1DvG6qcrPu9
 /z3JaK9m4bJd42HW01H29++7pWGn1DRTF05XvJ935/uJwiJdt4hvL/teaR/eovOzvvw7e8ze
 SgGFghc6fMITvte9uvL2ik6X493i6pPHKp8rhrjtrFv8fpoQj64SS3FGoqEWc1FxIgA/A0T5
 DgMAAA==
X-CMS-MailID: 20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----Gf8aDbeGtrhSTUhz_eRSz8K_wSo8H8Xmo2w0fMGKdZB5STHR=_102f50_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26
References: <CGME20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, jg123.choi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 linux-nvme@lists.infrared.org, mreitz@redhat.com, its@irrelevant.dk,
 u.kishore@samsung.com, stefanha@redhat.com, kbusch@kernel.org,
 javier.gonz@samsung.com, prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------Gf8aDbeGtrhSTUhz_eRSz8K_wSo8H8Xmo2w0fMGKdZB5STHR=_102f50_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

The enclosed patch contains the implementation of certain
commands of nvme-mi specification.The MI commands are useful
to manage/configure/monitor the device.Eventhough the MI commands
can be sent via the inband NVMe-MI send/recieve commands, the idea 
here is to emulate the sideband interface for MI.

Since the nvme-mi specification deals in communicating
to the nvme subsystem via. a sideband interface, in this
qemu implementation, virtual-vsock is used for making the
sideband communication, the guest VM needs to make the
connection to the specific cid of the vsock of the qemu host.

One needs to specify the following command in the launch to
specify the nvme-mi device, cid and to setup the vsock:
-device nvme-mi,bus=<nvme bus number>
-device vhost-vsock-pci, guest-cid=<vsock cid>

The following commands are tested with nvme-cli by hooking
to the cid of the vsock as shown above and use the socket
send/recieve commands to issue the commands and get the response.

we are planning to push the changes for nvme-cli as well to test the
MI functionality.

As the connection can be established by the guest VM at any point,
we have created a thread which is looking for a connection request.
Please suggest if there is a native/better way to handle this.

This module makes use of the NvmeCtrl structure of the nvme module,
to fetch relevant information of the nvme device which are used in
some of the mi commands. Eventhough certain commands might require
modification to the nvme module, currently we have currently refrained
from making changes to the nvme module.

Since this is our first foray into implementing a new module in qemu,
we will be happy to receive comments, suggestions to improve the current
implementation.

cmd-name                              cmd-type
*************************************************
read nvme-mi ds                        nvme-mi
configuration set                      nvme-mi
configuration get                      nvme-mi
vpd read                               nvme-mi
vpd write                              nvme-mi
controller Health Staus Poll           nvme-mi
nvme subsystem health status poll      nvme-mi
identify                               nvme-admin
get log page                           nvme-admin
get features                           nvme-admin

Signed-off-by: Padmakar Kalghatgi

---
 hw/nvme/meson.build |   2 +-
 hw/nvme/nvme-mi.c   | 676 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme-mi.h   | 288 ++++++++++++++++++++++
 3 files changed, 965 insertions(+), 1 deletion(-)
 create mode 100644 hw/nvme/nvme-mi.c
 create mode 100644 hw/nvme/nvme-mi.h

diff --git a/hw/nvme/meson.build b/hw/nvme/meson.build
index 3cf4004..8dac50e 100644
--- a/hw/nvme/meson.build
+++ b/hw/nvme/meson.build
@@ -1 +1 @@
-softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c'))
+softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c', 'nvme-mi.c'))
diff --git a/hw/nvme/nvme-mi.c b/hw/nvme/nvme-mi.c
new file mode 100644
index 0000000..5e93417
--- /dev/null
+++ b/hw/nvme/nvme-mi.c
@@ -0,0 +1,676 @@
+/*
+ * QEMU NVMe-MI Controller
+ *
+ * Copyright (c) 2021, Samsung Electronics co Ltd.
+ *
+ * Written by Padmakar Kalghatgi <p.kalghatgi@samsung.com>
+ *            Arun Kumar Agasar <arun.ag@partner.samsung.com>
+ *            Saurav Kumar <saurav.29@partner.samsung.com>
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ */
+
+/**
+ * Reference Specs: http://www.nvmexpress.org,
+ *
+ *
+ * Usage
+ * -----
+ * The nvme-mi device has to be used along with nvme device only
+ *
+ * Add options:
+ *    -device  nvme-mi,bus=<nvme bus number>
+ *    -device  vhost-vsock-pci, guest-cid=<vsock cid>
+ *
+ * the cid is used to connect to the vsock
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+#include "hw/block/block.h"
+#include "hw/pci/msix.h"
+#include "nvme.h"
+#include "nvme-mi.h"
+#include "qemu/crc32c.h"
+
+#define NVME_TEMPERATURE 0x143
+#define NVME_TEMPERATURE_WARNING 0x157
+#define NVME_TEMPERATURE_CRITICAL 0x175
+
+static void nvme_mi_send_resp(NvmeMiCtrl *ctrl_mi, uint8_t *resp, uint32_t size)
+{
+    uint32_t crc_value = crc32c(0xFFFFFFFF, resp, size);
+    size += 4;
+    uint32_t retries = 5;
+    uint32_t offset = 0;
+    uint32_t som = 1;
+    uint32_t eom = 0;
+    uint32_t pktseq = 0;
+    uint32_t mtus = ctrl_mi->mctp_unit_size;
+    while (size > 0) {
+        uint32_t sizesent = size > mtus ? mtus : size;
+        size -= sizesent;
+        eom = size > 0 ? 0 : 1;
+        g_autofree uint8_t *buf = (uint8_t *)g_malloc(sizesent + 8);
+        buf[2] = sizesent + 5;
+        buf[7] = (som << 7) | (eom << 6) | (pktseq << 5);
+        som = 0;
+        memcpy(buf + 8, resp + offset, sizesent);
+        offset += sizesent;
+        if (size <= 0) {
+            memcpy(buf + 4 + offset , &crc_value, sizeof(crc_value));
+        }
+        retries = 5;
+        while (retries > 0) {
+            int32_t nsend = send(ctrl_mi->sock_desc, buf, sizesent + 8, 0);
+            if (nsend < 0) {
+                retries--;
+            } else {
+                break;
+            }
+        }
+    }
+}
+
+static void nvme_mi_resp_hdr_init(NvmeMIResponse *resp, bool bAdminCommand)
+{
+    resp->msg_header.msgtype = 4;
+    resp->msg_header.ic = 1;
+    resp->msg_header.csi = 0;
+    resp->msg_header.reserved = 0;
+    resp->msg_header.nmimt = bAdminCommand ? 2 : 1;
+    resp->msg_header.ror = 1;
+    resp->msg_header.reserved1 = 0;
+}
+static void nvme_mi_nvm_subsys_ds(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req)
+{
+    NvmeMIResponse resp;
+    NvmMiSubsysInfoDs ds;
+    ds.nump = 1;
+    ds.mjr = (ctrl_mi->n->bar.vs & 0xFF0000) >> 16;
+    ds.mnr = (ctrl_mi->n->bar.vs & 0xFF00) >> 8;
+
+    nvme_mi_resp_hdr_init(&resp , false);
+    resp.status = SUCCESS;
+    resp.mgmt_resp = sizeof(ds);
+    uint32_t total_size = sizeof(resp) + sizeof(ds);
+    uint8_t resp_message[total_size];
+    memcpy(resp_message, &resp, sizeof(resp));
+    memcpy(resp_message + sizeof(resp), &ds, sizeof(ds));
+
+    nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+}
+
+static void nvme_mi_opt_supp_cmd_list(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req)
+{
+    NvmeMIResponse resp;
+    nvme_mi_resp_hdr_init(&resp , false);
+    resp.status = SUCCESS;
+
+    uint16_t mi_opt_cmd_cnt = sizeof(NvmeMiCmdOptSupList) /
+                              sizeof(uint32_t);
+    uint16_t admin_mi_opt_cmd_cnt = sizeof(NvmeMiAdminCmdOptSupList) /
+                                    sizeof(uint32_t);
+    uint32_t offset = 0;
+    uint16_t total_commands = mi_opt_cmd_cnt + admin_mi_opt_cmd_cnt;
+    uint32_t size = 2 * (total_commands + 1);
+
+    g_autofree uint8_t *cmd_supp_list = (uint8_t *)g_malloc0(size);
+
+    memcpy(cmd_supp_list, &total_commands, sizeof(uint16_t));
+    offset += sizeof(uint16_t);
+    for (uint32_t i = 0; i < mi_opt_cmd_cnt; i++) {
+        memcpy(cmd_supp_list + offset, &NvmeMiCmdOptSupList[i],
+               sizeof(uint8_t));
+        cmd_supp_list[offset + 1] = 1;
+        offset += 2;
+    }
+
+    for (uint32_t i = 0; i < admin_mi_opt_cmd_cnt; i++) {
+        memcpy(cmd_supp_list + offset, &NvmeMiAdminCmdOptSupList[i],
+               sizeof(uint8_t));
+        cmd_supp_list[offset + 1] = 1;
+        offset += 2;
+    }
+
+    resp.mgmt_resp = size;
+    uint32_t total_size = sizeof(resp) + size;
+    uint8_t resp_message[total_size];
+    memcpy(resp_message, &resp, sizeof(resp));
+    memcpy(resp_message + sizeof(resp), cmd_supp_list, size);
+
+    nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+}
+
+static void nvme_mi_controller_health_ds(NvmeMiCtrl *ctrl_mi,
+                                         NvmeMIRequest *req)
+{
+    uint32_t dword0 = req->dword0;
+    uint32_t dword1 = req->dword1;
+    uint32_t maxrent = (dword0 >> 16) & 0xFF;
+    uint32_t reportall = (dword0 >> 31) & 0x1;
+    uint32_t incvf = (dword0 >> 26) & 0x1;
+    uint32_t incpf = (dword0 >> 25) & 0x1;
+    uint32_t incf = (dword0 >> 24) & 0x1;
+
+    NvmeMIResponse resp;
+    nvme_mi_resp_hdr_init(&resp , false);
+
+    if (maxrent > 255 || (reportall == 0) || incvf || incpf || (incf == 0)) {
+        resp.status = INVALID_PARAMETER;
+        return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+    NvmeMiCtrlHealthDs nvme_mi_chds;
+    if (dword1 & 0x1) {
+        nvme_mi_chds.csts.rdy = ctrl_mi->n->bar.csts & 0x1;
+        nvme_mi_chds.csts.cfs |= ctrl_mi->n->bar.csts & 0x2;
+        nvme_mi_chds.csts.shst |= ctrl_mi->n->bar.csts & 0xa;
+        nvme_mi_chds.csts.nssro |= ctrl_mi->n->bar.csts & 0x10;
+        nvme_mi_chds.csts.en |= ctrl_mi->n->bar.cc & 0x1 << 5;
+    }
+    if (dword1 & 0x2) {
+        nvme_mi_chds.ctemp = ctrl_mi->n->temperature;
+    }
+    if (((ctrl_mi->n->temperature >= ctrl_mi->n->features.temp_thresh_hi) ||
+        (ctrl_mi->n->temperature <= ctrl_mi->n->features.temp_thresh_low)) &&
+         (dword1 & 0x2)) {
+        nvme_mi_chds.cwarn.temp_above_or_under_thresh = 0x1;
+    }
+    printf("size = %lu\n", sizeof(resp) + sizeof(NvmeMiCtrlHealthDs));
+    g_autofree uint8_t *resp_buf = (uint8_t *)g_malloc(sizeof(resp) +
+                                                       sizeof(NvmeMiCtrlHealthDs));
+    resp.mgmt_resp = 1 << 0x10;
+    memcpy(resp_buf, &resp, sizeof(resp));
+    memcpy(resp_buf + sizeof(resp), &nvme_mi_chds, sizeof(nvme_mi_chds));
+    nvme_mi_send_resp(ctrl_mi, resp_buf, sizeof(resp) + sizeof(NvmeMiCtrlHealthDs));
+}
+
+static void nvme_mi_read_nvme_mi_ds(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req)
+{
+    ReadNvmeMiDs ds;
+    ds.cntrlid = req->dword0 & 0xFFFF;
+    ds.portlid = (req->dword0 & 0xFF0000) >> 16;
+    ds.dtyp = (req->dword0 & ~0xFF) >> 24;
+    int dtyp = ds.dtyp;
+    switch (dtyp) {
+    case NVM_SUBSYSTEM_INFORMATION:
+        nvme_mi_nvm_subsys_ds(ctrl_mi, req);
+        break;
+    case OPT_SUPP_CMD_LIST:
+        nvme_mi_opt_supp_cmd_list(ctrl_mi, req);
+        break;
+    }
+}
+
+static void nvme_mi_configuration_get(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req)
+{
+    uint8_t config_identifier = (req->dword0 & 0xFF);
+    NvmeMIResponse resp;
+
+    uint32_t total_size = sizeof(resp);
+    uint8_t resp_message[total_size];
+    switch (config_identifier) {
+    case SMBUS_I2C_FREQ: {
+       nvme_mi_resp_hdr_init(&resp, false);
+       resp.status = SUCCESS;
+       resp.mgmt_resp = ctrl_mi->smbus_freq;
+       memcpy(resp_message, &resp, sizeof(resp));
+
+       nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+    break;
+    case MCTP_TRANS_UNIT_SIZE: {
+        nvme_mi_resp_hdr_init(&resp, false);
+        resp.status = SUCCESS;
+        resp.mgmt_resp = ctrl_mi->mctp_unit_size;
+        memcpy(resp_message, &resp, sizeof(resp));
+
+        nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+    break;
+    }
+}
+
+static void nvme_mi_configuration_set(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req)
+{
+    uint8_t config_identifier = (req->dword0 & 0xFF);
+    NvmeMIResponse resp;
+    uint32_t total_size = sizeof(resp);
+    uint8_t resp_message[total_size];
+    switch (config_identifier) {
+    case SMBUS_I2C_FREQ: {
+        nvme_mi_resp_hdr_init(&resp, false);
+        resp.status = SUCCESS;
+        resp.mgmt_resp = 0;
+        ctrl_mi->smbus_freq = (req->dword0 & 0xF00) >> 8;
+        memcpy(resp_message, &resp, sizeof(resp));
+
+        nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+    break;
+    case MCTP_TRANS_UNIT_SIZE: {
+        nvme_mi_resp_hdr_init(&resp, false);
+        resp.status = SUCCESS;
+        ctrl_mi->mctp_unit_size = (req->dword1 & 0xFFFF);
+        memcpy(resp_message, &resp, sizeof(resp));
+
+        nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+    break;
+    default:
+        nvme_mi_resp_hdr_init(&resp, false);
+        resp.status = INVALID_PARAMETER;
+        memcpy(resp_message, &resp, sizeof(resp));
+        nvme_mi_send_resp(ctrl_mi, resp_message, total_size);
+    }
+
+}
+
+static void nvme_mi_vpd_read(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req)
+{
+    uint16_t dofst = (req->dword0 & 0xFFFF);
+    uint16_t dlen = (req->dword1 & 0xFFFF);
+    NvmeMIResponse resp;
+    nvme_mi_resp_hdr_init(&resp, false);
+    if ((dofst + dlen) > sizeof(NvmeMiVpdElements)) {
+        resp.status = INVALID_PARAMETER;
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    } else {
+        resp.status = SUCCESS;
+        g_autofree uint8_t *resp_buf = (uint8_t *) g_malloc(dlen + sizeof(resp));
+        memcpy(resp_buf, &resp, sizeof(resp));
+        memcpy(resp_buf + sizeof(resp), &ctrl_mi->vpd_data + dofst, dlen);
+        nvme_mi_send_resp(ctrl_mi, resp_buf, dlen + sizeof(resp));
+    }
+}
+
+static void nvme_mi_vpd_write(NvmeMiCtrl *ctrl_mi, NvmeMIRequest *req,
+                              uint8_t *buf)
+{
+    uint16_t dofst = (req->dword0 & 0xFFFF);
+    uint16_t dlen = (req->dword1 & 0xFFFF);
+    NvmeMIResponse resp;
+    nvme_mi_resp_hdr_init(&resp, false);
+    if ((dofst + dlen) > sizeof(NvmeMiVpdElements)) {
+        resp.status = INVALID_PARAMETER;
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    } else {
+        resp.status = SUCCESS;
+        memcpy(&ctrl_mi->vpd_data + dofst, buf + 16 , dlen);
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+}
+
+static void nvme_mi_nvm_subsys_health_status_poll(NvmeMiCtrl *ctrl_mi,
+                                                  NvmeMIRequest *req)
+{
+    NvmeMIResponse resp;
+    NvmeMiNvmSubsysHspds nshds;
+    nvme_mi_resp_hdr_init(&resp, false);
+    for (uint32_t cntlid = 1; cntlid < ARRAY_SIZE(ctrl_mi->n->subsys->ctrls);
+         cntlid++) {
+
+        NvmeCtrl *ctrl = nvme_subsys_ctrl(ctrl_mi->n->subsys, cntlid);
+        if (!ctrl) {
+            continue;
+        }
+
+        if ((ctrl->bar.csts & 0x1) == 0x1) {
+            nshds.ccs = 0x1;
+        }
+        if ((ctrl->bar.csts & 0x2) == 0x2) {
+            nshds.ccs |= 0x2;
+        }
+        if ((ctrl->bar.csts & 0x10) == 0x10) {
+            nshds.ccs |= 0x10;
+        }
+        if (find_first_bit(ctrl->changed_nsids, NVME_CHANGED_NSID_SIZE) !=
+            NVME_CHANGED_NSID_SIZE) {
+                nshds.ccs |= 0x40;
+        }
+        if ((ctrl->temperature >= ctrl->features.temp_thresh_hi) ||
+           (ctrl->temperature <= ctrl->features.temp_thresh_low)) {
+            nshds.ccs |= 0x200;
+        }
+    }
+
+
+    g_autofree uint8_t *resp_buf = (uint8_t *)g_malloc(sizeof(resp) + sizeof(nshds));
+    memcpy(resp_buf, &resp, sizeof(resp));
+    memcpy(resp_buf + sizeof(resp), &nshds, sizeof(nshds));
+    nvme_mi_send_resp(ctrl_mi, resp_buf, sizeof(resp_buf));
+}
+
+static void nvme_mi_admin_identify_ns(NvmeMiCtrl *ctrl_mi,
+                                      NvmeAdminMIRequest *req,
+                                      uint32_t dofst, uint32_t dlen)
+{
+    NvmeIdNs *id_ns;
+    uint32_t nsid = req->sqentry1;
+    NvmeMIAdminResponse resp;
+    nvme_mi_resp_hdr_init((NvmeMIResponse *)&resp, true);
+    resp.status = SUCCESS;
+    NvmeNamespace *ns = nvme_ns(ctrl_mi->n, nsid);
+    if (!ns) {
+        resp.cqdword0 = 0;
+        resp.cqdword1 = 0;
+        resp.cqdword3 = NVME_INVALID_NSID << 16;
+            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(NvmeMIAdminResponse));
+        return ;
+    }
+
+    id_ns = &ns->id_ns;
+
+    g_autofree uint8_t *resp_buff = g_malloc0(sizeof(NvmeMIAdminResponse) + dlen);
+    memcpy(resp_buff, &resp, sizeof(NvmeMIAdminResponse));
+    memcpy(resp_buff + sizeof(NvmeMIAdminResponse), id_ns + dofst, dlen);
+
+    nvme_mi_send_resp(ctrl_mi, (uint8_t *)resp_buff,
+                      sizeof(NvmeMIAdminResponse) + dlen);
+}
+static void nvme_mi_admin_identify_ctrl(NvmeMiCtrl *ctrl_mi,
+                                        NvmeAdminMIRequest *req,
+                                        uint32_t dofst, uint32_t dlen)
+{
+    NvmeMIAdminResponse resp;
+    nvme_mi_resp_hdr_init((NvmeMIResponse *)&resp, true);
+    resp.status = SUCCESS;
+    g_autofree uint8_t *resp_buff = g_malloc0(sizeof(NvmeMIAdminResponse) + dlen);
+    memcpy(resp_buff, &resp, sizeof(NvmeMIAdminResponse));
+    memcpy(resp_buff + sizeof(NvmeMIAdminResponse), &ctrl_mi->n->id_ctrl + dofst, dlen);
+
+    nvme_mi_send_resp(ctrl_mi, (uint8_t *)resp_buff, sizeof(NvmeMIAdminResponse) + dlen);
+}
+static void nvme_mi_admin_identify(NvmeMiCtrl *ctrl_mi, NvmeAdminMIRequest *req)
+{
+    uint32_t cns = req->sqentry10 & 0xFF;
+    uint32_t cflags = req->cmdflags;
+    uint32_t dofst = req->dataofst;
+    uint32_t dlen = req->datalen;
+    NvmeMIResponse resp;
+    if (dofst + dlen > 4096) {
+        nvme_mi_resp_hdr_init(&resp, true);
+        resp.status = INVALID_PARAMETER;
+        return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+    if ((cflags & 0x1) == 0) {
+        dlen = 4096;
+    }
+    if (!(cflags & 0x2)) {
+        dofst = 0;
+    }
+    switch (cns) {
+    case 0x00:
+        return nvme_mi_admin_identify_ns(ctrl_mi, req, dofst, dlen);
+    case 0x1:
+        return nvme_mi_admin_identify_ctrl(ctrl_mi, req, dofst, dlen);
+    default:
+    {
+        NvmeMIAdminResponse resp;
+        nvme_mi_resp_hdr_init((NvmeMIResponse *)&resp, true);
+        resp.status = SUCCESS;
+        resp.cqdword3 = NVME_INVALID_FIELD << 16;
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+    }
+}
+static void nvme_mi_admin_error_info_log(NvmeMiCtrl *ctrl_mi,
+                                         NvmeAdminMIRequest *req,
+                                         uint32_t dofst, uint32_t dlen)
+{
+    NvmeMIAdminResponse resp;
+    NvmeErrorLog errlog;
+    memset(&errlog, 0x0, sizeof(errlog));
+    nvme_mi_resp_hdr_init((NvmeMIResponse *)&resp, true);
+    resp.status = SUCCESS;
+    g_autofree uint8_t *resp_buff = g_malloc0(sizeof(NvmeMIAdminResponse) + dlen);
+    memcpy(resp_buff, &resp, sizeof(NvmeMIAdminResponse));
+    memcpy(resp_buff + sizeof(NvmeMIAdminResponse), &errlog + dofst, dlen);
+    nvme_mi_send_resp(ctrl_mi, (uint8_t *)resp_buff, sizeof(NvmeMIAdminResponse) + dlen);
+}
+
+static void nvme_mi_admin_get_log_page(NvmeMiCtrl *ctrl_mi,
+                                       NvmeAdminMIRequest *req)
+{
+    uint32_t lid = req->sqentry10;
+    uint32_t cflags = req->cmdflags;
+    uint32_t dofst = req->dataofst;
+    uint32_t dlen = req->datalen;
+    NvmeMIResponse resp;
+
+    switch (lid) {
+    case 0x00:
+        if (dofst + dlen > sizeof(NvmeErrorLog)) {
+            nvme_mi_resp_hdr_init(&resp, true);
+            resp.status = INVALID_PARAMETER;
+            return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+        }
+        if ((cflags & 0x1) == 0) {
+            dlen = sizeof(NvmeErrorLog);
+        }
+        if (!(cflags & 0x2)) {
+            dofst = 0;
+        }
+        if (dofst + dlen > sizeof(NvmeErrorLog)) {
+            nvme_mi_resp_hdr_init(&resp, true);
+            resp.status = INVALID_PARAMETER;
+            return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+        }
+
+        return nvme_mi_admin_error_info_log(ctrl_mi, req, dofst, dlen);
+    default:
+    {
+        NvmeMIAdminResponse resp;
+        nvme_mi_resp_hdr_init((NvmeMIResponse *)&resp, true);
+        resp.status = SUCCESS;
+        resp.cqdword3 = NVME_INVALID_FIELD << 16;
+        nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+    }
+}
+
+static void nvme_mi_admin_get_features(NvmeMiCtrl *ctrl_mi,
+                                       NvmeAdminMIRequest *req)
+{
+    uint32_t fid = req->sqentry10 & 0xFF;
+    uint32_t dofst = req->dataofst;
+    uint32_t dlen = req->datalen;
+
+    if (dofst || dlen) {
+        NvmeMIResponse resp;
+        nvme_mi_resp_hdr_init(&resp, true);
+        resp.status = INVALID_PARAMETER;
+        return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+
+    NvmeMIAdminResponse resp;
+    nvme_mi_resp_hdr_init((NvmeMIResponse *)&resp, true);
+    resp.status = SUCCESS;
+
+    switch (fid) {
+    case NVME_TEMPERATURE_THRESHOLD:
+        resp.cqdword0 = 0;
+
+        if (NVME_TEMP_TMPSEL(req->sqentry11) != NVME_TEMP_TMPSEL_COMPOSITE) {
+            break;
+        }
+
+        if (NVME_TEMP_THSEL(req->sqentry11) == NVME_TEMP_THSEL_OVER) {
+            resp.cqdword0 = NVME_TEMPERATURE_WARNING;
+        }
+        break;
+    case NVME_NUMBER_OF_QUEUES:
+        resp.cqdword0 = (ctrl_mi->n->params.max_ioqpairs - 1) |
+                        ((ctrl_mi->n->params.max_ioqpairs - 1) << 16);
+        break;
+    default:
+        resp.cqdword3 = NVME_INVALID_FIELD << 16;
+        return nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+    }
+
+    nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(NvmeMIAdminResponse));
+}
+
+static void nvme_mi_admin_command(NvmeMiCtrl *ctrl_mi, void* req_arg)
+{
+    uint8_t *msg  = ((uint8_t *)req_arg);
+    NvmeMiMessageHeader msghdr;
+    memcpy(&msghdr, msg, sizeof(NvmeMiMessageHeader));
+    if (msghdr.nmimt == 1) {
+        NvmeMIRequest *req = (NvmeMIRequest *) (msg);
+        switch (req->opc) {
+        case READ_NVME_MI_DS:
+            nvme_mi_read_nvme_mi_ds(ctrl_mi, req);
+            break;
+        case CHSP:
+            nvme_mi_controller_health_ds(ctrl_mi, req);
+            break;
+        case NVM_SHSP:
+            nvme_mi_nvm_subsys_health_status_poll(ctrl_mi, req);
+            break;
+        case CONFIGURATION_SET:
+            nvme_mi_configuration_set(ctrl_mi, req);
+            break;
+        case CONFIGURATION_GET:
+            nvme_mi_configuration_get(ctrl_mi, req);
+            break;
+        case VPD_READ:
+            nvme_mi_vpd_read(ctrl_mi, req);
+            break;
+        case VPD_WRITE:
+            nvme_mi_vpd_write(ctrl_mi, req, msg);
+            break;
+        default:
+        {
+            NvmeMIResponse resp;
+            nvme_mi_resp_hdr_init(&resp, false);
+            resp.status = INVALID_COMMAND_OPCODE;
+            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+            break;
+        }
+        }
+    } else {
+        NvmeAdminMIRequest *req = (NvmeAdminMIRequest *) (msg);
+        switch  (req->opc) {
+        case NVME_ADM_MI_CMD_IDENTIFY:
+            printf("identify\n");
+            nvme_mi_admin_identify(ctrl_mi, req);
+            break;
+        case NVME_ADM_MI_CMD_GET_LOG_PAGE:
+            printf("get log page\n");
+            nvme_mi_admin_get_log_page(ctrl_mi, req);
+            break;
+        case NVME_ADM_MI_CMD_GET_FEATURES:
+            printf("get features\n");
+            nvme_mi_admin_get_features(ctrl_mi, req);
+            break;
+        default:
+        {
+            NvmeMIResponse resp;
+            nvme_mi_resp_hdr_init(&resp, true);
+            resp.status = INVALID_COMMAND_OPCODE;
+            nvme_mi_send_resp(ctrl_mi, (uint8_t *)&resp, sizeof(resp));
+            break;
+        }
+        }
+    }
+
+    return;
+}
+
+static void nvme_mi_init(NvmeMiCtrl *ctrl_mi)
+{
+    pthread_t vsock_tid;
+    pthread_create(&vsock_tid, NULL, vsock_server_start, ctrl_mi);
+    pthread_detach(vsock_tid);
+}
+
+void *vsock_server_start(void *arg)
+{
+    NvmeMiCtrl *ctrl_mi = (NvmeMiCtrl *)arg;
+    int listenfd = 0, c = 0;
+    struct sockaddr_vm sa = {
+                        .svm_family = AF_VSOCK,
+                        .svm_cid = VMADDR_CID_ANY,
+                        .svm_port = 1342,
+                    };
+    struct sockaddr_vm client;
+    listenfd = socket(AF_VSOCK, SOCK_STREAM, 0);
+    if (listenfd == -1) {
+        pthread_exit(NULL);
+    }
+    if (bind(listenfd, (struct sockaddr *)&sa, sizeof(sa)) < 0) {
+        pthread_exit(NULL);
+    }
+    listen(listenfd, 1);
+    puts("Waiting for incoming connections...");
+    c = sizeof(struct sockaddr_vm);
+    while (1) {
+        ctrl_mi->sock_desc = accept(listenfd, (struct sockaddr *)&client,
+                                       (socklen_t *)&c);
+        if ((ctrl_mi->sock_desc) < 0) {
+            continue;
+        }
+
+        NvmeMiMctpHeader mctp_hdr;
+        uint32_t total_len = 0;
+        uint8_t *getdata_buf = NULL;
+        while (!mctp_hdr.EOM) {
+            uint8_t buf[7];
+            recv(ctrl_mi->sock_desc, buf, 7, 0);
+            mctp_hdr.byte_count = buf[1];
+            mctp_hdr.EOM = (buf[6] & 0x40) >> 6;
+            mctp_hdr.SOM = (buf[6] & 0x80) >> 7;
+            mctp_hdr.pckt_seq = (buf[6] & 0x20) >> 5;
+
+            uint32_t curr_len = total_len;
+            total_len = total_len + (mctp_hdr.byte_count - 5);
+
+            getdata_buf = (uint8_t *)g_realloc(getdata_buf, total_len);
+            recv(ctrl_mi->sock_desc, getdata_buf + curr_len,
+                        (mctp_hdr.byte_count - 5), 0);
+        }
+        NvmeMiMessageHeader msghdr;
+        memcpy(&msghdr, getdata_buf, sizeof(NvmeMiMessageHeader));
+        nvme_mi_admin_command(ctrl_mi, getdata_buf);
+    }
+    pthread_exit(0);
+}
+
+static void nvme_mi_realize(DeviceState *dev, Error **errp)
+{
+    NvmeMiCtrl *ctrl_mi = (NvmeMiCtrl *)malloc(sizeof(NvmeMiCtrl));
+    BusState *s = qdev_get_parent_bus(dev);
+    ctrl_mi->n = NVME(s->parent);
+    ctrl_mi->mctp_unit_size = 64;
+    ctrl_mi->smbus_freq = 0x01;
+    ctrl_mi->sock_desc = 0;
+    memset(&ctrl_mi->vpd_data, 0, sizeof(ctrl_mi->vpd_data));
+
+    nvme_mi_init(ctrl_mi);
+}
+
+static void nvme_mi_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+
+    dc->bus_type = TYPE_NVME_BUS;
+    dc->realize = nvme_mi_realize;
+    dc->desc = "nvme mi";
+}
+
+static const TypeInfo nvme_mi = {
+    .name = TYPE_NVME_MI,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(NvmeMiCtrl),
+    .class_init = nvme_mi_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&nvme_mi);
+}
+
+type_init(register_types);
diff --git a/hw/nvme/nvme-mi.h b/hw/nvme/nvme-mi.h
new file mode 100644
index 0000000..4c155a0
--- /dev/null
+++ b/hw/nvme/nvme-mi.h
@@ -0,0 +1,288 @@
+/*
+ * QEMU NVMe-MI
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ * Authors:
+ *   Padmakar Kalghatgi      <p.kalghatgi@samsung.com>
+ *   Arun Kumar Agasar       <arun.ag@partner.samsung.com>
+ *   Saurav Kumar            <saurav.29@partner.samsung.com>
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ */
+
+#ifndef NVME_MI_H
+#define NVME_MI_H
+
+#include <sys/socket.h>
+#include <linux/vm_sockets.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <pthread.h>
+
+#define TYPE_NVME_MI "nvme-mi"
+
+#define NVM_SUBSYSTEM_INFORMATION 0
+#define PORT_INFORMATION 1
+#define CONTROLLER_LIST 2
+#define CONTROLLER_INFORMATION 3
+#define OPT_SUPP_CMD_LIST 4
+#define MGMT_EPT_BUFF_CMD_SUPP_LIST 5
+
+typedef struct NvmeMiVpdElements {
+    long common_header;
+} NvmeMiVpdElements;
+
+typedef struct NvmeMiCtrl {
+   int32_t sock_desc;
+   uint32_t mctp_unit_size;
+   uint32_t smbus_freq;
+   NvmeCtrl *n;
+   NvmeMiVpdElements vpd_data;
+   u_char dummy[1000];
+} NvmeMiCtrl;
+
+enum NvmeMiMngmtInterfaceCmdSetsOpcodes {
+   READ_NVME_MI_DS                   = 0x00,
+   NVM_SHSP                          = 0x01,
+   CHSP                              = 0x02,
+   CONFIGURATION_SET                 = 0x03,
+   CONFIGURATION_GET                 = 0x04,
+   VPD_READ                          = 0x05,
+   VPD_WRITE                         = 0x06,
+   MI_RESET                          = 0x07,
+   SES_RECEIVE                       = 0x08,
+   SES_SEND                          = 0x09,
+   MANAGEMENT_ENDPOINT_BUFFER_READ   = 0x0A,
+   MANAGEMENT_ENDPOINT_BUFFER_WRITE  = 0x0B,
+   MI_RESERVED                       = 0x0C,
+   VENDOR_SPECIFIC                   = 0xC0
+};
+
+enum NvmeMiControlPrimitiveOpcodes {
+   PAUSE                             = 0x00,
+   RESUME                            = 0x01,
+   ABORT                             = 0x02,
+   GET_STATE                         = 0x03,
+   REPLAY                            = 0x04,
+   CTRL_PRIMITIVE_RESERVED           = 0x05,
+   CTRL_PRIMITIVE_VENDOR_SPECIFIC    = 0xF0
+};
+
+enum NvmeMiAdminCommands {
+   NVME_ADM_MI_CMD_DELETE_SQ      = 0x00,
+   NVME_ADM_MI_CMD_CREATE_SQ      = 0x01,
+   NVME_ADM_MI_CMD_GET_LOG_PAGE   = 0x02,
+   NVME_ADM_MI_CMD_DELETE_CQ      = 0x04,
+   NVME_ADM_MI_CMD_CREATE_CQ      = 0x05,
+   NVME_ADM_MI_CMD_IDENTIFY       = 0x06,
+   NVME_ADM_MI_CMD_ABORT          = 0x08,
+   NVME_ADM_MI_CMD_SET_FEATURES   = 0x09,
+   NVME_ADM_MI_CMD_GET_FEATURES   = 0x0a,
+   NVME_ADM_MI_CMD_ASYNC_EV_REQ   = 0x0c,
+   NVME_ADM_MI_CMD_NS_MANAGEMENT  = 0x0d,
+   NVME_ADM_MI_CMD_ACTIVATE_FW    = 0x10,
+   NVME_ADM_MI_CMD_DOWNLOAD_FW    = 0x11,
+   NVME_ADM_MI_CMD_DST            = 0x14,
+   NVME_ADM_MI_CMD_NS_ATTACHMENT  = 0x15,
+   NVME_ADM_MI_CMD_KEEP_ALIVE     = 0x18,
+   NVME_ADM_MI_CMD_DIRECTIVE_SEND = 0x19,
+   NVME_ADM_MI_CMD_DIRECTIVE_RECV = 0x1A,
+   NVME_ADM_MI_CMD_VIRTUALIZATION = 0x1C,
+   NVME_ADM_MI_CMD_DB_BUF_CONIF   = 0x7C,
+   NVME_ADM_MI_CMD_FORMAT_NVM     = 0x80,
+   NVME_ADM_MI_CMD_SECURITY_SEND  = 0x81,
+   NVME_ADM_MI_CMD_SECURITY_RECV  = 0x82,
+   NVME_ADM_MI_CMD_SANITIZE       = 0x84,
+   NVME_ADM_MI_CMD_GET_LBA_STATUS = 0x86,
+};
+
+enum NvmeMiConfigGetResponseValue {
+   DEFAULT_MCTP_SIZE   = 64,
+   DEFAULT_SMBUS_FREQ  = 1,
+   SET_SMBUS_FREQ      = 129,
+   SET_7BITS           = 255,
+   SET_4BITS           = 15,
+   SET_16BITS          = 65535
+};
+
+enum NvmeMiConfigurationIdentifier {
+   SMBUS_I2C_FREQ = 1,
+   HEALTH_STATUS_CHG,
+   MCTP_TRANS_UNIT_SIZE,
+};
+
+enum NvmeMiResponseMessageStatus {
+   SUCCESS,
+   MORE_PROCESSING_REQUIRED,
+   INTERNAL_ERROR,
+   INVALID_COMMAND_OPCODE,
+   INVALID_PARAMETER,
+   INVALID_COMMAND_SIZE,
+   INVALID_COMMAND_INPUT_DATA_SIZE,
+   ACCESS_DENIED,
+   VPD_UPDATES_EXCEEDED = 0x20,
+   PCIe_INACCESSIBLE
+};
+
+typedef struct NvmeMiMctpHeader {
+   uint32_t byte_count:8;
+   uint32_t SOM:1;
+   uint32_t EOM:1;
+   uint32_t pckt_seq:2;
+} NvmeMiMctpHeader;
+
+typedef struct NvmeMiMessageHeader {
+   uint32_t msgtype:7;
+   uint32_t ic:1;
+   uint32_t csi:1;
+   uint32_t reserved:2;
+   uint32_t nmimt:4;
+   uint32_t ror:1;
+   uint32_t reserved1:16;
+} NvmeMiMessageHeader;
+
+typedef struct NvmeMIRequest {
+   NvmeMiMessageHeader msg_header;
+   uint32_t               opc:8;
+   uint32_t               rsvd:24;
+   uint32_t               dword0;
+   uint32_t               dword1;
+   uint8_t                *buf;
+   uint32_t               mic;
+} NvmeMIRequest;
+
+typedef struct NvmeAdminMIRequest {
+   NvmeMiMessageHeader msg_header;
+   uint8_t                opc;
+   uint8_t                cmdflags;
+   uint16_t               cntlid;
+   uint32_t               sqentry1;
+   uint32_t               sqentry2;
+   uint32_t               sqentry3;
+   uint32_t               sqentry4;
+   uint32_t               sqentry5;
+   uint32_t               dataofst;
+   uint32_t               datalen;
+   uint32_t               reserved[2];
+   uint32_t               sqentry10;
+   uint32_t               sqentry11;
+   uint32_t               sqentry12;
+   uint32_t               sqentry13;
+   uint32_t               sqentry14;
+   uint32_t               sqentry15;
+   uint8_t                *buf;
+   uint32_t               mic;
+} NvmeAdminMIRequest;
+
+typedef struct ReadNvmeMiDs {
+    uint16_t cntrlid;
+    uint8_t  portlid;
+    uint8_t  dtyp;
+}  ReadNvmeMiDs;
+
+typedef struct NvmeMiConfigurationSet {
+    uint8_t conf_identifier_dword_0;
+    uint16_t conf_identifier_specific_dword_0;
+    uint16_t conf_identifier_specific_dword_1;
+}  MiConfigurationSet;
+
+typedef struct NvmeMiNvmSubsysHspds {
+    uint8_t nss;
+    uint8_t sw;
+    uint8_t ctemp;
+    uint8_t pdlu;
+    uint16_t ccs;
+    uint16_t reserved;
+} NvmeMiNvmSubsysHspds;
+
+typedef struct NvmeMiControlPrimitives {
+    uint32_t nmh;
+    uint32_t cpo;
+    uint32_t tag;
+    uint32_t cpsp;
+    uint32_t mic;
+} NvmeMiControlPrimitives;
+
+typedef struct NvmMiSubsysInfoDs {
+    uint8_t nump;
+    uint8_t mjr;
+    uint8_t mnr;
+    uint8_t rsvd[29];
+} NvmMiSubsysInfoDs;
+
+typedef struct NvmeMiCwarnStruct {
+    uint8_t spare_thresh:1;
+    uint8_t temp_above_or_under_thresh:1;
+    uint8_t rel_degraded:1;
+    uint8_t read_only:1;
+    uint8_t vol_mem_bup_fail:1;
+    uint8_t reserved:3;
+} NvmeMiCwarnStruct;
+
+typedef struct NvmeMiCstsStruct {
+    uint16_t rdy:1;
+    uint16_t cfs:1;
+    uint16_t shst:2;
+    uint16_t nssro:1;
+    uint16_t en:1;
+    uint16_t nssac:1;
+    uint16_t fwact:1;
+    uint16_t reserved:8;
+} NvmeMiCstsStruct;
+
+typedef struct NvmeMiCtrlHealthDs {
+   uint16_t ctlid;
+   NvmeMiCstsStruct csts;
+   uint16_t ctemp;
+   uint16_t pdlu;
+   uint8_t spare;
+   NvmeMiCwarnStruct cwarn;
+   uint8_t reserved[7];
+} NvmeMiCtrlHealthDs;
+
+typedef struct NvmeMIResponse {
+   NvmeMiMessageHeader msg_header;
+   uint8_t                status;
+   uint32_t               mgmt_resp:24;
+} NvmeMIResponse;
+
+typedef struct NvmeMIAdminResponse {
+   NvmeMiMessageHeader msg_header;
+   uint32_t status:8;
+   uint32_t mgmt_resp:24;
+   uint32_t cqdword0;
+   uint32_t cqdword1;
+   uint32_t cqdword3;
+} NvmeMIAdminResponse;
+
+uint32_t NvmeMiCmdOptSupList[] = {
+  /*
+   * MANAGEMENT_ENDPOINT_BUFFER_READ,
+   * MANAGEMENT_ENDPOINT_BUFFER_WRITE,
+   */
+};
+
+uint32_t NvmeMiAdminCmdOptSupList[] = {
+   /*
+    *  NVME_ADM_CMD_DST,
+    *  NVME_ADM_CMD_DOWNLOAD_FW,
+    *  NVME_ADM_CMD_ACTIVATE_FW,
+    *  NVME_ADM_CMD_FORMAT_NVM,
+    *  NVME_ADM_CMD_NS_MANAGEMENT,
+    *  NVME_ADM_CMD_NS_ATTACHMENT,
+    *  NVME_ADM_CMD_DIRECTIVE_SEND,
+    *  NVME_ADM_CMD_DIRECTIVE_RECV,
+    *  NVME_ADM_CMD_SET_FEATURES,
+    *  NVME_ADM_CMD_SANITIZE,
+    */
+};
+
+void *vsock_server_start(void *);
+void *ControlPrimitiveThread(void *);
+void *nvme_mi_admin_commandthread(void *);
+
+#endif
-- 
2.7.0.windows.1


------Gf8aDbeGtrhSTUhz_eRSz8K_wSo8H8Xmo2w0fMGKdZB5STHR=_102f50_
Content-Type: text/plain; charset="utf-8"


------Gf8aDbeGtrhSTUhz_eRSz8K_wSo8H8Xmo2w0fMGKdZB5STHR=_102f50_--

