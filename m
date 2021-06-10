Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F53A30FF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:41:59 +0200 (CEST)
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNkk-0004Ku-1J
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrNjZ-0003fz-Bu
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:40:45 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrNjX-0007sG-LN
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:40:45 -0400
Received: by mail-pf1-x433.google.com with SMTP id k15so2089900pfp.6
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 09:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jICL2E2dGsyW6wqVaOWDQKDgLWC/P6azjECe17Eegzc=;
 b=xDZG64OuydqR2jtN1JpiL2dKjMLq5oPJxbGTWM6FZBxmWlPn3QgDoloqkVOx0gEvgR
 Aek91gW53Cx25BoVwHx9F3yGIiF2oUXtWOYFPlEvW43Wv++mJvqfT/aAy0YTTFS+TtRX
 q4Hn/m7VVvGBqHDYFPjGS9ZAiEpmPGaZkLWdo1vnT5m+g/HdQCN2oZcy8Z/JBq6h5NQZ
 gwNLfWKKyFCLJHyYSMfqM9wEvcdXeYyyVIzFOfgGPw638RsX1nNBGMZLTbmBLoXd6bVj
 HI9xlal3/yIW+mwxKZsXVEoXCMpjim4vlw8jCPpv5ucQbwVWSP7fyv5HmVUwucIEKaEW
 ZHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jICL2E2dGsyW6wqVaOWDQKDgLWC/P6azjECe17Eegzc=;
 b=F1gEtDe24k/ZU3YGzmkDsqf5dUO2+W72CAQPBcl0iSuH3XflGtTEsR/pMeuyWC4LBm
 OzJOnFic53B5od3XKk8eaegKVC6jzff4cfRv2IIZ7qQhFVkL8iyU4HCivpCAtAlxYk00
 JEmypgBn0z1MVwAamank49THNgoKoMLsxalRkpR6xfj1Eh2ZRo5ruITMIVxfg/MKBCA7
 TCAUGPzdoGsmSMkH1Udrje/pp01xyR+q5S/auCTvmEuDt37IqpghiBcDA48mAGu07XPo
 M5lJPWswwFA8qSJkTG3zHy0LQsvUUp0hGQ44nSuAWHzBqyjJqnt8v8rBRebqZQSklHmV
 r1rw==
X-Gm-Message-State: AOAM530QAzpmI4WMjhgMHtcDIt0psSYizbx6w9f8A4wYSz48mS+0bVNS
 dbkrDQoDvHiPltNeGQzuJi7aKPhumRyDMw==
X-Google-Smtp-Source: ABdhPJy1sZ1j4geIR2e2fjlsQu3NP7JjkDQqHw8QsnDLUcAOINCT5U2JxqePW5TUFgqrJX+49luxtA==
X-Received: by 2002:a63:d455:: with SMTP id i21mr5780053pgj.263.1623343241709; 
 Thu, 10 Jun 2021 09:40:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id t143sm3565208pgb.93.2021.06.10.09.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:40:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: Use MiB in tcg_init_machine
Date: Thu, 10 Jun 2021 09:40:40 -0700
Message-Id: <20210610164040.233820-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

This sits in the middle of my "Clean up code_gen_buffer allocation"
patch set.  Alex mentioned it during review, and I had already made
the change.

This is the only patch in the set that has not been posted and
reviewed.  Rather than re-posting the entire set, I'm just
sending this one and will queue the whole thing to tcg-next.


r~

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


