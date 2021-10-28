Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E967E43D97E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:48:14 +0200 (CEST)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvSg-0003PV-3K
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMI-0004TG-4W
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:38 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMF-00033t-43
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:37 -0400
Received: by mail-pj1-x1031.google.com with SMTP id v10so2975996pjr.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k69n+NAqhKditk9j302sj9FGt8K/9s94vNSW9sZvtmU=;
 b=JVIvicQbAqzM3lWW/Pek7RFQG99R1McjPN4kWfPFBQ6BSO1EjoGlVpk4pWa8/ri/2P
 3kVtMXR0wei+xTOyr3u7uvcSDPYPIXCcHCdZKQJ256Fuzk3i6qX/8/hCpOfvSNjUih0b
 35IUIWkPKc8dgBCkzdkvgcLjn8Q+AK3+FplqbIuauUpbGskGUMji79W+tciqR05pwNOX
 V89B2I1uWQIS6jYdpb93rCTyVJ1okDuatyPWvq3gJ66d7fJbufYIESlQhaUoYULkBD6w
 8CueUVNeZj7cU5t3SMKspYSho51lARurQyoXGeYispjJTNjWWNVjNNwy8g9ZK7Mgot/C
 8vYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k69n+NAqhKditk9j302sj9FGt8K/9s94vNSW9sZvtmU=;
 b=K+NLZC6nt/t+gTJZewEKAxg/4aE94irzGFn7niPHJwMOW3hW/SC1DBQRdETWFNtr66
 cwM18LlFTljHJWyQ2YM+l7d/QATBLEuyQHlz42w9lSuTDjdOR1SPEVN+nNByh9aCf1Z0
 mloVttA2M65YFlNu0yXMuArXeuHnHXikzUZAl0qxV8oNZ3JO/Ai4PZRmh7HSXoykEITO
 DzQ09w9d+ZFoay75TW3JQ+ksHwXoJ74TQTxZQsptvesSX/NFNDWd/dBJDnVPZMGT77Xb
 aBRnotXv1dP2R43/+RKmfTALcNrVLgB5cDeARZrHH3rp4yuS5vdnxKM0E8pqNBP8Oiel
 OIRw==
X-Gm-Message-State: AOAM530leg94s8WUVEXEb3TvJTJqNuqeBA34A89hrPFDYtSvECv5L5Wc
 YpY2aKcWv8Cdx+qyLhUdAOuIrM1rRm7oKg==
X-Google-Smtp-Source: ABdhPJyoSJNsuOvCmRVSVYkwYSefuoIQExaGpenAzVK6WUz+mxb2eFNCOLomxRCV9+lYD/dL8aOHRw==
X-Received: by 2002:a17:90a:de0b:: with SMTP id
 m11mr9799954pjv.39.1635388893107; 
 Wed, 27 Oct 2021 19:41:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/56] qemu/int128: Add int128_{not,xor}
Date: Wed, 27 Oct 2021 19:40:36 -0700
Message-Id: <20211028024131.1492790-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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


