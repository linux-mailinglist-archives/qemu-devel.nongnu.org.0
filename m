Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450736AED61
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:03:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbap-0006SG-Fu; Tue, 07 Mar 2023 12:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbai-0006Ov-3x
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:12 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbag-0000Hj-Bi
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:11 -0500
Received: by mail-pl1-x629.google.com with SMTP id i10so14994410plr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCv8hLvR12zb0GhK9inws+fKF9+BKihLEv8bu5oRR7c=;
 b=fZ72aq1I+9520oZ87jhMNQRRVeG2tym45zH2RBkv1KtBEoqCrzdgPBxvBlvMNof+b7
 /iZYY5AHnYdwL4azS6YHcG3QyN4ggZ50+tTv3EPUK2UCg62I2rBYHD9SabcyqYMk7YIZ
 sKQRLPDbgT4HsM+2JXu0yzEQMjk9VtDBr/GWSYy/uIo8bqe3l+ZN4Y47nUWS4WjcYdP1
 CzRWNgpWiUoHBCCOdhq9yMYhkCha4ultVlgHXbsclVOa85xrbMak/hoKtgqttCpNcvWb
 0C3S+s97cBbiI4hWDImVDWzrIv0KnKz4qEH0uW0GyqIEBRKwlY9LbPk2mVz9nAAAvF4f
 IuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCv8hLvR12zb0GhK9inws+fKF9+BKihLEv8bu5oRR7c=;
 b=JX9X3pETTX8zXSZ/uzPhygLAWk/Y2M4Xz3O1W/TWSPeUtdWVjQ1kDfzS+LKZZeVj7e
 tDuRScgue/l7u090EMhJqQb3SMY+TFdoA6L6WtrBVfKC9P/RnXeTYFdRVnt8dWMv0ZYU
 3lvLYj+EfiMr5tbi4k0rucWxQH0YJOWvIibeNhzTSVIl0gCEcqeUyQIZdhnwVZKbPrx2
 rru4kH5wlqH3JcQtfhSyEusbiOXfxsIqfPhmzzpSZ8HjkANcoWFRmsbN1HhCh104NwLA
 O/Y25JkoydluYUPgVBtEnUdWDGqHIWbvMjZcNQBXginbTv/u+aPm3JSJogmOaS7oCkth
 vAEQ==
X-Gm-Message-State: AO0yUKWDXr2mI4GRvzeVrySKUAImy8l/9a8Z3HDc2bIr8vw1yUBrPZUJ
 S2+Qzuhw/ekXCA8ttj6ZXOnQrDDlxrZ/3fU9xe8=
X-Google-Smtp-Source: AK7set+6Cee1+CPEsScWnCoXxq2LPYAgJ++ifwaE+4qE6ZSFUzxA2yekdzDXKYcIix0Rmnowx4qx3Q==
X-Received: by 2002:a17:902:dac1:b0:19c:13d2:44c1 with SMTP id
 q1-20020a170902dac100b0019c13d244c1mr19818241plx.15.1678211948838; 
 Tue, 07 Mar 2023 09:59:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 24/67] target/loongarch: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:05 -0800
Message-Id: <20230307175848.2508955-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-10-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
index 414d8fff46..1265dc7cb5 100644
--- a/target/loongarch/cpu-param.h
+++ b/target/loongarch/cpu-param.h
@@ -13,6 +13,5 @@
 #define TARGET_VIRT_ADDR_SPACE_BITS 48
 
 #define TARGET_PAGE_BITS 14
-#define NB_MMU_MODES 5
 
 #endif
-- 
2.34.1


