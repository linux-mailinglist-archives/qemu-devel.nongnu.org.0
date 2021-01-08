Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88D2EF86B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:55:03 +0100 (CET)
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxqg-00045x-Pp
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxno-0002Dk-HI
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:52:04 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxnl-0004VB-Ns
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:52:03 -0500
Received: by mail-wm1-x331.google.com with SMTP id y23so9396949wmi.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2ajQPIFYRSDLifvESHkyonYhqAc+VzA8sC/bR0K24E=;
 b=fXCVOBjimAlPdAlSeFRP9cFMU7VseqwDMVJFm+XhFds8l/gZOI/L1exZbX+b1yeBI+
 9aBh53mDl7fFFF4aKbZBy1Bb9C6qz06WyXJ5cKGp6kR4Kx346hvAu0Hgc/N2AdcR8/S7
 CjPudtFf9AJDqj+7yrwYYmkqwF7CWQXYOC1pvneWwrHs+N7BX4cfWJnwarT8KbjF+g9e
 hzmYnRovnmoS7Asxq6RKQ0tLSyheIux2rqYpyxjRzt3RBZQltRyvhLZiYSZpDzVxt/xw
 W6MWEggaSCv4OJhhqnSdGy1+urEPbIVeu0LurmmUcYbXeGnIrtQKlCTWGlisWfvS9Ms/
 rwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2ajQPIFYRSDLifvESHkyonYhqAc+VzA8sC/bR0K24E=;
 b=D2OGMAox6RFdEpfrvZHSPfBvCiWWq2RUlkxMCOX1Ba1cqGdeSE/XPBoG08EpY4Iwjb
 W7oPlhE0lUeRNGBM7AD/A3Cdti/po8YiK/f6G90PFxBhZl30+a7tSs+ZjgvTnPappH7i
 3BALiT1WuNvYW+UuJnpjjdu7rDMCxWArnmrbN3c9u7Mr1D8yyLIyr2g9lScXKcd3Ur2j
 1td/Jza8AOJgb56SgJTZJ5vIPrafKj4PJ/qkKL+DLltiwkny4liyxgPE9Ce/SC0jH8Nr
 PMzoCqcciEVDgxLcLdb8rnzefQULGKkmamMahZ2zOCZ+xbYF7LxSFqolXvYzWqJtraNe
 it2Q==
X-Gm-Message-State: AOAM530lja5/e5rmOmpS6dgIVf5MPYFsAg9NY7Q5jqk6c0FW1/MPX/CS
 XDi1vWE/A+ey7NeIUlQSZ9TbjQ==
X-Google-Smtp-Source: ABdhPJy5K0u4aBsn/7/iZoeqYmW5+7ZwoP8OljIKdGWfV7sBv4lknYLEfvpt46TaG0V/B7VCv3UNUQ==
X-Received: by 2002:a1c:61c3:: with SMTP id v186mr4426243wmb.146.1610135519909; 
 Fri, 08 Jan 2021 11:51:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b127sm15338635wmc.45.2021.01.08.11.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 11:51:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Don't decode insns in the XScale/iWMMXt space as
 cp insns
Date: Fri,  8 Jan 2021 19:51:57 +0000
Message-Id: <20210108195157.32067-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: qemu-stable@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit cd8be50e58f63413c0 we converted the A32 coprocessor
insns to decodetree. This accidentally broke XScale/iWMMXt insns,
because it moved the handling of "cp insns which are handled
by looking up the cp register in the hashtable" from after the
call to the legacy disas_xscale_insn() decode to before it,
with the result that all XScale/iWMMXt insns now UNDEF.

Update valid_cp() so that it knows that on XScale cp 0 and 1
are not standard coprocessor instructions; this will cause
the decodetree trans_ functions to ignore them, so that
execution will correctly get through to the legacy decode again.

Cc: qemu-stable@nongnu.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
With this Guenter's test image now successfully boots
and shuts down again.
---
 target/arm/translate.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5acd32e76a..528b93dffa2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5282,7 +5282,14 @@ static bool valid_cp(DisasContext *s, int cp)
      * only cp14 and cp15 are valid, and other values aren't considered
      * to be in the coprocessor-instruction space at all. v8M still
      * permits coprocessors 0..7.
+     * For XScale, we must not decode the XScale cp0, cp1 space as
+     * a standard coprocessor insn, because we want to fall through to
+     * the legacy disas_xscale_insn() decoder after decodetree is done.
      */
+    if (arm_dc_feature(s, ARM_FEATURE_XSCALE) && (cp == 0 || cp == 1)) {
+        return false;
+    }
+
     if (arm_dc_feature(s, ARM_FEATURE_V8) &&
         !arm_dc_feature(s, ARM_FEATURE_M)) {
         return cp >= 14;
-- 
2.20.1


