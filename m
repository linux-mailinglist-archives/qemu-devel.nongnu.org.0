Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD14D9EEC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:43:20 +0100 (CET)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9KR-0003sY-3U
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:43:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nU9AI-0002R4-NB
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:32:50 -0400
Received: from [2a00:1450:4864:20::429] (port=45835
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nU9AG-0001TV-5T
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:32:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id p9so29548930wra.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOAnZVQ6DvcJNfMPFhjLRZR2iXuK0l4TRp21+R4a0wE=;
 b=QxZ3E3YyCO5Kqu/TsFhlRqYRSK8YYfGLjM/t0gTY9b58NexJD9abWjYiUa96DQc4nw
 fF4gGmxzpTkH/79o+uWs62VGuoev0IumPa6rJgbjEXvfp96CTqesWx1PaD7B+UB6EZNH
 8bDnAYjISN4x+F59U+Ma8WNPZIKfDQAml+9f2cRQzwmZDp/iAnouQ6+PAcvvGBNsQdOR
 LktwwkxvmsxqP9UwQrhG9/GEHCwfVOh91Uh05s4ktfyXsSnH8rIm0UORtrKIPUT7LIVb
 gTgXUOTyrSh9I3ymk14BulbPSCYojetXs05gLSSSpsxc3xkr54f770Da+bgNCqaS3ZYS
 dc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOAnZVQ6DvcJNfMPFhjLRZR2iXuK0l4TRp21+R4a0wE=;
 b=GUaz+62f2kp2QtcocEI4R1GBYZ7Ad83DOvKTn7m216kKuv7MjvJsl05/Z833hdgBRc
 NAn+UQtFJDJw4iJKEIeqZA67TZWzF/dtFJwHX49J9wcYyZSXlxwi8Idcx4Bf2XbONHLu
 a6LJl+ELEsfqvETkB30cOBvndW43LhHA7fG+beIeHNZrkeBYf9cXYWqeu9poNb8O9HIw
 gmf0xyQghJRaDt7hoqLFNth8AJ92kBAo4jg6kcwqkFr5SajUjciR96HJYkSuwN9v/T5z
 RwlG7l3MaPf9oxMmOwOzHKA+G6zM4Izr5B8J5X48AEtvbCFPL1YiOwSYdt9O1StLx2H+
 lOgA==
X-Gm-Message-State: AOAM533krvT9tQpAeSqfIrKkxDJeT7lae7UtxUOdmxhpQvN+yBpWmJm/
 n8MOy5CdPGF1hojwBexb6bxf/UAfic4=
X-Google-Smtp-Source: ABdhPJxhE9/uSN6aDTjsTBNEMAV+/QlODtmhpKlqZtKiuoUn3YKEXaFKe2RgpAPU6drITGVPWAtsGA==
X-Received: by 2002:adf:d08f:0:b0:1f0:7eaa:e541 with SMTP id
 y15-20020adfd08f000000b001f07eaae541mr20620476wrh.372.1647358365882; 
 Tue, 15 Mar 2022 08:32:45 -0700 (PDT)
Received: from localhost.localdomain
 ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm4468021wms.9.2022.03.15.08.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 08:32:45 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] hyperv: Add support to process syndbg commands
Date: Tue, 15 Mar 2022 17:32:19 +0200
Message-Id: <20220315153220.953556-4-arilou@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315153220.953556-1-arilou@gmail.com>
References: <20220315153220.953556-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=arilou@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SynDbg commands can come from two different flows:
1. Hypercalls, in this mode the data being sent is fully
   encapsulated network packets.
2. SynDbg specific MSRs, in this mode only the data that needs to be
   transfered is passed.

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 docs/hyperv.txt               |  15 +++
 hw/hyperv/hyperv.c            | 243 ++++++++++++++++++++++++++++++++++
 include/hw/hyperv/hyperv.h    |  58 ++++++++
 target/i386/cpu.c             |   2 +
 target/i386/cpu.h             |   7 +
 target/i386/kvm/hyperv-stub.c |   6 +
 target/i386/kvm/hyperv.c      |  52 +++++++-
 target/i386/kvm/kvm.c         |  76 ++++++++++-
 8 files changed, 451 insertions(+), 8 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 0417c183a3..33588a0396 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -225,6 +225,21 @@ default (WS2016).
 Note: hv-version-id-* are not enlightenments and thus don't enable Hyper-V
 identification when specified without any other enlightenments.
 
+3.21. hv-syndbg
+===============
+Enables Hyper-V synthetic debugger interface, this is a special interface used
+by Windows Kernel debugger to send the packets through, rather than sending
+them via serial/network .
+When enabled, this enlightenment provides additional communication facilities
+to the guest: SynDbg messages.
+This new communication is used by Windows Kernel debugger rather than sending
+packets via serial/network, adding significant performance boost over the other
+comm channels.
+This enlightenment requires a VMBus device (-device vmbus-bridge,irq=15)
+and the follow enlightenments to work:
+hv-relaxed,hv_time,hv-vapic,hv-vpindex,hv-synic,hv-runtime,hv-stimer
+
+
 4. Supplementary features
 =========================
 
diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 8b832566c1..4a1b59cb9d 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -704,3 +704,246 @@ uint16_t hyperv_hcall_signal_event(uint64_t param, bool fast)
     }
     return HV_STATUS_INVALID_CONNECTION_ID;
 }
+
+static HvSynDbgHandler hv_syndbg_handler;
+static void *hv_syndbg_context;
+
+void hyperv_set_syndbg_handler(HvSynDbgHandler handler, void *context)
+{
+    assert(!hv_syndbg_handler);
+    hv_syndbg_handler = handler;
+    hv_syndbg_context = context;
+}
+
+uint16_t hyperv_hcall_reset_dbg_session(uint64_t outgpa)
+{
+    uint16_t ret;
+    HvSynDbgMsg msg;
+    struct hyperv_reset_debug_session_output *reset_dbg_session = NULL;
+    hwaddr len;
+
+    if (!hv_syndbg_handler) {
+        ret = HV_STATUS_INVALID_HYPERCALL_CODE;
+        goto cleanup;
+    }
+
+    len = sizeof(*reset_dbg_session);
+    reset_dbg_session = cpu_physical_memory_map(outgpa, &len, 1);
+    if (!reset_dbg_session || len < sizeof(*reset_dbg_session)) {
+        ret = HV_STATUS_INSUFFICIENT_MEMORY;
+        goto cleanup;
+    }
+
+    msg.type = HV_SYNDBG_MSG_CONNECTION_INFO;
+    ret = hv_syndbg_handler(hv_syndbg_context, &msg);
+    if (ret) {
+        goto cleanup;
+    }
+
+    reset_dbg_session->host_ip = msg.u.connection_info.host_ip;
+    reset_dbg_session->host_port = msg.u.connection_info.host_port;
+    /* The following fields are only used as validation for KDVM */
+    memset(&reset_dbg_session->host_mac, 0,
+           sizeof(reset_dbg_session->host_mac));
+    reset_dbg_session->target_ip = msg.u.connection_info.host_ip;
+    reset_dbg_session->target_port = msg.u.connection_info.host_port;
+    memset(&reset_dbg_session->target_mac, 0,
+           sizeof(reset_dbg_session->target_mac));
+cleanup:
+    if (reset_dbg_session) {
+        cpu_physical_memory_unmap(reset_dbg_session,
+                                  sizeof(*reset_dbg_session), 1, len);
+    }
+
+    return ret;
+}
+
+uint16_t hyperv_hcall_retreive_dbg_data(uint64_t ingpa, uint64_t outgpa,
+                                        bool fast)
+{
+    uint16_t ret;
+    struct hyperv_retrieve_debug_data_input *debug_data_in = NULL;
+    struct hyperv_retrieve_debug_data_output *debug_data_out = NULL;
+    hwaddr in_len, out_len;
+    HvSynDbgMsg msg;
+
+    if (fast || !hv_syndbg_handler) {
+        ret = HV_STATUS_INVALID_HYPERCALL_CODE;
+        goto cleanup;
+    }
+
+    in_len = sizeof(*debug_data_in);
+    debug_data_in = cpu_physical_memory_map(ingpa, &in_len, 0);
+    if (!debug_data_in || in_len < sizeof(*debug_data_in)) {
+        ret = HV_STATUS_INSUFFICIENT_MEMORY;
+        goto cleanup;
+    }
+
+    out_len = sizeof(*debug_data_out);
+    debug_data_out = cpu_physical_memory_map(outgpa, &out_len, 1);
+    if (!debug_data_out || out_len < sizeof(*debug_data_out)) {
+        ret = HV_STATUS_INSUFFICIENT_MEMORY;
+        goto cleanup;
+    }
+
+    msg.type = HV_SYNDBG_MSG_RECV;
+    msg.u.recv.buf_gpa = outgpa + sizeof(*debug_data_out);
+    msg.u.recv.count = TARGET_PAGE_SIZE - sizeof(*debug_data_out);
+    msg.u.recv.options = debug_data_in->options;
+    msg.u.recv.timeout = debug_data_in->timeout;
+    msg.u.recv.is_raw = true;
+    ret = hv_syndbg_handler(hv_syndbg_context, &msg);
+    if (ret == HV_STATUS_NO_DATA) {
+        debug_data_out->retrieved_count = 0;
+        debug_data_out->remaining_count = debug_data_in->count;
+        goto cleanup;
+    } else if (ret != HV_STATUS_SUCCESS) {
+        goto cleanup;
+    }
+
+    debug_data_out->retrieved_count = msg.u.recv.retrieved_count;
+    debug_data_out->remaining_count =
+        debug_data_in->count - msg.u.recv.retrieved_count;
+cleanup:
+    if (debug_data_out) {
+        cpu_physical_memory_unmap(debug_data_out, sizeof(*debug_data_out), 1,
+                                  out_len);
+    }
+
+    if (debug_data_in) {
+        cpu_physical_memory_unmap(debug_data_in, sizeof(*debug_data_in), 0,
+                                  in_len);
+    }
+
+    return ret;
+}
+
+uint16_t hyperv_hcall_post_dbg_data(uint64_t ingpa, uint64_t outgpa, bool fast)
+{
+    uint16_t ret;
+    struct hyperv_post_debug_data_input *post_data_in = NULL;
+    struct hyperv_post_debug_data_output *post_data_out = NULL;
+    hwaddr in_len, out_len;
+    HvSynDbgMsg msg;
+
+    if (fast || !hv_syndbg_handler) {
+        ret = HV_STATUS_INVALID_HYPERCALL_CODE;
+        goto cleanup;
+    }
+
+    in_len = sizeof(*post_data_in);
+    post_data_in = cpu_physical_memory_map(ingpa, &in_len, 0);
+    if (!post_data_in || in_len < sizeof(*post_data_in)) {
+        ret = HV_STATUS_INSUFFICIENT_MEMORY;
+        goto cleanup;
+    }
+
+    if (post_data_in->count > TARGET_PAGE_SIZE - sizeof(*post_data_in)) {
+        ret = HV_STATUS_INVALID_PARAMETER;
+        goto cleanup;
+    }
+
+    out_len = sizeof(*post_data_out);
+    post_data_out = cpu_physical_memory_map(outgpa, &out_len, 1);
+    if (!post_data_out || out_len < sizeof(*post_data_out)) {
+        ret = HV_STATUS_INSUFFICIENT_MEMORY;
+        goto cleanup;
+    }
+
+    msg.type = HV_SYNDBG_MSG_SEND;
+    msg.u.send.buf_gpa = ingpa + sizeof(*post_data_in);
+    msg.u.send.count = post_data_in->count;
+    msg.u.send.is_raw = true;
+    ret = hv_syndbg_handler(hv_syndbg_context, &msg);
+    if (ret != HV_STATUS_SUCCESS) {
+        goto cleanup;
+    }
+
+    post_data_out->pending_count = msg.u.send.pending_count;
+    ret = post_data_out->pending_count ? HV_STATUS_INSUFFICIENT_BUFFERS :
+                                         HV_STATUS_SUCCESS;
+cleanup:
+    if (post_data_out) {
+        cpu_physical_memory_unmap(post_data_out,
+                                  sizeof(*post_data_out), 1, out_len);
+    }
+
+    if (post_data_in) {
+        cpu_physical_memory_unmap(post_data_in,
+                                  sizeof(*post_data_in), 0, in_len);
+    }
+
+    return ret;
+}
+
+uint32_t hyperv_syndbg_send(uint64_t ingpa, uint32_t count)
+{
+    HvSynDbgMsg msg;
+
+    if (!hv_syndbg_handler) {
+        return HV_SYNDBG_STATUS_INVALID;
+    }
+
+    msg.type = HV_SYNDBG_MSG_SEND;
+    msg.u.send.buf_gpa = ingpa;
+    msg.u.send.count = count;
+    msg.u.send.is_raw = false;
+    if (hv_syndbg_handler(hv_syndbg_context, &msg)) {
+        return HV_SYNDBG_STATUS_INVALID;
+    }
+
+    return HV_SYNDBG_STATUS_SEND_SUCCESS;
+}
+
+uint32_t hyperv_syndbg_recv(uint64_t ingpa, uint32_t count)
+{
+    uint16_t ret;
+    HvSynDbgMsg msg;
+
+    if (!hv_syndbg_handler) {
+        return HV_SYNDBG_STATUS_INVALID;
+    }
+
+    msg.type = HV_SYNDBG_MSG_RECV;
+    msg.u.recv.buf_gpa = ingpa;
+    msg.u.recv.count = count;
+    msg.u.recv.options = 0;
+    msg.u.recv.timeout = 0;
+    msg.u.recv.is_raw = false;
+    ret = hv_syndbg_handler(hv_syndbg_context, &msg);
+    if (ret != HV_STATUS_SUCCESS) {
+        return 0;
+    }
+
+    return HV_SYNDBG_STATUS_SET_SIZE(HV_SYNDBG_STATUS_RECV_SUCCESS,
+                                     msg.u.recv.retrieved_count);
+}
+
+void hyperv_syndbg_set_pending_page(uint64_t ingpa)
+{
+    HvSynDbgMsg msg;
+
+    if (!hv_syndbg_handler) {
+        return;
+    }
+
+    msg.type = HV_SYNDBG_MSG_SET_PENDING_PAGE;
+    msg.u.pending_page.buf_gpa = ingpa;
+    hv_syndbg_handler(hv_syndbg_context, &msg);
+}
+
+uint64_t hyperv_syndbg_query_options(void)
+{
+    HvSynDbgMsg msg;
+
+    if (!hv_syndbg_handler) {
+        return 0;
+    }
+
+    msg.type = HV_SYNDBG_MSG_QUERY_OPTIONS;
+    if (hv_syndbg_handler(hv_syndbg_context, &msg) != HV_STATUS_SUCCESS) {
+        return 0;
+    }
+
+    return msg.u.query_options.options;
+}
diff --git a/include/hw/hyperv/hyperv.h b/include/hw/hyperv/hyperv.h
index a63ee0003c..015c3524b1 100644
--- a/include/hw/hyperv/hyperv.h
+++ b/include/hw/hyperv/hyperv.h
@@ -81,4 +81,62 @@ void hyperv_synic_update(CPUState *cs, bool enable,
                          hwaddr msg_page_addr, hwaddr event_page_addr);
 bool hyperv_is_synic_enabled(void);
 
+/*
+ * Process HVCALL_RESET_DEBUG_SESSION hypercall.
+ */
+uint16_t hyperv_hcall_reset_dbg_session(uint64_t outgpa);
+/*
+ * Process HVCALL_RETREIVE_DEBUG_DATA hypercall.
+ */
+uint16_t hyperv_hcall_retreive_dbg_data(uint64_t ingpa, uint64_t outgpa,
+                                        bool fast);
+/*
+ * Process HVCALL_POST_DEBUG_DATA hypercall.
+ */
+uint16_t hyperv_hcall_post_dbg_data(uint64_t ingpa, uint64_t outgpa, bool fast);
+
+uint32_t hyperv_syndbg_send(uint64_t ingpa, uint32_t count);
+uint32_t hyperv_syndbg_recv(uint64_t ingpa, uint32_t count);
+void hyperv_syndbg_set_pending_page(uint64_t ingpa);
+uint64_t hyperv_syndbg_query_options(void);
+
+typedef enum HvSynthDbgMsgType {
+    HV_SYNDBG_MSG_CONNECTION_INFO,
+    HV_SYNDBG_MSG_SEND,
+    HV_SYNDBG_MSG_RECV,
+    HV_SYNDBG_MSG_SET_PENDING_PAGE,
+    HV_SYNDBG_MSG_QUERY_OPTIONS
+} HvDbgSynthMsgType;
+
+typedef struct HvSynDbgMsg {
+    HvDbgSynthMsgType type;
+    union {
+        struct {
+            uint32_t host_ip;
+            uint16_t host_port;
+        } connection_info;
+        struct {
+            uint64_t buf_gpa;
+            uint32_t count;
+            uint32_t pending_count;
+            bool is_raw;
+        } send;
+        struct {
+            uint64_t buf_gpa;
+            uint32_t count;
+            uint32_t options;
+            uint64_t timeout;
+            uint32_t retrieved_count;
+            bool is_raw;
+        } recv;
+        struct {
+            uint64_t buf_gpa;
+        } pending_page;
+        struct {
+            uint64_t options;
+        } query_options;
+    } u;
+} HvSynDbgMsg;
+typedef uint16_t (*HvSynDbgHandler)(void *context, HvSynDbgMsg *msg);
+void hyperv_set_syndbg_handler(HvSynDbgHandler handler, void *context);
 #endif
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..9529a6389a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6841,6 +6841,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_AVIC, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
+    DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
+                      HYPERV_FEAT_SYNDBG, 0),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
     DEFINE_PROP_BOOL("hv-enforce-cpuid", X86CPU, hyperv_enforce_cpuid, false),
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9911d7c871..56e0317924 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1060,6 +1060,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define HYPERV_FEAT_IPI                 13
 #define HYPERV_FEAT_STIMER_DIRECT       14
 #define HYPERV_FEAT_AVIC                15
+#define HYPERV_FEAT_SYNDBG              16
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
@@ -1560,6 +1561,12 @@ typedef struct CPUX86State {
     uint64_t msr_hv_hypercall;
     uint64_t msr_hv_guest_os_id;
     uint64_t msr_hv_tsc;
+    uint64_t msr_hv_syndbg_control;
+    uint64_t msr_hv_syndbg_status;
+    uint64_t msr_hv_syndbg_send_page;
+    uint64_t msr_hv_syndbg_recv_page;
+    uint64_t msr_hv_syndbg_pending_page;
+    uint64_t msr_hv_syndbg_options;
 
     /* Per-VCPU HV MSRs */
     uint64_t msr_hv_vapic;
diff --git a/target/i386/kvm/hyperv-stub.c b/target/i386/kvm/hyperv-stub.c
index 0028527e79..778ed782e6 100644
--- a/target/i386/kvm/hyperv-stub.c
+++ b/target/i386/kvm/hyperv-stub.c
@@ -27,6 +27,12 @@ int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
         return 0;
     case KVM_EXIT_HYPERV_HCALL:
         exit->u.hcall.result = HV_STATUS_INVALID_HYPERCALL_CODE;
+        return 0;
+    case KVM_EXIT_HYPERV_SYNDBG:
+        if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
+            return -1;
+        }
+
         return 0;
     default:
         return -1;
diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c
index 26efc1e0e6..9026ef3a81 100644
--- a/target/i386/kvm/hyperv.c
+++ b/target/i386/kvm/hyperv.c
@@ -81,20 +81,66 @@ int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
     case KVM_EXIT_HYPERV_HCALL: {
         uint16_t code = exit->u.hcall.input & 0xffff;
         bool fast = exit->u.hcall.input & HV_HYPERCALL_FAST;
-        uint64_t param = exit->u.hcall.params[0];
+        uint64_t in_param = exit->u.hcall.params[0];
+        uint64_t out_param = exit->u.hcall.params[1];
 
         switch (code) {
         case HV_POST_MESSAGE:
-            exit->u.hcall.result = hyperv_hcall_post_message(param, fast);
+            exit->u.hcall.result = hyperv_hcall_post_message(in_param, fast);
             break;
         case HV_SIGNAL_EVENT:
-            exit->u.hcall.result = hyperv_hcall_signal_event(param, fast);
+            exit->u.hcall.result = hyperv_hcall_signal_event(in_param, fast);
+            break;
+        case HV_POST_DEBUG_DATA:
+            exit->u.hcall.result =
+                hyperv_hcall_post_dbg_data(in_param, out_param, fast);
+            break;
+        case HV_RETRIEVE_DEBUG_DATA:
+            exit->u.hcall.result =
+                hyperv_hcall_retreive_dbg_data(in_param, out_param, fast);
+            break;
+        case HV_RESET_DEBUG_SESSION:
+            exit->u.hcall.result =
+                hyperv_hcall_reset_dbg_session(out_param);
             break;
         default:
             exit->u.hcall.result = HV_STATUS_INVALID_HYPERCALL_CODE;
         }
         return 0;
     }
+
+    case KVM_EXIT_HYPERV_SYNDBG:
+        if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
+            return -1;
+        }
+
+        switch (exit->u.syndbg.msr) {
+        case HV_X64_MSR_SYNDBG_CONTROL: {
+            uint64_t control = exit->u.syndbg.control;
+            env->msr_hv_syndbg_control = control;
+            env->msr_hv_syndbg_send_page = exit->u.syndbg.send_page;
+            env->msr_hv_syndbg_recv_page = exit->u.syndbg.recv_page;
+            exit->u.syndbg.status = HV_STATUS_SUCCESS;
+            if (control & HV_SYNDBG_CONTROL_SEND) {
+                exit->u.syndbg.status =
+                    hyperv_syndbg_send(env->msr_hv_syndbg_send_page,
+                            HV_SYNDBG_CONTROL_SEND_SIZE(control));
+            } else if (control & HV_SYNDBG_CONTROL_RECV) {
+                exit->u.syndbg.status =
+                    hyperv_syndbg_recv(env->msr_hv_syndbg_recv_page,
+                            TARGET_PAGE_SIZE);
+            }
+            break;
+        }
+        case HV_X64_MSR_SYNDBG_PENDING_BUFFER:
+            env->msr_hv_syndbg_pending_page = exit->u.syndbg.pending_page;
+            hyperv_syndbg_set_pending_page(env->msr_hv_syndbg_pending_page);
+            break;
+        default:
+            return -1;
+        }
+
+        return 0;
     default:
         return -1;
     }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c8feb4a6f..1c6f3b53af 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -102,6 +102,7 @@ static bool has_msr_hv_synic;
 static bool has_msr_hv_stimer;
 static bool has_msr_hv_frequencies;
 static bool has_msr_hv_reenlightenment;
+static bool has_msr_hv_syndbg_options;
 static bool has_msr_xss;
 static bool has_msr_umwait;
 static bool has_msr_spec_ctrl;
@@ -932,6 +933,14 @@ static struct {
              .bits = HV_DEPRECATING_AEOI_RECOMMENDED}
         }
     },
+    [HYPERV_FEAT_SYNDBG] = {
+        .desc = "Enable synthetic kernel debugger channel (hv-syndbg)",
+        .flags = {
+            {.func = HV_CPUID_FEATURES, .reg = R_EDX,
+             .bits = HV_FEATURE_DEBUG_MSRS_AVAILABLE}
+        },
+        .dependencies = BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_RELAXED)
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
@@ -972,8 +981,8 @@ static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
 static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
 {
     struct kvm_cpuid2 *cpuid;
-    /* 0x40000000..0x40000005, 0x4000000A, 0x40000080..0x40000080 leaves */
-    int max = 10;
+    /* 0x40000000..0x40000005, 0x4000000A, 0x40000080..0x40000082 leaves */
+    int max = 11;
     int i;
     bool do_sys_ioctl;
 
@@ -1086,6 +1095,12 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
         entry_feat->eax |= HV_SYNTIMERS_AVAILABLE;
     }
 
+    if (has_msr_hv_syndbg_options) {
+        entry_feat->edx |= HV_GUEST_DEBUGGING_AVAILABLE;
+        entry_feat->edx |= HV_FEATURE_DEBUG_MSRS_AVAILABLE;
+        entry_feat->ebx |= HV_PARTITION_DEBUGGING_ALLOWED;
+    }
+
     if (kvm_check_extension(cs->kvm_state,
                             KVM_CAP_HYPERV_TLBFLUSH) > 0) {
         entry_recomm->eax |= HV_REMOTE_TLB_FLUSH_RECOMMENDED;
@@ -1337,12 +1352,22 @@ static int hyperv_fill_cpuids(CPUState *cs,
 {
     X86CPU *cpu = X86_CPU(cs);
     struct kvm_cpuid_entry2 *c;
-    uint32_t cpuid_i = 0;
+    uint32_t signature[3];
+    uint32_t cpuid_i = 0, max_cpuid_leaf = 0;
+
+    max_cpuid_leaf = HV_CPUID_IMPLEMENT_LIMITS;
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
+        max_cpuid_leaf = MAX(max_cpuid_leaf, HV_CPUID_NESTED_FEATURES);
+    }
+
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
+        max_cpuid_leaf =
+            MAX(max_cpuid_leaf, HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES);
+    }
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
-    c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
-        HV_CPUID_NESTED_FEATURES : HV_CPUID_IMPLEMENT_LIMITS;
+    c->eax = max_cpuid_leaf;
     c->ebx = cpu->hyperv_vendor_id[0];
     c->ecx = cpu->hyperv_vendor_id[1];
     c->edx = cpu->hyperv_vendor_id[2];
@@ -1421,6 +1446,33 @@ static int hyperv_fill_cpuids(CPUState *cs,
         c->eax = cpu->hyperv_nested[0];
     }
 
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
+        c = &cpuid_ent[cpuid_i++];
+        c->function = HV_CPUID_SYNDBG_VENDOR_AND_MAX_FUNCTIONS;
+        c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
+            HV_CPUID_NESTED_FEATURES : HV_CPUID_IMPLEMENT_LIMITS;
+        memcpy(signature, "Microsoft VS", 12);
+        c->eax = 0;
+        c->ebx = signature[0];
+        c->ecx = signature[1];
+        c->edx = signature[2];
+
+        c = &cpuid_ent[cpuid_i++];
+        c->function = HV_CPUID_SYNDBG_INTERFACE;
+        memcpy(signature, "VS#1\0\0\0\0\0\0\0\0", 12);
+        c->eax = signature[0];
+        c->ebx = 0;
+        c->ecx = 0;
+        c->edx = 0;
+
+        c = &cpuid_ent[cpuid_i++];
+        c->function = HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES;
+        c->eax = HV_SYNDBG_CAP_ALLOW_KERNEL_DEBUGGING;
+        c->ebx = 0;
+        c->ecx = 0;
+        c->edx = 0;
+    }
+
     return cpuid_i;
 }
 
@@ -2215,6 +2267,9 @@ static int kvm_get_supported_msrs(KVMState *s)
             case HV_X64_MSR_REENLIGHTENMENT_CONTROL:
                 has_msr_hv_reenlightenment = true;
                 break;
+            case HV_X64_MSR_SYNDBG_OPTIONS:
+                has_msr_hv_syndbg_options = true;
+                break;
             case MSR_IA32_SPEC_CTRL:
                 has_msr_spec_ctrl = true;
                 break;
@@ -3132,6 +3187,11 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                 kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_STATUS,
                                   env->msr_hv_tsc_emulation_status);
             }
+            if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG) &&
+                has_msr_hv_syndbg_options) {
+                kvm_msr_entry_add(cpu, HV_X64_MSR_SYNDBG_OPTIONS,
+                                  hyperv_syndbg_query_options());
+            }
         }
         if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
             kvm_msr_entry_add(cpu, HV_X64_MSR_APIC_ASSIST_PAGE,
@@ -3565,6 +3625,9 @@ static int kvm_get_msrs(X86CPU *cpu)
         kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_CONTROL, 0);
         kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_STATUS, 0);
     }
+    if (has_msr_hv_syndbg_options) {
+        kvm_msr_entry_add(cpu, HV_X64_MSR_SYNDBG_OPTIONS, 0);
+    }
     if (has_msr_hv_crash) {
         int j;
 
@@ -3851,6 +3914,9 @@ static int kvm_get_msrs(X86CPU *cpu)
         case HV_X64_MSR_TSC_EMULATION_STATUS:
             env->msr_hv_tsc_emulation_status = msrs[i].data;
             break;
+        case HV_X64_MSR_SYNDBG_OPTIONS:
+            env->msr_hv_syndbg_options = msrs[i].data;
+            break;
         case MSR_MTRRdefType:
             env->mtrr_deftype = msrs[i].data;
             break;
-- 
2.35.1


