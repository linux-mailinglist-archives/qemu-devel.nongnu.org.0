Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64E3AF96E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:32:54 +0200 (CEST)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTPR-0006Y2-HS
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC8-00013r-Dc
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:08 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC6-000628-Ak
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:08 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h1so9421440plt.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UelU97hoekIGhPpWADV+x6IGBUO6uugBAMvKK1hARaE=;
 b=HoC+LvK2qtoNdNqgwWbtZ0OPJa/tz/uewc4kMNBFoF90/B2S4vqfWOr8mNp/rYztHs
 HkXuCjdH91or2hJpqF71a/+oqxDYBMSqO0EeqHvppjK5DSEYhEVRw3ib6hB/nA8l6EEH
 hzCAuX1mlPNFp+8g1yH9raF6TAvb9Z070cRFF58JZsd2kWuXP6pW/VSNckRmk/eZYMKl
 Bu8Z5SsfIArJRm7N4lvN8Afbvs8zhV5K+rimqPvf6fltzd6x4rZS0TumMg4vzgrO3cP5
 /zProZb1td5aH5AkX2zJlcKMnzqpXZrp8gGxrspV7PGe0rYuX7VAAALvz9JR4wfCnMFd
 H47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UelU97hoekIGhPpWADV+x6IGBUO6uugBAMvKK1hARaE=;
 b=lX6UQvJlx20saKT9472iZhwKNkSHlZzmdgJYL1ykd19sPRDjioYaA1UCS09ZQ95ohn
 B4vRJ8UThFRjKTaZPnNVWXTLfZRiE8w96ZnBO5Qx982gQbPKY2Dv+5y+xXVRajn/fOAS
 RJxWZGhCrS0SYJwnvCci14Pty1c5IRZ4ZblfALN7BaHDKActcF1sjawjjwaNTcsc0lsT
 bP3GR3G8+MdlkPCRsCF6a2GvacQBnFNlMGc+czi9gkbs2i02aQqAV7hm9zvjPKIAYldX
 2nd7VYaMADt79ZgwK/jAtiBJMB6x01/W3KLyYh4d4yqe9Y6vk5CpmrDP8PtAQyEXM6XO
 mGng==
X-Gm-Message-State: AOAM530fvk7Pp/ewfPzAbIKG7lnQ92YhDP834bCyYAElzI3ZRtDlmU7g
 JAgIZdoGckScQ/PO5/9LatRSzXBV8OAWdg==
X-Google-Smtp-Source: ABdhPJytyXqlTN6szTQ3Rfb4phzAbxOeb1DFbadzRQPHEQb1sQ4QtVXQNW93z8r872zN6WR9yG6pPQ==
X-Received: by 2002:a17:90a:f293:: with SMTP id
 fs19mr619640pjb.149.1624317544935; 
 Mon, 21 Jun 2021 16:19:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/29] target/arm: Improve vector REV
Date: Mon, 21 Jun 2021 16:18:42 -0700
Message-Id: <20210621231849.1871164-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can eliminate the requirement for a zero-extended output,
because the following store will ignore any garbage high bits.

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


