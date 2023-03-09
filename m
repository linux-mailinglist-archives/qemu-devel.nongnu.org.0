Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58ED6B2E52
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:13:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWl-0004RE-Me; Thu, 09 Mar 2023 15:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWh-0004Mj-1C
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:11 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWf-0000jt-Gj
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:10 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so7427747pjh.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DawSorGfxad1nEnazjpmhldK0G+RxpbOgJxSBlz8XVM=;
 b=OolYDFCg7OlcMsqYAtEtCrjvPn9SQmYHOvhMCpWM9lli95Jj+1zu6RSP/qdA8ONAou
 QqKy1nD3X2d0t22CeN3Y/XzwHPVL0ZVwX32ceF6gRdwcQTGUxFf8zPl2zXTasKZRB73/
 1KKgTwpXBcZwPrTkdwcUSxd+9ih5UAFT+I1tFeVQw+0Pe0VTBOKDr55GAQYVScsHn2+X
 LdbfugedgDP279/TUhmdTOqLcDXGeYhJYzZj2GDtoPoVNX751tXNZlAL34apB87gbbTj
 Du8+w4ZFp0Z30ayYNEwgdTi6s6IakUpBzXNwxHZuLqesLw1wUCactcCvmbcpmNRbHD8v
 RMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DawSorGfxad1nEnazjpmhldK0G+RxpbOgJxSBlz8XVM=;
 b=jjgkJy8cH0VVK23+UfLPmSQ3uwgTtQaR90+xb0VoE/ZOrVJ+9kSbMPLZxXqsYmcf0i
 qu1xEpwbupOsz22u+liaToUXgq4A9Y2iLm8Tlban90XAlqUbZMlukFoMTAbMyAXR4yUa
 SCjqHh0u5kX2XtvtRpfWyCOOsha2MJBeHDsgeDy6D+i9iRbTBS/8ikXrnaKJemKBGyiu
 Eo6EhSGyuC/QadDpyoqhBrU6tG9S7eJl1S2fSF5TmPanwCJ3yMkZaZcJxPgtfSDpQq/x
 DLFdMp7AEEzytQriqJ7kfgaj3EQh9147Un4Ab8WrdrGGzTNLCyo/nbVgK250xFRuBcpJ
 3QNg==
X-Gm-Message-State: AO0yUKUR1k4LYMWuZbmEFhJ+aVZ7Iftbo3FK8uA1dOdGIhaTN2Pj1lpH
 1c1IQwp55IXy0vN7TgvSlAQfrQUy16rHFRKahGo=
X-Google-Smtp-Source: AK7set+Av8kLMa0wXDPrDsQ8NTNzj/LBNLkIkfB8HzhTgRuySa1cAWZzHaYq2dQU+muNiZuUjFCbOw==
X-Received: by 2002:a17:90a:190d:b0:230:7a31:b9a6 with SMTP id
 13-20020a17090a190d00b002307a31b9a6mr24100727pjg.7.1678392368088; 
 Thu, 09 Mar 2023 12:06:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 18/91] target/arm: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:37 -0800
Message-Id: <20230309200550.3878088-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Message-Id: <20230306175230.7110-4-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index b7bde18986..b3b35f7aa1 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -45,6 +45,4 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 12
-
 #endif
-- 
2.34.1


