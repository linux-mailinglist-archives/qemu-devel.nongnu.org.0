Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E688370247
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:39:23 +0200 (CEST)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZv0-0005cF-Cj
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiY-0008QO-Oq
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:31 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiN-0005zb-Lz
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:30 -0400
Received: by mail-pf1-x430.google.com with SMTP id b15so5008688pfl.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=br78Q7AmWJ+XfOQwE2rDFXsz+3JbpInND1mUnQKHlAY=;
 b=uE+DNl4Z32104nNSkPou4iulwrQVxJiXMsCKSSq4XhAvmsGYzvq0Scl+AKe++orTDp
 6BXlweHk7ZimFAwvBhmEC7Lu4AqbdGVjU9vnHqY721gYUyRntXpDJF1E0nF1J7XVd/kl
 LlVhchQOS8NUHENB+/aJUYMzQnSiBK9tipGtBO1uQ1at27nonvJse7S+ioLp64m3co8d
 dLQkGxQ2KPdtRViJb4WfsnyyxwEmmpq+Rj38dzN0s+4vS1KYkzZSTAd0uq0w/b/q8bAR
 srBMBszlz8BfyeD7AmjqeM0SHXgZ99/ngL5ZkhlhD1CHWCaa2JTMLePkbEAbT8ioOpu/
 DkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=br78Q7AmWJ+XfOQwE2rDFXsz+3JbpInND1mUnQKHlAY=;
 b=IVmxLKFJ1gI0VThdiy48bWDnSEP8KR9t4hXyRjnzO5FlGjhatTUz4/PqQX5ReZQPlm
 /5SUV4SScNDlY6iAHC+w2wEOlcQ84JgJM7Kyk20j/6ySE7m3ckek6IEPoHBbk8477Qd7
 lpeDTMv+OeVvUfbI6xspbpTLJooEZG4+ToJQ3/13n1JILIHKYMtee2hbtEFhg5YY/+oI
 QqYQRPjtUE4eCXjFVgCw2zzHf+ffukC5emXw+SrR3e//tT9CbahDxSmDyp1OD0hFR1WE
 i61+tVU7Tm6HxVOIR0/nZgEnBY/Vx/DKte3Eu8ikSrN5pjBIfv16nKqqkGCGy1BfEO2q
 mVog==
X-Gm-Message-State: AOAM531HibwTnhyg3DDzIKqc5gqlfXNS/25kWO3qtelBl7bP4j9bZeqp
 rPCf8HzNYz1sPWTZ3Mi+SkyrvY5iXoKNPQ==
X-Google-Smtp-Source: ABdhPJweCDSmLmoCTaSmbOYWTQgCOt5gu3DIub51LXMqKqTnMsWGmKPUZxz8SnwfSOH3MMo7Uq9PlA==
X-Received: by 2002:a65:6a50:: with SMTP id o16mr6335989pgu.6.1619814378075;
 Fri, 30 Apr 2021 13:26:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/82] target/arm: Implement SVE2 integer add/subtract
 interleaved long
Date: Fri, 30 Apr 2021 13:24:59 -0700
Message-Id: <20210430202610.1136687-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: qemu-arm@nongnu.org
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
index 22983b3b85..ae8323adb7 100644
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
2.25.1


