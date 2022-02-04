Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B844A9797
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:18:37 +0100 (CET)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvfo-00030P-Cr
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nFvVT-0002aw-Qh
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:07:55 -0500
Received: from [2a00:1450:4864:20::42e] (port=44824
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nFvVR-0000js-0d
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:07:55 -0500
Received: by mail-wr1-x42e.google.com with SMTP id k18so10290920wrg.11
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 02:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ALUT9NrheV33/ehcrPuhcm5VH2gEBiaZUAODpzDB6dA=;
 b=l9GT5oGiciXxCT6S+yMXwsSRdsTAeX0X3AM/p4tKEhv33BJadU3jevGUf30RvHJhPb
 GxTrSMOP+zMj0qoD5tQLDKCyRFWEV6E7QEKNvhEVcEFsr25E2mBFh1nihtuABe4/C5Lc
 ufIQ8c2tzAQwxwWAQ/iVDjLdXz00l7GIzmlrCfeSrppYg/QwwJsx+EbTlGcuRki+gYz+
 6z6dcrg0lbKyBgM4b4KQuLFKmLm6UJyF3npyBcpYKCPgOYCVgnNqwQrLY9RUfK3QJu/9
 cZdEI7J5hSp9pDfhwAdcqgsVdFprYj63FY+zzyC7o8y/XfUX1MvkvC72eLvRP+BHwPRv
 uJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ALUT9NrheV33/ehcrPuhcm5VH2gEBiaZUAODpzDB6dA=;
 b=HrL4ukzyK+gMt5+qVTY0K9nW+4DI5MxrnO3gYc1U4K5/zSpT4p8NdomKw3tr4EimIQ
 FQdXoPZAurSLICiQEmXrsRisFklDtMhE+TS1QOapkxdsGZI4TcLH0m4AyjwShnFyX/S7
 o8S7AqydzdHK1ewFu+tzUWLZ6OPdlLuxROBa9VErckGSVfeBoXCqr4dXG17qUHXKjAKl
 cTOH0KW/wizsAUqSMatZrHF6SKCoU0jYB+kaMTDUmEgSuFn0pdJCAouoNuEOzQJOgiox
 NWlniVssmqnswuWaCnL0CSZOYCFfu8OKDEPXW05iP+Uj0EWWH3Rrrq2yrxc9fRhPKbh0
 OusA==
X-Gm-Message-State: AOAM530ARrEqb+PJgZAqvNcM1ViDbgMyReyIK/F+rDI/RBQEf8jEsdy7
 geLdI4ePkYysxk2CkyBWKh9UBp+/+jE=
X-Google-Smtp-Source: ABdhPJy6TwSn6iLV0jeTjATU7+6hHTCIDtpRBR5O0Ogy8fdnaKYwf4epXZfmd4OyY9NCbODgtHGrRA==
X-Received: by 2002:a05:6000:1b8a:: with SMTP id
 r10mr1842471wru.665.1643969271314; 
 Fri, 04 Feb 2022 02:07:51 -0800 (PST)
Received: from localhost.localdomain
 ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id u18sm657227wrn.110.2022.02.04.02.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 02:07:50 -0800 (PST)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/4] hyperv: SControl is optional to enable SynIc
Date: Fri,  4 Feb 2022 12:07:20 +0200
Message-Id: <20220204100723.406121-2-arilou@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204100723.406121-1-arilou@gmail.com>
References: <20220204100723.406121-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=arilou@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

SynIc can be enabled regardless of the SControl mechanisim which can
register a GSI for a given SintRoute.

This behaviour can achived by setting enabling SIMP and then the guest
will poll on the message slot.

Once there is another message pending the host will set the message slot
with the pending flag.
When the guest polls from the message slot, incase the pending flag is
set it will write to the HV_X64_MSR_EOM indicating it has cleared the
slow and we can try and push our message again.

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 hw/hyperv/hyperv.c         | 233 ++++++++++++++++++++++++-------------
 include/hw/hyperv/hyperv.h |   2 +
 2 files changed, 153 insertions(+), 82 deletions(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index cb1074f234..88c9cc1334 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -27,18 +27,70 @@ struct SynICState {
 
     CPUState *cs;
 
-    bool enabled;
+    bool sctl_enabled;
     hwaddr msg_page_addr;
     hwaddr event_page_addr;
     MemoryRegion msg_page_mr;
     MemoryRegion event_page_mr;
     struct hyperv_message_page *msg_page;
     struct hyperv_event_flags_page *event_page;
+
+    QemuMutex sint_routes_mutex;
+    QLIST_HEAD(, HvSintRoute) sint_routes;
 };
 
 #define TYPE_SYNIC "hyperv-synic"
 OBJECT_DECLARE_SIMPLE_TYPE(SynICState, SYNIC)
 
+/*
+ * KVM has its own message producers (SynIC timers).  To guarantee
+ * serialization with both KVM vcpu and the guest cpu, the messages are first
+ * staged in an intermediate area and then posted to the SynIC message page in
+ * the vcpu thread.
+ */
+typedef struct HvSintStagedMessage {
+    /* message content staged by hyperv_post_msg */
+    struct hyperv_message msg;
+    /* callback + data (r/o) to complete the processing in a BH */
+    HvSintMsgCb cb;
+    void *cb_data;
+    /* message posting status filled by cpu_post_msg */
+    int status;
+    /* passing the buck: */
+    enum {
+        /* initial state */
+        HV_STAGED_MSG_FREE,
+        /*
+         * hyperv_post_msg (e.g. in main loop) grabs the staged area (FREE ->
+         * BUSY), copies msg, and schedules cpu_post_msg on the assigned cpu
+         */
+        HV_STAGED_MSG_BUSY,
+        /*
+         * cpu_post_msg (vcpu thread) tries to copy staged msg to msg slot,
+         * notify the guest, records the status, marks the posting done (BUSY
+         * -> POSTED), and schedules sint_msg_bh BH
+         */
+        HV_STAGED_MSG_POSTED,
+        /*
+         * sint_msg_bh (BH) verifies that the posting is done, runs the
+         * callback, and starts over (POSTED -> FREE)
+         */
+    } state;
+} HvSintStagedMessage;
+
+struct HvSintRoute {
+    uint32_t sint;
+    SynICState *synic;
+    int gsi;
+    EventNotifier sint_set_notifier;
+    EventNotifier sint_ack_notifier;
+
+    HvSintStagedMessage *staged_msg;
+
+    unsigned refcount;
+    QLIST_ENTRY(HvSintRoute) link;
+};
+
 static bool synic_enabled;
 
 bool hyperv_is_synic_enabled(void)
@@ -51,11 +103,11 @@ static SynICState *get_synic(CPUState *cs)
     return SYNIC(object_resolve_path_component(OBJECT(cs), "synic"));
 }
 
-static void synic_update(SynICState *synic, bool enable,
+static void synic_update(SynICState *synic, bool sctl_enable,
                          hwaddr msg_page_addr, hwaddr event_page_addr)
 {
 
-    synic->enabled = enable;
+    synic->sctl_enabled = sctl_enable;
     if (synic->msg_page_addr != msg_page_addr) {
         if (synic->msg_page_addr) {
             memory_region_del_subregion(get_system_memory(),
@@ -80,7 +132,7 @@ static void synic_update(SynICState *synic, bool enable,
     }
 }
 
-void hyperv_synic_update(CPUState *cs, bool enable,
+void hyperv_synic_update(CPUState *cs, bool sctl_enable,
                          hwaddr msg_page_addr, hwaddr event_page_addr)
 {
     SynICState *synic = get_synic(cs);
@@ -89,7 +141,7 @@ void hyperv_synic_update(CPUState *cs, bool enable,
         return;
     }
 
-    synic_update(synic, enable, msg_page_addr, event_page_addr);
+    synic_update(synic, sctl_enable, msg_page_addr, event_page_addr);
 }
 
 static void synic_realize(DeviceState *dev, Error **errp)
@@ -110,16 +162,20 @@ static void synic_realize(DeviceState *dev, Error **errp)
                            sizeof(*synic->event_page), &error_abort);
     synic->msg_page = memory_region_get_ram_ptr(&synic->msg_page_mr);
     synic->event_page = memory_region_get_ram_ptr(&synic->event_page_mr);
+    qemu_mutex_init(&synic->sint_routes_mutex);
+    QLIST_INIT(&synic->sint_routes);
 
     g_free(msgp_name);
     g_free(eventp_name);
 }
+
 static void synic_reset(DeviceState *dev)
 {
     SynICState *synic = SYNIC(dev);
     memset(synic->msg_page, 0, sizeof(*synic->msg_page));
     memset(synic->event_page, 0, sizeof(*synic->event_page));
     synic_update(synic, false, 0, 0);
+    assert(QLIST_EMPTY(&synic->sint_routes));
 }
 
 static void synic_class_init(ObjectClass *klass, void *data)
@@ -168,54 +224,6 @@ static void synic_register_types(void)
 
 type_init(synic_register_types)
 
-/*
- * KVM has its own message producers (SynIC timers).  To guarantee
- * serialization with both KVM vcpu and the guest cpu, the messages are first
- * staged in an intermediate area and then posted to the SynIC message page in
- * the vcpu thread.
- */
-typedef struct HvSintStagedMessage {
-    /* message content staged by hyperv_post_msg */
-    struct hyperv_message msg;
-    /* callback + data (r/o) to complete the processing in a BH */
-    HvSintMsgCb cb;
-    void *cb_data;
-    /* message posting status filled by cpu_post_msg */
-    int status;
-    /* passing the buck: */
-    enum {
-        /* initial state */
-        HV_STAGED_MSG_FREE,
-        /*
-         * hyperv_post_msg (e.g. in main loop) grabs the staged area (FREE ->
-         * BUSY), copies msg, and schedules cpu_post_msg on the assigned cpu
-         */
-        HV_STAGED_MSG_BUSY,
-        /*
-         * cpu_post_msg (vcpu thread) tries to copy staged msg to msg slot,
-         * notify the guest, records the status, marks the posting done (BUSY
-         * -> POSTED), and schedules sint_msg_bh BH
-         */
-        HV_STAGED_MSG_POSTED,
-        /*
-         * sint_msg_bh (BH) verifies that the posting is done, runs the
-         * callback, and starts over (POSTED -> FREE)
-         */
-    } state;
-} HvSintStagedMessage;
-
-struct HvSintRoute {
-    uint32_t sint;
-    SynICState *synic;
-    int gsi;
-    EventNotifier sint_set_notifier;
-    EventNotifier sint_ack_notifier;
-
-    HvSintStagedMessage *staged_msg;
-
-    unsigned refcount;
-};
-
 static CPUState *hyperv_find_vcpu(uint32_t vp_index)
 {
     CPUState *cs = qemu_get_cpu(vp_index);
@@ -259,7 +267,7 @@ static void cpu_post_msg(CPUState *cs, run_on_cpu_data data)
 
     assert(staged_msg->state == HV_STAGED_MSG_BUSY);
 
-    if (!synic->enabled || !synic->msg_page_addr) {
+    if (!synic->msg_page_addr) {
         staged_msg->status = -ENXIO;
         goto posted;
     }
@@ -343,7 +351,7 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
     if (eventno > HV_EVENT_FLAGS_COUNT) {
         return -EINVAL;
     }
-    if (!synic->enabled || !synic->event_page_addr) {
+    if (!synic->sctl_enabled || !synic->event_page_addr) {
         return -ENXIO;
     }
 
@@ -364,11 +372,13 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
 HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
                                    HvSintMsgCb cb, void *cb_data)
 {
-    HvSintRoute *sint_route;
-    EventNotifier *ack_notifier;
+    HvSintRoute *sint_route = NULL;
+    EventNotifier *ack_notifier = NULL;
     int r, gsi;
     CPUState *cs;
     SynICState *synic;
+    bool ack_event_initialized = false, sint_notifier_initialized = false,
+         irqfd_initialized = false;
 
     cs = hyperv_find_vcpu(vp_index);
     if (!cs) {
@@ -381,57 +391,82 @@ HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
     }
 
     sint_route = g_new0(HvSintRoute, 1);
-    r = event_notifier_init(&sint_route->sint_set_notifier, false);
-    if (r) {
-        goto err;
+    if (!sint_route) {
+        goto cleanup_err;
     }
 
+    sint_route->gsi = 0;
+    sint_route->synic = synic;
+    sint_route->sint = sint;
+    sint_route->refcount = 1;
 
     ack_notifier = cb ? &sint_route->sint_ack_notifier : NULL;
     if (ack_notifier) {
         sint_route->staged_msg = g_new0(HvSintStagedMessage, 1);
+        if (!sint_route->staged_msg) {
+            goto cleanup_err;
+        }
         sint_route->staged_msg->cb = cb;
         sint_route->staged_msg->cb_data = cb_data;
 
         r = event_notifier_init(ack_notifier, false);
         if (r) {
-            goto err_sint_set_notifier;
+            goto cleanup_err;
         }
-
         event_notifier_set_handler(ack_notifier, sint_ack_handler);
+        ack_event_initialized = true;
+    }
+
+    /* See if we are done or we need to setup a GSI for this SintRoute */
+    if (!synic->sctl_enabled) {
+        goto cleanup;
     }
 
+    /* We need to setup a GSI for this SintRoute */
+    r = event_notifier_init(&sint_route->sint_set_notifier, false);
+    if (r) {
+        goto cleanup_err;
+    }
+    sint_notifier_initialized = true;
+
     gsi = kvm_irqchip_add_hv_sint_route(kvm_state, vp_index, sint);
     if (gsi < 0) {
-        goto err_gsi;
+        goto cleanup_err;
     }
+    irqfd_initialized = true;
 
     r = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
                                            &sint_route->sint_set_notifier,
                                            ack_notifier, gsi);
     if (r) {
-        goto err_irqfd;
+        goto cleanup_err;
     }
     sint_route->gsi = gsi;
-    sint_route->synic = synic;
-    sint_route->sint = sint;
-    sint_route->refcount = 1;
-
+cleanup:
+    qemu_mutex_lock(&synic->sint_routes_mutex);
+    QLIST_INSERT_HEAD_RCU(&synic->sint_routes, sint_route, link);
+    qemu_mutex_unlock(&synic->sint_routes_mutex);
     return sint_route;
 
-err_irqfd:
-    kvm_irqchip_release_virq(kvm_state, gsi);
-err_gsi:
+cleanup_err:
+    if (irqfd_initialized) {
+        kvm_irqchip_release_virq(kvm_state, gsi);
+    }
+
+    if (sint_notifier_initialized) {
+        event_notifier_cleanup(&sint_route->sint_set_notifier);
+    }
+
     if (ack_notifier) {
-        event_notifier_set_handler(ack_notifier, NULL);
-        event_notifier_cleanup(ack_notifier);
+        if (ack_event_initialized) {
+            event_notifier_set_handler(ack_notifier, NULL);
+            event_notifier_cleanup(ack_notifier);
+        }
+
         g_free(sint_route->staged_msg);
     }
-err_sint_set_notifier:
-    event_notifier_cleanup(&sint_route->sint_set_notifier);
-err:
-    g_free(sint_route);
 
+    g_free(sint_route);
     return NULL;
 }
 
@@ -442,6 +477,8 @@ void hyperv_sint_route_ref(HvSintRoute *sint_route)
 
 void hyperv_sint_route_unref(HvSintRoute *sint_route)
 {
+    SynICState *synic;
+
     if (!sint_route) {
         return;
     }
@@ -452,21 +489,33 @@ void hyperv_sint_route_unref(HvSintRoute *sint_route)
         return;
     }
 
-    kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
-                                          &sint_route->sint_set_notifier,
-                                          sint_route->gsi);
-    kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
+    synic = sint_route->synic;
+    qemu_mutex_lock(&synic->sint_routes_mutex);
+    QLIST_REMOVE_RCU(sint_route, link);
+    qemu_mutex_unlock(&synic->sint_routes_mutex);
+
+    if (sint_route->gsi) {
+        kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
+                                              &sint_route->sint_set_notifier,
+                                              sint_route->gsi);
+        kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
+        event_notifier_cleanup(&sint_route->sint_set_notifier);
+    }
+
     if (sint_route->staged_msg) {
         event_notifier_set_handler(&sint_route->sint_ack_notifier, NULL);
         event_notifier_cleanup(&sint_route->sint_ack_notifier);
         g_free(sint_route->staged_msg);
     }
-    event_notifier_cleanup(&sint_route->sint_set_notifier);
     g_free(sint_route);
 }
 
 int hyperv_sint_route_set_sint(HvSintRoute *sint_route)
 {
+    if (!sint_route->gsi) {
+        return 0;
+    }
+
     return event_notifier_set(&sint_route->sint_set_notifier);
 }
 
@@ -529,6 +578,26 @@ int hyperv_set_msg_handler(uint32_t conn_id, HvMsgHandler handler, void *data)
     return ret;
 }
 
+int hyperv_synic_eom(CPUState *cs)
+{
+    SynICState *synic = get_synic(cs);
+    HvSintRoute *sint_route;
+
+    if (!synic) {
+        return -1;
+    }
+
+    qemu_mutex_lock(&synic->sint_routes_mutex);
+    QLIST_FOREACH(sint_route, &synic->sint_routes, link) {
+        /* Try to complete every SintRoute */
+        aio_bh_schedule_oneshot(qemu_get_aio_context(), sint_msg_bh,
+                                sint_route);
+    }
+    qemu_mutex_unlock(&synic->sint_routes_mutex);
+
+    return 0;
+}
+
 uint16_t hyperv_hcall_post_message(uint64_t param, bool fast)
 {
     uint16_t ret;
diff --git a/include/hw/hyperv/hyperv.h b/include/hw/hyperv/hyperv.h
index a63ee0003c..ef9f6b6c09 100644
--- a/include/hw/hyperv/hyperv.h
+++ b/include/hw/hyperv/hyperv.h
@@ -28,6 +28,8 @@ void hyperv_sint_route_unref(HvSintRoute *sint_route);
 
 int hyperv_sint_route_set_sint(HvSintRoute *sint_route);
 
+int hyperv_synic_eom(CPUState *cs);
+
 /*
  * Submit a message to be posted in vcpu context.  If the submission succeeds,
  * the status of posting the message is reported via the callback associated
-- 
2.34.1


