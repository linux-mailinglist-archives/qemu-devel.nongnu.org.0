Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A396E485519
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:54:14 +0100 (CET)
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57g5-0006uM-OF
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:54:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n574l-0001J5-BM
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:15:42 -0500
Received: from [2a00:1450:4864:20::432] (port=41913
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n574a-00082I-6E
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:15:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id v6so21612383wra.8
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WGLxwgFRPYMKnzIwGeKxONT31IWtB3S7Y1yFhg9IfIs=;
 b=qGuWjA8lT3+yVaZfPYBL5ZjaD2Lw5uPCv3lsOZtk24LURxeDJXmGMOX+0JeVAxjgbx
 OcYD0skv/6Xb24xqHK7DwJGqa1lHdzukgSLw9DzXK4QumrUY3f0xm/6a2lpHR6ois8Ge
 FD7ox54/qrNVKvrQ28ynsDnwrxok56yw1PU86jMzAiEPli99vS6HeZsRGRt9qU7/ktq+
 3nWVU9Je/qT62WSzTWAi430RrLbXXcI7AeLsOPtZRy+U9+BY6OgwF7gEA/ErxXWLzsim
 n4z8I5ijRTYZjoccDGTj67PnvV0x8kAKZvszsteIX16bwcdomYUd8eIFvlQXi9/cTGhg
 83VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WGLxwgFRPYMKnzIwGeKxONT31IWtB3S7Y1yFhg9IfIs=;
 b=yf/HupUPc2/Fw4hPubTEsoZekgcrhzGXhvWEkfgvyvhnfpLvjNbqSgD1rn+Pj03Csy
 CjzYkBtgraiB40ugMpQU6ZXAfmuzXNkrQ5JFMCsd2ig0vunN/hMu+V1i1vZqAe2mGQK1
 Az4Rja3Uny8dhVhRK1MPCN7EIKLwSkAISL+jGFcokN0rihCsgVURZuxrg/6ViXGNGZXl
 WAyKf5JrhBZ99RHWbpfRNGrIveHwliEbGwNwiS9z5QBPe5Xh4RzceySmLStm1YFhcYlX
 X5hPLT55nJq4nZY/YkJ0KgYIwsvoYumFop80w7L/BHMQzNr857h67MVjpEhDmv1raxDh
 L+kw==
X-Gm-Message-State: AOAM530zPsyUjzCRB01LNcMmn3tZdt/kpyquG/gv58w2AmmYkVcgaDqw
 JnmFhH6MFAaApJU3nnkYr7Paiw==
X-Google-Smtp-Source: ABdhPJx9HtQGGyG/JcIuTfUoSweYIWvWuin/h2cP1tSvRBwqy4ZJvjFLU+68sEQ6j83qVNOTwjHUMw==
X-Received: by 2002:a5d:6049:: with SMTP id j9mr45104476wrt.332.1641392117365; 
 Wed, 05 Jan 2022 06:15:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k9sm41049434wro.80.2022.01.05.06.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:15:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89BF91FFC8;
 Wed,  5 Jan 2022 13:50:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 16/34] tests/docker: fix sorting of alpine image package
 lists
Date: Wed,  5 Jan 2022 13:49:51 +0000
Message-Id: <20220105135009.1584676-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

"python" sorts alphabetically after "py3-xxxx"

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-17-berrange@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 5a1808726e..ca4b3b58d2 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -35,9 +35,9 @@ ENV PACKAGES \
 	ncurses-dev \
 	perl \
 	pulseaudio-dev \
-	python3 \
 	py3-sphinx \
 	py3-sphinx_rtd_theme \
+	python3 \
 	samurai \
 	snappy-dev \
 	spice-dev \
-- 
2.30.2


