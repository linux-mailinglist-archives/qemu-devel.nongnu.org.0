Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90176AED05
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:00:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZban-0006PS-Aw; Tue, 07 Mar 2023 12:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbag-0006No-Vy
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:11 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaf-0000HC-EN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:10 -0500
Received: by mail-pl1-x633.google.com with SMTP id p20so14958509plw.13
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEKReLOKqjv5W6HOAYTaA99zru6Qt/dl4bD/vorfcSo=;
 b=gpz/aPlhOH2VZnF93s8Xjxk6yvtllriCviyc2CL6GktYUDsSi1VCmM9CEP3HxQU7s1
 dBTk3NXRMHQmL8GCgj/GbEnGgYNVt1VzF3DTWVaMrDgtF7lcnqiqIfo2xrx464S1pcz4
 m8WXl7myFYs37ozzSNVlzt4ZjPY45Jk8lvKsz7V+8X9Z7LobJrneiz54yfBcZ0E8VipM
 +dxHcUdVxrIl568dDiJKaeIGRKRtpqO2K+xN/7FxuHMoPVhY7+fsEI7G7CnayjIws5mc
 xPp1cI3fj+sg5BNOV2S8pAGxut9twSxSFYF1QBjrK7qV5lCgC7DJ1wDXYSyjj3mbTSKV
 jiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LEKReLOKqjv5W6HOAYTaA99zru6Qt/dl4bD/vorfcSo=;
 b=tsljqRMa5rH8L3m48+PCey96dUwi+Gy6XGX4z9bCvESnuOOIS0G7pZgCgfos8vAh1w
 OcCgQd06EIttZzrnJUfp+UYvlKlUZWMlkqaa6aqOgkU8IQOEIzitov8torXMWQjs/Pry
 mZ9shyjUcxO8YENiX7aGOTWnDeQIOxx/UYHvKid8PS3w8l71rQW5mO/35zKAfXzC3m9O
 Y6Jh//YzZk+o/+6b/iiMKgdg1cBnul/AKO4fWX20rl0WfwDPQM3X9isyZ3OIEhQuqQRR
 SfoSf1eyjSc+THDUf/DpbQPHM84Zw7fbq2iZOUFfKfmiPuAXFvCUFLuX0OKfobqj9tNn
 AnqQ==
X-Gm-Message-State: AO0yUKVEb9t0/kRv8UOKWupDP1nXai7aWJIAZGo9DCwd6Tvlf7hZWjlf
 6UBbZsYvO2CYaR8jqkhUD+BnI6blUl7T+1gWU88=
X-Google-Smtp-Source: AK7set+Y79rdO0iQ/7zpWGk9RHVy7y10G5h2ThgGAPtY0ssFKbrnBTSengF/dKu0KS83vGD2OmWz6w==
X-Received: by 2002:a17:902:f691:b0:19d:1fce:c9ec with SMTP id
 l17-20020a170902f69100b0019d1fcec9ecmr19321104plg.37.1678211948019; 
 Tue, 07 Mar 2023 09:59:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 23/67] target/i386: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:04 -0800
Message-Id: <20230307175848.2508955-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Message-Id: <20230306175230.7110-9-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index abad52af20..911b4cd51b 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -23,6 +23,5 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS  32
 #endif
 #define TARGET_PAGE_BITS 12
-#define NB_MMU_MODES 5
 
 #endif
-- 
2.34.1


