Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E70A4B857D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:28:22 +0100 (CET)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHXo-0001or-Vi
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:28:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nKHV2-0007E6-Di
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:25:29 -0500
Received: from [2a00:1450:4864:20::42b] (port=38615
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nKHUz-0005Cm-7c
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:25:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d27so2652380wrb.5
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 02:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pWlIy25gsosmWshCCMM1GogJS70eXo5ISLNVt2+bFg=;
 b=XZvJTMsv/VJKtkxKtfsb35jonJ6FPptYebrQbrTfbXZimiRQ7eyS12JtTIy1I1ClhJ
 PpueZ0klVyg1rmkhYBVJ/gen+mllgpK4XhzuI9riS+vt8dN3IZICREs/zI3qhug4Wslk
 qWrWbFPvGy27HGqsIiZ8qkAv20CcAVZIUey4kXCDCkjdRTByBZMPTRnF1kQdsV1vteUS
 kWSdFQRDeQzmzJGydh/DfMPC6MU9gokDjNE0Rjt21lGx1D4s7kO0Rn1WhDn8oDzft96s
 b8bYZQHpUpTAXxC90WEc09WEGpjsbNjR3tXgXh6Pyr2EQIHLmELfhU4abhluYltz/9RG
 MwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pWlIy25gsosmWshCCMM1GogJS70eXo5ISLNVt2+bFg=;
 b=fNTy7KPzZSyijHnBY9y/irdWD1pm0iZZaUzE2gRHFqvUv5tOPqyy/EtgJo8lWAJhrN
 pDGjZ7nzQ6EWozk/we4ax5E+upyNON7UhtI/h5eLvntqZZ0rr4qfqGJSPsODk+PMS1Y3
 itv4QZ3JcVnBQtrQQo07l/2X85wrXKCromFIqrv2LxCtLZeiW4sIIIWnPrg8AyRnZELw
 g2XOaAzGMr1+qQy3zxrAzyocQB4NqyvMfggZzFMjcKYuzj/Q+myfcLNmbkk2/f6Hia9Z
 ngKpL63WrA+Vl8MYc7zznnDL7sjXV0cUAuwSjhfYLHfIS6+VCFbUj7p0wLRvKyDH6SpX
 X9UQ==
X-Gm-Message-State: AOAM530qAyTCKGO9GZFUgzsI5iifCC/Mdu2qfBn8aVJ/7UqDczDXrHN3
 EIHHkTYcuumY8FJ4RzAej4pofdnz170=
X-Google-Smtp-Source: ABdhPJzGI1zsB3RejdNZ6TI4sPE/THFiBiCd6nmK81/efHlPQNqrnYYbiL7YLBHiyVyAkZ5B42lpug==
X-Received: by 2002:adf:f790:0:b0:1e5:19f3:e0b8 with SMTP id
 q16-20020adff790000000b001e519f3e0b8mr1664109wrp.643.1645007122668; 
 Wed, 16 Feb 2022 02:25:22 -0800 (PST)
Received: from localhost.localdomain
 ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id y10sm17212967wmi.47.2022.02.16.02.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:25:22 -0800 (PST)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hyperv: Add definitions for syndbg
Date: Wed, 16 Feb 2022 12:24:58 +0200
Message-Id: <20220216102500.692781-3-arilou@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216102500.692781-1-arilou@gmail.com>
References: <20220216102500.692781-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=arilou@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Add all required definitions for hyperv synthetic debugger interface.

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 include/hw/hyperv/hyperv-proto.h | 52 ++++++++++++++++++++++++++++++++
 target/i386/kvm/hyperv-proto.h   | 37 +++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/include/hw/hyperv/hyperv-proto.h b/include/hw/hyperv/hyperv-proto.h
index 21dc28aee9..4a2297307b 100644
--- a/include/hw/hyperv/hyperv-proto.h
+++ b/include/hw/hyperv/hyperv-proto.h
@@ -24,12 +24,17 @@
 #define HV_STATUS_INVALID_PORT_ID             17
 #define HV_STATUS_INVALID_CONNECTION_ID       18
 #define HV_STATUS_INSUFFICIENT_BUFFERS        19
+#define HV_STATUS_NOT_ACKNOWLEDGED            20
+#define HV_STATUS_NO_DATA                     27
 
 /*
  * Hypercall numbers
  */
 #define HV_POST_MESSAGE                       0x005c
 #define HV_SIGNAL_EVENT                       0x005d
+#define HV_POST_DEBUG_DATA                    0x0069
+#define HV_RETRIEVE_DEBUG_DATA                0x006a
+#define HV_RESET_DEBUG_SESSION                0x006b
 #define HV_HYPERCALL_FAST                     (1u << 16)
 
 /*
@@ -127,4 +132,51 @@ struct hyperv_event_flags_page {
     struct hyperv_event_flags slot[HV_SINT_COUNT];
 };
 
+/*
+ * Kernel debugger structures
+ */
+
+/* Options flags for hyperv_reset_debug_session */
+#define HV_DEBUG_PURGE_INCOMING_DATA        0x00000001
+#define HV_DEBUG_PURGE_OUTGOING_DATA        0x00000002
+struct hyperv_reset_debug_session_input {
+    uint32_t options;
+} __attribute__ ((__packed__));
+
+struct hyperv_reset_debug_session_output {
+    uint32_t host_ip;
+    uint32_t target_ip;
+    uint16_t host_port;
+    uint16_t target_port;
+    uint8_t host_mac[6];
+    uint8_t target_mac[6];
+} __attribute__ ((__packed__));
+
+/* Options for hyperv_post_debug_data */
+#define HV_DEBUG_POST_LOOP                  0x00000001
+
+struct hyperv_post_debug_data_input {
+    uint32_t count;
+    uint32_t options;
+    /*uint8_t data[HV_HYP_PAGE_SIZE - 2 * sizeof(uint32_t)];*/
+} __attribute__ ((__packed__));
+
+struct hyperv_post_debug_data_output {
+    uint32_t pending_count;
+} __attribute__ ((__packed__));
+
+/* Options for hyperv_retrieve_debug_data */
+#define HV_DEBUG_RETRIEVE_LOOP              0x00000001
+#define HV_DEBUG_RETRIEVE_TEST_ACTIVITY     0x00000002
+
+struct hyperv_retrieve_debug_data_input {
+    uint32_t count;
+    uint32_t options;
+    uint64_t timeout;
+} __attribute__ ((__packed__));
+
+struct hyperv_retrieve_debug_data_output {
+    uint32_t retrieved_count;
+    uint32_t remaining_count;
+} __attribute__ ((__packed__));
 #endif
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index 89f81afda7..e40e59411c 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -19,6 +19,9 @@
 #define HV_CPUID_ENLIGHTMENT_INFO             0x40000004
 #define HV_CPUID_IMPLEMENT_LIMITS             0x40000005
 #define HV_CPUID_NESTED_FEATURES              0x4000000A
+#define HV_CPUID_SYNDBG_VENDOR_AND_MAX_FUNCTIONS    0x40000080
+#define HV_CPUID_SYNDBG_INTERFACE                   0x40000081
+#define HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES       0x40000082
 #define HV_CPUID_MIN                          0x40000005
 #define HV_CPUID_MAX                          0x4000ffff
 #define HV_HYPERVISOR_PRESENT_BIT             0x80000000
@@ -55,8 +58,14 @@
 #define HV_GUEST_IDLE_STATE_AVAILABLE           (1u << 5)
 #define HV_FREQUENCY_MSRS_AVAILABLE             (1u << 8)
 #define HV_GUEST_CRASH_MSR_AVAILABLE            (1u << 10)
+#define HV_FEATURE_DEBUG_MSRS_AVAILABLE         (1u << 11)
 #define HV_STIMER_DIRECT_MODE_AVAILABLE         (1u << 19)
 
+/*
+ * HV_CPUID_FEATURES.EBX bits
+ */
+#define HV_PARTITION_DEBUGGING_ALLOWED          (1u << 12)
+
 /*
  * HV_CPUID_ENLIGHTMENT_INFO.EAX bits
  */
@@ -72,6 +81,11 @@
 #define HV_ENLIGHTENED_VMCS_RECOMMENDED     (1u << 14)
 #define HV_NO_NONARCH_CORESHARING           (1u << 18)
 
+/*
+ * HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES.EAX bits
+ */
+#define HV_SYNDBG_CAP_ALLOW_KERNEL_DEBUGGING    (1u << 1)
+
 /*
  * Basic virtualized MSRs
  */
@@ -130,6 +144,18 @@
 #define HV_X64_MSR_STIMER3_CONFIG               0x400000B6
 #define HV_X64_MSR_STIMER3_COUNT                0x400000B7
 
+/*
+ * Hyper-V Synthetic debug options MSR
+ */
+#define HV_X64_MSR_SYNDBG_CONTROL               0x400000F1
+#define HV_X64_MSR_SYNDBG_STATUS                0x400000F2
+#define HV_X64_MSR_SYNDBG_SEND_BUFFER           0x400000F3
+#define HV_X64_MSR_SYNDBG_RECV_BUFFER           0x400000F4
+#define HV_X64_MSR_SYNDBG_PENDING_BUFFER        0x400000F5
+#define HV_X64_MSR_SYNDBG_OPTIONS               0x400000FF
+
+#define HV_X64_SYNDBG_OPTION_USE_HCALLS         BIT(2)
+
 /*
  * Guest crash notification MSRs
  */
@@ -168,5 +194,16 @@
 
 #define HV_STIMER_COUNT                       4
 
+/*
+ * Synthetic debugger control definitions
+ */
+#define HV_SYNDBG_CONTROL_SEND              (1u << 0)
+#define HV_SYNDBG_CONTROL_RECV              (1u << 1)
+#define HV_SYNDBG_CONTROL_SEND_SIZE(ctl)    ((ctl >> 16) & 0xffff)
+#define HV_SYNDBG_STATUS_INVALID            (0)
+#define HV_SYNDBG_STATUS_SEND_SUCCESS       (1u << 0)
+#define HV_SYNDBG_STATUS_RECV_SUCCESS       (1u << 2)
+#define HV_SYNDBG_STATUS_RESET              (1u << 3)
+#define HV_SYNDBG_STATUS_SET_SIZE(st, sz)   (st | (sz << 16))
 
 #endif
-- 
2.35.1


