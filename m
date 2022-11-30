Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA51263DACC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 17:36:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Q2w-0003jl-RV; Wed, 30 Nov 2022 11:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Q2s-0003ge-3j
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:34:52 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Q2p-0008Rt-MS
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:34:49 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 i81-20020a1c3b54000000b003d070274a61so1409963wma.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rm47tdE3SdYBH3zdkN0e4TzDiQRPGs47DqgC4yVHqoQ=;
 b=T/M1VhuZSwy7hWbdL0Hbltsh2/FkJ1TOcvES63I7XKVglI6zXoUJDDWCkjpzESvEfk
 EAV5tIMSQN3q9Gkuf7FDVwuHVqYzuH5xAWRpJNa7ZYJeHPEMSLxWm41DJBNuPujbqu62
 dz1zwA4OoNQH/dk3cfwgtCOA3xiBCo6lNsYOxEXbbG5DW05keVXgjHzjV2Iyzq8MuM5B
 KqfbzXfku/U6JOf92VR0QLYH1fdOoWuNz8H2FaHWrnmPeusN8I+Mlp+D2kqpj7qfgz/i
 +0VViBlRx6HEYIiJHhtiw911oZcY9pWAztPNhw7T+JapY5OBeqRvoMxhusGxChEJKtsA
 mxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rm47tdE3SdYBH3zdkN0e4TzDiQRPGs47DqgC4yVHqoQ=;
 b=HwA515+1CFA1aVepE/TI5r7IXP8Vzt7DZ7fzsn22ctpXfkrrAll4D/Ly4uh9677CNf
 edcYF8ooJI7BgKXcXDGuUMWWyVvjhUnxJ0bslj7mFItmxWV1h4WPnSIwL+pr3nM8uy1p
 vCk9d15xkfdZV0ScUwAuK3+4gJi5xS9oDz2RIemMv3XCEv/ptgZP47kRetp0KvPY3WyM
 HcrvpFA0gPnNYRNAYvgPm26oXjy5Eo8Yprng9BG/DXiwRkBV6wanbiNRXqUuQNxDaIpG
 arCEG9XGzV08qYO5X/97M6URsJJcI7TbNuBhbZBx7VrmL/A55aAzUc1hCNyJaM2yBM3k
 nQJA==
X-Gm-Message-State: ANoB5pnj0DjqXg+M6flfxLMOTd1wWOA8/x1uJQAjot/aTMOuezCFe2eX
 CeQbIqeNGBw/s8N07esOEqrNWJDqb8V5GBJz
X-Google-Smtp-Source: AA0mqf7Yio9oBnMvGTjB4gZVWBoQIbg3UHLZpxGFktowIpm2pYrj1f5yUwJVewxcD4kS+fvJz/IrKw==
X-Received: by 2002:a05:600c:20b:b0:3cf:f2aa:4f24 with SMTP id
 11-20020a05600c020b00b003cff2aa4f24mr44332082wmi.48.1669826084817; 
 Wed, 30 Nov 2022 08:34:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a5d42c2000000b002365b759b65sm1985477wrr.86.2022.11.30.08.34.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 08:34:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alessandro Di Federico <ale@rev.ng>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 1/2] target/s390x: Replace TCGv by TCGv_i64 in
 op_mov2e()
Date: Wed, 30 Nov 2022 17:34:35 +0100
Message-Id: <20221130163436.87687-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130163436.87687-1-philmd@linaro.org>
References: <20221130163436.87687-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Although TCGv is defined as TCGv_i64 on s390x,
make it clear tcg_temp_new_i64() returns a TCGv_i64.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1e599ac259..a77039b863 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3335,7 +3335,7 @@ static DisasJumpType op_mov2(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mov2e(DisasContext *s, DisasOps *o)
 {
     int b2 = get_field(s, b2);
-    TCGv ar1 = tcg_temp_new_i64();
+    TCGv_i64 ar1 = tcg_temp_new_i64();
 
     o->out = o->in2;
     o->g_out = o->g_in2;
-- 
2.38.1


