Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8214AA19C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:09:54 +0100 (CET)
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5q5-0004RF-FQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:09:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WY-0008Vt-0L
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:42 -0500
Received: from [2a00:1450:4864:20::429] (port=36776
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WM-00089o-BJ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id u15so13485241wrt.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDJAuZNRUYETqEl8Qe7mgcrxpi3O5M6kuT0AcxY8xgk=;
 b=wgjo94IBNevQk0+32gltuKEz+UYt3sqXatWewAIxuUhmlbPEQe/mfaiF4D2q4yQ/tV
 VHfzRma0pQ6y5hbxg21kHsz5PvxsXjor4Ui+iTExOzWAiyMQ5wGWvkySrNEwYNut+D5y
 i4xDQlSMlyOkeDgl5pGkIH8Ny9v+kR0XBV0HV8+QdwwKM0lqExvRAQgpXb458KigtxXn
 AlUcWCywxPPJCihn/fXa3QAynL6NErU5TALPNiH3Hp28BRQXmOf7xdcCInB1OdWPkQTU
 PJi5qlY/5EOXey2Uyq76rTLf4aOrJHvEfH8RJiKdyTc9CZFkdgoIx78UJmjMplDr+xAU
 sQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDJAuZNRUYETqEl8Qe7mgcrxpi3O5M6kuT0AcxY8xgk=;
 b=w3ZOuWAKiARSh3BsdFtwaOAx0VGU+nJ7FuOaqeC0r6jeldBPnZwu6caz4v0c3LGPOC
 wbTHyOleUcLcHf/+bfl/LCkOzLFN6OzRwasWLbt10QzDl/Wg7/hnyUshFU+XHZ459bbA
 odK9DcJ7DKauGrw6ZD1eLnOnL0SdrdOuujW4XjFjcu15fSLkxzoS48/W7cXaxMLOvVpf
 Tse8lOk2ALBsn9s5ii0mmjaj81fq/fzXZr5qiQDHz9Uh2+HWOwCUTUn7LXWD9Arqzf38
 D4IUH8LcHeNzwPnZ0XQwHp/XdpXUHl2q5lLhlw0oV71gNFNCpqnXSlMryaZTsJjy5LYg
 9P2Q==
X-Gm-Message-State: AOAM53150jdJQpOmX590y9JdXX2yAD5MsQl1sdFFlOWAtr7uox3psis4
 /h4vvxCMuOym2L98PKpn2YNEUA==
X-Google-Smtp-Source: ABdhPJxx5IGSjLcBunD9gZa+kLpmvSMCnAwBl706MJvGfpPeEWpba/NhflRArNeNk8pwyWtv//ZBwQ==
X-Received: by 2002:a5d:554b:: with SMTP id g11mr551578wrw.168.1644007759661; 
 Fri, 04 Feb 2022 12:49:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm2529984wry.33.2022.02.04.12.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA04E1FFC8;
 Fri,  4 Feb 2022 20:43:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 16/26] tests/tcg/sh4: disable another unreliable test
Date: Fri,  4 Feb 2022 20:43:25 +0000
Message-Id: <20220204204335.1689602-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, Yoshinori Sato <ysato@users.sourceforge.jp>,
 f4bug@amsat.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given the other failures it looks like general thread handling on sh4
is sketchy. It fails more often on CI than on my developer machine
though. See https://gitlab.com/qemu-project/qemu/-/issues/856 for more
details.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/sh4/Makefile.target | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 0e96aeff16..620ccc23c1 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -18,3 +18,7 @@ run-linux-test: linux-test
 	$(call skip-test, $<, "BROKEN")
 run-plugin-linux-test-with-%:
 	$(call skip-test, $<, "BROKEN")
+
+# This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
+run-plugin-threadcount-with-%:
+	$(call skip-test, $<, "BROKEN")
-- 
2.30.2


