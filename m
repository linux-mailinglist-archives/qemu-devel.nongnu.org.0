Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD02F7C93
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:27:24 +0100 (CET)
Received: from localhost ([::1]:52000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0P8N-0002T2-RF
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqS-0006HW-1J
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:52 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqO-0006ZU-Nm
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:51 -0500
Received: by mail-wm1-x32b.google.com with SMTP id h17so7112339wmq.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eBPRRTpBQIiw9KV1Y5NGEpPUP1NHA3ZNzhEBTWGhjU=;
 b=errtOb+LNTSh3QpNuh2PuZECbpVQVduKOpQy7lG+ODURMW5GP0nYqPTFlK+1EZ2fkB
 WeaVCG0kAOBZbWw+wNp5z8Zkc8WmkLKw5Ai4QXOYr6qfm6dy5O4rNxwqhDr2xlDW9lff
 eP1CjJKktx20SG2RoBkiaKFv46Nd/y3ABAmZ/GpHnab2h3NzRkR79vFKstgOS/mQaeYh
 WaEz2QRynEHglhKyuHYwwoPTiRc0YYnb5cyVB+zO1+daH5MD2uFn/tGyNgzTWKkBBCFg
 7hSD0cGMZhFDigs9M30zyfFuQfL1FDDXhErN065hK82r5UVRn0hpfLmL3eQFzRcZJJJe
 g9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eBPRRTpBQIiw9KV1Y5NGEpPUP1NHA3ZNzhEBTWGhjU=;
 b=IIOMASUAbezTpY4xu/guVoKkZZyhea43ntbANZo64pdbtV4vbIatjY8kgdMR67Af88
 fsFSa39wA6QX+ectewIigb2teijagsr9R7qoIbu57S2VS1EZWn1bkps5eHfzZweNqfXI
 VZqKECoYg1mBr/Ujg/ZtdSvRQpBP9RcG3DHjrIX7NXPFiOAaEQlIO0YtgFhKsUVZEHzv
 TIJxcDkXHqLTA8rnSk1LjHCS8b1drwNnU8yMzKc1E//iCQ7WQjkeqLUFIArzxxfBhDdQ
 JeUZSy1CFZxzag5Qk3CUSXtRkctlsMdQyYSefsuZKF11hEFcym3VXyFCWGuenpeL0eSQ
 csKA==
X-Gm-Message-State: AOAM533+K5bYTo7OJBMetWUVbtHLTvF0etwfCPm4w7LfYlQN/O92AICU
 NKpEKJxdue5lVOFYBXm7Sz/6dw==
X-Google-Smtp-Source: ABdhPJxXdLijJgMew4xrAxyrRl6D6LeA+N0f2W8YcKzwnnpeRAH4H1fwyzVgztLMExkfbyR5u4lzfA==
X-Received: by 2002:a7b:c20b:: with SMTP id x11mr5709985wmi.107.1610716127399; 
 Fri, 15 Jan 2021 05:08:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g187sm7172865wmf.1.2021.01.15.05.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:08:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE15F1FF91;
 Fri, 15 Jan 2021 13:08:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/30] Makefile: wrap ctags in quiet-command calls
Date: Fri, 15 Jan 2021 13:08:03 +0000
Message-Id: <20210115130828.23968-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For prettier output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114165730.31607-6-alex.bennee@linaro.org>

diff --git a/Makefile b/Makefile
index 0c509a7704..bbab640b31 100644
--- a/Makefile
+++ b/Makefile
@@ -250,8 +250,13 @@ find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name
 
 .PHONY: ctags
 ctags:
-	rm -f "$(SRC_PATH)/"tags
-	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
+	$(call quiet-command, 			\
+		rm -f "$(SRC_PATH)/"tags, 	\
+		"CTAGS", "Remove old tags")
+	$(call quiet-command, \
+		$(find-src-path) -exec ctags 		\
+		-f "$(SRC_PATH)/"tags --append {} +,	\
+		"CTAGS", "Re-index $(SRC_PATH)")
 
 .PHONY: gtags
 gtags:
-- 
2.20.1


