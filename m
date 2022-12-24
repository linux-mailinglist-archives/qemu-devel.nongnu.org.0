Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F4655BEC
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:11:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP3-0002qG-5H; Sat, 24 Dec 2022 18:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOq-0002RE-Lo
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:58 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOo-0006Mh-Qd
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:56 -0500
Received: by mail-pl1-x62a.google.com with SMTP id d7so8024230pll.9
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRnYCcPWX5BOQQf1a59sccPy8bi18QDF38eChoryi3g=;
 b=iqAkJokNkpKws9Yhs9UsbE0fbi9WoVy21F1RhhehesbWsN8tVjrhVaihfSrupf6XtL
 SdHa/RVz5pIBaG6ulKOd2aq5MWJjN6RoUMDJnsTPPKuM23jW5NFgwkCA4VLg1fjW6B/u
 c7UFZaQEvLe2RapkDMxADjT54Z209IFZnN0tWr+VPp2JgsReI+Z++7I5VTCWc4AnifTj
 nioPXCT22smkAkDWJAGZw9uztr1Qx5DLNJ25B1qfiNb+BcR/FYtrkSAOq2uxn9aRX3fS
 KqkadXTxnG0P8hTk+HuNAShsSjwSk5wIgvWePXmKRypxtCoB2q9JbfH9AncnMHy3Fq5v
 necg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRnYCcPWX5BOQQf1a59sccPy8bi18QDF38eChoryi3g=;
 b=5dxtwDxQdSkshksicthHB+asl2lzRtXf86kXNwrVweZ0W7KWJdkSD29gPHYCqABJ8N
 qB7TjH54Kp3eIsBB70jA/CpuAjN5nOWSLuMqJdXgB40lFincEa1b9dhjsrSwdDluGROh
 NlvKkuWoC0Dp+MEZJxndZBd9GGR8/H/RBD4ow1ilqFQAJ/N684dvy4TiP10SltRs+FRY
 o51cNmfWqaLUO7ZSmco+wDIpmoZhQgofHUv94O/6NVFen/TinLhhQpuqDB1XhE55SBlU
 YmuEgsumULp/W/8qVgtWdBu0QR3aTwOZgDEB4olMD2wvsKxZctt3V6sVnIeYXcTqN/pr
 xQZQ==
X-Gm-Message-State: AFqh2kpYuXZCfKRokRD58z8gjl0smEN5xBap6WXP/ZEWUdY80YOGTbr6
 O05EomC/Mp1QjGJ1hcKP7GM7bjNrfSIM8Bfc
X-Google-Smtp-Source: AMrXdXuAfWeVV11urpVpNX9pYIUvaL1bYHFQwn4PihhMfONicL9wxrp/C6NIAI3Kc+faZRA+FUhH2w==
X-Received: by 2002:a17:902:b613:b0:18f:98bb:c08e with SMTP id
 b19-20020a170902b61300b0018f98bbc08emr14213521pls.36.1671926273443; 
 Sat, 24 Dec 2022 15:57:53 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 33/43] accel/tcg/plugin: Avoid duplicate copy in copy_call
Date: Sat, 24 Dec 2022 15:57:10 -0800
Message-Id: <20221224235720.842093-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We copied all of the arguments in copy_op_nocheck.
We only need to replace the one argument that we change.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9e359c006a..77e6823d6b 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -397,9 +397,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
 
     func_idx = TCGOP_CALLO(op) + TCGOP_CALLI(op);
     *cb_idx = func_idx;
-
     op->args[func_idx] = (uintptr_t)func;
-    op->args[func_idx + 1] = old_op->args[func_idx + 1];
 
     return op;
 }
-- 
2.34.1


