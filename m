Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED73A4B86
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:58:54 +0200 (CEST)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr37-0002zE-4g
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmq-00031V-LR
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmg-0002ep-R8
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:04 -0400
Received: by mail-pl1-x631.google.com with SMTP id 69so3599959plc.5
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qR3R54ldm2hlks4jTNDifo1l/88jznlHccjT2381AZE=;
 b=HFqOKFv1yij89TQD7WLpcIcI/eicB91mmdQf2Lx/EmLYmGjWoKs/53PcYJEFJAF5BD
 Cv8uMZ+DFxb198ZMSrOGz7JRIysCxcm2AlevJbKsFOYxu3KJqnfxfO6QaBPK8pHio2H5
 eFtoGBERNo9kMRRfnkEzhaXt03k/JSMJwCqSR4UGGNKpZykvri2TfkCZBYp7WtOYemcM
 /eqtAfMlsA6qWE2A3Sd2jiGn5uN3ZtH0jhtOC96vmINFQ1rsUkWWGADEACD4SLdg04dh
 oDmU8YTmmsGXmx0dUYuFyUZmHBhOiUxzD1iBr0ug/a6kOBFyQZQZ/4ptfctAUa28U9sc
 zAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qR3R54ldm2hlks4jTNDifo1l/88jznlHccjT2381AZE=;
 b=WU6K3UOm1QHmQXCo/WFGUrHNlS07+SpqQnx2O/LTLBB5zt5/vbMD1qZZVRvHalMjtb
 ErcDqAByZCVSPARBmZPv1HqzTRkOlpnk/nbzd7EszMg7VOaxArZneZZ78s6zubS2laVy
 EONhTJYYDUCBg5XMu8y4fDTUFUsxaIQX8jXnFOz++UBuWukSWCouSt/H6KocIjAaH99Y
 RS6TIm1iY99fYMxNnLrUykPHc9lNIwOh3Pz4UzbO4NONF0R8ZNoGN9nI3x7MrNEJ+2BJ
 C0a2ggjfXNMnrF2B4CkcOwo3v3+bBWah/LVSoZHShr2EgJv74Ragh0eFGDdwWVqOB/8J
 JTAg==
X-Gm-Message-State: AOAM532HnHqcy4G8NGMDQ3IV+rhpvNc9QU9OzxKNlcowXfA/rTbWFeCl
 UJQwm31t6nItGYt6QbitUoY6l8y0jplrOQ==
X-Google-Smtp-Source: ABdhPJxXXCmMLbdPAJis9bNKHwBgd95j3q7mHpJt04TKHc06OF71xSYmV0ONy8yM/JXIhVOUl8NO3g==
X-Received: by 2002:a17:90a:4a89:: with SMTP id
 f9mr11571593pjh.50.1623454913496; 
 Fri, 11 Jun 2021 16:41:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/34] accel/tcg: Use MiB in tcg_init_machine
Date: Fri, 11 Jun 2021 16:41:23 -0700
Message-Id: <20210611234144.653682-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-all.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index e990180c4b..1ee89902c3 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -32,6 +32,7 @@
 #include "qemu/error-report.h"
 #include "qemu/accel.h"
 #include "qapi/qapi-builtin-visit.h"
+#include "qemu/units.h"
 #include "internal.h"
 
 struct TCGState {
@@ -115,7 +116,7 @@ static int tcg_init_machine(MachineState *ms)
 
     page_init();
     tb_htable_init();
-    tcg_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
+    tcg_init(s->tb_size * MiB, s->splitwx_enabled);
 
 #if defined(CONFIG_SOFTMMU)
     /*
-- 
2.25.1


