Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BA64000F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:55:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymr-0002lT-Rn; Fri, 02 Dec 2022 00:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymp-0002km-Nk
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:35 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymo-0003R9-94
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:35 -0500
Received: by mail-pf1-x433.google.com with SMTP id c7so575054pfc.12
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tSbRzCjHlrSQSoghRByzLuEHEpXHbvdfoP5b3KIKF+c=;
 b=AZgc4YPLwKTBY6oJV8Jyyxn4E4qhKGa2KXk1eBOvbb9/Y3DYho8wonQFsT/BMc2Gzi
 euv9ZG6ETAQAmvaOecbC1HtkF34dm2YW11QQCjHRJa43WV33N+djK29Q0UEck7JrLdih
 JcCt5ZqhJN64ZKSUr0ffXxTOoS/wqMSJF8NIAR6T4+FeXEYWK2swjOFclG4VkntgIFSR
 XZ9ntOi/An05EOQZ4501khhKLn3HOMzogG+2ICBTzmWCjcpxqqSCBAZbHX4b0DudNEti
 I/vOpLubkGIzoktR4xDGLLZvhFTTG5yxJF3+LLCa+muc/29ikWa+xrRjnJIdAlxXPbV+
 OO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSbRzCjHlrSQSoghRByzLuEHEpXHbvdfoP5b3KIKF+c=;
 b=I+RgR28lSJGtsydUi0vz17KVhIQz5SfrWSX0lZlMLuHllWib1ATQeAT3YspxV+Vi2+
 cCa+xIJ5rdVVKKgWV5sck+k+Z1U2gzATOQTCg5/cQkE8UXU/aHXeMvNZuRC52MiI7DHa
 toGFkPsy37mR5tGG6OlxgQXeMbYc18Ng4AV/oQPIpUuf1ZY/QNwG3wA0y4vnYY2BzXDS
 Hha6ScCfhL91LnysP1E4fgjSoveoJB2C4TEoKx0/26djoLn1FNXRKTJrfCvDIjf+to1D
 I9BpmxN7fjRiqSgEKsZZphXD4HPUksvk5VfAisNHcyBHExYLFQhzMPX4+dal29njMy64
 nd9g==
X-Gm-Message-State: ANoB5pmr3mtYhKZ6GlQ8DJZrmMiGY87PLAsjw2noMZlobghy2vsFR4XA
 mLwhAo3YEhOLE0kvvQTOXRT5VQ8UPbCEaqJN
X-Google-Smtp-Source: AA0mqf5ks35VYJixns9foLKpwqlFLSJMxk5wBZHeWsX9K/8w2S9aoXJGFMKiQDmVCLQmUkaDwp594A==
X-Received: by 2002:a63:1055:0:b0:46e:f011:9548 with SMTP id
 21-20020a631055000000b0046ef0119548mr43433547pgq.553.1669959632944; 
 Thu, 01 Dec 2022 21:40:32 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 33/34] tcg/aarch64: Merge tcg_out_callr into tcg_out_call
Date: Thu,  1 Dec 2022 21:39:57 -0800
Message-Id: <20221202053958.223890-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

There is only one use, and BLR is perhaps even more
self-documentary than CALLR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 344b63e20f..1af879e6f5 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1336,11 +1336,6 @@ static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
-static inline void tcg_out_callr(TCGContext *s, TCGReg reg)
-{
-    tcg_out_insn(s, 3207, BLR, reg);
-}
-
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
@@ -1348,7 +1343,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
         tcg_out_insn(s, 3206, BL, offset);
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_callr(s, TCG_REG_TMP);
+        tcg_out_insn(s, 3207, BLR, TCG_REG_TMP);
     }
 }
 
-- 
2.34.1


