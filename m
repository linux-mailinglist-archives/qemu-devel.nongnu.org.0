Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC26ED154
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:29:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy7X-0007rM-DP; Mon, 24 Apr 2023 11:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy7P-0007U8-4V
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:28:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy7J-000739-3V
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:28:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so2776629f8f.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350114; x=1684942114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GxEwSkfuQJqYIN7NaE1JW+VVfYPYEn1JSj4/u7O/cOk=;
 b=O0qYaxPp8WszZVImVBdrAdAKHERlzqTuIPVuOWmyop3PLHZrKmFoDLfvLJbt3dfKBq
 dNVhYecESBbVYRYbEy5kHsYwbG8q5wwA6WM+1TDYwpfV5CrJjQ/HqMzsXYqaA48KSkyh
 ygDKtGPi+3UuTS0uFXrF9LzvMN/ytEgNuiS56qI+2r22EYnyBCHvxcJTe6Frh9Csdnne
 vRb0NY8BpvRNhw0U2roDuXCjbkuu9NNIjE+3Z5mxSaoXoINJs+WAfDa+/RKCZuXP3fAE
 3cDPxdJkD3iRGWAUIeCcAK1Nr0pNevBBzgKCDPBWI/j5N313jd+I3ZftE3zJOac0t8vQ
 KcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350114; x=1684942114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GxEwSkfuQJqYIN7NaE1JW+VVfYPYEn1JSj4/u7O/cOk=;
 b=P7fKPpYOMJvnYtbOD54fTWDZwJV8c+PQsTd8N97pQLHktCqgB2HvTxdqyRjAy0Dt8b
 mOqPxhJYvKwPuweGcWCAjAlw07znHPJJm8z/0lnnle9GuOawC5c1Ubsb/kWWprIN5O3N
 g1f1LIg5gVWeaFM9QbXtylbfxl6lhuj5l3njFKfxP8wOtbNX2ESXzQZ5dmcEypxXvkK2
 kK+unHQgXdn+WSbU9KJU4D+6nxItXQSfV9sBCKoETlV08W4ioSyIlOfkUvP+YREqpLMo
 utZdguw9ACcgzdj0BFJQuFu0Emr4FlCWcdWb8885shpDyMbFnUV287cXCfk5xAIAgdJx
 zGng==
X-Gm-Message-State: AAQBX9eFv7y33kvRFhPc2ZGqHxrtrjIAgQ1yyiVPUC/it3lf5ub+MlRh
 PBD6LMUcgustMOp7FjUbT/IDGQ==
X-Google-Smtp-Source: AKy350YNBA+QH6UbUAtCDTG1xuZ29OgR5etJIz/PGOmIrqJSoZgkGXa7TZ4IdFHkup0gssDLs2fWeQ==
X-Received: by 2002:adf:f70f:0:b0:2f5:8e8b:572c with SMTP id
 r15-20020adff70f000000b002f58e8b572cmr9363955wrp.49.1682350114378; 
 Mon, 24 Apr 2023 08:28:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1cf202000000b003f190dfc404sm9556457wmc.18.2023.04.24.08.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:28:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH] hw/intc/allwinner-a10-pic: Don't use set_bit()/clear_bit()
Date: Mon, 24 Apr 2023 16:28:33 +0100
Message-Id: <20230424152833.1334136-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The Allwinner PIC model uses set_bit() and clear_bit() to update the
values in its irq_pending[] array when an interrupt arrives.  However
it is using these functions wrongly: they work on an array of type
'long', and it is passing an array of type 'uint32_t'.  Because the
code manually figures out the right array element, this works on
little-endian hosts and on 32-bit big-endian hosts, where bits 0..31
in a 'long' are in the same place as they are in a 'uint32_t'.
However it breaks on 64-bit big-endian hosts.

Remove the use of set_bit() and clear_bit() in favour of using
deposit32() on the array element.  This fixes a bug where on
big-endian 64-bit hosts the guest kernel would hang early on in
bootup.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/allwinner-a10-pic.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
index 8cca1248073..4875e68ba6a 100644
--- a/hw/intc/allwinner-a10-pic.c
+++ b/hw/intc/allwinner-a10-pic.c
@@ -49,12 +49,9 @@ static void aw_a10_pic_update(AwA10PICState *s)
 static void aw_a10_pic_set_irq(void *opaque, int irq, int level)
 {
     AwA10PICState *s = opaque;
+    uint32_t *pending_reg = &s->irq_pending[irq / 32];
 
-    if (level) {
-        set_bit(irq % 32, (void *)&s->irq_pending[irq / 32]);
-    } else {
-        clear_bit(irq % 32, (void *)&s->irq_pending[irq / 32]);
-    }
+    *pending_reg = deposit32(*pending_reg, irq % 32, 1, level);
     aw_a10_pic_update(s);
 }
 
-- 
2.34.1


