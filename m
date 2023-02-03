Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2BB689B9E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4l-0006ua-FF; Fri, 03 Feb 2023 09:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Y-0006hk-M4
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:52 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Q-00055s-LH
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:47 -0500
Received: by mail-wm1-x32a.google.com with SMTP id bg26so4031501wmb.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YcRN5KzcgPE4Jkd8YcnXRx6q8ttqJHp+NRxt/dZGyyI=;
 b=AbmdDGlk4qmqgcQbJscQpMSnhttNdRoip+D2y16lovjDZPzYFzkPqAtdvXMuR6QmI2
 CCsUHkB8drSsH/wm47WKZ5UmQRPDWxqIes9tS53ZGCoqi3RJp6EiRAz42FRlFD0pM9Mr
 tt4gOlXwc6yfAGETWXtxjUWawk1rjpB9iaM7DDySdEgwhflZU+oVBfPE3Tjeny96EFuP
 +0ZWH0ZsdHd5XQm4EGqTe+IF/J0/eC+4axy+s9mUPkquTeTiczgk7F9Mmy90vY6TbFPr
 9IQO2hmJlRTwlfD95vajkJJGS6pHBfbnnxVzRyQ0jVeXSxrYTdXw28utlWJamdDyNIvX
 Ek1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YcRN5KzcgPE4Jkd8YcnXRx6q8ttqJHp+NRxt/dZGyyI=;
 b=oXWnyxlrHqZm36A3+CqyiKzRh/SeK0ZpugqOQPtf1xRSGvUebXsnuNPplfLrb1yX6k
 yT8GwbeWPNHFNJlyaVWwwbsZ7IdqqjITFSkoURfPdte1NTu6F4qKnwpkNXqWl9Z1GyAY
 BliOdZhJ/8EwBAgqYEZoJb0zFOwr8b7+WKABR9IboOKk5QkmP7bEHOsp9c1LunKq54fe
 R9L1ZFR8fAx5fM34ExSVYoueO+mElp5hlxmTkqDhO/9YcpDHYVI/lj3ExzbsP/wdTJdW
 xZKNfbiM9PPSKtfa+bdsOw12AgT/f0qDCv6/rMojE04ztr7Clo2s9rDfHot7LEXspHAw
 kSOQ==
X-Gm-Message-State: AO0yUKVpSRiz2yS+sKKlpUtaaAxpjs2Z9UCj7O+Guy418+1boGqNViZt
 QdNOSvk+HPXr5oYp8tz2qUhwakd2xybLPWIO
X-Google-Smtp-Source: AK7set8PEXYQMtNd2hSFgwZGWppNtm5XooC8mntXQDuDVCYGQFwVFlYsdzJOiflq1QcQGH8Q0bK0/g==
X-Received: by 2002:a05:600c:4ec7:b0:3dc:5e0d:4ce7 with SMTP id
 g7-20020a05600c4ec700b003dc5e0d4ce7mr9786650wmq.11.1675434579209; 
 Fri, 03 Feb 2023 06:29:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/33] target/arm: Correct syndrome for ATS12NSO* at Secure EL1
Date: Fri,  3 Feb 2023 14:29:06 +0000
Message-Id: <20230203142927.834793-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

The AArch32 ATS12NSO* address translation operations are supposed to
trap to either EL2 or EL3 if they're executed at Secure EL1 (which
can only happen if EL3 is AArch64).  We implement this, but we got
the syndrome value wrong: like other traps to EL2 or EL3 on an
AArch32 cpreg access, they should report the 0x3 syndrome, not the
0x0 'uncategorized' syndrome.  This is clear in the access pseudocode
for these instructions.

Fix the syndrome value for these operations by correcting the
returned value from the ats_access() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-3-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-3-peter.maydell@linaro.org
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ccb7d1e1712..6f6772d8e04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3284,9 +3284,9 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
         if (arm_current_el(env) == 1) {
             if (arm_is_secure_below_el3(env)) {
                 if (env->cp15.scr_el3 & SCR_EEL2) {
-                    return CP_ACCESS_TRAP_UNCATEGORIZED_EL2;
+                    return CP_ACCESS_TRAP_EL2;
                 }
-                return CP_ACCESS_TRAP_UNCATEGORIZED_EL3;
+                return CP_ACCESS_TRAP_EL3;
             }
             return CP_ACCESS_TRAP_UNCATEGORIZED;
         }
-- 
2.34.1


