Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FCB4D1681
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:44:32 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYGU-0004Lu-6D
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:44:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7N-0007le-8V
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:05 -0500
Received: from [2a00:1450:4864:20::631] (port=34473
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7L-0005u6-LV
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:04 -0500
Received: by mail-ej1-x631.google.com with SMTP id gb39so38478065ejc.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3tF3F2oelBcRo7SwxGLE49lOLvZU4Fu6BpeRb+9CS0=;
 b=bCJlJyBz97MKNTu1KTRmP8gGru0B1rLu7xf+2SuSiXSlzuu9pIPWplQgZXXsp+8S9Y
 0Slhn0AqKQz+ytYhuIkBfYsThFsNGlaLOrLzngQn/Xr6DJLhgToq9jig78BF7YqzdSVi
 4dJVqNsxT6h87beP6NCZ/HimibJwTDADQV2abykX50ud1ifWlwNWBYhURoOwsHOrA6/i
 NMABNd4m6FGm0qj+BwwkItToI1Jzjq80yXAQw0seYRbgegV8m4TTpAIZ+fLw9OoMZ1W9
 X0H5cc3YLrMaMKsKJLQUgLvp9DW7hhVJTJoDPp0dVvcwLcMzZanHLBpgXlIGbkVz9IpT
 fb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f3tF3F2oelBcRo7SwxGLE49lOLvZU4Fu6BpeRb+9CS0=;
 b=QFUsfqgA12+eDlmUdfq6wuMBREynoem1yXS72RT9oFCLgoEDcrie18IJClLgp7IKko
 ltWS6Xvwa0etXf5rc6FhnsqVvLOP7p679Nj18CrU0Qsmm1SS+jvzaHWdz+S8/Vk4J59O
 DZKPcnKyl6rSs/aPnPP7rgAo+3ccCVMjbnZia5kQZJqRcwJfl8Vwle/1ECAD8OoCxce3
 CTTydng+O8pJjFcS0WW0/LHdpwsrdafZB5hxXvAba53sH/dg9CHpZUkh66i/smv/DTOj
 MS9U3CD62tyFlKrkn3tFeiPFgwiIEWYimmj6rf9ig5CtGAGH/n6f9E+uygs/KVSIk3Lj
 bvSw==
X-Gm-Message-State: AOAM530fOBBoRK8uGR+PH6Xi+xDAu4fRgXN+kkqC9xx67tAtX7nU+uBa
 O/Sxmu/IV+te+E9RAELwEkcs/r/oTTU=
X-Google-Smtp-Source: ABdhPJzi26xJCjlMIwH+W8w+yN1M4FD1SP3kwO7EOGaOxc7uo0gTqO+sciGocrttq6+TguSXkoRVHA==
X-Received: by 2002:a17:907:1c91:b0:6d7:b83:cddb with SMTP id
 nb17-20020a1709071c9100b006d70b83cddbmr12593436ejc.739.1646739302338; 
 Tue, 08 Mar 2022 03:35:02 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/22] kvm-irqchip: introduce new API to support route change
Date: Tue,  8 Mar 2022 12:34:31 +0100
Message-Id: <20220308113445.859669-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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
2.35.1



