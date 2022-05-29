Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C369537053
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 10:30:51 +0200 (CEST)
Received: from localhost ([::1]:48456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvEK0-0004Pt-Uk
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 04:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nvEGf-0003A3-51; Sun, 29 May 2022 04:27:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nvEGd-0000D8-GZ; Sun, 29 May 2022 04:27:20 -0400
Received: by mail-pl1-x631.google.com with SMTP id q18so7757905pln.12;
 Sun, 29 May 2022 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kdL09LF0wEk8mBmd/CcNhvuPXhBu3MYDhubty9TYOPA=;
 b=p4l19WG0ICgNwt/E8ONZnRcuZMuZ2M5tgRM1W19fe5z9sN8yalCiSP+6lUHJjfPFMb
 G1pc8AorNtpczE/D3C1zkB0/23FNTIoyJATM2sFjqquMWGtmWBA0CgMzf9mOalrBFAzJ
 1SULlouzkxCCg16XWxF07cYP/elmSegDqzE4Oo3VRNOaGNtUijmHLzjR7jssWNw7oI/Z
 t48uOECQrY6hiLJo2Iazgy2kcdz6p6LtXhd5wJCsp96eCSuEXjITRoMnZsx8cNvm+APD
 0sFUfvL1/FaSbvMxs4qDB1Cgbbp4AI7s1uH7Qrs/EK/3nzmyTxUSDkun4n9g/P1ORiBf
 ZdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kdL09LF0wEk8mBmd/CcNhvuPXhBu3MYDhubty9TYOPA=;
 b=qBJofpedEL2BYk3zE4NJs/yi1X13iwmEZ3F5ojW0/3vU4rqHvgLanWRMI/30oCrCs6
 16Vf98rn4GHobjKl0bUbOW7K4lNOjQMbfg+7i0Z3cf/hOGlLNwy82SYTLn9Mrjwu676E
 PMExAq7/Gm2fqRSHElo/dHzBBrlYeGOZ+MDm6gKOjmL5/ty3OC2ijehn7ct4+/81UAy+
 7SHkEEJIFXfzwESZAx/Svb0apkK9cnQLuRMSU9PazbRhazf0M50aTXA0cJyK/FN/SHq8
 tj27n5kP2jz+5qt+Wy/p94J2lhLwslREIT/cepxX1rqXakSe+BuBW/cXLMKgk+0r8Tdx
 pKTg==
X-Gm-Message-State: AOAM532xTSnpCJfpaM+3oQalE9pdAvLDCL8fvjQ8TBjmO2RAotAYJpMJ
 tCshFkksUNwgNdhVkhiaocI=
X-Google-Smtp-Source: ABdhPJyUsq32X5Is3b8yTU+3I43v5nmlaMo7uI2gSSTs/f6ESbRHcxkFSlA/BN4jZY1y9Icq2RZheg==
X-Received: by 2002:a17:902:e9d3:b0:161:aa01:b956 with SMTP id
 19-20020a170902e9d300b00161aa01b956mr51024684plk.110.1653812836980; 
 Sun, 29 May 2022 01:27:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:2838:873c:bfb7:88bb])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a170902a71400b0016232dbd01fsm6756921plq.292.2022.05.29.01.27.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 29 May 2022 01:27:16 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH] hvf: arm: Include target/arm/cpregs.h
Date: Sun, 29 May 2022 17:27:09 +0900
Message-Id: <20220529082709.89190-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

hvf was missed when cpregs.h was split out.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 86710509d20..e595da31b9e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -25,6 +25,7 @@
 #include "qemu/main-loop.h"
 #include "sysemu/cpus.h"
 #include "arm-powerctl.h"
+#include "target/arm/cpregs.h"
 #include "target/arm/cpu.h"
 #include "target/arm/internals.h"
 #include "trace/trace-target_arm_hvf.h"
-- 
2.32.0 (Apple Git-132)


