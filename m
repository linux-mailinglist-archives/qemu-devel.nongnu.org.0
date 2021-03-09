Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F1332D41
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:29:13 +0100 (CET)
Received: from localhost ([::1]:44082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgAS-0008FG-0a
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6f-0007DG-Ag
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:13 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:46163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6R-0002S4-TT
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:13 -0500
Received: by mail-ot1-x335.google.com with SMTP id r24so6269567otq.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MBA7VlgaL7sj30xRXq/QblNTMSN0MmjXoz+f7WQsSFg=;
 b=j7w3w+yKwBoa+bodyFP8uP5Pk8rlksQZUAZGaZcI/erPHCXHpQBQ2hsyjSphBqW1/o
 1t5n4LecC96y55LAsoLB7SvIrSmYfakWlqZDAluT+cZPT4V9xJgKnKrwpSSNhWKCezGE
 cWVEtsg013kc8cLSwawfITEG0frpBh04D+rQ+uQvo7SgHn0P5psIxnY/VuAN0hLyqGx2
 pwVpSzHN0vAuUlLMxIZUxVIWBBFSUfK0zsVqs3w5T4Rn+ZbvaJYVNuA0ywiM/Vk+I1U3
 u8cWgw4uySBVttH75BA1XrTJ5g3HFBRsZ/T21U3NgTr+6pUmARa+fFh+G25IeHvAvS2x
 0IoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MBA7VlgaL7sj30xRXq/QblNTMSN0MmjXoz+f7WQsSFg=;
 b=rU9edvQbmSvtpbLZ3rdJO3tWLFv6ChJ7Wg15F8apOwQj2bB2zit9aiFqKONzPXCALq
 4szhHivy/wRNBgv1xDcpxW1iXzyDueYeXq//wOLo7LOyMCRutXhJW4EexCb/jgnNz7bU
 VDVDvX7t8QYqcKcX4JUVDns/tgpUGgIyePNCt0+JnahE/do3m7an6vzJnpeoiHleJhOE
 5djMdyBmwsjUZk6roraJMUsN6+EcHFzrjb2ISI5w8UY5jrJ6y6L2y4OdVp2Z30nNL53W
 hie/of0Sj7kOQsP5/2ClVeNRgFcs/pSPNXgVfBs/gxiXVI4xMnXU+7YulExOvMskzAdG
 s/jw==
X-Gm-Message-State: AOAM531SceuC4SzdWD8LqJUownbKz7UPBkzGWypQh0K+M5kpfqNaiOyG
 EtoS6FRWceJErmwouTqIkJy4XsJ7rCjgwJlC
X-Google-Smtp-Source: ABdhPJzbhyYIuHudUpLkHuz6yTg+VCw/jmUqinpNHJihm6t49MmObiJckCqm49LBzQTM2oLklM4Clg==
X-Received: by 2002:a9d:823:: with SMTP id 32mr23535685oty.306.1615306855811; 
 Tue, 09 Mar 2021 08:20:55 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:20:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/78] target/arm: Implement SVE2 integer add/subtract
 interleaved long
Date: Tue,  9 Mar 2021 08:19:34 -0800
Message-Id: <20210309162041.23124-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 6 ++++++
 target/arm/translate-sve.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fbfd57b23a..12be0584a8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1178,3 +1178,9 @@ SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
 SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
 UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
 UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract interleaved long
+
+SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
+SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
+SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b94561b92b..105c70dc8c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6017,3 +6017,7 @@ DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
 DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
 DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
 DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+
+DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
-- 
2.25.1


