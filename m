Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F72B4AC4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:21:58 +0100 (CET)
Received: from localhost ([::1]:57942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehGP-0003sX-37
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3e-0008T8-5c
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:46 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3a-0007q3-74
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:45 -0500
Received: by mail-wr1-x442.google.com with SMTP id r17so19295139wrw.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ndVG3Ur/YVssArwv222lKAY0FdZzdrlIXHioNrSqs3Q=;
 b=iJB9gGn2i4gB7DNDRGs9+1HkmXJXvC7IipL/5wAyfqNYX3Ig0DxUiriQv//NWw0Tgz
 IevpZjYLiMVElxkkkb8KezbqVaZa/zMtJvD6TPRg7GJ0co1mt1SzTEDHuzDPlkbYMnf1
 hKiivlnEIwzmChT7KNtInscSHKNXGF0EA9Zew79NyOzZI/hS3tdArgybeP6VO2eDfPmb
 u87+0MkNVV/8AGYa+SMV6BPi2hWMbQjwXqrgNNV00KrdfZWngHp6VsaeFrJXoyGI+Wg0
 7Q3r6a2IGBCjRAMsCoRFg0FroPf3o/tsJZdQ567wdxetcBEt9SC660rG705EkatMGm/R
 ybiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ndVG3Ur/YVssArwv222lKAY0FdZzdrlIXHioNrSqs3Q=;
 b=eK7mBCunY6mJhfF6pR2b8KLwDgdYVX14jtqt8/0x7+Lt5Rvl2ZDI0WsMMChjjUyrIF
 PuknHoXd/SLJ272TYNvuJmQSIpZX/fotBGrE+1qOf0gQ1ec91DTvntmDbLzMY1+3lwOW
 86xNqbR+pub4usya8+9cwGs7DzP/BbzRwr3r4s8pLooQ4KAZ8FMe9VxABtgjouCVDzjR
 XQQJmLG2CTQzWqhS3O1aaxViMvtmU86dEfKAvCm4UGptRDjBow2jDXn9QmLAsSf2WYHC
 krr4iWcyZph9cT/uMfUgiF1daHD6V+2BNHFQ6VN4zQFPr9LqRktxd0iPep8rG8KAcHW1
 ce8A==
X-Gm-Message-State: AOAM531QDMmcxU7V68NgpE/JaG7Bn3YTn/6HqaTPdJ0O/MqrBIA3ZUOu
 ABqc8j6jK3EaVAWq4WAWSydEFw==
X-Google-Smtp-Source: ABdhPJwcPDXqAuG991Zsn2W1zVHgoXzT+f38/iTAh4+D8arH1/DEs6YGk94fFZSTYfO93limTxCu+A==
X-Received: by 2002:adf:dccd:: with SMTP id x13mr21348550wrm.394.1605542920918; 
 Mon, 16 Nov 2020 08:08:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/15] target/arm: Enforce M-profile VMRS/VMSR register
 restrictions
Date: Mon, 16 Nov 2020 16:08:22 +0000
Message-Id: <20201116160831.31000-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
---
 target/arm/translate-vfp.c.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index daf39306d04..aee60ff98b3 100644
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


