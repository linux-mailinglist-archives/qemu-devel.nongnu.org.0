Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7361198ACA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 06:03:24 +0200 (CEST)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ87Y-00086f-1g
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 00:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jJ7zf-0004rp-9Q
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 23:55:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jJ7ze-0008Ls-8b
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 23:55:15 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jJ7ze-0008Kt-1y
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 23:55:14 -0400
Received: by mail-pg1-x532.google.com with SMTP id g20so263334pgk.10
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 20:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+Tp2V6+LD0F/OwBiPn+CFeXg9gywOboZsBIVwTf7gQ=;
 b=MSd+x3bnkEVoSxvLeKdHDVtbFsQRFrPR1E6d+c0MH3aPXnlh3U0b20GXJvwkw7sftb
 nC3ds+5Oq4XVfRUD2E36GM+T7W2K+E2+TuTm0fbe5PzjCcmx4bZDOB4LlO9yIpKaZuXe
 cPJpko1rPeaBbJgWZv7yj/RjUOhp7ubzr3s2lW6AKHtvA2yUZx4Nz3973e/Iufytc9SK
 rdijkqbpD7ul2MJuBNGLeJlEIr6S1ws4XmoeqSXN81ihpC98u7RB5vxXDVox8b9s0II2
 DM+EdIEYKyhgky/y9bf0l/cICUIbVUDV3xSfuHLm+J4xn7cu9EJRWLBOnLFLurobHGI5
 U74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+Tp2V6+LD0F/OwBiPn+CFeXg9gywOboZsBIVwTf7gQ=;
 b=n8STos92U2OWC4ewDRnkkYyWq+yOeon59Cth81s1mYRrsaBJq5dBMb2/62T4hyZXry
 j8rrO5uv5CkhuwObQdPSWGaq5ljkC6b4N6rp4mQCIAWKc5gSqV+al2eddXoXS+IIgYp/
 0yfCng+EG+LKiUSb/t4W/btj0izwzL+sytabvMqUtyFzicywJ9g0pD4Stgiy6K/LFN2Y
 +rctbE3VxD99ftFIdrym2JOQ6wvMHqz+e5CO1TgPrlU9RhUfk4x3P+Kk2PhByMhQ8aep
 PYFDQ8eHN8aaBT9TrR9RX/PzSor3l2ukVke64XgM/QxV2knXf+t+EZJRjeI+A300Q3Cj
 0gvw==
X-Gm-Message-State: ANhLgQ1MVADVwq01D3KwgwnsyhA898H5IlTDAJgmg9/8Vz3Q5UnZX1Z2
 HuL5ivCw/QhMoXNtswDgzOGHg5McToQ=
X-Google-Smtp-Source: ADFU+vvI2kt1d4imhlR7tm2vHAXfHjfizlp1c5plBy6RMt4gH2xZmlPobgbJGDb8FtTJlqfEgyE63Q==
X-Received: by 2002:a63:c712:: with SMTP id n18mr15360690pgg.343.1585626912712; 
 Mon, 30 Mar 2020 20:55:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id h11sm11386174pfq.56.2020.03.30.20.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 20:55:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.0 10/10] decodetree: Use Python3 floor division operator
Date: Mon, 30 Mar 2020 20:54:56 -0700
Message-Id: <20200331035456.6494-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200331035456.6494-1-richard.henderson@linaro.org>
References: <20200331035456.6494-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::532
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This script started using Python2, where the 'classic' division
operator returns the floor result. In commit 3d004a371 we started
to use Python3, where the division operator returns the float
result ('true division').
To keep the same behavior, use the 'floor division' operator "//"
which returns the floor result.

Fixes: 3d004a371
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200330121345.14665-1-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 2a8f2b6e06..46ab917807 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1025,7 +1025,7 @@ class SizeTree:
         if extracted < self.width:
             output(ind, 'insn = ', decode_function,
                    '_load_bytes(ctx, insn, {0}, {1});\n'
-                   .format(extracted / 8, self.width / 8));
+                   .format(extracted // 8, self.width // 8));
             extracted = self.width
 
         # Attempt to aid the compiler in producing compact switch statements.
@@ -1079,7 +1079,7 @@ class SizeLeaf:
         if extracted < self.width:
             output(ind, 'insn = ', decode_function,
                    '_load_bytes(ctx, insn, {0}, {1});\n'
-                   .format(extracted / 8, self.width / 8));
+                   .format(extracted // 8, self.width // 8));
             extracted = self.width
         output(ind, 'return insn;\n')
 # end SizeLeaf
-- 
2.20.1


