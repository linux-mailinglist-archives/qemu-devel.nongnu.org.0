Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B23B370292
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:01:30 +0200 (CEST)
Received: from localhost ([::1]:42232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaGP-0000Qz-JE
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZm4-0004Ej-FB
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:10 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007h5-2D
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:08 -0400
Received: by mail-pf1-x429.google.com with SMTP id b27so905342pfp.9
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
 b=vGvjRHTVa3JK48nDwrfipfb4ZCugRkn+EOX/G4k2gLqNpPm02UxGUhC4DFsQcjr58q
 TUZyYcdonisdsMTO+gU59VZYka025arMZPlgh8Mkq6bIGByvhPbAZc/3Kh7AlG0HfVrq
 HJttUddHR9dAZ88xOAuwwwSCbv36hoaBvkCKhINitT/0TIQkWxER+1Dgy0xW7cVGeUJi
 xW/t0lXDyBVya4YDhL97c9RvFDlagT6mZP1xwjQFMCRX63qCf3icgObJSkvtEg5VtY/Z
 PJ6T6SldJOVniv/IWARuufoCtfu1rqa1Oyacaz2fPjsdHee/RMH8QcraIOTtvio9TLM2
 8TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
 b=l+qlEioxUh6Dz3qLmoorb0o9UUKEy/vbGRZ9Lwnf/1fQhaocmCXRiGjOJgMJQ+i22y
 /ZYs/F6jqyoaqyw7yBLWjWbV65v7x3pq6sulahCzdxk0PDy04VUiaHnVNlBSu1iegtkk
 tfOdzlhHoHmvrA/Nt9mXG+iqALU7Lln2VpRvDcscW9RR5TmLYohco4mISiU2pA9/H1Xm
 B4qfnqKYJHLXDOESVT/kNE7SRFASvse2vH/Me5AMdqZfLAe4ylqgzVedUu0dA5D/y5c+
 kgDLiccPlyIMjbq0hdMVu0//s/4nB+cXhjcPGEfHNWdo/+dDzdFnf+gIFub5Khg4PzmV
 3PNw==
X-Gm-Message-State: AOAM533wm8Jjw2vytBOCtGs+UbBg8GcnLQfNF+nPKpaKweZ/3QF2TZcq
 0fh4NuMIWYyp9GfJPWh8AM+rkVEMEvfZTQ==
X-Google-Smtp-Source: ABdhPJwsPnNfjnGAYFOJoenP/6Zq03Mq+QifMt6A4k3AjLFHR118NUW6NxbPClhQjZ2D6D2CT37eZg==
X-Received: by 2002:aa7:80c1:0:b029:262:ab5f:adc5 with SMTP id
 a1-20020aa780c10000b0290262ab5fadc5mr6747237pfn.60.1619814578788; 
 Fri, 30 Apr 2021 13:29:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 44/82] target/arm: Implement SVE2 scatter store insns
Date: Fri, 30 Apr 2021 13:25:32 -0700
Message-Id: <20210430202610.1136687-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal
store insns.

64-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)
* STNT1D (vector plus scalar)

32-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7645587469..5cfe6df0d2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1388,3 +1388,13 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
+
+### SVE2 Memory Store Group
+
+# SVE2 64-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE2 32-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index eea8b6f1d0..0356b6a124 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6167,6 +6167,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     return true;
 }
 
+static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_ST1_zprz(s, a);
+}
+
 /*
  * Prefetches
  */
-- 
2.25.1


