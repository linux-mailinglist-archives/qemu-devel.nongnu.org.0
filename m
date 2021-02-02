Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C630C8E5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:06:09 +0100 (CET)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7040-0006JB-7B
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztw-0005O8-RX
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:44 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztc-0002Ee-EB
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:43 -0500
Received: by mail-wm1-x335.google.com with SMTP id w4so2004190wmi.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gzWlxwGPzoms0Ug6rgP3MPwoGWfsZNay/8PJUHAGy4o=;
 b=cixYe0bHwHdpbppCYtukVdUNyDeAs//yejnhN2GSY9CRms7GHzayOh9GoTFcSNZ/+K
 3ZXTDA1vrArMpDat7gQOHwrgE4p+7TBG5uaRjpOmWE142xqZt/iZHnv5H/sO8bHraLSS
 n37M5fqQrV5fQwmhtc541HofSqeb1Io9UKgAMM0MvY+Iljat9ddGNUIrcfBO7agffsrK
 c62FoDc3N4EEScTd4kSlIFqFz+SyeYk+w4mgPYW8oCBryu1BTSzJDRY0VAN3tzRKYx6F
 C4kWblr4ltkQV2+ekrkZgn110ivXqeyF9Gg76DoLqY7vpg0eg39K4K6bM6/4ErbNoI2g
 bdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gzWlxwGPzoms0Ug6rgP3MPwoGWfsZNay/8PJUHAGy4o=;
 b=SDSZYJ1Hv4kwhrEZlBvRn+PIF8NuKSFsxysiXvHnfaI3MRGJ3fBjVKkFDUordCKbyE
 /sOrr7buMT57NU3ohtp/v4H3aOkqo5izyzW+DHJZqfWOSSwCZC32TzSTHpYQvVRWDMCT
 fINs5REXZw0bjGSyAJYbCLcgfOZhD9igN3UxJ7wXOWSuHC93ba/qOCGw34jwQYsZBBPR
 zTM9bnU2+TyDuGezToImq2uVAUmYhgutFrUJvBBVGYju56DTqHOIGM4Gs54FFU++9wqN
 LZDhTQoxi/tSmPR88LoIJrOfJ7ws1oIlWAWpm2gM6iTY/9j0XIsvBAo1eunLJ+qSpXp/
 8gjg==
X-Gm-Message-State: AOAM533K1vNR25sqzwuiyRYkiBOHYXgDYC9IAu7aqNdqmQoK41fdIbmt
 d2nrsWi7ysa+rNqrIlt3wAKavb6ErhC6bw==
X-Google-Smtp-Source: ABdhPJxCjGyJQAv5lRTgFv941XhRi6XuHbgLHqsccG2LL9sYFDIlM7iNsvTscRJEklndlDgGroeDzQ==
X-Received: by 2002:a1c:4ca:: with SMTP id 193mr4693839wme.178.1612288521096; 
 Tue, 02 Feb 2021 09:55:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] hw/intc/arm_gic: Allow to use QTest without crashing
Date: Tue,  2 Feb 2021 17:54:57 +0000
Message-Id: <20210202175517.28729-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Alexander reported an issue in gic_get_current_cpu() using the
fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
doing:

  $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=qtest -qtest stdio
  [I 1611849440.651452] OPENED
  [R +0.242498] readb 0xf03ff000
  hw/intc/arm_gic.c:63:29: runtime error: member access within null pointer of type 'CPUState' (aka 'struct CPUState')
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_gic.c:63:29 in
  AddressSanitizer:DEADLYSIGNAL
  =================================================================
  ==3719691==ERROR: AddressSanitizer: SEGV on unknown address 0x0000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
  ==3719691==The signal is caused by a READ memory access.
      #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
      #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
      #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
      #3 0x56187adc573b in memory_region_read_with_attrs_accessor softmmu/memory.c:464:9
      #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:552:18
      #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory.c:1426:16
      #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.c:1449:9
      #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:2822:23
      #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
      #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2875:18
      #10 0x56187aa88633 in address_space_read include/exec/memory.h:2489:18
      #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:13
      #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
      #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5

current_cpu is NULL because QTest accelerator does not use CPU.

Fix by skipping the check and returning the first CPU index when
QTest accelerator is used, similarly to commit c781a2cc423
("hw/i386/vmport: Allow QTest use without crashing").

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Message-id: 20210128161417.3726358-1-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index af41e2fb448..c33b1c8c4bc 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "trace.h"
 #include "sysemu/kvm.h"
+#include "sysemu/qtest.h"
 
 /* #define DEBUG_GIC */
 
@@ -57,7 +58,7 @@ static const uint8_t gic_id_gicv2[] = {
 
 static inline int gic_get_current_cpu(GICState *s)
 {
-    if (s->num_cpu > 1) {
+    if (!qtest_enabled() && s->num_cpu > 1) {
         return current_cpu->cpu_index;
     }
     return 0;
-- 
2.20.1


