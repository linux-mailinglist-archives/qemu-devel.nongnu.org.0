Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC145A410E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:21:23 +0200 (CEST)
Received: from localhost ([::1]:55952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUOx-0001DF-1N
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUHK-00019x-FS
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:13:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUHH-00028u-MY
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:13:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id d12so6608655plr.6
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=fVRMB7bLiJXQp6UITMYGBhpDzGrjatv+H+ijUjE6SCc=;
 b=OB2kt7f3aObLaj/8U8WElvkL55B+JOo/7H1GqnUAIGCGfIgL0HfKlupRbUmZ8jXa5K
 uLx3MlKEidkD3HvENc7Kqz1kWC6O23OgmjJGd1cU7PaBQpaqS4t2W+F6p220GsnUsZbN
 txy4Orz4/WjnCjkkGZFaES0uR2hAq0WH4y3ppZlbku2TzfEdMZcdWdE0MexQ+omMIV66
 VyiHFOevkh9PqcKLhXYHu7Yg8MRinEPmWPdnfq6MdWYDHcn5HudJLYigZ2kXwCSdQLHe
 aNW3cHFn+HgdOj0Kyxz8w3UxP+2S/BnjYYMjjPQ/+/alQ71ct3FzcjzQmoerfQhFu+sj
 NOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=fVRMB7bLiJXQp6UITMYGBhpDzGrjatv+H+ijUjE6SCc=;
 b=hus0mjYJdSx8vRPVhjjT3plDYEbUZXxvtJvRWi+WFW8uCqVXL1M7CD92/B5sJnn2oV
 JJ4KKDmrWHGtEKuQ0akUMinzIYMoJR+U/dSZ9+GXJOO8HILvYZKqyUaiP6YPWleWRSFa
 XkxOfQQAGn97SJ1eXbYzAvXhaXjIeXJSHWl1rswNjYQqUY1y5uWAG7BI1DlCAlFRabcl
 54qYbzXv4M4msN8qr1+wxCbQdQQ0F0R7rTl403lJDwE3FI6jDVO8yN9/vmOQvu8vPOrf
 d4/60Q9Pn89TiWpFtI3+EkdA9nRnej466ZAzvHfl+D3KPWGmj/gpzKG0zCj3LRQ/qRTC
 YB0A==
X-Gm-Message-State: ACgBeo1GCPmB6zvklJpR8TQmSgTQE+Mc4JOIZghPzUwv5sNKsTvgdJf9
 3zq6LPI97vOE8cG66pUdGMbAALWOSBfhww==
X-Google-Smtp-Source: AA6agR6WsfeyP7rSbXnnPiUeJkcviwcgjR1/4hRHNrX0gpECxlxRRlLBAuNadWX6w0PIA/zhRrUJgA==
X-Received: by 2002:a17:90b:3a8d:b0:1fb:1487:1cca with SMTP id
 om13-20020a17090b3a8d00b001fb14871ccamr15748268pjb.196.1661739206434; 
 Sun, 28 Aug 2022 19:13:26 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a17090a348700b001f260b1954bsm5467172pjb.13.2022.08.28.19.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:13:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, qemu-stable@nongnu.org
Subject: [PATCH] target/sh4: Fix TB_FLAG_UNALIGN
Date: Sun, 28 Aug 2022 19:13:25 -0700
Message-Id: <20220829021325.154978-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The value previously chosen overlaps GUSA_MASK.

Cc: qemu-stable@nongnu.org
Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 9f15ef913c..e79cbc59e2 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -84,7 +84,7 @@
 #define DELAY_SLOT_RTE         (1 << 2)
 
 #define TB_FLAG_PENDING_MOVCA  (1 << 3)
-#define TB_FLAG_UNALIGN        (1 << 4)
+#define TB_FLAG_UNALIGN        (1 << 13)
 
 #define GUSA_SHIFT             4
 #ifdef CONFIG_USER_ONLY
-- 
2.34.1


