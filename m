Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14D2EFB74
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:52:48 +0100 (CET)
Received: from localhost ([::1]:47156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0ch-0006HQ-RQ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TV-0005xi-Iz
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:17 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TT-0003Jv-Ui
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:17 -0500
Received: by mail-wm1-x32f.google.com with SMTP id n16so7530133wmc.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+tNfZXks0AfgGeVgRmCcNJ5lvfvk4oLjTnHoH0ByjE=;
 b=vxzxJ5uqRBBtdE7LfMGwX3cS4hUiNOSHDcQ6Kaxyk+diFyC7OVHjTd/4bjFwpRq0vt
 003gdmEeAra5M7OKqOzKFX/BEkvIDCOfD4Q/kHE4sDH3HgLafdTu33wgDA9O+hKo4dLB
 PrkzphalGGCL0I3W/6YF2puasAQ6KExBiYnyb3KhwpyGNS2ux0QNUoZJL/vOMACu0MdV
 a3lfac2nxi8MGoTlUTgv3IaHIUfjs9lzvHvyEOwr/pJthfvy+lLlqO3+StSv4D1fNDt2
 nEtFj2ghXDP1a6AUulKrvbJ0c9iTrXLGrcOVKCn1KUZDJ6lvhWL1OqLcZlja7f7BKfwk
 DWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+tNfZXks0AfgGeVgRmCcNJ5lvfvk4oLjTnHoH0ByjE=;
 b=CWTFu9lk1WEB+0hxaXQIzT9puh808izbkn8A9zd87k2V7BR78TRk2OuSPfJwxKEbrU
 lH7MuS9X/gFPLlrKQ/D3q/35x4hgtywNRqI4s0FX60NWOWncPQK3r2daoRPtTUYlHoKw
 aBVKqLTz3fPfPzW+21V08+Jxz6MYsQS9SHc1zeCBpZA1vlI7Y69Z8eIn3eoCVIG6690F
 4lTggz5HZpCBIg/0K1bu/ww7bqW+KH9rV2GLnZ82gTdBuPBKUmGLQ/Um4IMqPcy0d1mX
 qoxCIvkSJ2NB9K/4pt3oow0by/S/FX4MCnIYGSi0n6fwIsdIYNemaCJxuDBY4C38d/Y8
 R7xw==
X-Gm-Message-State: AOAM532SbDaiy6b4pqr5VbxgnTD5m1h9i0NKqAYoMfB7ACVLSKfZpCBA
 7//JDpkXbulbbdAZ9EU3AYSg33b/0457eQ==
X-Google-Smtp-Source: ABdhPJx/28yB5vpA+18iKiJfxmH3j5Ixi5JzXtxipmv+HW0b9FPXZl5mkGN/JEedII1KtaP3OCGFTw==
X-Received: by 2002:a1c:df57:: with SMTP id w84mr4850639wmg.37.1610145794761; 
 Fri, 08 Jan 2021 14:43:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm14908433wro.40.2021.01.08.14.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:43:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07D521FF9A;
 Fri,  8 Jan 2021 22:42:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 11/20] Makefile: add GNU global tags support
Date: Fri,  8 Jan 2021 22:42:47 +0000
Message-Id: <20210108224256.2321-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GNU Global is another tags engine which is more like cscope in being
able to support finding both references and definitions. You will be
un-surprised to know it also integrates well with Emacs.

The main benefit of integrating it into find-src-path is it takes less
time to rebuild the database from scratch when you have a lot of build
directories under your source tree.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile   | 9 ++++++++-
 .gitignore | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fb9923ff22..66eec99685 100644
--- a/Makefile
+++ b/Makefile
@@ -253,6 +253,13 @@ ctags:
 	rm -f "$(SRC_PATH)/"tags
 	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
 
+.PHONY: gtags
+gtags:
+	rm -f "$(SRC_PATH)/"GTAGS
+	rm -f "$(SRC_PATH)/"GRTAGS
+	rm -f "$(SRC_PATH)/"GPATH
+	$(find-src-path) | gtags -f -
+
 .PHONY: TAGS
 TAGS:
 	rm -f "$(SRC_PATH)/"TAGS
@@ -279,7 +286,7 @@ help:
 	$(call print-help,all,Build all)
 	$(call print-help,dir/file.o,Build specified target only)
 	$(call print-help,install,Install QEMU, documentation and tools)
-	$(call print-help,ctags/TAGS,Generate tags file for editors)
+	$(call print-help,ctags/gtags/TAGS,Generate tags file for editors)
 	$(call print-help,cscope,Generate cscope index)
 	$(call print-help,sparse,Run sparse on the QEMU source)
 	@echo  ''
diff --git a/.gitignore b/.gitignore
index b32bca1315..75a4be0724 100644
--- a/.gitignore
+++ b/.gitignore
@@ -7,6 +7,9 @@
 cscope.*
 tags
 TAGS
+GPATH
+GRTAGS
+GTAGS
 *~
 *.ast_raw
 *.depend_raw
-- 
2.20.1


