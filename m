Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E90506557
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:07:41 +0200 (CEST)
Received: from localhost ([::1]:58322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghxc-0001oL-Fm
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmJ-0001Fj-2a
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmG-0004XF-5g
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:54 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so449207wmb.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOaUYa7fBDqONojLs85aGCSQRzn8YhTVI4Z+wM5s/uY=;
 b=FAClG8oaBxdAHPYdI8CmfO8qH4mpHWMgujfR17WACzIyxetg3WMQBfjR8MxrNlP6+Q
 HjI5pcXKRUAxLHgGsFIwS4+NBilsjNpvY4hCHTzRoleph5o90ZjWfff/dTnOdx/JT62U
 qVQKIoTPSaHBQMhE8UBnz0NJjRLJAl4ZpNltJgQOF8+FHExLcQtP14JtKUQhrJeo2Sw4
 5m0JFtLxW93ws8kQJlzL9w0A2zX3U2nX/vD0hw0cu/QXIRMR9GCdUw6kZZN2q7kOa/P8
 sL8IBMB5gQMcxjWCSLUYJFTsE8Y1aY2+UYnZCcuy6OGqFRpCRi+PBy+Xfm98j8rFxPmK
 KwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aOaUYa7fBDqONojLs85aGCSQRzn8YhTVI4Z+wM5s/uY=;
 b=kFLXnFHkdcGMNSjAgIE9isZjgE8CMnirNpPJmIEBMn2KzClNoWbmeg/YvmGyyamzxA
 a1SQ5FIXbXO2/f9ZVaSa5Rajyt4t6f+4gXgbpZupaW5jDbMaaVVSFIP2YF9QCLB0mdgz
 j5TTE28+68VcErWJsOHNE8XmyZwpNR3SeilWXsLDh1IrRkbh0zUVEOP3HC6KNI1OiVLI
 Ni24C6jFQNWMCg6p+vvvy6N8CSDGvSu1e0jj9wEFkxn3BFY4BXxjBPrANdqGVUJAmYL1
 FpLvUNhZSfiRg4sXDC9t7K9CCjTom0E1hxYQ2vkeIOrHguJwDkjRLptWlz3U0iwWW62s
 kziQ==
X-Gm-Message-State: AOAM531no94y9IjnxyOrHe8B1ZrUniDSwv55UGMy4WOZzaReqevhg7kW
 4AGDUuHyjnxdjRYZzpvL157Y/SO/tsd06g==
X-Google-Smtp-Source: ABdhPJy+xmqirKXTweLXjse4KG9tLOqTnoRSzRzWyxUiCC84xlC7UdwmihyQg9IF57WGs+BvQAAVHw==
X-Received: by 2002:a05:600c:3588:b0:392:91be:4575 with SMTP id
 p8-20020a05600c358800b0039291be4575mr10090807wmq.149.1650347510901; 
 Mon, 18 Apr 2022 22:51:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/53] hyperv: SControl is optional to enable SynIc
Date: Tue, 19 Apr 2022 07:51:00 +0200
Message-Id: <20220419055109.142788-45-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
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

SynIc can be enabled regardless of the SControl mechanisim which can
register a GSI for a given SintRoute.

This behaviour can achived by setting enabling SIMP and then the guest
will poll on the message slot.

Once there is another message pending the host will set the message slot
with the pending flag.
When the guest polls from the message slot, in case the pending flag is
set it will write to the HV_X64_MSR_EOM indicating it has cleared the
slot and we can try and push our message again.

Signed-off-by: Jon Doron <arilou@gmail.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220216102500.692781-2-arilou@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/hyperv/hyperv.c | 109 +++++++++++++++++++++++++++++++--------------
 1 file changed, 76 insertions(+), 33 deletions(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index cb1074f234..8b832566c1 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -27,13 +27,16 @@ struct SynICState {
 
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
@@ -51,11 +54,11 @@ static SynICState *get_synic(CPUState *cs)
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
@@ -80,7 +83,7 @@ static void synic_update(SynICState *synic, bool enable,
     }
 }
 
-void hyperv_synic_update(CPUState *cs, bool enable,
+void hyperv_synic_update(CPUState *cs, bool sctl_enable,
                          hwaddr msg_page_addr, hwaddr event_page_addr)
 {
     SynICState *synic = get_synic(cs);
@@ -89,7 +92,7 @@ void hyperv_synic_update(CPUState *cs, bool enable,
         return;
     }
 
-    synic_update(synic, enable, msg_page_addr, event_page_addr);
+    synic_update(synic, sctl_enable, msg_page_addr, event_page_addr);
 }
 
 static void synic_realize(DeviceState *dev, Error **errp)
@@ -110,16 +113,20 @@ static void synic_realize(DeviceState *dev, Error **errp)
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
@@ -214,6 +221,7 @@ struct HvSintRoute {
     HvSintStagedMessage *staged_msg;
 
     unsigned refcount;
+    QLIST_ENTRY(HvSintRoute) link;
 };
 
 static CPUState *hyperv_find_vcpu(uint32_t vp_index)
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
 
@@ -364,11 +372,12 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
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
+    bool ack_event_initialized = false;
 
     cs = hyperv_find_vcpu(vp_index);
     if (!cs) {
@@ -381,57 +390,77 @@ HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
     }
 
     sint_route = g_new0(HvSintRoute, 1);
-    r = event_notifier_init(&sint_route->sint_set_notifier, false);
-    if (r) {
-        goto err;
+    if (!sint_route) {
+        return NULL;
     }
 
+    sint_route->synic = synic;
+    sint_route->sint = sint;
+    sint_route->refcount = 1;
 
     ack_notifier = cb ? &sint_route->sint_ack_notifier : NULL;
     if (ack_notifier) {
         sint_route->staged_msg = g_new0(HvSintStagedMessage, 1);
+        if (!sint_route->staged_msg) {
+            goto cleanup_err_sint;
+        }
         sint_route->staged_msg->cb = cb;
         sint_route->staged_msg->cb_data = cb_data;
 
         r = event_notifier_init(ack_notifier, false);
         if (r) {
-            goto err_sint_set_notifier;
+            goto cleanup_err_sint;
         }
-
         event_notifier_set_handler(ack_notifier, sint_ack_handler);
+        ack_event_initialized = true;
+    }
+
+    /* See if we are done or we need to setup a GSI for this SintRoute */
+    if (!synic->sctl_enabled) {
+        goto cleanup;
+    }
+
+    /* We need to setup a GSI for this SintRoute */
+    r = event_notifier_init(&sint_route->sint_set_notifier, false);
+    if (r) {
+        goto cleanup_err_sint;
     }
 
     gsi = kvm_irqchip_add_hv_sint_route(kvm_state, vp_index, sint);
     if (gsi < 0) {
-        goto err_gsi;
+        goto cleanup_err_sint_notifier;
     }
 
     r = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
                                            &sint_route->sint_set_notifier,
                                            ack_notifier, gsi);
     if (r) {
-        goto err_irqfd;
+        goto cleanup_err_irqfd;
     }
     sint_route->gsi = gsi;
-    sint_route->synic = synic;
-    sint_route->sint = sint;
-    sint_route->refcount = 1;
-
+cleanup:
+    qemu_mutex_lock(&synic->sint_routes_mutex);
+    QLIST_INSERT_HEAD(&synic->sint_routes, sint_route, link);
+    qemu_mutex_unlock(&synic->sint_routes_mutex);
     return sint_route;
 
-err_irqfd:
+cleanup_err_irqfd:
     kvm_irqchip_release_virq(kvm_state, gsi);
-err_gsi:
+
+cleanup_err_sint_notifier:
+    event_notifier_cleanup(&sint_route->sint_set_notifier);
+
+cleanup_err_sint:
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
 
@@ -442,6 +471,8 @@ void hyperv_sint_route_ref(HvSintRoute *sint_route)
 
 void hyperv_sint_route_unref(HvSintRoute *sint_route)
 {
+    SynICState *synic;
+
     if (!sint_route) {
         return;
     }
@@ -452,21 +483,33 @@ void hyperv_sint_route_unref(HvSintRoute *sint_route)
         return;
     }
 
-    kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
-                                          &sint_route->sint_set_notifier,
-                                          sint_route->gsi);
-    kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
+    synic = sint_route->synic;
+    qemu_mutex_lock(&synic->sint_routes_mutex);
+    QLIST_REMOVE(sint_route, link);
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
 
-- 
2.35.1



