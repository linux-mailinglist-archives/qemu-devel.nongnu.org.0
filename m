Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35D943F62E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:35:56 +0200 (CEST)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJcR-0006K6-6x
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaC-0003Xl-5v
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:36 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJa9-0007sX-PS
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:35 -0400
Received: by mail-pl1-x62d.google.com with SMTP id l13so965096pls.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k69n+NAqhKditk9j302sj9FGt8K/9s94vNSW9sZvtmU=;
 b=oNyF7uMiCWPRqc3JzUtBiIcHI65otOX3H0nW07CscChsAK1/WRoF5JnNsIuSq+3kiP
 z8PDX5QFr9hiA4ugTyPseFFQ/IHUVhFgQN81Q72pW3lIBdZV9bm2czUCBz5tKJGxqDdx
 KswV8/GaiwkC6rvY1CNT6rW1cO1PlkUx54ZF5hnrLAKsemLJ3vSVJKuffVlzqA1s8os4
 HbRwIzHUC36vWfPH7PaprEgwiY3h29t+sLw/XX6lDXeqgW70TtE+Lmez/TFopTsoMtMw
 QNnSbM+N0CkbObC+tTJMCs8UgyNRQCKPxLw5cRL8BBrDC7yBiGhSEUvspZvu3BsS8LDA
 V4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k69n+NAqhKditk9j302sj9FGt8K/9s94vNSW9sZvtmU=;
 b=TfUHYzxjuUyYdTTCqkO+KC1oGjAQWXpAr1UH+aSSwwW6EX5ByAixMdwClSnq9Mm7kN
 7CSW5/ai5s0dGVaBGavcryHYiNBvzxCl8VPtayz/dYpwrndlYk2wP71MBaCFoqSeeSNC
 AaIYT8BE1ujL+qPHOgUb2qiw0Ml/cZdEBordx87nU7wZpXjVaI5Pt2C/WcyQhs/ZBNeJ
 09fqOq04N+dL47KRXE4mhta+6n+mAG3pbBFPdLr2SVbIUdCA4iOsRfHFrwY0feyEtDww
 lG6t6AwDA4yQ2k7J+ueNi6hGLSzdsGrGnNwCYMBn2vJ9jeiIuGOHXzBw9xRPSfXU0niO
 gvbw==
X-Gm-Message-State: AOAM533YORrBpOnW37v4lea+KQti6rnw+C6nELlB0v4u3cMFyvNZu8ox
 J3pIYkoPKFcEbGWiX1Y7NOhAwVOW/4Ym0g==
X-Google-Smtp-Source: ABdhPJwGT+Zf2hbQJAJJUUIVLu41ANnkUYjKXYMv0EL459bcE/6V4+xm6NJ7DZyOMHZ6TZr2jUqpcQ==
X-Received: by 2002:a17:90b:3b4c:: with SMTP id
 ot12mr17412767pjb.216.1635482011916; 
 Thu, 28 Oct 2021 21:33:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/60] qemu/int128: Add int128_{not,xor}
Date: Thu, 28 Oct 2021 21:32:30 -0700
Message-Id: <20211029043329.1518029-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>

Addition of not and xor on 128-bit integers.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Message-Id: <20211025122818.168890-3-frederic.petrot@univ-grenoble-alpes.fr>
[rth: Split out logical operations.]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/int128.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 2ac0746426..b6d517aea4 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -58,6 +58,11 @@ static inline Int128 int128_exts64(int64_t a)
     return a;
 }
 
+static inline Int128 int128_not(Int128 a)
+{
+    return ~a;
+}
+
 static inline Int128 int128_and(Int128 a, Int128 b)
 {
     return a & b;
@@ -68,6 +73,11 @@ static inline Int128 int128_or(Int128 a, Int128 b)
     return a | b;
 }
 
+static inline Int128 int128_xor(Int128 a, Int128 b)
+{
+    return a ^ b;
+}
+
 static inline Int128 int128_rshift(Int128 a, int n)
 {
     return a >> n;
@@ -235,6 +245,11 @@ static inline Int128 int128_exts64(int64_t a)
     return int128_make128(a, (a < 0) ? -1 : 0);
 }
 
+static inline Int128 int128_not(Int128 a)
+{
+    return int128_make128(~a.lo, ~a.hi);
+}
+
 static inline Int128 int128_and(Int128 a, Int128 b)
 {
     return int128_make128(a.lo & b.lo, a.hi & b.hi);
@@ -245,6 +260,11 @@ static inline Int128 int128_or(Int128 a, Int128 b)
     return int128_make128(a.lo | b.lo, a.hi | b.hi);
 }
 
+static inline Int128 int128_xor(Int128 a, Int128 b)
+{
+    return int128_make128(a.lo ^ b.lo, a.hi ^ b.hi);
+}
+
 static inline Int128 int128_rshift(Int128 a, int n)
 {
     int64_t h;
-- 
2.25.1


