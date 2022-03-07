Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF44D0671
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:24:02 +0100 (CET)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI1Z-0007IF-Ml
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:24:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuh-00013b-PN
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:55 -0500
Received: from [2a00:1450:4864:20::62e] (port=33716
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005ND-6e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:55 -0500
Received: by mail-ej1-x62e.google.com with SMTP id kt27so33956347ejb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fjXszMyPdCO8TmuZAfVhiRygjcmH9t+A5T8HqlfmFlU=;
 b=mXzeOz7VKLbeTtsKp/CvhgLNwQ9+KyPOhKPI1jyiaF+Kar5iQ7Bdsqu8jCKbkaX7bx
 RL4QV62bQOMXXcd54AukDCCyhfZcJJYn0JjCIWLzdVOLZI2dW+wZg572t3+F/RIvbKIA
 0si/5kXI95ZLSR8lZSMN/Iu3MVD7WW88Qy381HLVbbpGBGnQHVXj3zk9rYtQnUo2+Ha/
 3YvXd4CrAjlR491swq2l0kJ0nOXoPK8B9F//jjWUnI7ucPmAFGx99kDlriiZ6rZ4ShgN
 KdaDBSa2GnhoJnZuYFPH+YRgwHJbgsf5cXAh1quNbztokhwXVnV76G4sIbQGWEnegMv1
 gduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fjXszMyPdCO8TmuZAfVhiRygjcmH9t+A5T8HqlfmFlU=;
 b=y5Xy9sNpN5jUDC4y0Tr5b1WzprSzR5D2l850Q59q1nEcHsrAUU/jntUaJRVaomVMP5
 eybuGPc5/o4eLpVNVg9oTPzIRO4AQThqk0Pc1iFoCSUMBtXyWtJw5fsMIqci4N1ZptVK
 ra8mlHenX+yJVXUvrBE0Ahs6QJqRr7YAnSxeE3j9SdTTXbnIfeyJKsSe7UZHOOJ8m69p
 ZAqvEjvKUmVLrvfHYHY9D+VQlITg09sHO1jIwIuGqhJcAo+U3VM3G8y2b6Hh0LMksc/h
 0oFNzowKzxeBfbSgIlSwY+g3NPcUyGbrXOsg9ZAOvVjwiD4DZoTFQjlfkztz/niBPscI
 DHzA==
X-Gm-Message-State: AOAM533UrFNuvEUea5CfZuDcHxIzHnwBqAOfEdocVaDgVzmE8mLvfA0A
 zcoFZOcQl3ONcEgSWM/63Jkx2ymOKIo=
X-Google-Smtp-Source: ABdhPJzf6OKk/sLArOktyh8JvmFEwW6uGpbeKRjdbjQ923+jUy0fL7B3fETP2NyQMh1iC++8MLyPsw==
X-Received: by 2002:a17:907:2d11:b0:6da:924b:748f with SMTP id
 gs17-20020a1709072d1100b006da924b748fmr9797925ejc.584.1646677001966; 
 Mon, 07 Mar 2022 10:16:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/23] kvm-irqchip: introduce new API to support route change
Date: Mon,  7 Mar 2022 19:16:18 +0100
Message-Id: <20220307181633.596898-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Longpeng(Mike)" <longpeng2@huawei.com>

Paolo suggested adding the new API to support route changes [1]. We should invoke
kvm_irqchip_begin_route_changes() before changing the routes, increasing the
KVMRouteChange.changes if the routes are changed, and commit the changes at last.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg02898.html

Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20220222141116.2091-2-longpeng2@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/kvm.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6eb39a088b..36e6d40191 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -224,6 +224,11 @@ DECLARE_INSTANCE_CHECKER(KVMState, KVM_STATE,
 extern KVMState *kvm_state;
 typedef struct Notifier Notifier;
 
+typedef struct KVMRouteChange {
+     KVMState *s;
+     int changes;
+} KVMRouteChange;
+
 /* external API */
 
 bool kvm_has_free_slot(MachineState *ms);
@@ -494,6 +499,20 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev);
 int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
                                  PCIDevice *dev);
 void kvm_irqchip_commit_routes(KVMState *s);
+
+static inline KVMRouteChange kvm_irqchip_begin_route_changes(KVMState *s)
+{
+    return (KVMRouteChange) { .s = s, .changes = 0 };
+}
+
+static inline void kvm_irqchip_commit_route_changes(KVMRouteChange *c)
+{
+    if (c->changes) {
+        kvm_irqchip_commit_routes(c->s);
+        c->changes = 0;
+    }
+}
+
 void kvm_irqchip_release_virq(KVMState *s, int virq);
 
 int kvm_irqchip_add_adapter_route(KVMState *s, AdapterInfo *adapter);
-- 
2.34.1



