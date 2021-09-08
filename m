Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C304041BA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:22:21 +0200 (CEST)
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6tY-00014d-D7
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6ry-0006UU-8f
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6rv-0002iH-El
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWnIa1NnZmGclGfmWQAc+byFrHYlEtTXg6KMBnsWc1s=;
 b=CNr7uEMA9kce1mHm8iJRelPNGfg/Oj7Dn6LovQY5TTLblc8kbJOcFtS22RRLTtSaNaEl4E
 VLYd9KZkuGraLYmHaL3r2Jw+BHe28d/3lc1D6u88BLC7NtYOvuGSOhyDdvS8coF4RZ+KJH
 4/0/Kg2IXtekjoQnjG/sd5TxZZtASz4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-6Q8R3zvrMoSU5R8aT9PUng-1; Wed, 08 Sep 2021 19:20:37 -0400
X-MC-Unique: 6Q8R3zvrMoSU5R8aT9PUng-1
Received: by mail-wm1-f70.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so32016wmj.8
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWnIa1NnZmGclGfmWQAc+byFrHYlEtTXg6KMBnsWc1s=;
 b=YL/FP/DYEBNYPztG8FAwp2ISrvt2qkHp72Fx2nvxpL3gxSBsMJtcDt7h4R6l2bWFbI
 PMaI1fn+ictz5k08ri2gdd01uGwDCj/ozC/RmGgZK+snbhfSjYA3ji2aDR6a24juXN0P
 lUBGBvu6c3IIlPh0F4kuA9PT1Wa7hikWJL1WLoVrqEFrFdoii8pkAv2y9Zrbl2j+M4Fc
 Swa6kJgN3HEuxC0VHGnKAQjWvMmaiYfL/jpQS8w/f78vWiWHbBSDOWYg9dLeA1uYy95l
 vEpWV1cSeVDCvFX8c+CXNDp/IIf7r23Ygh3UxoGkPzGufkaoGiJiUaipOIGqVy+aG56T
 VlDQ==
X-Gm-Message-State: AOAM532LJhh2nBuAsquZIwBVjEyE5FrSDIm7TJ6RFhMN5Nh90szYFrkq
 QdlHdq06W83KEtiknKKHiFBlvB+Hu28E7UWSTMQi2Ic34UKB4p9p2NCqSb3ngxkxiiCtlX6kQJE
 V6426hhESwOuLYY85leraPvFivk9dXh00q46tqu7lagq/kcg45K9OtvyQ5ASypzOy
X-Received: by 2002:a1c:448a:: with SMTP id r132mr557416wma.105.1631143236109; 
 Wed, 08 Sep 2021 16:20:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6WkilBgiH6FuwGNniEzqjgdLM6GzbGQfLFFCepoIH7M5nhemfkyQL//fRVRjKLyNs63E1PQ==
X-Received: by 2002:a1c:448a:: with SMTP id r132mr557389wma.105.1631143235880; 
 Wed, 08 Sep 2021 16:20:35 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j14sm30789wrp.21.2021.09.08.16.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/10] accel: Use qemu_security_policy_taint(),
 mark KVM and Xen as safe
Date: Thu,  9 Sep 2021 01:20:16 +0200
Message-Id: <20210908232024.2399215-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the AccelClass::secure_policy_supported field to classify
safe (within security boundary) vs unsafe accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/accel.h | 5 +++++
 accel/kvm/kvm-all.c  | 1 +
 accel/xen/xen-all.c  | 1 +
 softmmu/vl.c         | 3 +++
 4 files changed, 10 insertions(+)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6fc..895e30be0de 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -44,6 +44,11 @@ typedef struct AccelClass {
                        hwaddr start_addr, hwaddr size);
 #endif
     bool *allowed;
+    /*
+     * Whether the accelerator is withing QEMU security policy boundary.
+     * See: https://www.qemu.org/contribute/security-process/
+     */
+    bool secure_policy_supported;
     /*
      * Array of global properties that would be applied when specific
      * accelerator is chosen. It works like MachineClass.compat_props
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb8..eb6b9e44df2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3623,6 +3623,7 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
     ac->init_machine = kvm_init;
     ac->has_memory = kvm_accel_has_memory;
     ac->allowed = &kvm_allowed;
+    ac->secure_policy_supported = true;
 
     object_class_property_add(oc, "kernel-irqchip", "on|off|split",
         NULL, kvm_set_kernel_irqchip,
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b2..57867af5faf 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -198,6 +198,7 @@ static void xen_accel_class_init(ObjectClass *oc, void *data)
     ac->setup_post = xen_setup_post;
     ac->allowed = &xen_allowed;
     ac->compat_props = g_ptr_array_new();
+    ac->secure_policy_supported = true;
 
     compat_props_add(ac->compat_props, compat, G_N_ELEMENTS(compat));
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 92c05ac97ee..e4f94e159c3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2388,6 +2388,9 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
         return 0;
     }
 
+    qemu_security_policy_taint(!ac->secure_policy_supported,
+                               "%s accelerator", acc);
+
     return 1;
 }
 
-- 
2.31.1


