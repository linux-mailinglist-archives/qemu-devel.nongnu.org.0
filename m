Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51DC332C0B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:30:01 +0100 (CET)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfFA-0006AH-MO
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefa-0004ka-9U
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:14 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:39223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefY-0001Dz-IK
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:13 -0500
Received: by mail-oi1-x235.google.com with SMTP id z126so15418314oiz.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JqBHCmuWPtc8j+9KLqwTqisgKUnIBVTxV3C6VerPLaI=;
 b=yOofloXz+lpOjmIomS/aMNxj/RYT7/R3cuyg9Rg9caoUaqo2rCaI0fSjoqkf3xAdTu
 wIUG92C24jdCTJB8WlgiwSaSTqJYFNGmoXvUVwQp+4d9GldrKbmNLheEurgGwF806xSQ
 wcuNxRYolka6+j4hsIeQChszknwZj4IoDT7x6r2ulOqVnmWgXaSsgoMteTuaFHja0NRH
 bRgYs9hHyddIIadjnwBbY8siYzpnkK/rdvRenOBWCbf06L9ZlhPgl6DQUh9cXXbWcfLc
 EcgJRfTngoyceoSLQyLiI1yYZIbM95ZsZ1ksCCqRLA/yZ0VIuNSlLBz6BH1WI/YbhbBQ
 DJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JqBHCmuWPtc8j+9KLqwTqisgKUnIBVTxV3C6VerPLaI=;
 b=bXrNnsI/x9/R2s14qjjne/JZ9LHuWQpiOqrAjgSX48CQbwyw/gXT65SqcIBh0h/dmK
 DgODjciCn57LKE+t65wXRx5lxmQKYkc7jyQ7fVTLmTKCpiNF8GaE8F0T19K6+4AFuQlN
 RD0pS+6q68UzM0A4slu8xhiBhVdo5AGUL2T1XcTMB/RrHgnPPQnqhgTfi7samkv2VFD/
 uSUAKXedQ0tXU+sFlaxvSzdawgtas67HWSGk68Ays9Bfh6ML4Y0+BAJrQoOWIiarkLvA
 eBdoUZsLPV/tcChOpclTmHprUabSmvjkl42Y/tqBSl35ltPUgbYPsTSGBIqAW4ZlbWqF
 ITsg==
X-Gm-Message-State: AOAM5317csuevMU1US3Mf/0QYPIiH3S1XmZstbffDn/QkZCamjavGyoc
 rcK8C9G4R139CrSWHKuYVcDt9qrqo41NdYmx
X-Google-Smtp-Source: ABdhPJzNIaIDIlHoHxOaQRRJekM6GLSz/zXEUp5GEvqRyanArl6dwZWgiKWVMiRQsYmgf6CEm6LlEA==
X-Received: by 2002:a05:6808:128f:: with SMTP id
 a15mr3340981oiw.143.1615305191423; 
 Tue, 09 Mar 2021 07:53:11 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:53:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/8] target/arm: Fix sve_punpk_p vs odd vector lengths
Date: Tue,  9 Mar 2021 07:53:00 -0800
Message-Id: <20210309155305.11301-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrote too much with punpk1 with vl % 512 != 0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2fb4b2c1ea..981895a17c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2105,11 +2105,11 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
             high = oprsz >> 1;
         }
 
-        if ((high & 3) == 0) {
+        if ((oprsz & 7) == 0) {
             uint32_t *n = vn;
             high >>= 2;
 
-            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+            for (i = 0; i < oprsz / 8; i++) {
                 uint64_t nn = n[H4(high + i)];
                 d[i] = expand_bits(nn, 0);
             }
-- 
2.25.1


