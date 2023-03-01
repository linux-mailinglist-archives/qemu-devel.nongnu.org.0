Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B516A65E3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCek-0000aP-8n; Tue, 28 Feb 2023 21:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeb-0008PT-4C
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:17 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeV-00038F-J7
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:14 -0500
Received: by mail-pj1-x1032.google.com with SMTP id bo22so342778pjb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TLkpNVzU6nVzMuBvRZY3OCTW04oVow48lJfgpIYCx34=;
 b=CSo68NO0Fz7dBGJJ64BujY2ojWaegJY2XcJRVhe7azu5iEapal+ifpXD+79RcRrxxq
 NyP/24Pazh+AlJpI6XCWiOOkj+bzTim6IooB5Bag6coqZGjfNATuSXMAnma3GUqiRJlu
 EKvCzo87YzbvG2hqPuNAu+GGH5V0+dDm4jJk6z2ZaM6lGj3RWut4IINT5uqtKgY064kT
 i4JyNffSxNT/8eDJfw5GfydNcskYQHGE09cIQDz0QAnmR1AYlErMuw1BnlcCOcSqwIUJ
 wym+Ub0RUwr1bhx5OsACZTboC7Jz2qLI6ZpaNnAPeH9QmRkZU+/UMyDhlBlm4UaSrzkc
 pbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TLkpNVzU6nVzMuBvRZY3OCTW04oVow48lJfgpIYCx34=;
 b=3FQfcRqjsZgT267pSBqBXI4KUiXwlS4i5BeHPY+0UFERQ0zV/tLzdnprQxUWkx62Pw
 HLYftFE3F3y3dISOiX+QoFjVcILlTnxU+at7nQWnxRd2vYEbcuvydt/cvmZJarIar2LC
 NCCGWkKNIsZdm6nJrh6TL5tOYZ7taUBio9QavAeJdE1N02oAgdPqADl/rKfwwh+jMeZw
 4xryv7aY99jGqI3jBodfeCWYJOa9f5zpd18rICjPGcRq11+Rx4Kzn2h1g92Ih1Pd0ROW
 Fa3ag3BzgPS7Mx2A+MDWbCcw02TGaAIfsH5M07EYI3b0bdYEXBMklTEz3G/24osX/n2g
 gdig==
X-Gm-Message-State: AO0yUKUzDu3+43HiRwJmRj8uZcuFy22FsBTJEFhEV4PjOj3vIsEHW4LD
 S0DT6JX9lJAoHyOB1EGCUlNdqja+pYaNl1ilgZY=
X-Google-Smtp-Source: AK7set8Mq7INDQkTA+vOXkTTfxAlaBckOnj5AuSxuSf5H1mCIhKNqm1clEESOzV3znP/AYW8hGJPvw==
X-Received: by 2002:a17:902:c407:b0:19d:5b5:c159 with SMTP id
 k7-20020a170902c40700b0019d05b5c159mr6434476plk.1.1677639430408; 
 Tue, 28 Feb 2023 18:57:10 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 14/62] target/i386: Remove `TARGET_TB_PCREL` define
Date: Tue, 28 Feb 2023 16:55:55 -1000
Message-Id: <20230301025643.1227244-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Message-Id: <20230227135202.9710-11-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu-param.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index f579b16bd2..abad52af20 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -25,8 +25,4 @@
 #define TARGET_PAGE_BITS 12
 #define NB_MMU_MODES 5
 
-#ifndef CONFIG_USER_ONLY
-# define TARGET_TB_PCREL 1
-#endif
-
 #endif
-- 
2.34.1


