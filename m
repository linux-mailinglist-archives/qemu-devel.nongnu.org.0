Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6014CAD9E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:33:56 +0100 (CET)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTnP-0005qj-3D
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:33:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS6-0006vI-DH
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:54 -0500
Received: from [2a00:1450:4864:20::32a] (port=38466
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTS4-0008R2-Oh
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:54 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so2673740wms.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fjXszMyPdCO8TmuZAfVhiRygjcmH9t+A5T8HqlfmFlU=;
 b=k1gSHolGROPk/DnTfWnvyQRMaXlh+MQ0c0cVgplopHG6IucOBu6ar+d6tnQdSKQGaE
 CFo6H0KalOv696C3JdXPq4wgln+0EPfhHt0x/lOora8WCCeOH+3rX8y959HyjjBFf/EN
 OaVjBnrPLB9BWlZ17SedYgl5XqAniWViXa41PTdUCahrWv4n4tbS3fYCrafBEtU0fKIQ
 3eEOz0+GzUb35v3N2iGvaVB7cXgPzlqigyWrdI74UDp33ds3xT7NlIyIUPsdECMXltBJ
 bGhv9ahe2MsjIvwSZKxKK7JWDggBFkggwl4SVSbDih/jmr5nkBR6GJ9Rwo/v7paUa/sI
 m8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fjXszMyPdCO8TmuZAfVhiRygjcmH9t+A5T8HqlfmFlU=;
 b=3PtgtEiDClzRaXhjltoTcC7JpDwqcVk3XMRhpuwzJEpboPtLWDy7WHW8e+7QJfkNE4
 0P1ZZpzZn5XR/kyhscXLsjCp0cbfwkZElyThGeBgPJgKDMAMqwhvQN6sVtoVEZLvmGgt
 5V6UG3slQBPQBUp6zRbwct3ITyCUhVc93YTAHNQpDnj3/8ICCpe+FTCsuYRjGGqPUkwr
 R7xPkJlUx388pWAOUMugrTTw9/lmE+2ifI4N8oqB6aJvBQDAbX+LG7fqxdr71AH37ba9
 +PgcZVTulSz2Fk5+kUYd6LaniWllqu8GCPJWH33MOprF8yyPdxd+LAHmDjoTIKEPQ/KQ
 An+g==
X-Gm-Message-State: AOAM531PaLpajbg6AhvBhmzs24JhG9FndhFUMoCHR27TJWpvqHkTZLvA
 u+41gZpl0SBVRdjNCJoSTUbTPv2GIWQ=
X-Google-Smtp-Source: ABdhPJzZ+lItZogudVbnAiV/KmCslITI0xdAD0YtBr7UevT/iqxEYfMX7srpExCBGPpFJUTh159q+Q==
X-Received: by 2002:a7b:c939:0:b0:37b:c13f:6fa3 with SMTP id
 h25-20020a7bc939000000b0037bc13f6fa3mr841405wml.72.1646244711332; 
 Wed, 02 Mar 2022 10:11:51 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] kvm-irqchip: introduce new API to support route change
Date: Wed,  2 Mar 2022 19:11:31 +0100
Message-Id: <20220302181134.285107-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
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



