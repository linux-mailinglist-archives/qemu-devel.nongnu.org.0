Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5EF2D908C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:32:31 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY2g-0003MZ-S5
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXs5-00033L-IU
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXs4-0005eF-4N
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r7so14385833wrc.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lPfxuHaLxE9K8aKuTGSCmD6sK9ifyAYTxEpcM22e690=;
 b=Pr5IDJIIy1ec3blHYUhCbSak/f0RziqCIK5su9y046d1yiq063geeiaEQ9A/rOHqS1
 YmXuZzav6vN5pAW+dNS9A6Lzm6NRFhk14UjAiKtbRPB0HT9O4oNODBBqXYvGT/IlzOrB
 jVtgM/lfkqcO/VNBCClpJZ6wRdH8eSVV36SI01vXijcQuriWNC9GMhIadVKr9TDAokcY
 ztO950eYWGI71rpLGbfq90p5IItiBoWufekxIvGfkSJnLTQwAUjFvgRKQCl9EhM0Kfux
 v3zalJvNAiSLoG5rxye32lCy3OLpmlY2Gm4I/Rn0H6Ne/scVsZg72O4oYS3QGFe6bDuc
 8eKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lPfxuHaLxE9K8aKuTGSCmD6sK9ifyAYTxEpcM22e690=;
 b=LifMvY5yAIdyKKklMf/YtLAHuSVFl8n5njPnobugfln5qDWRm05nO2c0jOdTSClwuF
 vTtQEYSfl3eHDwH3TM++5IZjJx0YJwFbo6LdD+V4RHyc8xeLGH6p+RdsT1YlD3Ky9sQ6
 B9MtdPnxXK4cKya7y0ni/2pbx1umDNkFDSoPihvgxGBIO9UmUB/9P/1mk16Br+4lwcRD
 bhnwITK8d0wwINBuks0pfoCJxypRMSdwL7TKJFJNg2I6CcJULRKalPvZF3u5FXiPo5hW
 SFBZVmYGJn71n5b2gMpcIyLlcpZcqE4+JPiaH+IHo8cvY+CWtz4K0bAu7zaApTmm1PeL
 6L+g==
X-Gm-Message-State: AOAM532bYZCG9zToYWfMfjscKLYe0J22NGC+ppkCHOczHYUuAbJdrepB
 pPp3V89Ep9CTvBxGovI6GLbuPKAXtSg=
X-Google-Smtp-Source: ABdhPJykEIfb+pgpzd8TM3ktlEuSMEG2GBmsebeicQwa/ZyOg087Gw/0IqJ5Ecv/dMNq7lQ3IwomKg==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr25926230wrx.170.1607890888569; 
 Sun, 13 Dec 2020 12:21:28 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n9sm10368160wrq.41.2020.12.13.12.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/26] hw/mips/malta: Rewrite CP0_MVPConf0 access using
 deposit()
Date: Sun, 13 Dec 2020 21:19:40 +0100
Message-Id: <20201213201946.236123-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PTC field has 8 bits, PVPE has 4. We plan to use the
"hw/registerfields.h" API with MIPS CPU definitions
(target/mips/cpu.h). Meanwhile we use magic 8 and 4.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201204222622.2743175-6-f4bug@amsat.org>
---
 hw/mips/malta.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index f06cb90a44a..366f4fdfcde 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/bitops.h"
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
@@ -1136,8 +1137,11 @@ static void malta_mips_config(MIPSCPU *cpu)
     CPUState *cs = CPU(cpu);
 
     if (ase_mt_available(env)) {
-        env->mvp->CP0_MVPConf0 |= ((smp_cpus - 1) << CP0MVPC0_PVPE) |
-                         ((smp_cpus * cs->nr_threads - 1) << CP0MVPC0_PTC);
+        env->mvp->CP0_MVPConf0 = deposit32(env->mvp->CP0_MVPConf0,
+                                           CP0MVPC0_PTC, 8,
+                                           smp_cpus * cs->nr_threads - 1);
+        env->mvp->CP0_MVPConf0 = deposit32(env->mvp->CP0_MVPConf0,
+                                           CP0MVPC0_PVPE, 4, smp_cpus - 1);
     }
 }
 
-- 
2.26.2


