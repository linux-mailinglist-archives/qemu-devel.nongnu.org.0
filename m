Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6666B2E69
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWu-0004Xu-S4; Thu, 09 Mar 2023 15:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWr-0004Wt-UP
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:21 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWq-0000ik-AR
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:21 -0500
Received: by mail-pl1-x631.google.com with SMTP id y11so3232098plg.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zNzTLPBqlL/DRYa/cfMtL4A+dUzS8n292w/2a7UOVk4=;
 b=SiTII+ur9AQjShGHQPpDedCMrMZKyXXt0gVOaEQaAhTUDOYPZztYRpBNxj3snHMXCa
 Lhk+qaMSAxAXcA0KHThWDY9qDLRyq3of9F9ofmQRlt84IYzBx8p5ZUz63ZyoUocvIt82
 NnBnpw3YTSSNbQ95wj0OdrTT5SUTY0ICzfPD8/NDtEi5aHc19GKEEXNc4F4WV2eGlhXU
 9hON7RhqXrFpVbGE+iCi1gJrPzE3fqXrvsVWO93bIki/bqGEd8aTZ68pKtuBY7Gc0sAu
 pSqS2k2CsuiT/9LpbAjk9iTUJw1X9ifnDxkIhq4by36aMWkEV2zd/tWwJuDqaHBqeVnC
 JSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zNzTLPBqlL/DRYa/cfMtL4A+dUzS8n292w/2a7UOVk4=;
 b=a00HFhew6ak5yEDthPkP2lURfatCpWNGTBYOfT7NI2sXFeuEklRHB0l3T1KNenh8WK
 nGphGVceKJcTj28QIJZMy9v0Xa/MWlpyq/RGADOx2CxI1QWQO0wF8G+17Lxl7cKGoM89
 XbApHPBtymy6M9SEeHamVpZ2B7H8BhhwjaUX2YUP7FoQOAOvQBjkutvP/Lb+mmA71Dt4
 FtwmfZvqKfljqJWNG4C8tAHWdObHo2RQJL2rIC1i80MAbWpngnCud4q6C6SfJaWeenEW
 jK9LijdZa7+ebbQeNtqYnX6dJ7NzHjMXJsz+aVYc441tvMqTszbvLwAZt/1/X/FUD0II
 wJPQ==
X-Gm-Message-State: AO0yUKWk32cNOc2fkXzolGDlqkm/O4VaMLoAs04rEHjyi0O7WDi8Q4sm
 aiFsn26B842TKh5B/ot02cf0p9qXYsVZbkvLNrY=
X-Google-Smtp-Source: AK7set9jHzTlxZbwvomQtDrESFjYMyAeTmRRonE8cu2PeC4kcWIJYTeAMHhWKls0uXWWQgzK5Jre0g==
X-Received: by 2002:a17:90b:4b41:b0:234:a9df:db83 with SMTP id
 mi1-20020a17090b4b4100b00234a9dfdb83mr23685460pjb.10.1678392379644; 
 Thu, 09 Mar 2023 12:06:19 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 31/91] target/riscv: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:50 -0800
Message-Id: <20230309200550.3878088-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-17-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index ebaf26d26d..b2a9396dec 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -27,6 +27,5 @@
  *  - S mode HLV/HLVX/HSV 0b101
  *  - M mode HLV/HLVX/HSV 0b111
  */
-#define NB_MMU_MODES 8
 
 #endif
-- 
2.34.1


