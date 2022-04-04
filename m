Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740B64F192A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 18:07:59 +0200 (CEST)
Received: from localhost ([::1]:35190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbPFG-0006EV-I9
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 12:07:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbP10-00065d-8l
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:53:14 -0400
Received: from [2a00:1450:4864:20::42b] (port=35800
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbP0y-0001NG-Gx
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:53:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w21so15208415wra.2
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FuDOYhuH9z3OYdG3JyUjI/cHbnZxsTHuxtWNAPPhFY4=;
 b=KGzW5rXYjfqTTD+D9dbFPFCQjjj2KZOcbjOdyAp4ebkak8qtFThz7q1RgtF8mqnajL
 qQ3ZSNWpIRaA6nRbE0+9iavW1LuMibV7q6L7pylKB71OOxuEJppUEEN8fIsmz4ib7rzW
 OFzf5qaidzxngdc/g3dz1zi/Ygv/V+b0BGbOEa8Eyhhl5JV2GRD2sz7hYeueJTRy8zGd
 U5f9p1XRd1smTj8b7ERdSV7y/0e416gCMmF4B+z+3jwDzGJZLblZ8LdiGfcUR/idhvZ/
 5gIGn+y2xnSwq43vFX7bm+uk4a2E4C/bE/+kTTNM9O2ZzLAJ1bRPKteRAGy4ZgG1D+lQ
 5hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FuDOYhuH9z3OYdG3JyUjI/cHbnZxsTHuxtWNAPPhFY4=;
 b=L++RmiAS9IlFz7/Ygy2LWirJHRBdA3ILuutjl6EjjCj4OkvZUc+UeAzMgp4GKbRKhl
 WspDlo/iOcfjAQXU4E3t3hhvrhpI9NXavsEn8Kqatr+N2y7MyoyA+SA2rxY/mI7sgoKM
 w/TG5MvjMeVkjMbt6BIJTghoJ7roZGXtCrS5vH2+et5+C+lIFDNrgBNltsl55sfiS11/
 F3E4tgS9o0Na/u/w6AowCLn3jFD0ZDaFhEMUhMoxBjmj7oXrwd5lmTIcVGJPWBSMuRsN
 0oYd/yanpoDuTRpBaTiBzVRe63GKVoyAPJjSuPJc2rSmyTN4w5x/+EAwuRHRMXzxW9wd
 eJoA==
X-Gm-Message-State: AOAM530VfrZ6G6hrkkXbqx1WxBvOxMkRq7GW65Ym6IECrYAEkWc0FTbX
 JdP9upfOBiy7luHutbTKOvfZK6Au6YL8NQ==
X-Google-Smtp-Source: ABdhPJx/1Cq3NYUCo2ELdPgc9LjH1EKTz98/lH5u+N/+SKfFA/gTkjdaxbLZFqMraO63f341EuPFWw==
X-Received: by 2002:a5d:58d7:0:b0:206:f0f:18d5 with SMTP id
 o23-20020a5d58d7000000b002060f0f18d5mr282727wrf.271.1649087583285; 
 Mon, 04 Apr 2022 08:53:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a5d6d4b000000b0020599079f68sm9733858wri.106.2022.04.04.08.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:53:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1] hw/arm/virt: Check for attempt to use TrustZone with
 KVM or HVF
Date: Mon,  4 Apr 2022 16:53:01 +0100
Message-Id: <20220404155301.566542-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not possible to provide the guest with the Security extensions
(TrustZone) when using KVM or HVF, because the hardware
virtualization extensions don't permit running EL3 guest code.
However, we weren't checking for this combination, with the result
that QEMU would assert if you tried it:

$ qemu-system-aarch64 -enable-kvm -machine virt,secure=on -cpu host -display none
Unexpected error in object_property_find_err() at ../../qom/object.c:1304:
qemu-system-aarch64: Property 'host-arm-cpu.secure-memory' not found
Aborted

Check for this combination of options and report an error, in the
same way we already do for attempts to give a KVM or HVF guest the
Virtualization or MTE extensions. Now we will report:

qemu-system-aarch64: mach-virt: KVM does not support providing Security extensions (TrustZone) to the guest CPU

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not a regression, so not worth fixing in 7.0.
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234a..8f94e2fde62 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2048,6 +2048,13 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    if (vms->secure && (kvm_enabled() || hvf_enabled())) {
+        error_report("mach-virt: %s does not support providing "
+                     "Security extensions (TrustZone) to the guest CPU",
+                     kvm_enabled() ? "KVM" : "HVF");
+        exit(1);
+    }
+
     if (vms->virt && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
-- 
2.25.1


