Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB75274DB
	for <lists+qemu-devel@lfdr.de>; Sun, 15 May 2022 03:41:59 +0200 (CEST)
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nq3Gg-0005Ng-5Z
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 21:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3F0-0003JT-G0
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:19 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3Ey-0002fU-QU
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:14 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x23so10997143pff.9
 for <qemu-devel@nongnu.org>; Sat, 14 May 2022 18:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D8CeNai5hoihLKkHUXkY+f/fMIbV4YMBEU8bGlpc+0s=;
 b=ZxVu/cWR+IvYjKbtcVhkX6CgIMce0aOWzjalwL2wGshyORidy66P6+Bjc0EHaLxZQX
 zWJs0Us8zRmxjs8KbEqS3wFXA/hxIXoFOddIxK3QalwddUI540zMCbV7god0uIISGdcI
 UrO73R5eVF6XkvfU/5GDhd5+jbvgF+/QK9h0Y/Ot2PolWUFN5sZ1nZBxrmtnkdjenH6r
 E7By7Bemwhq6vXXohRwHH+E9g/B2I4tdxJqMrgpaTlRLxPlX8Qav/yZp9JLKtmpbL1EG
 ZgKQTDGOeXOHlg9JrrxDL0TjMDSw6zu15qdGi0PWYFAT+7i9GfNvx+zLx+89uArvtxaM
 WaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D8CeNai5hoihLKkHUXkY+f/fMIbV4YMBEU8bGlpc+0s=;
 b=ajKsiqEzCmoxNBJkoo2g37fHpWuJGFZk+rpO8Hj4Ah9fxY89Q6xA8hAiuY2YpWY1lX
 aO3B181k6Zeu9hOUTzoxBbDfUzc+OB9vOFj8A7kx9S7ggxmW3RQAJFyQv7+9hbc35Qu1
 /jRrr3o/sH79ncEEZHNcvIb4pl+32E+ibLwOmg/y4rf6VvTElZz2eh4f+mVxoV76TlYH
 YWInfsOe/i6FJLHGSD8aAFdttbR1yuUXOMJhhv0gcFvL7cFQQIk3Jrb+gmxWc/vSIdzL
 5rdbB3cmhP1wzzVRLJGSeeKGwTiIjpP/bnK6mD7eWEnh5jIXFGni5URu3h2UYuPBWfJt
 JcTw==
X-Gm-Message-State: AOAM532Af97sHS1lRYgeosqxirNK02w86ICn90EgEAKL2RHerGfeIqPW
 Fx6aQoQP6e2pidpPUzebLsc8CehxgCc=
X-Google-Smtp-Source: ABdhPJwqXroJ2r/qacIRI05lBh2vA9pp8s++Pd8zOjIilPil/xXH6iwHXu35zzRJtYFlCWjOpVn9fg==
X-Received: by 2002:a05:6a00:134f:b0:50e:10e0:ef82 with SMTP id
 k15-20020a056a00134f00b0050e10e0ef82mr11597338pfu.45.1652578810890; 
 Sat, 14 May 2022 18:40:10 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a056a00213a00b00510749ae412sm4193425pfj.48.2022.05.14.18.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 18:40:10 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jia Liu <proljc@gmail.com>
Subject: [PULL 1/4] hw/openrisc: page-align FDT address
Date: Sun, 15 May 2022 10:39:45 +0900
Message-Id: <20220515013948.2993495-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220515013948.2993495-1-shorne@gmail.com>
References: <20220515013948.2993495-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

The QEMU-provided FDT was only being recognized by the kernel when it
was used in conjunction with -initrd. Without it, the magic bytes
wouldn't be there and the kernel couldn't load it. This patch fixes the
issue by page aligning the provided FDT.

Cc: Stafford Horne <shorne@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/openrisc_sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 8184caa60b..99b14940f4 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -356,7 +356,7 @@ static uint32_t openrisc_load_fdt(Or1ksimState *state, hwaddr load_start,
     }
 
     /* We put fdt right after the kernel and/or initrd. */
-    fdt_addr = ROUND_UP(load_start, 4);
+    fdt_addr = TARGET_PAGE_ALIGN(load_start);
 
     ret = fdt_pack(fdt);
     /* Should only fail if we've built a corrupted tree */
-- 
2.31.1


