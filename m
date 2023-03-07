Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5346AECF5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbao-0006QD-En; Tue, 07 Mar 2023 12:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaf-0006Hc-2s
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:09 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbac-0000DP-EI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:08 -0500
Received: by mail-pl1-x630.google.com with SMTP id x11so10473519pln.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fxJsCw9SAQMOOIzEn67MnkbkN5n7yiFNqsqG/gc+9ZY=;
 b=tSgCydAdQ3CSpuBMFC0CNr1mf8yeOhZhy8opDtIbzYm3rmEZMUjh7DPSxOAsLiFaXG
 VssX9ingMib2TOZwdT/kd6r/oCaIjgG2oXN8SV5HmztBOU1VFuU6q6g3Hk3MXgoBdDG3
 GTD7DPftEM2DLMVbUK2gffzRcQVMjpHKk9bsoDIQ+GWicDnojLsJSz+PPoX4WtMsW3R2
 f0JtLAXmVXiCYNmIrjTuyaqpo1mXAarYbY+tCqCom042pujRsUGw1CvsefkTIl0GeeaE
 i6qgJpzzfnBYCaaisvY1eu50bqFdV88T6TMGbNyNq1mcBTnxIMj+a3kbRxj2rwdyFt3n
 dieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fxJsCw9SAQMOOIzEn67MnkbkN5n7yiFNqsqG/gc+9ZY=;
 b=ARL2ZGp4vqKsg3j37FigBNgg0dew13Fm5UsgmRbq48U84FEYoE0S1q0pxXbiXd82Q/
 Eth18C+p6+NmzbIeK8i+EhIK24ii3G0RwU3+6sB+LXsGMAc2QVpYemflME149YESoDDF
 Pr2b7E50XZPgUsva3Yq4WtB9J+9R/0K0e5kZwz5PJt0bDND3D1865vY90u1TR4iBGEUv
 eiOjmMUWCWEO7WxcI+6B4M7EYEQfUmPhzxnkrHqoZqlx3cQfEhOoVrz7ViUFUeUOkf3D
 gUpRDNhOI1K/dShGRrznKfY1Qv9XD4Kt5V0cnRSeQUfBDiUvWqygTiT+jyZntUdyJ4Qf
 OEQA==
X-Gm-Message-State: AO0yUKVnyySPlfr9SSWIQ/RgNsQ9q0Sfk531yY9a+84qmBkMU58YXZLZ
 hjz6U/joHYruzLs/HJgZBiQCKePrGVKIlNggteg=
X-Google-Smtp-Source: AK7set+jSvjDcdx5Mhh9+qqrUX7tEruIORcXr6hdSqt71QQ3l3bOJyTie6Z08P+oM5DO1SlGd8RVqQ==
X-Received: by 2002:a17:90b:3812:b0:237:b702:49ac with SMTP id
 mq18-20020a17090b381200b00237b70249acmr16453414pjb.17.1678211944721; 
 Tue, 07 Mar 2023 09:59:04 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 19/67] target/avr: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:00 -0800
Message-Id: <20230307175848.2508955-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Message-Id: <20230306175230.7110-5-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
index 7ef4e7c679..9a92bc74fc 100644
--- a/target/avr/cpu-param.h
+++ b/target/avr/cpu-param.h
@@ -31,6 +31,5 @@
 #define TARGET_PAGE_BITS 8
 #define TARGET_PHYS_ADDR_SPACE_BITS 24
 #define TARGET_VIRT_ADDR_SPACE_BITS 24
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


