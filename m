Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B048A034
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:32:45 +0100 (CET)
Received: from localhost ([::1]:35486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70PM-0002bP-Pl
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:32:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n70BD-0007qG-SJ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:18:09 -0500
Received: from [2a00:1450:4864:20::436] (port=38410
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n70BA-00051H-Cx
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:18:06 -0500
Received: by mail-wr1-x436.google.com with SMTP id a5so24746448wrh.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 11:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NwOJ7W0q/pYFOyZh1Xbq8WoDYGV9gt57w84iz0l5T8M=;
 b=tsZNJsLOYWgdFLn7SyYrKzdpPdPdKNZWKl7eU4aE/NPUH0TtdSc/2qkhqS31L5tZgl
 sal+dahdFcT61wkuZr3OgI7E0HQWMA/07a7kQKsbycoehgTMQNLSXgfur4c9rqd0q3a3
 xZWn8vVJohVDeL1vDnPugJbX2wlmBxYxwpu//zzeAd3ZvC6lbEZ7oZGzgbRLQB2YW3Vj
 JLSL8LIV3WI3h9WmyBdUL5gEP/7xUZicHwlRr9npTW3y68aa6Zl2B0OJOwNeYLVv+aj3
 xsvzPi6CEUASGv2Vo5PS6x+6OruOO8gFKse753Y/xTZcmLBGFivAZCZARswHUrg0wvcV
 VF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NwOJ7W0q/pYFOyZh1Xbq8WoDYGV9gt57w84iz0l5T8M=;
 b=Q/YnlYfM18LonedOsV3X1bBTndgYiaDVFo7vPvqd41/AsoQVmWxpaZyp/5eKAqzS0N
 CyMDAcFofPAYkoIwhjA0ANnt6LLlmmip/4I7enhR1Yna+j1GA+9/zJwaKCUKjVguosit
 t9QwsXRWu9wJw/yh23ekwEU8NN0UhUaMJIQ2ytQwf70naQkepcf2J4tuNZEpnpVtwWrU
 fohYP7mDDcADMplLMXUs5SSVTWfiEZMbQ5EbV4a+o4No3DpSJxZ4Z1kS2llWwRxXP05U
 a/frpU7AK8RMOzIFTPGNSqnKWDwzvA/dVt6AKotgFYQ7xX8CO3OfP8jODn9lW9Ro/k7i
 mUBg==
X-Gm-Message-State: AOAM532p1ahDN7nxEl647fXhVNTqwfKB3624d20LNZGNomLxn+4EfRvm
 ICrOTtjiiTIk2BRNYD3qw2z09FTBmjsMIg==
X-Google-Smtp-Source: ABdhPJyAOOzdPpDXnqMpSqInP2ZmbspdndWwNEzG/NyjghBNzWovVROqT4ILXeod5b8k1k+bTq/vaQ==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr869737wru.250.1641842272947;
 Mon, 10 Jan 2022 11:17:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7427847wmq.19.2022.01.10.11.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 11:17:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Fix clang warning for nios2-linux-user code
Date: Mon, 10 Jan 2022 19:17:51 +0000
Message-Id: <20220110191751.3335516-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The clang in Ubuntu 18.04 (10.0.0-4ubuntu1) produces a warning
on the code added in commit f5ef0e518d03 where we use a
shifted expression in a boolean context:

../../linux-user/elfload.c:2423:16: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
    } else if (LO_COMMPAGE) {
               ^
../../linux-user/elfload.c:1102:22: note: expanded from macro 'LO_COMMPAGE'
#define LO_COMMPAGE  TARGET_PAGE_SIZE
                     ^
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/exec/cpu-all.h:231:31: note: expanded from macro 'TARGET_PAGE_SIZE'
#define TARGET_PAGE_SIZE   (1 << TARGET_PAGE_BITS)
                              ^
1 error generated.

The warning is bogus because whether LO_COMMPAGE is zero or not
depends on compile-time ifdefs; shut the compiler up by adding
an explicit comparison to zero.

Fixes: f5ef0e518d0331 ("linux-user/nios2: Map a real kuser page")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'm probably going to apply this directly once it's reviewed, because
it fixes a build-break on one of my machines.

 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 329b2375ef1..2993b01e60c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2420,7 +2420,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         } else {
             offset = -(HI_COMMPAGE & -align);
         }
-    } else if (LO_COMMPAGE) {
+    } else if (LO_COMMPAGE == 0) {
         loaddr = MIN(loaddr, LO_COMMPAGE & -align);
     }
 
-- 
2.25.1


