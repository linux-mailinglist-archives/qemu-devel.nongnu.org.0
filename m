Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B316818F4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:26:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqB-0000zF-Bm; Mon, 30 Jan 2023 13:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq5-0000yQ-V7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:09 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq2-0008CF-P2
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:09 -0500
Received: by mail-wr1-x434.google.com with SMTP id bk16so11966584wrb.11
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=go2SaPky1rTKNTTKbI6nYsdnpD4UmWB7Rewm+CymwZw=;
 b=HUeOK2D8a+YDbPcs7aL9SrhKNW6aBBLCjAfi5vJ95AxrVm8jto0l5UObpAnxyyO09c
 4YxLKnlh/TT6/lcsfI0malZw3y2rMEEyO9DGjkyoyYFmnwEK3/GWj1bNgS0FHzAVzDSh
 AeSPxhAtQ5LE/xyB7iqO529sSfAzkYO30RveWlwD298ImITUvfUQJ25EXkdZRWNMUlha
 DsRdNscrhGzeODuZXfl51toBd6E18M0OhGKMrqMWbk/jbtrHFPOCB+1HIvaZDAYGVlfq
 LbW2SHii/tIYVdxdPlfLK4o52q5z8u5YANj9qkscGKHzT2lo2Y4Tg+iw/9g+Ml8LRXfW
 XMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=go2SaPky1rTKNTTKbI6nYsdnpD4UmWB7Rewm+CymwZw=;
 b=7HeOk1kuWZtI1caN4+3zwoL89+4qO/cdzScHy0L9ue3/wYmfC3X9DXUPNodbjvO1ke
 RQYvnyoaHoRb7liwH5WOsanAzTwgmERpnTbmpTTj5zmD4JL0/Rh82MzpnKWjWF8RHleQ
 esY1tQW8M3OHZpUJijsDs3q3IdN56AgHOESIBhFsKZwToWXGvP2yeei1Om88dsk59Qha
 3iDkOC+4r9pmwO/Pkfz89FSfMBKtyhm01nTomDznNfJcGxrNM0zgcoEB+tebees3fJ21
 VNL61ckEa2HnUrszsA8FeIBETl6AbAP1wVsEJ2sZWTEVkFZKOgu9CKUDz59pHYOPxrVz
 WtYA==
X-Gm-Message-State: AO0yUKVtDqouvkEWr7dZkREC1GM1uRqo/0wCI/hC2gJ5pQJFIboVKBrG
 DvdRQcscIZXLGzO35zhQZCvaJA==
X-Google-Smtp-Source: AK7set8k++mqi582J9+/79n+4+Cg9mqX6AQlR3UzZ1alGr8AnLzM+cOjicJ/wMDhp2Mow/dvhiPdpg==
X-Received: by 2002:a5d:4578:0:b0:2bf:c725:85 with SMTP id
 a24-20020a5d4578000000b002bfc7250085mr14591485wrc.12.1675103102487; 
 Mon, 30 Jan 2023 10:25:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs
 correctly
Date: Mon, 30 Jan 2023 18:24:37 +0000
Message-Id: <20230130182459.3309057-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

The encodings 0,0,C7,C9,0 and 0,0,C7,C9,1 are AT SP1E1RP and AT
S1E1WP, but our ARMCPRegInfo definitions for them incorrectly name
them AT S1E1R and AT S1E1W (which are entirely different
instructions).  Fix the names.

(This has no guest-visible effect as the names are for debug purposes
only.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-2-peter.maydell@linaro.org
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf17..ccb7d1e1712 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7734,11 +7734,11 @@ static const ARMCPRegInfo vhe_reginfo[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const ARMCPRegInfo ats1e1_reginfo[] = {
-    { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1RP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-    { .name = "AT_S1E1W", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1WP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-- 
2.34.1


