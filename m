Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20CD390571
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:29:54 +0200 (CEST)
Received: from localhost ([::1]:50442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZ0D-0000Xo-PS
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbO-00036r-JK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbD-0004Jx-Kz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:14 -0400
Received: by mail-wr1-x434.google.com with SMTP id n4so6680764wrw.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+YtrjczBz9b0gziSQnSzXU7T4pwhIHFJgxHoP3hTuuE=;
 b=eaRHyrbEuUwc9lFC8/OUfOLevq/oxffZJ22yuXoNA3pRRMRN9J1nvuW4rYS4GFkYPQ
 rYY9eUkieKhHammHM2Z3elC8CEkj0DjlVPNY6zwVSkTKdR99VNDVu4UmdzoWHyElMCYT
 Zf+l5bjBKXLyTrbyS1srWTc5PgH4tPgd6tuWHqBfxJntmaHKNPyfhn/9HIQA2YPu6Pvy
 I0Tadzs0a93jpBqDlu68BEATySyurIG1KBb+NWWi+E1/SNOucogwNDC3k5BwfB0n9mv8
 DnKyvx2MjbXvnX9cjGaGQJiXb3h/stb2WlF1yE2Gcrm/QbqT/5MX2Z06kzxj3cZPv3NJ
 kFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+YtrjczBz9b0gziSQnSzXU7T4pwhIHFJgxHoP3hTuuE=;
 b=T8vLhV3ldWv0BLaqgps1JOuEW75AI+WnCQkEYLG1teU7DnYzeb1AB3qd7EObm+pcCM
 vVPFeUZyd2cImruHFVRydoh7jsjcDpN6HiEh9RhS2gwdpOg71Q+yNX3k1eeTGG2NdTJl
 DPEOS7HG6rb1OZkxJEeL51XhAdvTn1/WkZw1ZVYhhm9PRd9Cb9K4URPPimIuEXnm3l2h
 rn89FdFbyWKiWW0YNUkWq/wuSCTNbmuz4IBh8cqexn26Twi2pTHml87N39wNBSdIMTXB
 5dZr9rP+0mDi05/08jV+0voKotcruUAthox1gcWo8/pwA06CATmjPijXJUWQ/7KueciO
 dBiA==
X-Gm-Message-State: AOAM532TfdpGLw7XN0y9B0FAufNv6SeCau9ZmmSyfJjAr8kvTVABfDpc
 oWm58CoolCqtzB+sOWe8M1Eo43U8QQtFpfae
X-Google-Smtp-Source: ABdhPJysxKPmTKqWYSNHIC1bJtoBN4m7ougpPjUvQSQZgt6JQ00fo/u5O7BOPvrqWFCX9fx1S0hoxg==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr29501142wri.244.1621955036723; 
 Tue, 25 May 2021 08:03:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 033/114] target/arm: Implement SVE2 integer add/subtract
 interleaved long
Date: Tue, 25 May 2021 16:02:03 +0100
Message-Id: <20210525150324.32370-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      | 6 ++++++
 target/arm/translate-sve.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fbfd57b23a8..12be0584a8c 100644
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
index 22983b3b85a..ae8323adb7d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6016,3 +6016,7 @@ DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
 DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
 DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
 DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+
+DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
-- 
2.20.1


