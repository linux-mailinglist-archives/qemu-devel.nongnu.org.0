Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9F22B9D4D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:02:35 +0100 (CET)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfs0g-0006d2-5l
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruo-0000eP-5E
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:30 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrum-00049C-CB
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:29 -0500
Received: by mail-wr1-x443.google.com with SMTP id c17so7955075wrc.11
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8+XlTYUesFmn7xGnqY89ywEYlA7oUC0DSrJvhHCe1y4=;
 b=ATAp569PDfzF+YrpxcB6+d0W5+Qs7SQLOV01UCKfalb3Wk2I0l6p4oezdQMcz12Nmw
 aku+dW0JakM0KX/QrjWx8sTSFyejhwA8QQrbmHHGAslL6X8r8b3QsP0vShhiRhtNGEXK
 NIJ0aeDl9cin3F+/ywHunUKKMUXC4gKMtOtaJvE1poz3fiYihfhGwZ7acp++0AnrDVV6
 xEJYCSYPGwAjVSrVTcNdTKffqHU1TRgim5aEfvAx8J5ahb0JFGe4Dre5FnZLhymrhUvm
 QeAUvXt3oMOE1VMnvPy15jn0511OS9Hcm7fXp3I3+CxJIkd5pUUZcmf5Hz8lqXwjjmNL
 zJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+XlTYUesFmn7xGnqY89ywEYlA7oUC0DSrJvhHCe1y4=;
 b=PJBIqQuJlqAOTbGiU+rFcNE0b6/pBam8vEdQ5UHcPaYuXKejj1mTHD3deeyzXKA7kv
 D7sBjdPsUnmURoeghcqZ3jpO6kcyqp7woQcxbk/wgHN2supS7FofBvC26SNIbDxQ2YJI
 Ki79fY7QnhfWdFI/X6dCBALyx9J2/6yBsT9LFkF735J8G5Sudf8jsuI2BD5/b5COIPvR
 hMLu5X+pVvfkRbs/msbzPEf176+vSrOIygmz9CdGoUueRA5mI9FBGnHTQQs8NWukxc+1
 gZ9e3yXWL4Z1Awoc2IMab6mOplKPJeOLiaPrh50wXxLrBzG2i4W4iWUfWlxV7eLhRGw2
 DV4A==
X-Gm-Message-State: AOAM531256cNwuhmfq5b7qCRgc6s7+MIyuM6F4SCsY3FI3lqQW7HuunR
 gqEePxXkMHTwaAISN8ASO/G4gw==
X-Google-Smtp-Source: ABdhPJw7PLQ9P5KkIr+Ie6Bru5iOxMKzRF6VZdnhMJ34538L3QOm20eKoAwsL40dcVI80QnlxU9QsQ==
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr11931796wrv.87.1605822986900; 
 Thu, 19 Nov 2020 13:56:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/28] target/arm: Enforce M-profile VMRS/VMSR register
 restrictions
Date: Thu, 19 Nov 2020 21:55:55 +0000
Message-Id: <20201119215617.29887-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
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

For M-profile before v8.1M, the only valid register for VMSR/VMRS is
the FPSCR.  We have a comment that states this, but the actual logic
to forbid accesses for any other register value is missing, so we
would end up with A-profile style behaviour.  Add the missing check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 2a67ed0f6e2..e100182a32c 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -622,7 +622,10 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
          * Accesses to R15 are UNPREDICTABLE; we choose to undef.
          * (FPSCR -> r15 is a special case which writes to the PSR flags.)
          */
-        if (a->rt == 15 && (!a->l || a->reg != ARM_VFP_FPSCR)) {
+        if (a->reg != ARM_VFP_FPSCR) {
+            return false;
+        }
+        if (a->rt == 15 && !a->l) {
             return false;
         }
     }
-- 
2.20.1


