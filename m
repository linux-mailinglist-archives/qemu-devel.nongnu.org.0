Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2754F3B790E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:05:47 +0200 (CEST)
Received: from localhost ([::1]:50804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJzO-00034S-MS
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwl-0004JE-2c
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:59 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwO-00031Z-K0
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:58 -0400
Received: by mail-pg1-x536.google.com with SMTP id g22so1104524pgl.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/anbb6DPNvIO8E9zByeUSadBR7zd/opSVuaQ6a6eP4=;
 b=BzmcQhDaQ52jEGbZRotnM66CCSOsQTiSBKGl+eB4MFyPhLE8n30V9QSbs3E6Mp9yu9
 M+uliDyM5iXLfEiqdcaRaq4x1ffL5+sJkCTFLjAFSE7kBi9jjjyRiPe5xh3eqY+faAdF
 RpL+M6fZ/rZpW+YyvqLJRs/671nf26E0rLyoFhC5f8wHkPHfS3g5da0QmJJ3cudl6dqh
 kHjp0t3E/SLg5K1WiecFZJqVusHb9o0FAp3KfT9ztApyVsckUt/52bZaUzh5m8V4+/KM
 LaDuEj3njsnQXEKe6UrMt/0wUwgLowhwmYQOy5H0X8YGPCF2UZXgBumgfF9fqkPPct4p
 nKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/anbb6DPNvIO8E9zByeUSadBR7zd/opSVuaQ6a6eP4=;
 b=hFeJdBwUgL5wobQ9C2ZACRbXtcGOLMGJ+ujIiGz926cZq2QZ2gS0L4drUCxLC26dkO
 KIa+05Z/P3klXHUkpWeZRgr6PDnERY/yY9h/sX/8y8mTK+Hiz3gcFOzMXWS1+4Dbdw/+
 vy/vnTQeqaC5ldbAg/4hFWv93yZlXMjiOApSHJHlOC7E7RYUoaCHEU6rZg9pLVvVLznQ
 PZfJ1hZnZEPZGy3ymi3JQfWmGcnQ72ciUjff1CTc21pjVQaOim6lsPnTIBC8tHtf39t+
 4To7tI3/k/Lq+ctqptNoWU65tC2Vy57vtt6pIVRzkbCaDOgi2qhI9IAJYwtcZoUYBPDF
 NEmQ==
X-Gm-Message-State: AOAM5328ZF/9tiexS8cwvU3Pd0C3ZhiUBQqVTn/UpU3Ymbm3Mof6sYci
 YLeXXAyqtjQf2lpxmPfbGotVPpY5o92ydQ==
X-Google-Smtp-Source: ABdhPJyIbFiF7Pz9TPsCXTJ3s11AsUn88GEm+yI4OL7j0rNneJTBAwp/XPWMqWemn6T83rV+G0g6fw==
X-Received: by 2002:a62:150c:0:b029:30d:fe79:c343 with SMTP id
 12-20020a62150c0000b029030dfe79c343mr6580239pfv.29.1624993114955; 
 Tue, 29 Jun 2021 11:58:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 56/63] target/arm: Improve vector REV
Date: Tue, 29 Jun 2021 11:54:48 -0700
Message-Id: <20210629185455.3131172-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can eliminate the requirement for a zero-extended output,
because the following store will ignore any garbage high bits.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 304fd3d370..1a40e49db7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12444,12 +12444,10 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
             read_vec_element(s, tcg_tmp, rn, i, grp_size);
             switch (grp_size) {
             case MO_16:
-                tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp,
-                                    TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+                tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ);
                 break;
             case MO_32:
-                tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp,
-                                    TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+                tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ);
                 break;
             case MO_64:
                 tcg_gen_bswap64_i64(tcg_tmp, tcg_tmp);
-- 
2.25.1


