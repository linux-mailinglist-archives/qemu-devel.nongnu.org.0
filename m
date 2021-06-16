Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A713A8E6F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:35:49 +0200 (CEST)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKT6-0004WS-Gq
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6n-0005lK-W4
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6T-0008VZ-7s
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:42 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so2964350pjn.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C5fvMl6g5lyKr/RZPA4w0LgiP0MNwve4euP98chYQf4=;
 b=Wv5QKd4YmUcJS/CcEKS8WAVXMZuaiyqUG9GJix5FcqCbHVQOwW9BRgBRoIeAyc/A8E
 eafhse2ZymP9V3UVXDpIHXa5PLa2hQj70hLdPZ1VbJvMd4o9h3BgS7cJOz3286Q3H5Ow
 fGBYh/1kjz3kXcawF2I69E3f4NGrrMFGTk1HiuezR3GJEZbg1/AL4KyVHq4LDFlMUc3o
 jXklID1gf9FSqbBwRjxO+tExWuIAeikM6wEW+yl9/nlU+3cMq1xlLhkTkTxtomKkp35/
 E0memNhEkxAchdZHjfkdjPkjH4ZqcoBewBcbq/35Bwgsa/EwnvcG0TKBIWiAlgaWvvPI
 9fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C5fvMl6g5lyKr/RZPA4w0LgiP0MNwve4euP98chYQf4=;
 b=l8+PoYwUWbH4xhGh1+CMvMvZIJNXKqPG66weR/jC+CH32tKxrtGO/i5mRrZI64Jgav
 gHH57Hm1hyrvLnchFxquJ7QBVOEnez7OI9FENRvnLVpG9Y698ZZHXk1lqYj+1TScDyeD
 fiUwMUFFvIzSmsSXUbkc0JQOauJItN09UzJTeFDZDZXdWi+/6tdz0iOriK6R5b/ZrI2/
 zPfjQffKoml4QsmBESQsxOYxRvl5w4KtqPqqWRYot1nSSp/h989l3qY68uurZ3eYcpmN
 SXrYoaUhLTI61K3ujenGEHt93JNhcvRChDUs2kG6WBtvnxX2ZP+SopjkueX9jLWz/m9v
 0Iag==
X-Gm-Message-State: AOAM531sqaolcrhsdWK7qWBn5oNTE1cUlU93EN1ToRoExMdnuCO3E4yE
 PJ2DGyxnBJ358QVFujqomVIi3BaW+cGjGQ==
X-Google-Smtp-Source: ABdhPJzgGen4kdWcCwZ4BIoCtOhhxEfTG2c1R2J2Hge40COIymDoRMcrwubVRXP5SQ78Muy7mEi3Gg==
X-Received: by 2002:a17:902:9b87:b029:11b:e66e:a1b3 with SMTP id
 y7-20020a1709029b87b029011be66ea1b3mr6824171plp.33.1623805943944; 
 Tue, 15 Jun 2021 18:12:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/21] linux-user: Remove default for
 TARGET_ARCH_HAS_SIGTRAMP_PAGE
Date: Tue, 15 Jun 2021 18:12:09 -0700
Message-Id: <20210616011209.1446045-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All targets now define TARGET_ARCH_HAS_SIGTRAMP_PAGE.

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


