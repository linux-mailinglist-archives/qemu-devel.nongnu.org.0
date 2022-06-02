Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D5D53BB84
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:22:19 +0200 (CEST)
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwmeP-0001n9-3e
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmVm-00009L-50
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:13:22 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmVk-0006CH-Jq
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:13:21 -0400
Received: by mail-pg1-x535.google.com with SMTP id r71so5038119pgr.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9pazjDNhxS4z0NmOrBsgRIL8mzZfsAVnJBL6W/2yfw0=;
 b=ujz1gTFaCw7acDjBvXckMZMd/NfEpaQ0avmLmdKpgM1lKKrdZtQD1kqw8XR/hXXpOK
 DlR2vub2AiTDYSriL8rR2mpwTT1H4VVoX++ePeYdyqrrsNlPgpyCFNMOYGll6DM55NIx
 S6L/0w82/zclccB7MIMTO3MZufv1jyIztELMwHeyxFw5DW39FJ3rkBoHphHKqh/U0Uit
 +9T8zclpF/R6zn2zVXETZGYy+kxpaiiIC3ENmAWKmFYb3miAQBQbHlsd1lr6PtU36px4
 p9tev2QYyNkWI/0KCS9+16DGjOlyZsTNWP8XOAzupJgBaCEYtM28smItPPJqYJybosoc
 mZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pazjDNhxS4z0NmOrBsgRIL8mzZfsAVnJBL6W/2yfw0=;
 b=aIOKvKphrYoF7GP33QknV4AFQyFRslRqs19DeEHCKVxUBKz1gasKe57jczgate7Fcp
 IbNDdQ2cgXXhIStZbK8fMzHMvQHlxZyIAHpSkXaCcoMNeV9WevxM2SEafAatyavhqvug
 hFlbQTL7W4NIaeehl3pSuuISlPdjtnKcj4XL/WVnCnOJfEfv24tGq1DczdREGg3/Yd1N
 XSFdUkc7ry8ZEoK9HwICf4DiKh8wPfRwzvpRbe/KDGn+zy3OsmMUwo5uet7Qx5VNydek
 grL7zMamOSoYZJrvG9G9uwExCZVBiWSmF8nXfp0meYz77exXs5pmItT7DhenvhRs6oIV
 K/iA==
X-Gm-Message-State: AOAM5320FClJmsi71NgcxoS3/XjYDrYgQbO9KGG3hT3dCnZ+5qseAzdL
 hoPAivHFIt2JSEeZrrTy2EkQ5ahLjCxmjq/S
X-Google-Smtp-Source: ABdhPJzN7MTqvHXsg9MVkSlyeYzxkSxnQK3XQ5WViu4LwX0gdICAfANVp9dmi6wY60m0Hcr4+ZFTPA==
X-Received: by 2002:a65:488e:0:b0:3fa:289e:882b with SMTP id
 n14-20020a65488e000000b003fa289e882bmr4619484pgs.393.1654182799099; 
 Thu, 02 Jun 2022 08:13:19 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a170902820100b001618383483fsm3625159pln.224.2022.06.02.08.13.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 08:13:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] tcg/i386: Fix encoding of OPC_VPSRAQ for INDEX_op_sars_vec
Date: Thu,  2 Jun 2022 08:13:11 -0700
Message-Id: <20220602151312.477967-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602151312.477967-1-richard.henderson@linaro.org>
References: <20220602151312.477967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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


