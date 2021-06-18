Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD2A3AD30F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:44:12 +0200 (CEST)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKPT-0003xS-RJ
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBw-0001j5-Vt
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBr-0001b9-4I
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:12 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso6470950pjb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i6vIvt0pneZSp74FyENOB1Pe/9xAPO7tymkBwoPywig=;
 b=fAU6NcImZsmPlk0eKq/ocCWdcsrk+Jdv6eaN5UgT/fMvaeCHA6vXmn69zfsaLlFax/
 vuiu/PAqzK1HgifYpQd82T03KW5PpxRmi8bBXzzdAGz8yDnXYq2JbVK4kDsXILjUacxP
 5SFw0BXomsF3tpTb1O7eDQ11lAOms+UAlreFyQkxaH9NfuVSqXQPtpSBKgw7Uc4joDlK
 oXD7JWpZDD0TRvDbq1l+uYUtgr6bB3OzFCyLALC9NC19WM9a2YqkK3YDiximxUFa9Fzz
 IyyI4oXSS4p+mWlEhDCy+sDf3UtGeXPzzyMZXQx4Qap7wrMKOn2pYXrBOQFEAw4WP40j
 0nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i6vIvt0pneZSp74FyENOB1Pe/9xAPO7tymkBwoPywig=;
 b=e6Ywlqw/4Zms5nH7lVmUpWhA44x0QVDUioxn8RtrNXyK9da2aTsr2/1Mc2LhfPV00d
 MyTZL6qtyD/YTKSatlI4nVCr5EbU+hNllIn5Qf1vxVJ3EHDTAuQ4PeJjGEFDJfMtQ4ew
 fpteJHxnc/TPTWdNgeI3ud9xSDm9LBnGQoLh+Qde5HFny/pIUJAC4sj9QBrKRcNe//cr
 4g7Vfr07mxBGyHtuskaOaTAV7duXAQIFcCIOuNLa6IMKoQLbZ4bBHnAV4FaKlMOXa66X
 40rWbJmYTy3ImgNzCqDp1SJmNhKLMeVf0xuqaXzS7jYNe+baP2Cz46mAm6P/dfbpVtnO
 Syog==
X-Gm-Message-State: AOAM531jxa9vZ00X3Iyhi8N+A5v4gb9mlIYda5s8y6wVnMCGsIPQEo/K
 ipq72Lw9/grD3tPWq9SXhtSeD0hEdNgk1A==
X-Google-Smtp-Source: ABdhPJyEd1fjDwI6xa59YRosEOXN2OEe50jyFi51VD/PHbMmUlDrLRQEhZlHddPwPkoSNCIYij0shw==
X-Received: by 2002:a17:90a:6304:: with SMTP id
 e4mr12749821pjj.222.1624044605899; 
 Fri, 18 Jun 2021 12:30:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:30:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/23] linux-user: Remove default for
 TARGET_ARCH_HAS_SIGTRAMP_PAGE
Date: Fri, 18 Jun 2021 12:29:51 -0700
Message-Id: <20210618192951.125651-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
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
index 7bc67ac9cb..c0236a0b09 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -26,10 +26,6 @@
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


