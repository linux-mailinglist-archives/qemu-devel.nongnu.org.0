Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CB2BB84E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:29:49 +0100 (CET)
Received: from localhost ([::1]:59536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDyW-0007DV-SB
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDf5-0003m3-HD
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:45 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDf3-00040Z-Dr
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:42 -0500
Received: by mail-wm1-x341.google.com with SMTP id p22so11850871wmg.3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8GcA1tmgbgHsjhyS0X00aq1DHnZJQwU28jq75V9oiA8=;
 b=De0yqsrKx5tBwZsUF7B7lrVLtX8ukJw13uC6J1CK7ebKO+RXM8gdxxKG2Wzp27QDrw
 mddDUVSWAyvQQOtaNk2rXwtVZcQF2H18RBzvtSpTbMHqpXMGmkBp8HneMwk7x+BPt1Jv
 xJyCpRtSABeAp+WYqCF7MMerkSN69pW09H8q1d72sM4I1liBmqpB/M2DrvRrGqpNxB0H
 Urhn6Qb7FqrHvmZEFybrmw7xt0SRX1yM37T2AoIh0dCDAUXgEles4zkPNrSiS9RBoKVb
 vajRfhs9+fT0V1qMihciC0aJDR6zMTQ8FtpaW1QEm9vFBUn5iJ0If11C6fAbw69gQK0a
 ROCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8GcA1tmgbgHsjhyS0X00aq1DHnZJQwU28jq75V9oiA8=;
 b=TC58g0HNa6cccyp8jBdvwEpLW/TwmzmX8qFcWiIfvVIL9MTajuayoTP+1oNPdC2p5w
 Az+X6wblfubvzTdLBc4r/oLZ1UFOWTNnMhHuvI99zRzHxGvVH9DPKhJoNaMdKg52yJkM
 bdDaMnfaGTdCZHFrdMq8GckD4ouy3Tcz2Bk7zCnH9HVbml/BioihJDdWyX7/pMU9cHGp
 VR7vM0s9OpKEKGpjvdpX5a3N7eGbrzIsHVdAFx20o84HGJrXt9gT002SV+XVBQuccOzz
 kNjw11SwAqC1czQj0r+/wMvoUSItHRhwdzzTo+aI/JFd3z3RganL4EKCyyWV3DM/wO3t
 3znw==
X-Gm-Message-State: AOAM530ZKfdUnjXq+TBuLzDIoF1KTyAdEX9mpkWgImnPKbk5/yBseO6U
 W6QsltuesPvER3ocNkRLOk+SwATSM2I=
X-Google-Smtp-Source: ABdhPJyQk/7+Y2GUgg/1Pn1CwN4xY7tKMkwp2jN7qYHaiaTqJ74iKppDWWUVDFofRRssc26OpW+wNg==
X-Received: by 2002:a1c:ddd7:: with SMTP id u206mr11758386wmg.27.1605906579667; 
 Fri, 20 Nov 2020 13:09:39 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id s8sm6627126wrn.33.2020.11.20.13.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:09:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/26] target/mips: Extract the microMIPS ISA helper
 definitions
Date: Fri, 20 Nov 2020 22:08:28 +0100
Message-Id: <20201120210844.2625602-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the microMIPS ISA helper definitions to
'isa-micromips_helper.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                   | 10 ++--------
 target/mips/isa-micromips_helper.h.inc | 17 +++++++++++++++++
 2 files changed, 19 insertions(+), 8 deletions(-)
 create mode 100644 target/mips/isa-micromips_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index c15caed9fca..ee93c2de836 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -181,14 +181,6 @@ DEF_HELPER_2(dmtc0_entrylo1, void, env, i64)
 
 #endif /* !CONFIG_USER_ONLY */
 
-/* microMIPS functions */
-DEF_HELPER_4(lwm, void, env, tl, tl, i32)
-DEF_HELPER_4(swm, void, env, tl, tl, i32)
-#ifdef TARGET_MIPS64
-DEF_HELPER_4(ldm, void, env, tl, tl, i32)
-DEF_HELPER_4(sdm, void, env, tl, tl, i32)
-#endif
-
 /* CP1 functions */
 DEF_HELPER_2(cfc1, tl, env, i32)
 DEF_HELPER_4(ctc1, void, env, tl, i32, i32)
@@ -427,6 +419,8 @@ DEF_HELPER_FLAGS_1(pmovmskb, TCG_CALL_NO_RWG_SE, i64, i64)
 
 DEF_HELPER_3(cache, void, env, tl, i32)
 
+#include "isa-micromips_helper.h.inc"
+
 #include "mod-mips-dsp_helper.h.inc"
 #include "mod-mips-msa_helper.h.inc"
 #include "mod-mips-mt_helper.h.inc"
diff --git a/target/mips/isa-micromips_helper.h.inc b/target/mips/isa-micromips_helper.h.inc
new file mode 100644
index 00000000000..66a764c4aac
--- /dev/null
+++ b/target/mips/isa-micromips_helper.h.inc
@@ -0,0 +1,17 @@
+/*
+ * microMIPS instruction emulation helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_4(lwm, void, env, tl, tl, i32)
+DEF_HELPER_4(swm, void, env, tl, tl, i32)
+#ifdef TARGET_MIPS64
+DEF_HELPER_4(ldm, void, env, tl, tl, i32)
+DEF_HELPER_4(sdm, void, env, tl, tl, i32)
+#endif
-- 
2.26.2


