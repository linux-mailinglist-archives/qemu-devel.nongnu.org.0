Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B22F677C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:29:32 +0100 (CET)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06RA-000170-1u
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wS-0003kZ-Ks
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wQ-0004xo-6a
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:48 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v15so2851119wrx.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yU/oPNCcQU7/4kC+ZCz+tw6aTovOGv7Kkq2eB/9h1SU=;
 b=aKMEfA6TO+MX9/Wjuh/EzNaU18awEx0aH6A93uHmtFxbIXuBq2byKaK9lUwNQxpdZs
 Tj8wv5JrOmwMqGB/2ig8Iij7eirPn7IExD7i/qnSX9EbwtR8qVL83gSV8XxTdkxXZ9gW
 BfQ/f/f8ZPNoilDij5zYP/7MDyQaaXqKpqJb6sme1xzmwqntgyHDdv6j8+ZV/nAm6DSD
 IKS9sB+2+eocz1eMnOLK/gKljp4J/Vx8iLUtXRLFKxUG+PgHsPkI1AcN8XcYGcorJ/hw
 Ire5J4w48WG5LlURsyODNup7NW5EaON82yKTGEGnAcbiuFK0UofP14Z4qx9j12MHHhkH
 ViOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yU/oPNCcQU7/4kC+ZCz+tw6aTovOGv7Kkq2eB/9h1SU=;
 b=EgkkMwIvC8p2y5zZp7oCZvdIYdl2iDs7Bvio4u/qZTnNvhD+TGOV21qjfS2wVNqB9F
 qxmnwfJLyerhtKD0aIbt/Z30vL/jgR+Be1E2MRnxCq03V87ddkhBOXvi/VWuFKT2F9LF
 WIy8ePbqymIbiKTr0uhdBYEtCrknY18KSaoC8sPcWg+WeOQ2Fzzrh3PHeu1PSQ8oWcCT
 6T5TDveAEIfvs6e0wNxoQAGc+lDoeDNr/Em55aCRGYkAwlBc8z+ErWFt3ZYc5t79FFV8
 OaoKJK3GJARVduq/xLfHcun9rZ2fhwq88c/svx+hNdhn1Zw2lMihnAuZ2gGsFaPopPIZ
 JxMQ==
X-Gm-Message-State: AOAM531Lcp61/46cMexbvCNiHyZtgz7PzfmvtdaciYdxam/UQAsQcRsq
 DEsDbtfOpOUo3JaavdR3apJQsA==
X-Google-Smtp-Source: ABdhPJyjysrMAdpP18WpG+bTET4PBRReERhqyqR60xl1Mj6edPE7cS0H6t8LwNpY4sidLrdeTOlVZw==
X-Received: by 2002:adf:eec6:: with SMTP id a6mr8770092wrp.239.1610643464885; 
 Thu, 14 Jan 2021 08:57:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c4sm9347362wmf.19.2021.01.14.08.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2F711FF93;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 07/12] Makefile: wrap cscope in quiet-command calls
Date: Thu, 14 Jan 2021 16:57:25 +0000
Message-Id: <20210114165730.31607-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
 Makefile | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index f7e9eb9f08..2a926aaeb0 100644
--- a/Makefile
+++ b/Makefile
@@ -282,9 +282,17 @@ TAGS:
 
 .PHONY: cscope
 cscope:
-	rm -f "$(SRC_PATH)"/cscope.*
-	$(find-src-path) -print | sed -e 's,^\./,,' > "$(SRC_PATH)/cscope.files"
-	cscope -b -i"$(SRC_PATH)/cscope.files" -f"$(SRC_PATH)"/cscope.out
+	$(call quiet-command,			\
+		rm -f "$(SRC_PATH)/"cscope.* ,	\
+		"cscope", "Remove old $@ files")
+	$(call quiet-command, 					\
+		($(find-src-path) -print | sed -e 's,^\./,,'    \
+		> "$(SRC_PATH)/cscope.files"), 			\
+		"cscope", "Create file list")
+	$(call quiet-command, 				\
+		cscope -b -i"$(SRC_PATH)/cscope.files" 	\
+		-f"$(SRC_PATH)"/cscope.out, 		\
+		"cscope", "Re-index $(SRC_PATH)")
 
 # Needed by "meson install"
 export DESTDIR
-- 
2.20.1


