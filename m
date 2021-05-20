Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D297E38A009
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:44:03 +0200 (CEST)
Received: from localhost ([::1]:33750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeHi-0003DM-Sm
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxm-0005RT-Od
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxg-0001WI-Tn
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:25 -0400
Received: by mail-wr1-x42b.google.com with SMTP id p7so12940070wru.10
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3MqmAP7pwRW97qJ1+MtqhBMp1/DFWPX7Op2JzM69PlU=;
 b=FbtkKjQ1bG+R4VTVxd8tMQkmguJqHNH92uvZ+VIMq6mwAU2wBaZQPHgwL3U6CSAilI
 mkK3exnqgo2jqvdb535cxwMJVQ/YM/zggCwKaa2FGbNcA1htQpEZmLDO8c9LdQwmRqI4
 MZPJHx7gVd1LiFAFBxr9pPBuEMNUUqdLjQ3fdLD9X7pCC4Jj3tPLxxnBMrC00O7JRQ47
 uCo3xFDEfJWUg4SxHEs+85Y4hUv/HYgygigqrXpc5aPBbz8zVaJ5nykuwOv7DeX6hyAd
 ro8zyT2xsP8aaM4at56ZqmBSUc+ZUIYl0Ft377auE0x4nRSzh+dpBgllOct3gCg4rwSf
 9UgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3MqmAP7pwRW97qJ1+MtqhBMp1/DFWPX7Op2JzM69PlU=;
 b=STVRoASIpH16sUbehuwKdEkbbydhSJrIij56YsHbaz2Q68MPykH4Noao/Kes9p0fGZ
 dRLOleNdWv1qApDWJg6Gy6jpJHArkKqulpZUr9Lc0xkeAhFfayrWh6ONvxxceGz18EUh
 gtG+b2PF3qEU/S3OMKTwjenJSlQtvXQaP4hrEx4TjY31jdVSDRPJ4ETh5S+TEJXD+MdO
 xOrH67f7+ctHho8u0U89srZpyzF17Yb4oaVr1UggAzAXU/sy7l0IlMldwUaGKTraqiTN
 tO0km4AeMa3Q2hCXZ22EkGWi44ZwdhVZjdbNVw5P9jCpU3x3nl5PCF0jJFIqoCBRhaT/
 Zg7A==
X-Gm-Message-State: AOAM5312ButUDJOMzDmw0YucVXyMV8aDwvt4r7Qo88o4OfNmG5RH4xzW
 oddLF7FZazv4lprlVE8AZqqldaDpxxsw+g==
X-Google-Smtp-Source: ABdhPJxgS34Sj5sdyLZjCvdwhcALP3/l1SyyftYMdDp5wLHn4zAikCOgcsH47W1IVteEk5AatRbrvQ==
X-Received: by 2002:adf:d20a:: with SMTP id j10mr2915690wrh.188.1621498984456; 
 Thu, 20 May 2021 01:23:04 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.03 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/26] KVM: do not allow setting properties at runtime
Date: Thu, 20 May 2021 10:22:40 +0200
Message-Id: <20210520082257.187061-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



