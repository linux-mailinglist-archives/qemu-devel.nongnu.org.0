Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17109518DE3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:07:26 +0200 (CEST)
Received: from localhost ([::1]:51680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlynt-0008Sx-20
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW7-0001Nl-G3
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:03 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW4-0003Wq-7p
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:03 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so3204444pjv.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=D4UV//9Dx1fKTWaO/CeFVHK/oLn3ZgWAg/jUv9V5umM=;
 b=W+M7sOnWKH4+sz4oIHDL1NUrIdYlxisX00NL5wkyu1dO0mGxe2R3gBQRXA7T/n4yEl
 mtdZ9gvLlurO0axgbzgE8MayT6SITdDzKoa7XoZfDJBw4qQBTUrEoC/XpBZ7HKUeW7kN
 C7/k1tOzJDDE/nXo2aL+hOzfxc0YggsvQscNaYlpifl9C9+8dnrCOM7dw/UO3XZtU+i5
 OJZF2rvyA9wHNccWgVOazhau1i1OmZsw4xlMkpHJEuRGj0vKLhtON4tF7o4zR5YBgEpv
 hxJTEvi8JQdZmAzmvkDqX9RMKwHC1mp02hp1cTylinevt3GpeM0kVY/fQriZqM7YvcOF
 OASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4UV//9Dx1fKTWaO/CeFVHK/oLn3ZgWAg/jUv9V5umM=;
 b=CPiGVyYAMnfxYqoV2GQ84sTWZmBmtFBl+HFOW4yxQmoLqTFxseEo7p1UNSravDAnZD
 hE4r1R9Z8KEw9se3E3PpHYybzSVqtB++gum4AwC9/WkmHOX/XljBby54JTLu1pLm9SpX
 Jh9sUlW+jMDJMRp6lPE6+Lx9I4a0FuTs8NU1qFegj3aEYFMgfYNq1NFU7e6KOkQgtB9H
 PS4BE4x4KaLbZ7/mObVyiZCHYFxJTnL8Te4rqZL27enI4Db/8NJOoogESmjRsmx3ngw9
 X5cPuv7xCNmUbOEO03pLBjW9vzLtkOTA4SO1jBhIQlp8jmjwiC5J4V4/izB2jaNrehsT
 0l9w==
X-Gm-Message-State: AOAM530/HQ5EECmukAWem8i6N2ebdnXkBfFzJaJZtYFXDJAGrbvROJkg
 l7awsyyrR/AoetR8TYGcfFpqJ99kZGl71g==
X-Google-Smtp-Source: ABdhPJyoieOGJZ6YhbDJuwG61sBisWYt6bkCHvlmbYsiJM0t6wmx1w0xzzfOUS98QwXTDAsDLm5dVQ==
X-Received: by 2002:a17:902:eb85:b0:15e:bf29:bd9f with SMTP id
 q5-20020a170902eb8500b0015ebf29bd9fmr2104357plg.135.1651607335759; 
 Tue, 03 May 2022 12:48:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/74] semihosting: Adjust error checking in common_semi_cb
Date: Tue,  3 May 2022 12:47:39 -0700
Message-Id: <20220503194843.1379101-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The err parameter is non-zero if and only if an error occured.
Use this instead of ret == -1 for determining if we need to
update the saved errno.

This fixes the errno setting of SYS_ISTTY, which returns 0 on
error, not -1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7030dfd587..18664b1c47 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -276,7 +276,7 @@ static target_ulong common_semi_syscall_len;
 
 static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    if (ret == (target_ulong)-1) {
+    if (err) {
 #ifdef CONFIG_USER_ONLY
         TaskState *ts = cs->opaque;
         ts->swi_errno = err;
-- 
2.34.1


