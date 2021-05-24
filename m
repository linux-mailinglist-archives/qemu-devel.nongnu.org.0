Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423CF38F1DA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:57:20 +0200 (CEST)
Received: from localhost ([::1]:60230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDtH-0001fg-AL
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeK-0004jP-Oi
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:53 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeG-0004Lh-QR
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:51 -0400
Received: by mail-ej1-x630.google.com with SMTP id i7so24954819ejc.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3MqmAP7pwRW97qJ1+MtqhBMp1/DFWPX7Op2JzM69PlU=;
 b=ecGHdJKBJUyslijffhvty1GXYgfgVFWcWLTEIXQ3s4CG6zcoezC8D0cp20nbLWCgq2
 bfoVfeOLfZ0iK5RwdRbL9bt6A26dTwbmdy4gXiwvYBXLlHaK5wYsvypG8UO8GRn5tbiU
 TjtS4sHcvr8MW5Yc+g5X3Q6P645kgzRZqZugAkg87XN0xUyRPC4J5WHRN5Lu04PLnh6m
 JEvLPhX6K8vQZ/RZGZrF/JmSnECbwM1DshBA2h73Ei039SBdSlzPzUu6dBTK5Egq61G8
 FUrdjMWwPM77NWv/ZFje/MRrL+2osazkwaY/iPXm4jfq/eyPWMhBWWD2RmW5UjyqFOnD
 BHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3MqmAP7pwRW97qJ1+MtqhBMp1/DFWPX7Op2JzM69PlU=;
 b=XkQIzNkLNx6xkgHHfVBWz3PDEPwa+F0/Xn8AYGFdoWJ+yvMYjpCkIksLWmKmJdiCCC
 HRpYaBAPpnLfB70P7h+Rwbjmd1/wS7SDovluYxS6Zkfv0VWfKlwoQ4/G7VvxKGY+AGYT
 V7k6yMhR3cVFU6tFpB+fExWATyDVpa8zMn+0oBUQMc4G0OmXzBV4s5Twt5C9lxtackWz
 SxSt9IrzvbPgTovPMPrX6k5tlIPMisEHyfDq2QZseVetRhJy+JLroKd/nWLvPkqSvPaL
 ccXry0cOwbFHSWonejJE8Rk5qbDjIdXkdvfBtf1CuoOY3Y8xurklmPOWAyBPldXYKquK
 LZeA==
X-Gm-Message-State: AOAM530xxJMj/qOrHmkYLPaCjcWNRZDBFdcnuEQQ4p/6qtwyij9IKgTX
 JCHXsN0uFV4/KcjAQKjo6T6MgKfiNCw0+g==
X-Google-Smtp-Source: ABdhPJwLlZZ1/zjsJN6oYZRpU91IChfQ6uMNVbnFG6MXU4g0MwGc7Ht3t0+v+a1CjfGSS3idIuEdvQ==
X-Received: by 2002:a17:906:71a:: with SMTP id
 y26mr21774525ejb.491.1621874497957; 
 Mon, 24 May 2021 09:41:37 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.37 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/28] KVM: do not allow setting properties at runtime
Date: Mon, 24 May 2021 18:41:11 +0200
Message-Id: <20210524164131.383778-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only allow accelerator properties to be set when the
accelerator is being created.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4e0168e88b..54c0860979 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2017,7 +2017,6 @@ static int kvm_init(MachineState *ms)
     QTAILQ_INIT(&s->kvm_sw_breakpoints);
 #endif
     QLIST_INIT(&s->kvm_parked_vcpus);
-    s->vmfd = -1;
     s->fd = qemu_open_old("/dev/kvm", O_RDWR);
     if (s->fd == -1) {
         fprintf(stderr, "Could not access KVM kernel module: %m\n");
@@ -3112,6 +3111,11 @@ static void kvm_set_kvm_shadow_mem(Object *obj, Visitor *v,
     KVMState *s = KVM_STATE(obj);
     int64_t value;
 
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
     if (!visit_type_int(v, name, &value, errp)) {
         return;
     }
@@ -3126,6 +3130,11 @@ static void kvm_set_kernel_irqchip(Object *obj, Visitor *v,
     KVMState *s = KVM_STATE(obj);
     OnOffSplit mode;
 
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
     if (!visit_type_OnOffSplit(v, name, &mode, errp)) {
         return;
     }
@@ -3172,6 +3181,8 @@ static void kvm_accel_instance_init(Object *obj)
 {
     KVMState *s = KVM_STATE(obj);
 
+    s->fd = -1;
+    s->vmfd = -1;
     s->kvm_shadow_mem = -1;
     s->kernel_irqchip_allowed = true;
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
-- 
2.31.1



