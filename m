Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A556B2E2E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWn-0004Tk-15; Thu, 09 Mar 2023 15:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWk-0004Qj-9q
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:14 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWi-0000k9-S4
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:14 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so6580736pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCDjBjiCZjJWXyDK7u8JxQ5mqXZ6fyxdv4ApszjOe3Q=;
 b=vsgqGd7xnMF371tXL9XW/PFT0SDqXSF1sajUPaktrj8RBffKMs/5ZDuikVhRuwosqz
 INHSMOmTguL10dcuGpVWa6ujBvwahY+NQAcD5olH7gRZEmTgnnwOhyU+vbbLm9M7AwA5
 J6gXS6N+sZ52y3haduzzpeSaDQg5fDWBzfNKkcDGY2PeapqUwy1JQsHWUedMzT7DCoRb
 7/aY1Z2xjmjRUJB5Gj+4wqzH9QUiTGRCjmNP91BJocbXnq1KdGyeQc64BjxyseA9YsdP
 +sredndALWwBSWNMQkhoBgeCmTBpQLonmiB4gbpgFeTMWCK6Bqu9h0/LGcF30ulHqsYD
 fibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCDjBjiCZjJWXyDK7u8JxQ5mqXZ6fyxdv4ApszjOe3Q=;
 b=2K+A/O/gJqN/K5fPn24Rm6k/YRYo/IzehCaR6oAgefZcuboivjQiaWWce9XPkJ8XSl
 TLKU7G7kK2B4fgF45VEhyPnLlOSJFfhMwDNwi9WvFWYGFtLwg2zS3nqCVnFi3RUUsebF
 tKc1FqWqkb9iHs1yYRIFemNnR9XUVf+SXPVIiTtWhJNBs9EpLGm0Cf/a1kfU3AdsxuxC
 3P/f3D3IFxPE2rNJYzBmie5gH5cIVrwbkChv2vB/3ASlYWPzoIqRKLd+HeFOYrtoetg/
 XvILEaAGVhUN21QNQH9fSaAFfi6Q0WLivhtS4ChTmtlbEMGbRPNMeCnfbqpUFn26Wprb
 aS+w==
X-Gm-Message-State: AO0yUKVZD7OlUKR/KlQXtFO1NdiPeUq9S9It+dma/CJdBEDyiSrIrLKn
 3bpBbWXnjixSk4uHPMU18C4fJlfsj6SfS6QjJSs=
X-Google-Smtp-Source: AK7set/3WeuXwQQz4ArgLtAL0CsyDoLPohFKtOsSw8W446NlIQPzA3rLtnP+Y0+azZqWQYvApgK0CA==
X-Received: by 2002:a17:90b:3b89:b0:234:ba6f:c980 with SMTP id
 pc9-20020a17090b3b8900b00234ba6fc980mr24542386pjb.17.1678392372168; 
 Thu, 09 Mar 2023 12:06:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 23/91] target/i386: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:42 -0800
Message-Id: <20230309200550.3878088-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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


