Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A70417987
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:15:09 +0200 (CEST)
Received: from localhost ([::1]:39796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTomz-0005Xh-0F
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToYB-00033C-Dv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:51 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:33402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY9-00077M-Hv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:50 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id a9so6724948qvf.0
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YUMG9BLv2uEtpi53x6iY+Kj4bYcd7Wn5Zd273lBD+w=;
 b=nUkAvkf43ZVpU71HQ49DEBhet9R30v4JNPpMuXHZjlitnrmgEgjbmbNLWt3gtIFMm0
 MMFemC5bEeVaP/4v+iOr7hIw+J5C71ggsaZzc3F8TToMdWa/Vf2MN9+0Kej1xdUhFNBg
 ZfWdgECkhnFRymiw9sT0EZdKh7dvI5VwCSXpQstJW+EJmE1twPPVq3QGPXRI8MUTGDxG
 p8uXJr6rvbZePRvaNgo4FjyxgpcLPce2VmTMkbZOZsRHkCNPByEoqebO3mXWYyBFibu+
 u+gS1tWWkoItVV5CbDk0HnQJkwCV05qTVr7KNUmfy9XiN7c0XDasJSsPC3Fa6AzD6pKG
 7NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YUMG9BLv2uEtpi53x6iY+Kj4bYcd7Wn5Zd273lBD+w=;
 b=FSCsVpXU6SkQS43HS9kUMs/FHDHavEV+7nHwgQE1NqU0MKgPoTn9W4CCTZ7XecX8KE
 Oz5xGiV+9UxvB2WUzqIHUyzZTUPFUvVjzZDQWI+dKqpSFTRmJGHCtYqx1Cj6xO1qLovK
 aWbDm+DDSfccSYr0lJN2lSzeaG/d/tYmgJ0fs43tZK49uQuBEkzX87Xbudr5aF2CZSvf
 gB8Ikw+7meoO6x7ibqGhD39D0fMHtlfUm6dmqDFnyLWVByBwsgIQZ0CA9l8/GfOIlUvj
 KiXu73VOe0yqH3LjIWJm02jGAlhDumiIX4STvxVCFkIVK9pGMvQmoV5l/3qQGdPtkWBr
 DOoQ==
X-Gm-Message-State: AOAM532KQYwR53Kt759PXKEvvh4QtRCnTejNJZA0b9IaOWltAmgWsi2u
 2Qx8X4sC3bzbe4LP0T739Z+0G1ExFgtLfA==
X-Google-Smtp-Source: ABdhPJwdQFb4rPF2GHwyW1e9pnyPTFC0R2bUOowBoM9vYPCTaXra4BXWT48HtNDzO4VfhrUiHhXFiQ==
X-Received: by 2002:a05:6214:13e3:: with SMTP id
 ch3mr10927371qvb.35.1632502788632; 
 Fri, 24 Sep 2021 09:59:48 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/27] linux-user: Remove default for
 TARGET_ARCH_HAS_SIGTRAMP_PAGE
Date: Fri, 24 Sep 2021 12:59:26 -0400
Message-Id: <20210924165926.752809-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All targets now define TARGET_ARCH_HAS_SIGTRAMP_PAGE.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 7b3a91b3ed..f6a4f8f489 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -30,10 +30,6 @@
 #undef ELF_ARCH
 #endif
 
-#ifndef TARGET_ARCH_HAS_SIGTRAMP_PAGE
-#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
-#endif
-
 #define ELF_OSABI   ELFOSABI_SYSV
 
 /* from personality.h */
-- 
2.25.1


