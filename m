Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64D73F75B3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:15:14 +0200 (CEST)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIskL-0004jR-My
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYH-0006Pq-U4
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYF-0002ML-Vk
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id u16so36347915wrn.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nJNwio1dTQ0gx5yIvceymVX906UiKSNU6ZWoSzTuBw8=;
 b=cLomBZIFn3hzAwKApJb8v8/Y8LYCElslcvhMW63GiyP5yqpBSijzCHYSiTejdTGIXl
 1pooMWlHGLu5L4ifRkdYhxiaCoG4aiBHFvHDOQfarTHLqWo3lNGIpzdFxTvRfb7Vy6mM
 QsSdVHV/KR2ZGgvGOGKaCKiyv2fn6TbyfSUwqE5cfB4WqekXY1VMHN+d+D6/y2VA/F0b
 tNePd1Rwsul8s9xmzMmHUmzBN6hSLk2cDQ1B0Z4tRmDfT1GISNjrxjaUfCWgFrwCRL64
 JbtDDUaMUIcC6sneSsi0Frg4mUHbaVF6966rFPlbfPEIPdawZGC+jg9yVUd7yBD0RXIZ
 sirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nJNwio1dTQ0gx5yIvceymVX906UiKSNU6ZWoSzTuBw8=;
 b=CviMfKFzik3iSO4pZe5lYYGjLnlAFE5vBjfgylQcXdarBZxZyzP1MVY4nnfy3bxJUQ
 b1EljnG/g3TBZ5/mzGpmHPpQjFyccGv6qqt0ENxleRKns1p3Gfd2+Lu4Jhcjl4dcdLUM
 QaTpWMKAMjDfFffxAX+vjNuxiDb8Q+5mtGYwrDcgQ5TKNOLsq9PavOS+0KaeSoT4jnbz
 z1KMSXBMqxyljvkFqyYn2tx6gP8XbZXKPDncnzzSmeW9c7lUXg2kdgLmCyLAg7c9hpQg
 ZoT/RLVufuzPVEeqNJWKVBVY+Q1t9jrjDE79bYqE114sZsEUZV+IlbxHPjgVzQOZIYZz
 /PUA==
X-Gm-Message-State: AOAM532HcYO4O5/IQIb43e07WFrY0CZU1u6aVDuPA28T5kAEtB+Ha/GW
 kTmwpWs3V5+mEITb7n6fuqVor7fKLoE=
X-Google-Smtp-Source: ABdhPJyL9OeKnUBfFxhHngJaq2cbyCgZwWvCeIgp10dhBzmLzy7oAhdptAzO/d/LyUtu9Ej1YSw9XA==
X-Received: by 2002:a5d:508e:: with SMTP id a14mr25189425wrt.306.1629896562294; 
 Wed, 25 Aug 2021 06:02:42 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z6sm5252946wmp.1.2021.08.25.06.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:02:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/28] target/mips: Introduce generic TRANS() macro for
 decodetree helpers
Date: Wed, 25 Aug 2021 15:01:49 +0200
Message-Id: <20210825130211.1542338-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Plain copy/paste of the TRANS() macro introduced in the PPC
commit f2aabda8ac9 ("target/ppc: Move D/DS/X-form integer
loads to decodetree") to the MIPS target.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210808173018.90960-2-f4bug@amsat.org>
---
 target/mips/tcg/translate.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index c25fad597d5..791e3e2c7e8 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -202,4 +202,12 @@ bool decode_ext_txx9(DisasContext *ctx, uint32_t insn);
 bool decode_ext_tx79(DisasContext *ctx, uint32_t insn);
 #endif
 
+/*
+ * Helpers for implementing sets of trans_* functions.
+ * Defer the implementation of NAME to FUNC, with optional extra arguments.
+ */
+#define TRANS(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { return FUNC(ctx, a, __VA_ARGS__); }
+
 #endif
-- 
2.31.1


