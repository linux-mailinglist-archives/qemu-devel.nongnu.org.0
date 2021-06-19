Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CFD3ADA2F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 15:46:11 +0200 (CEST)
Received: from localhost ([::1]:56472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lubIY-0003CQ-Qc
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 09:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubF4-0004aO-Np
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:42:35 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubEr-000838-AU
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:42:34 -0400
Received: by mail-pl1-x636.google.com with SMTP id y13so10092plc.8
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gDZ4fKHEj5x3/MSUxAskWLr9drbT4tzdH2sLCcgKL8A=;
 b=vZsDhT1sJo5laHSpLF0QflFbPdfoucJxc/XIX6exYmu8crybJiPmnTUtAuHGfPwwUC
 bwjmYpvdJStsRIOiJxPVqrwBq7CQhkRml0orR9vcSXL+bisU3TNYTZr8VYfqM9gJynLa
 sLTGkMe0E9ulF78Pn3ch32YdGT5euy08JjvfD7sMx7PjUBV71QG78xUh78XjH/V//ob4
 e8wrebPwVeueJ7lxhAL5oqF2pemwIfH2e/4/X34duAuPVe0bWutPpPJEv94n6xn6Qop7
 eNzv5nGqYCNYAnb+4O52jPr7Fsx0o2QlDs5eFVEBwlwsLhlzSTAeExwYH4nxlDl+7QB7
 JhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gDZ4fKHEj5x3/MSUxAskWLr9drbT4tzdH2sLCcgKL8A=;
 b=hEyQVQIjAavPysvmrltviIjTvZW5GaBO9cwoZ71Z9kg1WMFYMpQ7TQwQcKPPqC/qpN
 Xj6miJD95b5dJX/AelDROMrP2uARIQw1EjCmmAbew4jkkL47zZD40QB2XmPrQVf8mk8X
 EW+2O4ophyEwqxJwS55pcaZrJMihFFqxVjsJK03qxefu/E9hFHa8lxk6V22WQzhB5ZDq
 eVK3FM0sug4A4D8KzXDYyWzgVz4OOnT+R90N7IkGcEVBSuNIwwj/G1FfrDcMWRrxy2Th
 +hD8sl4HcNrbGk2TZ7MqSlJ9Y64z77AO3t3m8vEs69965vh5zxIQwldfE7FgZoTupdCD
 OY3Q==
X-Gm-Message-State: AOAM532YqF+UTfBmQ1AjUjV2D7ouzrmC7i9SV3CfuBUNh+L2L4EGB6Iy
 4p+Q7cuxx3BoaErP3Or/cb158EwGF7jNAA==
X-Google-Smtp-Source: ABdhPJzB3bzzPdh3unRJe7WV3GgaWLr347uqWhPZ/xozk5wuUfjqtynJ3rrfIF08fLs806dnmnXynQ==
X-Received: by 2002:a17:902:a5c9:b029:f7:9f7e:aa2f with SMTP id
 t9-20020a170902a5c9b02900f79f7eaa2fmr9389733plq.54.1624110139324; 
 Sat, 19 Jun 2021 06:42:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y20sm12331511pfb.207.2021.06.19.06.42.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 06:42:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] tcg: Restart when exhausting the stack frame
Date: Sat, 19 Jun 2021 06:42:16 -0700
Message-Id: <20210619134216.590423-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619134216.590423-1-richard.henderson@linaro.org>
References: <20210619134216.590423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assume that we'll have fewer temps allocated after
restarting with a fewer number of instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 47cc66f159..fec922fa9e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3039,7 +3039,11 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 
     assert(align <= TCG_TARGET_STACK_ALIGN);
     off = ROUND_UP(s->current_frame_offset, align);
-    assert(off + size <= s->frame_end);
+
+    /* If we've exhausted the stack frame, restart with a smaller TB. */
+    if (off + size > s->frame_end) {
+        tcg_raise_tb_overflow(s);
+    }
     s->current_frame_offset = off + size;
 
     ts->mem_offset = off;
-- 
2.25.1


