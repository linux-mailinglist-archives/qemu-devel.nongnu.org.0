Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817CA6621A7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:33:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQy-00048R-Al; Mon, 09 Jan 2023 04:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQu-00047d-7V
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:27:08 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQs-0005a1-Kz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:27:07 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so8505328wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSI1q8Pr7ikyNEHE0ptbDijcSvsZa7X5vhrpcvBH7wI=;
 b=PupitDtLY7UghG6gW4N1I7E1STzB5G8pOzgskfDpFcRYuZwfJe8ZKSUTyleOJrXxUC
 26x+hvdXdg4GUermlxOi+IbsxnL+REoNdkcETJ+XzA5NuqwheVrAd/QJ54m25LoxFmvQ
 X0UeQDajIOU75/tK/D7e6s+PmgAMpoVinxtPmI04UeYh0VjXTMhdUIzvQid1Aoe+QPCe
 hpU0DEqefpi2wP0r9bq/RrvTmZYvjgQdF9AWfUkh9+99o5NrqrQWYeYTY4lJAGCJsS16
 ygg/+niSmnveo3hvClsBNEyzLOX1opS3Xt2s9qGXu3mC1y46k9cGrfUxvaSG/s7mrSgd
 M7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lSI1q8Pr7ikyNEHE0ptbDijcSvsZa7X5vhrpcvBH7wI=;
 b=jgv7l6PPvY+oopKxG/68kzlYDAcZLhUugWxzNGCOgmBpaYZG3qv+IkDorrR98TA+MY
 Cw9Alr+4koGxu7YcMwMjbUS08ojW4bZ3989h/8zA56k50aDkuEAmAwprAk9ALXsyFW76
 +J1CFhthy58NBVugNDu7EHTzoLMQgnwVSAbBL4UmxY4RTv+yaDikDluLP3Vf6sPZoPgf
 WerAUThUtS5ceYOyfvsY05eioZkMQw+sD+TNzSxgoh2bQ76BMI8bZfsSmLxwjn/OUo4I
 jcL7Z97j8x9v90bCslckeG3mhC/TVmkGBHfwL+rC+G7yUpVlnWHTk5HL2066Ep8pfFZz
 xR+w==
X-Gm-Message-State: AFqh2kphHCavaPhNDRvATrgmxHYEa0HrYDwLdVAXBXeu0WkG2vl8obkl
 bFs26VDoZ4OjY1/M15aJ1VMZ2n8+/ye1fn9t
X-Google-Smtp-Source: AMrXdXt+T0ZaeGuOm2agZKu7TzrKxUyDuMXwKKrteo+H1bcnpk9+F7ArnavH2dDnYAHrEDfln8e2rQ==
X-Received: by 2002:a05:600c:1f12:b0:3cf:8155:2adc with SMTP id
 bd18-20020a05600c1f1200b003cf81552adcmr46860643wmb.33.1673256425207; 
 Mon, 09 Jan 2023 01:27:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1c5403000000b003d35c09d4b9sm15151704wmb.40.2023.01.09.01.27.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:27:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 9/9] hw/i386/kvm: Convert TYPE_KVM_CLOCK from SysBus to QDev
Date: Mon,  9 Jan 2023 10:26:17 +0100
Message-Id: <20230109092617.80224-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Nothing in TYPE_KVM_CLOCK access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/kvm/clock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index df70b4a033..da0984b5a0 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -35,7 +35,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(KVMClockState, KVM_CLOCK)
 
 struct KVMClockState {
     /*< private >*/
-    SysBusDevice busdev;
+    DeviceState busdev;
     /*< public >*/
 
     uint64_t clock;
@@ -322,7 +322,7 @@ static void kvmclock_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo kvmclock_info = {
     .name          = TYPE_KVM_CLOCK,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_DEVICE,
     .instance_size = sizeof(KVMClockState),
     .class_init    = kvmclock_class_init,
 };
@@ -338,7 +338,7 @@ void kvmclock_create(bool create_always)
     if (create_always ||
         cpu->env.features[FEAT_KVM] & ((1ULL << KVM_FEATURE_CLOCKSOURCE) |
                                        (1ULL << KVM_FEATURE_CLOCKSOURCE2))) {
-        sysbus_create_simple(TYPE_KVM_CLOCK, -1, NULL);
+        qdev_realize(qdev_new(TYPE_KVM_CLOCK), NULL, &error_fatal));
     }
 }
 
-- 
2.38.1


