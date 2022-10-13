Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851AA5FDEDA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 19:22:39 +0200 (CEST)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1uo-0003Z3-L2
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 13:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj1ro-00086S-TX
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:19:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj1rm-0005kN-03
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:19:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u10so3894686wrq.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pA/r/wR34UCRcAHrPtSKaI1T56yoEpb2xy7U6UnAWQE=;
 b=lCVEc6Vo8crY9lEgq5QiBPSGrBjZxoVr6gJr3U+wNvHMXMarw2Qo4xKngUucwWswkb
 LSBednjh3DP0O1v09QUjif297XvXl1BSBN/LHj5tW///TGcnVHKHd/e3szqkQI00y6ju
 w0d5uxsTwwDANoHLIQptery9A6QbxLpp/uEJDIE6MQCJP2pGQvhCh3grWh5JQDF45qsD
 C/vDFxkk4F6zz1ORmXu+Bu7SGrwDA4KgvG1ebzgyJ1gesM2TSk1co2fROp1lZCiET0Uh
 gB05oHpPr4ePE4/161ZKrKvJSqBqAy5BUT+pH3t/6eGuxW1JOg7hbbRAhX+gji8UA9hK
 yWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pA/r/wR34UCRcAHrPtSKaI1T56yoEpb2xy7U6UnAWQE=;
 b=TFxNLh/fBpm+hZ2tsOmyjT2pn9HBPjfwQSIHVo7fHqjhY0hKY42HeSaEaFOkrd1pj3
 IKgewl1PmtP0nAhVld2UEZ48G5MRCqQPHS1f+y5i2C/sO/K2yitHOvG1MningAlnqTgg
 8EJ6pGrv+4TffGg5ty3fnQM+mNdcl3SGd6IGrpa6FDN/ventahe1sC/Qp7EtxTYalLBe
 gIaU09XXjRtqRrY2hvPxWoZyjOscX64jbb1TI2X+PaRmMMneh4of84Sj4CiqgHguR+CB
 GFAalAcYrNZvIs3PdgbdlV/DLvrjy/2hcJQ6AX8h8SBTmZQZbqgUjjgdEal61oi5hPbs
 gQjw==
X-Gm-Message-State: ACrzQf3IXtfz4X+nwuI17LjUF1esHK6s9Cl+fUz9iy3ZxtDYBfQf1/Bt
 gPudywBZDcN1jkWK8vXOsHXrOlj6++LxQA==
X-Google-Smtp-Source: AMsMyM7pcRIb9fxNfpERR20eNu+0FLxX+SxfWwKUDsIKdz9T2/bEIYyGW/Qirum4uQeXUyyQIsG4tg==
X-Received: by 2002:a5d:504a:0:b0:22e:3edd:3c86 with SMTP id
 h10-20020a5d504a000000b0022e3edd3c86mr747490wrt.360.1665681568307; 
 Thu, 13 Oct 2022 10:19:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adfeb01000000b0022cc3e67fc5sm96617wrn.65.2022.10.13.10.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 10:19:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] hw/i386: Use device_cold_reset() to reset the APIC
Date: Thu, 13 Oct 2022 18:19:26 +0100
Message-Id: <20221013171926.1447899-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The semantic difference between the deprecated device_legacy_reset()
function and the newer device_cold_reset() function is that the new
function resets both the device itself and any qbuses it owns,
whereas the legacy function resets just the device itself and nothing
else.

The pc_machine_reset() and microvm_machine_reset() functions use
device_legacy_reset() to reset the APIC; this is an APICCommonState
and does not have any qbuses, so for this purpose the two functions
behave identically and we can stop using the deprecated one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: tested only with 'make check' and 'make check-avocado'

 hw/i386/microvm.c | 2 +-
 hw/i386/pc.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 7fe8cce03e9..0b08010bf0a 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -486,7 +486,7 @@ static void microvm_machine_reset(MachineState *machine)
         cpu = X86_CPU(cs);
 
         if (cpu->apic_state) {
-            device_legacy_reset(cpu->apic_state);
+            device_cold_reset(cpu->apic_state);
         }
     }
 }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 566accf7e60..2b2d0bc2b33 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1860,7 +1860,7 @@ static void pc_machine_reset(MachineState *machine)
         cpu = X86_CPU(cs);
 
         if (cpu->apic_state) {
-            device_legacy_reset(cpu->apic_state);
+            device_cold_reset(cpu->apic_state);
         }
     }
 }
-- 
2.25.1


