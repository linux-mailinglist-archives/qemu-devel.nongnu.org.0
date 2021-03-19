Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54DB3421D6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 17:26:52 +0100 (CET)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNHxb-0001KO-EK
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 12:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNHvr-0008Rc-BL
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 12:25:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNHvp-0006mH-Mt
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 12:25:03 -0400
Received: by mail-wr1-x436.google.com with SMTP id x13so9705585wrs.9
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 09:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=46+rU9C+OSw0mSDlPfwgjj1CCS1S9rOiTtSewLKL/ZM=;
 b=eqapNkgbCn36px2JZ2GbkTgpvKeQdkOabjjIggZyZlyeKbr+wGovELetJQ8B2C/Uea
 +bswXpAZ+5iJbZhV5f2NZOIpVWYUkDGw1OITLsuYvbnBZz1c5sR4t5Faca1ELvLIFvpy
 aicgZNVe63LuUeVu3H2CY65DkZhXwxcZbsOxznIYeMmEsq+YvvlDtOrFn2jiJC57R6Q9
 /GQd2QbolCGdwPgVo5iDB7/eQ70TYOskNcDtMV+twbbWocS/jG2OWIjySd4AVyQbmOno
 aQkCY3MkCG1nckY0ot1H36kkgmQL4EvnKjEp6S5upflOtJrBtMT2XZri7iguo4DQHplp
 RNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=46+rU9C+OSw0mSDlPfwgjj1CCS1S9rOiTtSewLKL/ZM=;
 b=IX6V40cfYg8rvtiHDjZjIIjm5k/QYHgYHtLl1XhvVHsQzw8bRcBeS2O/ce0ngm7zcX
 d0sfWu7TgFY1RjBQOTNdaxutDxOPiDxMDEUeGHLedrh50/QVjrQ6wa9VJoN5FQItsTA/
 LtpyZ5SdyP+yH0zVR53LAWdeh2teTQoF+ePtkQ2r4i3yq0Ut4G9zlSAN88xA6xhMM9A9
 k0xkRVB5A0Dp2q0dnpGfel+D5kAJF8cT30SztH6WWnnDy5jaoX2l9av6S6X1U206vNPF
 X1fA3Z/LNnnSNuYf+xnSCXoXHFnrlc9EpXHDUWu+/HfowMkAHu964UR43htXbUHBrMz1
 iCIA==
X-Gm-Message-State: AOAM533qUc/tgdqVZKS3nH+2/XzG0hDEdscuJ7KciIZBtjQ5fr7hhjtE
 GeChcQsCibAqJ2pfQfGbvFd32Kvimip4BKF1
X-Google-Smtp-Source: ABdhPJzKoKAr9NtZ4V26TLx+aeonkKi3Rr+RmATstK+fnRd7KsdA4dOZOJjzrQfhm/GRJr+B6IQC4Q==
X-Received: by 2002:a5d:404f:: with SMTP id w15mr5630913wrp.106.1616171100029; 
 Fri, 19 Mar 2021 09:25:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x13sm8354461wrt.75.2021.03.19.09.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 09:24:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0] hw/timer/renesas_tmr: Add default-case asserts in
 read_tcnt()
Date: Fri, 19 Mar 2021 16:24:58 +0000
Message-Id: <20210319162458.13760-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 81b3ddaf8772ec we fixed a use of uninitialized data
in read_tcnt(). However this change wasn't enough to placate
Coverity, which is not smart enough to see that if we read a
2 bit field and then handle cases 0, 1, 2 and 3 then there cannot
be a flow of execution through the switch default. Add explicit
default cases which assert that they can't be reached, which
should help silence Coverity.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/renesas_tmr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
index eed39917fec..d96002e1ee6 100644
--- a/hw/timer/renesas_tmr.c
+++ b/hw/timer/renesas_tmr.c
@@ -146,6 +146,8 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
         case CSS_CASCADING:
             tcnt[1] = tmr->tcnt[1];
             break;
+        default:
+            g_assert_not_reached();
         }
         switch (FIELD_EX8(tmr->tccr[0], TCCR, CSS)) {
         case CSS_INTERNAL:
@@ -159,6 +161,8 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
         case CSS_EXTERNAL: /* QEMU doesn't implement this */
             tcnt[0] = tmr->tcnt[0];
             break;
+        default:
+            g_assert_not_reached();
         }
     } else {
         tcnt[0] = tmr->tcnt[0];
-- 
2.20.1


