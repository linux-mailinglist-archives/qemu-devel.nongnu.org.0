Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD97579A5D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:13:54 +0200 (CEST)
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDm6r-0000eO-4m
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4M-0004vJ-UC
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4L-0001lY-9h
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:18 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso9045104wms.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DiqGOB6lF2zKW4pGoquTd/9NIZHL+wdvtiLXsg7395o=;
 b=mijQYTc8UzHhSn7IsCAn9Y8Z8Q3RFZrRUyrsI9DgpW5vSVji+OldmMN552K76n8fAY
 qDGy7/VlZkQkwyO3DdnG7Z2nljfAj9FOiKXqU7tSoFNBYLeOs2wgkUdhJQsQa7uvv9Ml
 m+69wv+UVg/+sIxNhrsm4l4XF11eKsPb+keRQIDgjBzrJdzzY/WxfEj3wi+ANHwTd4+b
 mvVx16tps7VkOZW36xQwFC5JKNSzEgRtrLE/78CoUmCt50P8S+ZiVZmvBFCCHxOaiIeM
 MygEVLeNR+nQCD+k57Flq39r+xCVlN4Ftx0242UUcS+mCUBScKAEa42k2S3A0x2WoYnZ
 XLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DiqGOB6lF2zKW4pGoquTd/9NIZHL+wdvtiLXsg7395o=;
 b=OUkAGnVBtc9eNJG4ERBzCdg/tFVyipKQSoutbAZTLGrjdDgKD6WpUfgJ2/8R45pTNs
 9Bd6HIrJraM6kneAF5fuqSmQvE0I3rbVLvQWuGUzJblxL801N0aQ1scHUB7dqERCm312
 K1V21FkXOsDBnx4LjG2mWoJHsw+Y/9KxnI6YM1grznfgC2GH/TuziYAPdRCEmRpY9YcU
 zaVqXcaKKdb6YMrqmzwxRsHAYwhEozx46ycQhIzpNjzPCxOH3yxuudIiXMdK+duqL0uQ
 ga+oEdjjHeNMisEzoXuoIb+0SBu8lg5GkuItXUZA/rTYOiHfL2MtwxVbwJpqoN0AuDFK
 gBFg==
X-Gm-Message-State: AJIora93zIRycX2c2Miw3vxW62zm/P78amMYau3tEAIXyTJYfJuJwfMe
 Mr1MVmcs+1HdJpg0ngJ40slUCQ3N8rT0xQ==
X-Google-Smtp-Source: AGRyM1s/QaR70aO8sESdkrIHdCwdZWgysJjpb2j8wMHeVFFDEd5xWXPBluemHkcY+ovelBBsT+5n3A==
X-Received: by 2002:a05:600c:1f0a:b0:3a3:15a8:a8e1 with SMTP id
 bd10-20020a05600c1f0a00b003a315a8a8e1mr13013694wmb.167.1658232675977; 
 Tue, 19 Jul 2022 05:11:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b0039c5ab7167dsm22111287wmq.48.2022.07.19.05.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 05:11:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/4] semihosting: Check for errors on SET_ARG()
Date: Tue, 19 Jul 2022 13:11:09 +0100
Message-Id: <20220719121110.225657-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719121110.225657-1-peter.maydell@linaro.org>
References: <20220719121110.225657-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The SET_ARG() macro returns an error indication; we check this in the
TARGET_SYS_GET_CMDLINE case but not when we use it in implementing
TARGET_SYS_ELAPSED.  Check for and handle the errors via the do_fault
codepath, and update the comment documenting the SET_ARG() and
GET_ARG() macros to note how they handle memory access errors.

Resolves: Coverity CID 1490287
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 semihosting/arm-compat-semi.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1a1e2a69605..d12288fc806 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -171,6 +171,12 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
  * Read the input value from the argument block; fail the semihosting
  * call if the memory read fails. Eventually we could use a generic
  * CPUState helper function here.
+ * Note that GET_ARG() handles memory access errors by jumping to
+ * do_fault, so must be used as the first thing done in handling a
+ * semihosting call, to avoid accidentally leaking allocated resources.
+ * SET_ARG(), since it unavoidably happens late, instead returns an
+ * error indication (0 on success, non-0 for error) which the caller
+ * should check.
  */
 
 #define GET_ARG(n) do {                                 \
@@ -739,10 +745,14 @@ void do_common_semihosting(CPUState *cs)
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
         if (sizeof(target_ulong) == 8) {
-            SET_ARG(0, elapsed);
+            if (SET_ARG(0, elapsed)) {
+                goto do_fault;
+            }
         } else {
-            SET_ARG(0, (uint32_t) elapsed);
-            SET_ARG(1, (uint32_t) (elapsed >> 32));
+            if (SET_ARG(0, (uint32_t) elapsed) ||
+                SET_ARG(1, (uint32_t) (elapsed >> 32))) {
+                goto do_fault;
+            }
         }
         common_semi_set_ret(cs, 0);
         break;
-- 
2.25.1


