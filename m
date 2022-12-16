Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C1564F431
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU7-00062M-6T; Fri, 16 Dec 2022 16:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITt-0005wj-Db
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:05 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITp-0000ck-JY
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so2678214wmb.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7JDlZZ95XjtIp7lmmMxiRnDc54R2t8VHCWZoay81uuo=;
 b=qb+2tEd3ZMRI8oYO2pEAvtPDETaxH9yq6tRX2MTRfIVo+B74H2pXLtzp3KkZodsm3y
 WCmFGJxa8y9CkLDa2W0eDB2vFcZ4TxJWQ+gldQs1YjA997ivDEoQF1GYJN0mbZYgU12J
 FYVTwXzFcmAm8Eq5nd70M2GQE47NnqCrD7UdYAQa70HD23lVv0GhoybGJLDFUXq3NjfG
 evCXr5/9tO1z8Bl+7SsVsigyu8IPZ5phwLA2P269051HeIgBHNc3tsbLOR6Z77LIhyUw
 5igU4q8iba7+adblpWac6kZopYKgpWmLaOV/HdGaCO8aeqXkK4rPUrOq390NWJXpTXNJ
 45JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7JDlZZ95XjtIp7lmmMxiRnDc54R2t8VHCWZoay81uuo=;
 b=bnHpzsN/up1ud/+/6wAH5Q3jgEvVMLMdyfAN32cMipchTYe25WrFqXdRC1OXN61doh
 GJdZE+0CyWcGyOy/Isg+ABiMWLCPVlr9nUmjIsCwvv+cpZp0jE3/mWvnbZ2ZonGz5+Zy
 TUtvnPPxL1Bi4b3jORiFlqQsBvWCgLEC126x43WgJtwEKYMpB91DsY/4daoPjHYSh5it
 xGmGITiZVnPbRvbftf5Mgky/MSsTqkIBbOsCXBTjCdggC7IAvwMbcA+B5IKkMKG5VyHx
 QUsMTe3HOHGo79SxKibq/s/UAoKAsQ4uuIr0wTcn30SYbjzT0fRr5c85V0NqGGJ3v6D0
 XnQw==
X-Gm-Message-State: ANoB5pnJUMY8rYPbAsRxUyukmzgAr8PrEVrMxETji6LSpqAyHL4KR3qH
 f4RGKbUjWlsRI2a5AqlA4zGBV8G8fecrPD1R
X-Google-Smtp-Source: AA0mqf48S8NKCk6thIzDSH6PlCAyvhlDf76Il4Vf2NgeJQjj83EV/LASKRKvpYHtnw/DQ69Y5QfAyQ==
X-Received: by 2002:a05:600c:1e01:b0:3cf:a4fa:510 with SMTP id
 ay1-20020a05600c1e0100b003cfa4fa0510mr26952345wmb.30.1671226976267; 
 Fri, 16 Dec 2022 13:42:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/36] hw/core/cpu-common: Convert TYPE_CPU class to 3-phase
 reset
Date: Fri, 16 Dec 2022 21:42:19 +0000
Message-Id: <20221216214244.1391647-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Convert the parent class TYPE_CPU to 3-phase reset. This
is a necessary prerequisite to converting the subclasses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20221124115023.2437291-2-peter.maydell@linaro.org
---
 hw/core/cpu-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index f9fdd46b9d7..78b5f350a00 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -116,9 +116,9 @@ void cpu_reset(CPUState *cpu)
     trace_guest_cpu_reset(cpu);
 }
 
-static void cpu_common_reset(DeviceState *dev)
+static void cpu_common_reset_hold(Object *obj)
 {
-    CPUState *cpu = CPU(dev);
+    CPUState *cpu = CPU(obj);
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (qemu_loglevel_mask(CPU_LOG_RESET)) {
@@ -259,6 +259,7 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
 static void cpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     CPUClass *k = CPU_CLASS(klass);
 
     k->parse_features = cpu_common_parse_features;
@@ -269,7 +270,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
-    dc->reset = cpu_common_reset;
+    rc->phases.hold = cpu_common_reset_hold;
     cpu_class_init_props(dc);
     /*
      * Reason: CPUs still need special care by board code: wiring up
-- 
2.25.1


