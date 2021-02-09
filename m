Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06574315015
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:23:52 +0100 (CET)
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Szf-0004UU-1n
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swp-0002mJ-U6
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:20:55 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swj-0000lw-Bz
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:20:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id w4so3097428wmi.4
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQnHSU5URki5Eoi1GvfEMafAg4qrSv6IwWbelkI4His=;
 b=eekVPp/C9p6r8Vv1bvidh5JjtT5UYSt+vsgApr3nfh84RAaSvnD/6OKfx3K+tcCuCR
 riuYCYES6FN+KlUeWd83JvS/tlphQg1PkS38P3epX/v/0GBcxhHKxwfMtsiigjF6aq2+
 lbSRL4Pe8v+tiAopoakCQKbNveVHmaSx6Uj5rUXIcxIucOJyBzbFWh3adDJnHWRXHqNM
 1Up7NyRhMsMXmPewbucxS7K0Uuac2p5i1ttMOFqpqBWPTlHKI0SAvEq8iF/97cHi+h+c
 WTwWof2XitOZhCetL6ccuau3YcbooBsqPDMTmD/f6T/sbHbs+OwmNnNCHxSeXchVcOJq
 G2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQnHSU5URki5Eoi1GvfEMafAg4qrSv6IwWbelkI4His=;
 b=DYQFcntspE307xO2YsLeSmvqmOa+hvcXqvbiUCSsIsORjY7oRC8F9tLihTjGFqz31E
 eh571K1GUP7dg1PT/uDVRozVPn81AG6rbzYGyv0mDLQLPaNouCno8pPAnjpjGmceLpkg
 LUaYyNXR/iw25yijJ6D9iuaiFeukk7OV1Q3Doq+Dl9n4TdN9dw5QMl76nN7QARchGSmT
 a+41uXHyFniQ7yEQWYR4mxNysA2tGYmypSGeX0BWyRSclKNMYDMJbBbSC/4689GHST/4
 Ikpu4XdZdvupzHBrRt8p4GcLbPzDyreNc2L1AVoNwNDZsaBwnuVwqZoZB7ljBCNwxq20
 tNyQ==
X-Gm-Message-State: AOAM533WGRfxJ+2+606B6/BIezvXbbXa4omVouqcfU0Nm0Gozj12s9AE
 tQMJzGlgWcPoAZioW3n01Zhd+w==
X-Google-Smtp-Source: ABdhPJytVUwz6gtklifhSQuu0z5ZSOjp5w5MFnrIR3N+idNQhCEHAeCMVr+g/HRyzzwNkyWswYk8iw==
X-Received: by 2002:a1c:1d8b:: with SMTP id d133mr3431989wmd.172.1612876847751; 
 Tue, 09 Feb 2021 05:20:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm34752472wrh.16.2021.02.09.05.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:20:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
Date: Tue,  9 Feb 2021 13:20:40 +0000
Message-Id: <20210209132040.5091-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209132040.5091-1-peter.maydell@linaro.org>
References: <20210209132040.5091-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new clock_ns_to_ticks() function in npcm7xx_timer where
appropriate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/npcm7xx_timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
index 4efdf135b82..32f5e021f85 100644
--- a/hw/timer/npcm7xx_timer.c
+++ b/hw/timer/npcm7xx_timer.c
@@ -138,8 +138,8 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
 /* Convert a time interval in nanoseconds to a timer cycle count. */
 static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
 {
-    return ns / clock_ticks_to_ns(t->ctrl->clock,
-                                  npcm7xx_tcsr_prescaler(t->tcsr));
+    return clock_ns_to_ticks(t->ctrl->clock, ns) /
+        npcm7xx_tcsr_prescaler(t->tcsr);
 }
 
 static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdogTimer *t)
-- 
2.20.1


