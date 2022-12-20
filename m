Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DE265233A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:57:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e3A-0006sz-7u; Tue, 20 Dec 2022 09:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e35-0006qo-Ll
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:55 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e33-0004kB-Jg
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:54 -0500
Received: by mail-wr1-x431.google.com with SMTP id w15so11968362wrl.9
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWYX+bkDoAyS5D4KoXYEloAhrykg6/BssqVR4T1fIB4=;
 b=BWYUpPKXnvShEs0Oxzgi4gu5/EkBNtF4QGPbo9bocTcyBeRykHKTzEd1jJtKMG4T5Y
 eA3akbqhPFUS26BXPHvNrGv1y8Sz/ukl2XAtEAurmvMGy3F5rEY2PWFpLY9OqUQQ/WdU
 iOWn+cXUcI1omJfkQWuwPjE/u+W4A639SOg0Uu22Z4eSJQtD9071uB01PJyurDBnJiRs
 FgDonSF97cI/TE8ntMgvbBOC15ICHf/1f7Benf86373c7w2b1uxkAq9J6L7J9EonXNfu
 HQ9/nDg583oKC3HsYJZG54Yp/OWKAt88Wt6H4l8lUst0lW5aDTiBZRdFG5myTb2GNWgd
 IJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWYX+bkDoAyS5D4KoXYEloAhrykg6/BssqVR4T1fIB4=;
 b=mqBaRAFDrgWRCSPG3w1njdiJK7HOmIYt2s9IeY5KQ0HZugDpQHC69KAD8AhVV6HBfw
 317tPKG+s7tib0A09VsAc+Kz1Fp813GFs8kUFz8uEXQByargadJGYsJdiAuEkDs8+lSp
 umRdHoIisdQrATon6mD9kvE+BmQyrXmL0Gc2cqorh2zqBCF8eFynHrVjOkSfyBdaHCh4
 T2SyAEFVLQ5UJcWvnIZ/4Ln/6uoND6DCBGfM1BO9UO7dQNocIJwMYtCmINA128/VQk18
 oLqM4HbLxEkFz/GAsQOIl+TdWli8VEGHg+b0rq5Ou7pqpOEZtLftkGGz2aQGNM3Q4s+x
 latg==
X-Gm-Message-State: AFqh2kpi3clcUMoqk1ILnqAGmYIwUOLc2s6nsgmg9MCe+0bQYD0QGzUC
 +iA+IkGzl/b9ZFqY0kaH2K0ihLo70cytCLWJZiE=
X-Google-Smtp-Source: AMrXdXuoAu4ThmY+6P0bDNS/j7BAdzudrgi9ZJmI7X8yxSmsEVFX9yioNUFeAJfcmg1BblUACWBSaQ==
X-Received: by 2002:a05:6000:1f1c:b0:261:d8be:3046 with SMTP id
 bv28-20020a0560001f1c00b00261d8be3046mr4608817wrb.0.1671548212133; 
 Tue, 20 Dec 2022 06:56:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 by14-20020a056000098e00b002366f9bd717sm15348269wrb.45.2022.12.20.06.56.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:56:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/5] target/s390x: Restrict sysemu/reset.h to system emulation
Date: Tue, 20 Dec 2022 15:56:24 +0100
Message-Id: <20221220145625.26392-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220145625.26392-1-philmd@linaro.org>
References: <20221220145625.26392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In user emulation, threads -- implemented as CPU -- are
created/destroyed, but never reset. There is no point in
allowing the user emulation access the sysemu/reset API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 96562c516d..b10a8541ff 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -26,7 +26,6 @@
 #include "s390x-internal.h"
 #include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
-#include "sysemu/reset.h"
 #include "qemu/module.h"
 #include "trace.h"
 #include "qapi/qapi-types-machine.h"
@@ -35,6 +34,9 @@
 #include "fpu/softfloat-helpers.h"
 #include "disas/capstone.h"
 #include "sysemu/tcg.h"
+#ifndef CONFIG_USER_ONLY
+#include "sysemu/reset.h"
+#endif
 
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
-- 
2.38.1


