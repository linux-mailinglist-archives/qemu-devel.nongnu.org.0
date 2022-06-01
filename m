Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F453B05F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 01:31:05 +0200 (CEST)
Received: from localhost ([::1]:45096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwXnr-0003b9-Se
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 19:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwXk6-0002r5-EP
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 19:27:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwXk4-00083w-Lg
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 19:27:10 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 n13-20020a17090a394d00b001e30a60f82dso7716531pjf.5
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 16:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pazjDNhxS4z0NmOrBsgRIL8mzZfsAVnJBL6W/2yfw0=;
 b=N28nEPG3EchaY0RZ2uwNRbxzbFD8aotmQZHZdBtbu4d6l79hCYH0upleREPUaBxtdU
 SzQIZbXuEXhGoBsJlxsFfhcK1dgeIe4omH00YSQFPrOTLV7indylufWVM6zOyo+FNJ95
 0NLR+dwuPWa2yUdpxMvD0zc1NGGoOtdL2hBrKki6NKuOcTLXu9sO4swbQdYNZRSsey7l
 BydRSlZx1sJAwQpgQHbOdyRPuVfBhnInFESU1EKdnQwEHStrTPkrUkEnrfk/j8XE0JV1
 WpIXVCg6WkTvjjtmCR9Je3EFnZv9SUG5ymaxqoqRzRn5TOSmF6bVi9yiAAGq67LP7EmP
 hyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pazjDNhxS4z0NmOrBsgRIL8mzZfsAVnJBL6W/2yfw0=;
 b=IgwGPLMflJ65PIac8qt4mJLOb3Gm9iOAmcGobIxo26P8v77jBl3f60X7OW8TFAPNNk
 oLLivtWhUtkw2QUH//8kC3+d+EMxe6Fj5yNYi72UuZmCDRMY7JtQD7hLq87EXfIAf60t
 NCYEXkKJECPisdc5bfg6u7UBsl0JsZPyKoNEy+jwofWP9rl5dZMXTv69DBgsz49zonCl
 7r2NiKF6dqZXpb+efC7ETFwiHinjpIROZKjqdmaxNmnx9Lssx3V4TjtpSymmPZQ7M6Yg
 osrBg6WS51MM6iAZJdWJ0OF1/EbzXvmINsXjg1r+cwFVOiolTFDyK7RMxHHC8AQEDcDq
 t1IQ==
X-Gm-Message-State: AOAM533xSqOtRx4WnHBlf5evlgNl1jyhK4DNsLDNAkGLzzGRpDZjLKZ6
 Lz6VIEZNNHRUowYUgO8G6t5RVnWJevbEpg==
X-Google-Smtp-Source: ABdhPJwB8dXBFt0sozn6+3EanCSyhYAqyceCI9QTjJCC+qteuNeIX33aFn2epZfr7wEpUvXbk46XqA==
X-Received: by 2002:a17:902:f612:b0:14c:e978:f99e with SMTP id
 n18-20020a170902f61200b0014ce978f99emr1829820plg.23.1654126027057; 
 Wed, 01 Jun 2022 16:27:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a1709028c8600b001636c0b98a7sm2073491plo.226.2022.06.01.16.27.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 16:27:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/i386: Fix encoding of OPC_VPSRAQ for INDEX_op_sars_vec
Date: Wed,  1 Jun 2022 16:27:04 -0700
Message-Id: <20220601232704.39667-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We wanted the VPSRAQ variant with the scalar vector shift operand,
not the variant with an immediate operand.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1022
Fixes: 47b331b2a8da ("tcg/i386: Implement avx512 scalar shift")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index b5c6159853..d52206ba4d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -375,7 +375,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PSLLQ       (0xf3 | P_EXT | P_DATA16)
 #define OPC_PSRAW       (0xe1 | P_EXT | P_DATA16)
 #define OPC_PSRAD       (0xe2 | P_EXT | P_DATA16)
-#define OPC_VPSRAQ      (0x72 | P_EXT | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSRAQ      (0xe2 | P_EXT | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_PSRLW       (0xd1 | P_EXT | P_DATA16)
 #define OPC_PSRLD       (0xd2 | P_EXT | P_DATA16)
 #define OPC_PSRLQ       (0xd3 | P_EXT | P_DATA16)
-- 
2.34.1


