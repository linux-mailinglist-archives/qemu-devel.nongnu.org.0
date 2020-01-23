Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA585146E2C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 17:17:28 +0100 (CET)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iufAd-0004vg-Mx
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 11:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51541)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrU-00058G-ID
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrT-0003aT-EG
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iucrT-0003Z4-8F
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c9so3133416wrw.8
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 05:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idj0iLjmr8/TQLyRKf/J4FXSH6m29VJlJH1Xg+Aogq4=;
 b=kIX3Uo2jeXIPWKsQBH8CLaq3IunRXUHkOg2cB1d7RzN/2KTuxu4dS7sOuDThGGD3mX
 rdBR9WkrGk7LnYXOYfPloxPhfNv9cfdARgMF/P24Z1GMYe099Lz4tanT3ZjqzO62K6tQ
 75GUOhMY8SswlG8EP9o0fKD8xkF7RPah/u7bS6GCDK+VCzUj5xCEplhOzPt1gwMkgxxc
 EIBHFBdxjMSKM00kAlik+lc7qhyJSv8CL3345DKoMZY6wKOKnVj9FeACzgOHPWvPWtL2
 2sHSCw69V9K2NYZQGB92h0Rr1gMMUwSENAZmR2D8BhKjrROmSWTUhEiUUOoazKtAvv83
 QU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=idj0iLjmr8/TQLyRKf/J4FXSH6m29VJlJH1Xg+Aogq4=;
 b=jvGmCvsZa4lHziHRoi+WckAGs0ApDcq3km/T8GNP8mInIS25MUDVp+eDYTGtonlO5b
 bSQOKg3vdywnQb1gW/KE7OQW+w/c2hYNdwfuRpLOQ/t3xua1jZsnFWk4/PacF6DHAZmW
 HvGjHAkFBRgCIFcFVZG5CkQbkVkI24AVhmBdjBG+beTlSdLiJyrW3p+7A+ysvMmaBauU
 6tTvo3mcZsbaBTjcW8sFGQ0JenvDEa1uLmCyDVaJ+uXOS4vVx9jEYyxgSrmj1POKCvB8
 LMlu7iHtiegVzvbHMqAacO1eyjtcaM632y7W2EWidKOSu1kOnBomR8/g4AFAUITSRPyd
 W4xA==
X-Gm-Message-State: APjAAAV5ypRF9NG473XUPUAAQDHBuIDjEmoDmMcFrUbhWk274W5mssLZ
 plwS8eqwJTHTy7AKd8/WYHal7lBj
X-Google-Smtp-Source: APXvYqylD89kQkqZUSbKClb9VWQVvjWNF9fL6+G0Alzpz5nnp++VCyAZ09g//iKGkN9CQ4AwrdJdpA==
X-Received: by 2002:a5d:488c:: with SMTP id g12mr18045209wrq.67.1579787370126; 
 Thu, 23 Jan 2020 05:49:30 -0800 (PST)
Received: from 640k.localdomain.com ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id s15sm3073171wrp.4.2020.01.23.05.49.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jan 2020 05:49:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/59] target/arm/kvm: Use CPUState::kvm_state in
 kvm_arm_pmu_supported()
Date: Thu, 23 Jan 2020 14:48:29 +0100
Message-Id: <1579787342-27146-27-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
References: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

KVMState is already accessible via CPUState::kvm_state, use it.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200121110349.25842-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/arm/kvm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b87b59a..8d82889 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -181,9 +181,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
 
 bool kvm_arm_pmu_supported(CPUState *cpu)
 {
-    KVMState *s = KVM_STATE(current_machine->accelerator);
-
-    return kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
+    return kvm_check_extension(cpu->kvm_state, KVM_CAP_ARM_PMU_V3);
 }
 
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
-- 
1.8.3.1



