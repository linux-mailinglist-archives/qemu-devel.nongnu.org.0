Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B4250A797
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:57:58 +0200 (CEST)
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhb41-0007bV-AX
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeS-0000U3-FC
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:32 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeP-0002wP-SW
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:32 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j6so3298196pfe.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YihlbUdW9nVb05t909DK2GaeZ9Rq4UBEpzdddYMos/s=;
 b=KvCMqeSG+Y8SxokDXaJoCkVnauAtQWPUStXxCsxI6Lf945B1fldZB3N8dCLQeSPWvf
 NT+BfuPPEeqqlr52v9gaRgdEFOn1XMlyTpE3n8WLkG+AyHr35o+pEq1dslNRN4zJpgnz
 MCITny86pyKtAQBUUTc01BCkbivAT+5eyyV3IAkUk1MVbw9KZI4exz76H9x76DErr3n9
 lSaKDL3F4TsSMv2zBk5vSbvjWfznF2XRVy+DJuxjBZ5RBm7fauz6GvinqyTGOewnnxMk
 FKKv6djZlIzj8VUFQJBReAoSqmQo0S7+ZjWPbDHhvSlGxB/pTrwCfbfg8xtcGSSUs46p
 yS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YihlbUdW9nVb05t909DK2GaeZ9Rq4UBEpzdddYMos/s=;
 b=TBCpIGsWxEku2c1eDbbRnw9rcl0UH5hSLUJWE8hRiwGWrTI3mGH9EfWGfKI1B0iIZ9
 buB5KCX/ZYLriDiRI1TbUCwSdz1KraMokGst6zWnPTrfWePjYubmWhnlhVF6YyZ3C2Q/
 HdPtw3Aw9zL1fZIeASDY8QVbCEnGx1aVQY0xwmAk2ksRSKqw/mIjjFr+GAlTMGk0XvX2
 gg5DJTNUhKDCLmSpXHies21SyEF6np5qvPbum4PEM6WRqrZpTL8wKOIF9GYnElN/tpXc
 k52P2xDdlng312NTtyIiIyaLJTJ9k0aO2xH1rU6z8X8oH2mpTN9jmt+zFkNm/uZdlSHj
 U3XQ==
X-Gm-Message-State: AOAM532VRsclG11FJe6qPMt2Dp40lWo7coWsABn4rZbRRrxON/e+AAlV
 ctAE+hO0COnhvom48j6M+IsI5lcNTXY5YmaS
X-Google-Smtp-Source: ABdhPJzQGBSNbVtigXZJd9Jk0fz6MlJhBmAXqx27yanuHjMuRZPEqnr027KrScHCxFEKY0ud6DHzbA==
X-Received: by 2002:a62:2945:0:b0:50a:9430:a20b with SMTP id
 p66-20020a622945000000b0050a9430a20bmr712103pfp.34.1650562288494; 
 Thu, 21 Apr 2022 10:31:28 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm23557644pgc.50.2022.04.21.10.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:31:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] hw/rx: rx-gdbsim DTB load address aligned of 16byte.
Date: Thu, 21 Apr 2022 10:31:12 -0700
Message-Id: <20220421173114.48357-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421173114.48357-1-richard.henderson@linaro.org>
References: <20220421173114.48357-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yoshinori Sato <ysato@users.sourceforge.jp>

Linux kernel required alined address of DTB.
But missing align in dtb load function.
Fixed to load to the correct address.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207132758.84403-1-ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rx/rx-gdbsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 64f897e5b1..be147b4bd9 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -141,7 +141,7 @@ static void rx_gdbsim_init(MachineState *machine)
                 exit(1);
             }
             /* DTB is located at the end of SDRAM space. */
-            dtb_offset = machine->ram_size - dtb_size;
+            dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16);
             rom_add_blob_fixed("dtb", dtb, dtb_size,
                                SDRAM_BASE + dtb_offset);
             /* Set dtb address to R1 */
-- 
2.34.1


