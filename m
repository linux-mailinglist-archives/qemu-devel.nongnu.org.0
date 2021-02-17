Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82DE31E31E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:42:23 +0100 (CET)
Received: from localhost ([::1]:37362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWSc-0000nL-Tx
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWQs-0007cQ-SJ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:34 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWQr-0004Xi-5O
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:34 -0500
Received: by mail-pl1-x635.google.com with SMTP id s16so195923plr.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcGphVvC0/caTtvh4+lg1JnnXtDLzy6lys2FZhvbGvY=;
 b=uQcXATsih62P0UK9bhURf3ze2dRvXMsnNR0lFCgJiZe4WcacGxVUOz81XmOFqBgRBd
 2szhDlI6Uk/Y5Pl7ISxCx86/pmbyDR4jbcI7KIqt0LZSgu9XGX9xv4o5TI1/JXD5nbL0
 +hFOUuyJo7QxC1mulXQk4lCYZx0aV8wEoRBy/Ues9yCFhE0mtnpZ67i+5M+1dDgQg/Vm
 x5sqEhcV/qVpWfmBC2JAITYMGrQlZdhJbeCStSY6aFdfRLhrgOuX6StOO9lpH69bTkFM
 dfsxUsbF2bmXA+foUVXSjimQnYzIBL4gT0/1PDxSUlOXv7bdFlFuTlJ95naQ34WWJ7VP
 3Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcGphVvC0/caTtvh4+lg1JnnXtDLzy6lys2FZhvbGvY=;
 b=P83nTTbFbTW9iXbwHQbYKNJ7RWTjfecBrCuzR8HncYx3tOV3gAf6jkSWM+HfFjjD8x
 BEalm7N96hd6dy6DMSJ3auVmh4bcnOXOX3cAJZ3J5SKdEgLhUCCi71jihzjERqu/Zf1o
 A8GD6FO3YcWIVEue94sK/6Hswvlx5THlbG+1VaeuMPW7XRhdQq7KIhkRbOyOsumwR+pp
 YkOcL3wEHwZFPapZzYtyZTX7UPGatPpvMnbIWyPurbLC0MGnD/ZtEnRKmmrhjqtFcE2E
 Vx+HbsreB5YV2raRpKEostVd98xK7rYTTZbPy6nDI0YpBsiNuuQJKSyzMhEEcbBAauUQ
 Wemw==
X-Gm-Message-State: AOAM5305Ged8dEHcNa0vBMErpMZpU7MRE321+s2Hdxl8JKy3deFJh5h+
 8Fhh0eicK2jv/teY0hXs3nMsjdFCkdqxoA==
X-Google-Smtp-Source: ABdhPJzhmLP4MZpLCZJZSYNTq+d1GRRIFLxAAKMq39G/qXFSbmC+cYmNgDTKEbwXMXmwks6+vvfXgA==
X-Received: by 2002:a17:90b:1495:: with SMTP id
 js21mr1191621pjb.127.1613605229982; 
 Wed, 17 Feb 2021 15:40:29 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/35] qemu/int128: Add int128_or
Date: Wed, 17 Feb 2021 15:39:49 -0800
Message-Id: <20210217234023.1742406-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201021045149.1582203-2-richard.henderson@linaro.org>
---
 include/qemu/int128.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 76ea405922..52fc238421 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -58,6 +58,11 @@ static inline Int128 int128_and(Int128 a, Int128 b)
     return a & b;
 }
 
+static inline Int128 int128_or(Int128 a, Int128 b)
+{
+    return a | b;
+}
+
 static inline Int128 int128_rshift(Int128 a, int n)
 {
     return a >> n;
@@ -208,6 +213,11 @@ static inline Int128 int128_and(Int128 a, Int128 b)
     return (Int128) { a.lo & b.lo, a.hi & b.hi };
 }
 
+static inline Int128 int128_or(Int128 a, Int128 b)
+{
+    return (Int128) { a.lo | b.lo, a.hi | b.hi };
+}
+
 static inline Int128 int128_rshift(Int128 a, int n)
 {
     int64_t h;
-- 
2.25.1


