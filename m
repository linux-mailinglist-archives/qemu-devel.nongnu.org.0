Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC3F5064DF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:54:23 +0200 (CEST)
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghkk-0001yj-F4
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmN-0001G9-VA
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmI-0004Zy-Ui
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id bv16so3774529wrb.9
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/KvT5CgXU4wmhLYAO5op7r+QKpihbzo7jOY9w1iZVE=;
 b=QxIp/FccaWqkJQUW8O8viSUGOHCpKzwnBTmZ2ToW3QzxsObD8U043qFrFq9ih8bME1
 EK68/k+T13DP8yclZyhXEEDyqRygoJIV0GwjHjyp1dtEvAa2OEaFAEX6h/pdI3qPxFHF
 bFukXvvgjXnN2Sv16tbvyX62vw510NCijGExV8wlaDwzCjEfAFjk015oWLeLPpoxHSCD
 sC56waQLUFF/48BziC2O4Xa2rJo+DobGECOgOhkEyg1HK2OJgUPCyD5SIgTz/qvMetYJ
 NHpacrZN2OOSUkUjbk6o0HwLrUp4zstbh4isir5OWomDWp30dJmxf6zQflBtvYcvOtKA
 RVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9/KvT5CgXU4wmhLYAO5op7r+QKpihbzo7jOY9w1iZVE=;
 b=rhbcLBJLcL1IBiVw2UcT2n8AA4w40HVfBiMSPbMh9dyvXINsCmf/Y+KZw2/g67grDQ
 R5gD4KJh7HYViRJBhwDAQlKnRBLBcco56K+3wNESQCdtRoJZp+ThQFt19CXRjJGUZ4QY
 C5hNCYMc4u2z7Okvcl3rofLjcT1Ej0TDrYxmVaL+xZpwlHNMiVQrbCi/YGWNekV2IKtf
 LmvUyymsXOoh67s23UPAfuTchSthLp3xv8kcPQvLh7xKXaFJukM2ENT450bztc+WubPs
 QgwqpPrTWpL98eOOSGmo2yRrbGFvdjW9iRPBkCvcEtxwud4ob4zDilm3jUe4xHMFIPEI
 +ofQ==
X-Gm-Message-State: AOAM533iz8RlMyMk6lZhx6u44FiDzao/tL3bSBjLaCVN13UhkId33LBV
 HrS2bsI8P4saIHCnObFstEFwtuTbtC6MjQ==
X-Google-Smtp-Source: ABdhPJwPq78fp+4gXk2J91Tt1aDsdSU+5kh1UFO01AODtHNN0EmkvMFT8hJtDCfhIRET3A1iZrzIcg==
X-Received: by 2002:a05:6000:38b:b0:20a:923a:3aea with SMTP id
 u11-20020a056000038b00b0020a923a3aeamr6846631wrf.294.1650347513684; 
 Mon, 18 Apr 2022 22:51:53 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 47/53] hw: hyperv: Initial commit for Synthetic Debugging device
Date: Tue, 19 Apr 2022 07:51:03 +0200
Message-Id: <20220419055109.142788-48-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jon Doron <arilou@gmail.com>

Signed-off-by: Jon Doron <arilou@gmail.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220216102500.692781-5-arilou@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/hyperv/Kconfig     |   5 +
 hw/hyperv/meson.build |   1 +
 hw/hyperv/syndbg.c    | 402 ++++++++++++++++++++++++++++++++++++++++++
 target/i386/kvm/kvm.c |   6 +
 4 files changed, 414 insertions(+)
 create mode 100644 hw/hyperv/syndbg.c

diff --git a/hw/hyperv/Kconfig b/hw/hyperv/Kconfig
index 3fbfe41c9e..fcf65903bd 100644
--- a/hw/hyperv/Kconfig
+++ b/hw/hyperv/Kconfig
@@ -11,3 +11,8 @@ config VMBUS
     bool
     default y
     depends on HYPERV
+
+config SYNDBG
+    bool
+    default y
+    depends on VMBUS
diff --git a/hw/hyperv/meson.build b/hw/hyperv/meson.build
index 1367e2994f..b43f119ea5 100644
--- a/hw/hyperv/meson.build
+++ b/hw/hyperv/meson.build
@@ -1,3 +1,4 @@
 specific_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'))
 specific_ss.add(when: 'CONFIG_HYPERV_TESTDEV', if_true: files('hyperv_testdev.c'))
 specific_ss.add(when: 'CONFIG_VMBUS', if_true: files('vmbus.c'))
+specific_ss.add(when: 'CONFIG_SYNDBG', if_true: files('syndbg.c'))
diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
new file mode 100644
index 0000000000..89ae19b9aa
--- /dev/null
+++ b/hw/hyperv/syndbg.c
@@ -0,0 +1,402 @@
+/*
+ * QEMU Hyper-V Synthetic Debugging device
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/ctype.h"
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "qemu/sockets.h"
+#include "qemu-common.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/loader.h"
+#include "cpu.h"
+#include "hw/hyperv/hyperv.h"
+#include "hw/hyperv/vmbus-bridge.h"
+#include "hw/hyperv/hyperv-proto.h"
+#include "net/net.h"
+#include "net/eth.h"
+#include "net/checksum.h"
+#include "trace.h"
+
+#define TYPE_HV_SYNDBG       "hv-syndbg"
+
+typedef struct HvSynDbg {
+    DeviceState parent_obj;
+
+    char *host_ip;
+    uint16_t host_port;
+    bool use_hcalls;
+
+    uint32_t target_ip;
+    struct sockaddr_in servaddr;
+    int socket;
+    bool has_data_pending;
+    uint64_t pending_page_gpa;
+} HvSynDbg;
+
+#define HVSYNDBG(obj) OBJECT_CHECK(HvSynDbg, (obj), TYPE_HV_SYNDBG)
+
+/* returns NULL unless there is exactly one HV Synth debug device */
+static HvSynDbg *hv_syndbg_find(void)
+{
+    /* Returns NULL unless there is exactly one hvsd device */
+    return HVSYNDBG(object_resolve_path_type("", TYPE_HV_SYNDBG, NULL));
+}
+
+static void set_pending_state(HvSynDbg *syndbg, bool has_pending)
+{
+    hwaddr out_len;
+    void *out_data;
+
+    syndbg->has_data_pending = has_pending;
+
+    if (!syndbg->pending_page_gpa) {
+        return;
+    }
+
+    out_len = 1;
+    out_data = cpu_physical_memory_map(syndbg->pending_page_gpa, &out_len, 1);
+    if (out_data) {
+        *(uint8_t *)out_data = !!has_pending;
+        cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
+    }
+}
+
+static bool get_udb_pkt_data(void *p, uint32_t len, uint32_t *data_ofs,
+                             uint32_t *src_ip)
+{
+    uint32_t offset, curr_len = len;
+
+    if (curr_len < sizeof(struct eth_header) ||
+        (be16_to_cpu(PKT_GET_ETH_HDR(p)->h_proto) != ETH_P_IP)) {
+        return false;
+    }
+    offset = sizeof(struct eth_header);
+    curr_len -= sizeof(struct eth_header);
+
+    if (curr_len < sizeof(struct ip_header) ||
+        PKT_GET_IP_HDR(p)->ip_p != IP_PROTO_UDP) {
+        return false;
+    }
+    offset += PKT_GET_IP_HDR_LEN(p);
+    curr_len -= PKT_GET_IP_HDR_LEN(p);
+
+    if (curr_len < sizeof(struct udp_header)) {
+        return false;
+    }
+
+    offset += sizeof(struct udp_header);
+    *data_ofs = offset;
+    *src_ip = PKT_GET_IP_HDR(p)->ip_src;
+    return true;
+}
+
+static uint16_t handle_send_msg(HvSynDbg *syndbg, uint64_t ingpa,
+                                uint32_t count, bool is_raw,
+                                uint32_t *pending_count)
+{
+    uint16_t ret;
+    hwaddr data_len;
+    void *debug_data = NULL;
+    uint32_t udp_data_ofs = 0;
+    const void *pkt_data;
+    int sent_count;
+
+    data_len = count;
+    debug_data = cpu_physical_memory_map(ingpa, &data_len, 0);
+    if (!debug_data || data_len < count) {
+        ret = HV_STATUS_INSUFFICIENT_MEMORY;
+        goto cleanup;
+    }
+
+    if (is_raw &&
+        !get_udb_pkt_data(debug_data, count, &udp_data_ofs,
+                          &syndbg->target_ip)) {
+        ret = HV_STATUS_SUCCESS;
+        goto cleanup;
+    }
+
+    pkt_data = (const void *)((uintptr_t)debug_data + udp_data_ofs);
+    sent_count = sendto(syndbg->socket, pkt_data, count - udp_data_ofs,
+                             MSG_NOSIGNAL, NULL, 0);
+    if (sent_count == -1) {
+        ret = HV_STATUS_INSUFFICIENT_MEMORY;
+        goto cleanup;
+    }
+
+    *pending_count = count - (sent_count + udp_data_ofs);
+    ret = HV_STATUS_SUCCESS;
+cleanup:
+    if (debug_data) {
+        cpu_physical_memory_unmap(debug_data, count, 0, data_len);
+    }
+
+    return ret;
+}
+
+#define UDP_PKT_HEADER_SIZE \
+    (sizeof(struct eth_header) + sizeof(struct ip_header) +\
+     sizeof(struct udp_header))
+
+static bool create_udp_pkt(HvSynDbg *syndbg, void *pkt, uint32_t pkt_len,
+                           void *udp_data, uint32_t udp_data_len)
+{
+    struct udp_header *udp_part;
+
+    if (pkt_len < (UDP_PKT_HEADER_SIZE + udp_data_len)) {
+        return false;
+    }
+
+    /* Setup the eth */
+    memset(&PKT_GET_ETH_HDR(pkt)->h_source, 0, ETH_ALEN);
+    memset(&PKT_GET_ETH_HDR(pkt)->h_dest, 0, ETH_ALEN);
+    PKT_GET_ETH_HDR(pkt)->h_proto = cpu_to_be16(ETH_P_IP);
+
+    /* Setup the ip */
+    PKT_GET_IP_HDR(pkt)->ip_ver_len =
+        (4 << 4) | (sizeof(struct ip_header) >> 2);
+    PKT_GET_IP_HDR(pkt)->ip_tos = 0;
+    PKT_GET_IP_HDR(pkt)->ip_id = 0;
+    PKT_GET_IP_HDR(pkt)->ip_off = 0;
+    PKT_GET_IP_HDR(pkt)->ip_ttl = 64; /* IPDEFTTL */
+    PKT_GET_IP_HDR(pkt)->ip_p = IP_PROTO_UDP;
+    PKT_GET_IP_HDR(pkt)->ip_src = syndbg->servaddr.sin_addr.s_addr;
+    PKT_GET_IP_HDR(pkt)->ip_dst = syndbg->target_ip;
+    PKT_GET_IP_HDR(pkt)->ip_len =
+        cpu_to_be16(sizeof(struct ip_header) + sizeof(struct udp_header) +
+                    udp_data_len);
+    eth_fix_ip4_checksum(PKT_GET_IP_HDR(pkt), PKT_GET_IP_HDR_LEN(pkt));
+
+    udp_part = (struct udp_header *)((uintptr_t)pkt +
+                                     sizeof(struct eth_header) +
+                                     PKT_GET_IP_HDR_LEN(pkt));
+    udp_part->uh_sport = syndbg->servaddr.sin_port;
+    udp_part->uh_dport = syndbg->servaddr.sin_port;
+    udp_part->uh_ulen = cpu_to_be16(sizeof(struct udp_header) + udp_data_len);
+    memcpy(udp_part + 1, udp_data, udp_data_len);
+    net_checksum_calculate(pkt, UDP_PKT_HEADER_SIZE + udp_data_len, CSUM_ALL);
+    return true;
+}
+
+static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
+                                uint32_t count, bool is_raw, uint32_t options,
+                                uint64_t timeout, uint32_t *retrieved_count)
+{
+    uint16_t ret;
+    uint8_t data_buf[TARGET_PAGE_SIZE - UDP_PKT_HEADER_SIZE];
+    hwaddr out_len;
+    void *out_data;
+    ssize_t recv_byte_count;
+
+    /* TODO: Handle options and timeout */
+    (void)options;
+    (void)timeout;
+
+    if (!syndbg->has_data_pending) {
+        recv_byte_count = 0;
+    } else {
+        recv_byte_count = recv(syndbg->socket, data_buf,
+                               MIN(sizeof(data_buf), count), MSG_WAITALL);
+        if (recv_byte_count == -1) {
+            return HV_STATUS_INVALID_PARAMETER;
+        }
+    }
+
+    if (!recv_byte_count) {
+        *retrieved_count = 0;
+        return HV_STATUS_NO_DATA;
+    }
+
+    set_pending_state(syndbg, false);
+
+    out_len = recv_byte_count;
+    if (is_raw) {
+        out_len += UDP_PKT_HEADER_SIZE;
+    }
+    out_data = cpu_physical_memory_map(outgpa, &out_len, 1);
+    if (!out_data) {
+        return HV_STATUS_INSUFFICIENT_MEMORY;
+    }
+
+    if (is_raw &&
+        !create_udp_pkt(syndbg, out_data,
+                        recv_byte_count + UDP_PKT_HEADER_SIZE,
+                        data_buf, recv_byte_count)) {
+        ret = HV_STATUS_INSUFFICIENT_MEMORY;
+        goto cleanup_out_data;
+    } else if (!is_raw) {
+        memcpy(out_data, data_buf, recv_byte_count);
+    }
+
+    *retrieved_count = recv_byte_count;
+    if (is_raw) {
+        *retrieved_count += UDP_PKT_HEADER_SIZE;
+    }
+    ret = HV_STATUS_SUCCESS;
+
+cleanup_out_data:
+    cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
+    return ret;
+}
+
+static uint16_t hv_syndbg_handler(void *context, HvSynDbgMsg *msg)
+{
+    HvSynDbg *syndbg = context;
+    uint16_t ret = HV_STATUS_INVALID_HYPERCALL_CODE;
+
+    switch (msg->type) {
+    case HV_SYNDBG_MSG_CONNECTION_INFO:
+        msg->u.connection_info.host_ip =
+            ntohl(syndbg->servaddr.sin_addr.s_addr);
+        msg->u.connection_info.host_port =
+            ntohs(syndbg->servaddr.sin_port);
+        ret = HV_STATUS_SUCCESS;
+        break;
+    case HV_SYNDBG_MSG_SEND:
+        ret = handle_send_msg(syndbg, msg->u.send.buf_gpa, msg->u.send.count,
+                              msg->u.send.is_raw, &msg->u.send.pending_count);
+        break;
+    case HV_SYNDBG_MSG_RECV:
+        ret = handle_recv_msg(syndbg, msg->u.recv.buf_gpa, msg->u.recv.count,
+                              msg->u.recv.is_raw, msg->u.recv.options,
+                              msg->u.recv.timeout,
+                              &msg->u.recv.retrieved_count);
+        break;
+    case HV_SYNDBG_MSG_SET_PENDING_PAGE:
+        syndbg->pending_page_gpa = msg->u.pending_page.buf_gpa;
+        ret = HV_STATUS_SUCCESS;
+        break;
+    case HV_SYNDBG_MSG_QUERY_OPTIONS:
+        msg->u.query_options.options = 0;
+        if (syndbg->use_hcalls) {
+            msg->u.query_options.options = HV_X64_SYNDBG_OPTION_USE_HCALLS;
+        }
+        ret = HV_STATUS_SUCCESS;
+        break;
+    default:
+        break;
+    }
+
+    return ret;
+}
+
+static void hv_syndbg_recv_event(void *opaque)
+{
+    HvSynDbg *syndbg = opaque;
+    struct timeval tv;
+    fd_set rfds;
+
+    tv.tv_sec = 0;
+    tv.tv_usec = 0;
+    FD_ZERO(&rfds);
+    FD_SET(syndbg->socket, &rfds);
+    if (select(syndbg->socket + 1, &rfds, NULL, NULL, &tv) > 0) {
+        set_pending_state(syndbg, true);
+    }
+}
+
+static void hv_syndbg_realize(DeviceState *dev, Error **errp)
+{
+    HvSynDbg *syndbg = HVSYNDBG(dev);
+
+    if (!hv_syndbg_find()) {
+        error_setg(errp, "at most one %s device is permitted", TYPE_HV_SYNDBG);
+        return;
+    }
+
+    if (!vmbus_bridge_find()) {
+        error_setg(errp, "%s device requires vmbus-bridge device",
+                   TYPE_HV_SYNDBG);
+        return;
+    }
+
+    /* Parse and host_ip */
+    if (qemu_isdigit(syndbg->host_ip[0])) {
+        syndbg->servaddr.sin_addr.s_addr = inet_addr(syndbg->host_ip);
+    } else {
+        struct hostent *he = gethostbyname(syndbg->host_ip);
+        if (!he) {
+            error_setg(errp, "%s failed to resolve host name %s",
+                       TYPE_HV_SYNDBG, syndbg->host_ip);
+            return;
+        }
+        syndbg->servaddr.sin_addr = *(struct in_addr *)he->h_addr;
+    }
+
+    syndbg->socket = socket(AF_INET, SOCK_DGRAM, 0);
+    if (syndbg->socket < 0) {
+        error_setg(errp, "%s failed to create socket", TYPE_HV_SYNDBG);
+        return;
+    }
+
+    qemu_set_nonblock(syndbg->socket);
+
+    syndbg->servaddr.sin_port = htons(syndbg->host_port);
+    syndbg->servaddr.sin_family = AF_INET;
+    if (connect(syndbg->socket, (struct sockaddr *)&syndbg->servaddr,
+                sizeof(syndbg->servaddr)) < 0) {
+        closesocket(syndbg->socket);
+        error_setg(errp, "%s failed to connect to socket", TYPE_HV_SYNDBG);
+        return;
+    }
+
+    syndbg->pending_page_gpa = 0;
+    syndbg->has_data_pending = false;
+    hyperv_set_syndbg_handler(hv_syndbg_handler, syndbg);
+    qemu_set_fd_handler(syndbg->socket, hv_syndbg_recv_event, NULL, syndbg);
+}
+
+static void hv_syndbg_unrealize(DeviceState *dev)
+{
+    HvSynDbg *syndbg = HVSYNDBG(dev);
+
+    if (syndbg->socket > 0) {
+        qemu_set_fd_handler(syndbg->socket, NULL, NULL, NULL);
+        closesocket(syndbg->socket);
+    }
+}
+
+static const VMStateDescription vmstate_hv_syndbg = {
+    .name = TYPE_HV_SYNDBG,
+    .unmigratable = 1,
+};
+
+static Property hv_syndbg_properties[] = {
+    DEFINE_PROP_STRING("host_ip", HvSynDbg, host_ip),
+    DEFINE_PROP_UINT16("host_port", HvSynDbg, host_port, 50000),
+    DEFINE_PROP_BOOL("use_hcalls", HvSynDbg, use_hcalls, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void hv_syndbg_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, hv_syndbg_properties);
+    dc->fw_name = TYPE_HV_SYNDBG;
+    dc->vmsd = &vmstate_hv_syndbg;
+    dc->realize = hv_syndbg_realize;
+    dc->unrealize = hv_syndbg_unrealize;
+    dc->user_creatable = true;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo hv_syndbg_type_info = {
+    .name = TYPE_HV_SYNDBG,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(HvSynDbg),
+    .class_init = hv_syndbg_class_init,
+};
+
+static void hv_syndbg_register_types(void)
+{
+    type_register_static(&hv_syndbg_type_info);
+}
+
+type_init(hv_syndbg_register_types)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 0bb3176edc..c885763a5b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -54,6 +54,8 @@
 #include "exec/memattrs.h"
 #include "trace.h"
 
+#include CONFIG_DEVICES
+
 //#define DEBUG_KVM
 
 #ifdef DEBUG_KVM
@@ -965,6 +967,7 @@ static struct {
              .bits = HV_DEPRECATING_AEOI_RECOMMENDED}
         }
     },
+#ifdef CONFIG_SYNDBG
     [HYPERV_FEAT_SYNDBG] = {
         .desc = "Enable synthetic kernel debugger channel (hv-syndbg)",
         .flags = {
@@ -973,6 +976,7 @@ static struct {
         },
         .dependencies = BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_RELAXED)
     },
+#endif
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
@@ -3233,11 +3237,13 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                 kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_STATUS,
                                   env->msr_hv_tsc_emulation_status);
             }
+#ifdef CONFIG_SYNDBG
             if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG) &&
                 has_msr_hv_syndbg_options) {
                 kvm_msr_entry_add(cpu, HV_X64_MSR_SYNDBG_OPTIONS,
                                   hyperv_syndbg_query_options());
             }
+#endif
         }
         if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
             kvm_msr_entry_add(cpu, HV_X64_MSR_APIC_ASSIST_PAGE,
-- 
2.35.1



