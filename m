Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFAD2F674D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:21:09 +0100 (CET)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06J0-0007hM-CP
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wS-0003iY-2e
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:48 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wP-0004xN-2n
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:47 -0500
Received: by mail-wr1-x433.google.com with SMTP id 91so6527976wrj.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7r+PDMNStM+VkqcytyyPMRMX/yoouFQ9lhvxclzqDA=;
 b=IuCFzo2aYalu2jLZD1zQYAVtQjC/BVlmaCFBvTEk4x64Nw91We4+fF0P5nB2pcXmjA
 dDwIsebispdCysMqaseaZuholAUWfQ9+QrqG6WVYQvInAcE670UGmEQ3Za0PvP5fmi7v
 oMzNehm2R8zDyceR/i2w1O5EqTFORjtvsO0vdwKN1OnsRj+HsQVLZ5RTus8BOUwBWBKZ
 F1ZtRJyMb3OOLAbF3EEc+PjL/pJtobRDmWGdZzqKu3C7pGVn//ZSB2glXWQ9FzkCU3PX
 kEbLbS7zS00uhR7ZrTv9fr/FKW3LlW7kVv7VeEfXFctzzflUcGbVrJh9f1E7m49fRexP
 PzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7r+PDMNStM+VkqcytyyPMRMX/yoouFQ9lhvxclzqDA=;
 b=nsdUPhJSRwSplHUHJTigl+QgSiTEdi6d0govXX/CMca9HllKj2WTPWAJrLBCDKMmvl
 jb2kLlmrWIyZ+BWIH6kWSzhACZFzJuWfAI1fFfcEw8jhCkp862xzBEPdpkb2mhJr/Khp
 RIU+x2GV91z1Vd3dW2RxdrzNfbFiDGiJVuBy9nsoQyyCZiMT78qDTmJ8lIf3ZkcUKv/x
 18DsyxtvaGnLMROclesN2tMxX0PUsMlFfn6WVk7cMg8p3OcoK5rGBbH/tmOXzuep7OlV
 6tyHUkKx+CabXKPWnautilRGJQfojZYZJGS98TDdXg5aaNmR9HwyBBF6+pZdMfMYNhiq
 bFnA==
X-Gm-Message-State: AOAM533Xx7cZVvo5i6TJhF4uyHhSRj7QjgR9iPvcHrrDRH75/l2WDXko
 5hVJ7tT3zJucXCKdyEv1jb15x3FMxYeoUA==
X-Google-Smtp-Source: ABdhPJyVE2RwzXuRRMB+ZJ3hHmMxuYzMozXmqwqt3LY61JDx4jBwRbNC5lePUJhcQwncd+pB1FIPKA==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr9105440wrb.105.1610643459920; 
 Thu, 14 Jan 2021 08:57:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r82sm9752638wma.18.2021.01.14.08.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88A451FF91;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 05/12] Makefile: wrap ctags in quiet-command calls
Date: Thu, 14 Jan 2021 16:57:23 +0000
Message-Id: <20210114165730.31607-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

For prettier output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

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


