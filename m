Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC349E087
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:18:11 +0100 (CET)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2n4-0004Wu-GS
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:18:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fu-0006ll-Mj
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:47 -0500
Received: from [2a00:1450:4864:20::430] (port=35577
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fs-00067J-5D
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id e2so4114195wra.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78omnZ5BLUfUnSRSR2DgfwkYSNZfwAfILdqOtI91T4M=;
 b=GXYjyFvLe87K4lxjhx0ld8I9O+uH5rABjgFm6X1sgAFzw3ABjqvpRyCuIi+tAb95iQ
 VR1Mp/YSY3iepR8UdrE5Ni+pJqh72EZ7Yehjc+PtvHsfAScsAGpd0MskmcoCTO8uCxvQ
 6cCW44u6eKtlbhOufOf2dHDDnBg6QTaEakA/2o8qJNJ4mHTjTDcrs0Emqh0ZCHKQd4pN
 QFdh8wDjtiaoPdDTobP8Zc1aN5S7uljfHPkT1cYpO5qxhvWHb+eguKnX9E00FuRU3/Ug
 i8PFnhWwKqqz9COKKEtyD7Qa9Ub2tJiEJq6jBXHepSNvETAVjuFqwdD+Fk8YKxuVCdkZ
 CjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=78omnZ5BLUfUnSRSR2DgfwkYSNZfwAfILdqOtI91T4M=;
 b=qs53yevCk+OHhI1jwEbHkUgUi+F0KZaPyMqP93PLTs1yT3hgM1mJf4Mp4W5Lyakn//
 SmEdCrG6ZIR6MtwlKOrUYtMn5CUilA7YC9xMlst1nUteT/iBWX0T9Bd/KXde8XBK44d3
 Y51mSBZQEJzA7Ar9QSqBgj2a7VjiAnTT9YhZe2zzHtWnZdR9Gq9eLQj4NYREGNuI9xBu
 s2pldk5n6pszk4gUbkmAsmeBaQVA8tJDahHlqgWXbliLzZh4Npzwe1lET1qXM0euS9vh
 PXrD9wnKrVIIkbnuxuZPFfrlZ25qDwVNKjJuMAg2dPyLLlawhtcj2gDiVG2QTnZa2scj
 MJzA==
X-Gm-Message-State: AOAM5312T9hIMk3VRXd9duYSZnNYsARO8pqJGFNEz57dQL23bcs1TQ8+
 yfgpJtTmI7fpIVyfm4veiAlM2yNPIlY=
X-Google-Smtp-Source: ABdhPJx6M235UYRbiCrDldYl7TKvVIRByLcAkIWO4ZFZw45lmwKltqtJS9Br3gad9nuc8+3Ry58v5w==
X-Received: by 2002:a5d:64e9:: with SMTP id g9mr2642308wri.394.1643281842980; 
 Thu, 27 Jan 2022 03:10:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/14] intc: Unexport InterruptStatsProviderClass-related
 functions
Date: Thu, 27 Jan 2022 12:10:27 +0100
Message-Id: <20220127111037.457901-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

The functions are only used within their respective source files, so no
need for exporting.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20220116122327.73048-1-shentey@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/intc/i8259_common.c            | 6 +++---
 hw/intc/ioapic_common.c           | 2 +-
 include/hw/i386/ioapic_internal.h | 1 -
 include/hw/isa/i8259_internal.h   | 3 ---
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/intc/i8259_common.c b/hw/intc/i8259_common.c
index d90b40fe4c..af2e4a2241 100644
--- a/hw/intc/i8259_common.c
+++ b/hw/intc/i8259_common.c
@@ -116,8 +116,8 @@ void pic_stat_update_irq(int irq, int level)
     }
 }
 
-bool pic_get_statistics(InterruptStatsProvider *obj,
-                        uint64_t **irq_counts, unsigned int *nb_irqs)
+static bool pic_get_statistics(InterruptStatsProvider *obj,
+                               uint64_t **irq_counts, unsigned int *nb_irqs)
 {
     PICCommonState *s = PIC_COMMON(obj);
 
@@ -132,7 +132,7 @@ bool pic_get_statistics(InterruptStatsProvider *obj,
     return true;
 }
 
-void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
+static void pic_print_info(InterruptStatsProvider *obj, Monitor *mon)
 {
     PICCommonState *s = PIC_COMMON(obj);
 
diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index 3cccfc1556..aa5f760871 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -76,7 +76,7 @@ static void ioapic_irr_dump(Monitor *mon, const char *name, uint32_t bitmap)
     monitor_printf(mon, "\n");
 }
 
-void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
+static void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s)
 {
     static const char *delm_str[] = {
         "fixed", "lowest", "SMI", "...", "NMI", "INIT", "...", "extINT"};
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index 021e715f11..9880443cc7 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -112,7 +112,6 @@ struct IOAPICCommonState {
 
 void ioapic_reset_common(DeviceState *dev);
 
-void ioapic_print_redtbl(Monitor *mon, IOAPICCommonState *s);
 void ioapic_stat_update_irq(IOAPICCommonState *s, int irq, int level);
 
 #endif /* QEMU_IOAPIC_INTERNAL_H */
diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index a6ae8a583f..d272d879fb 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -72,8 +72,5 @@ struct PICCommonState {
 void pic_reset_common(PICCommonState *s);
 ISADevice *i8259_init_chip(const char *name, ISABus *bus, bool master);
 void pic_stat_update_irq(int irq, int level);
-bool pic_get_statistics(InterruptStatsProvider *obj,
-                        uint64_t **irq_counts, unsigned int *nb_irqs);
-void pic_print_info(InterruptStatsProvider *obj, Monitor *mon);
 
 #endif /* QEMU_I8259_INTERNAL_H */
-- 
2.34.1



