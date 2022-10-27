Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D09610142
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:13:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7nD-0002VO-H4; Thu, 27 Oct 2022 14:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kL-0001Pe-OF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:54 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kJ-0003Mo-He
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id 5so1577064wmo.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nz3u3EOxgjJf9Wiqq8Dvc92321GdoFjnj2g5e+GRydk=;
 b=gdmPqbmJsvjcmgkUJrxyZZpPYOG7AvtrXNA4oQDi+mWccclbOgrDYD6A0Zmz3srRKo
 wJTbCpwT5H+EBhWnF5Gqm5gteFrnd3XygUmalcUVSM39mxspDSLYD1ZRob99CgHfskd0
 ZBcmXO1qXEtt6fYwEBuQG1xpX9QcH9EoZ21SvDfU2MO/wo5fU777mqFxF/CAqcgEYnFa
 uwfxTd9brjxHi/mX6JcAKbGd2agkST1P3kQFyo982K4Pyd5PTpgYQKxL1kMZD+6sU2qN
 qaqFzweQne9AN3j8i0cIUlCn7oasMI0D9jZ6sK1JoXhjeMPnCtKB+kR8gVd6LRUiW0ZB
 muRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nz3u3EOxgjJf9Wiqq8Dvc92321GdoFjnj2g5e+GRydk=;
 b=omK9bNnfmHl/wWm60hTaGesZt0UXy8/Twbs8VvqLmQMDu8fwkY3bOZuOpsxkQ1qkKC
 I6VK+7HpDlzO+i1DbZ3eTjbkLJ8y0vHH1NXwLAVKqWtQ7mYWyu+/6wOU1fyzF6sNUxXJ
 nBRgRL/kwEPvfChFPVe6W5cEsu6HfjsGg8IKH40CRnMa4t/t5bXhhubvIcG5sf57CE2P
 UziHi/P9JWGIgyJ+KfbyDkeF0j1hIH6shVEIlpQI17rjMlXXvmRVASHMKs5Ji06sX2EN
 e3qaZBxIRduUwBjGbu8p4+GLyhRJb3L8Sjh1APoOwYUBQGg1+qj9q37mQt93lvZkmhGt
 HeDA==
X-Gm-Message-State: ACrzQf38WzK2lQXfzp7/gM5XskRDKW8RX9sMHKyOV8xAfeDJtncY3sLQ
 lkCCJJ7+JPxFt3FePPr/zPpZUQ==
X-Google-Smtp-Source: AMsMyM4FrbYBR8ntS3NsQYD7LoXj7GwrprumDZ3PcF+iLy826uLYAqkAr744Yr4brEVuyof+k+kGcw==
X-Received: by 2002:a7b:ca51:0:b0:3cf:4969:9be6 with SMTP id
 m17-20020a7bca51000000b003cf49699be6mr7004846wml.24.1666895809276; 
 Thu, 27 Oct 2022 11:36:49 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adfd090000000b0022ae401e9e0sm1676360wrh.78.2022.10.27.11.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EE111FFCB;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH  v4 21/30] tests/tcg: re-enable linux-test for sh4
Date: Thu, 27 Oct 2022 19:36:27 +0100
Message-Id: <20221027183637.2772968-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This test was marked as broken due to bug #704 which was fixed by
aee14c77f4 (linux-user: Rewrite do_getdents, do_getdents64). Local
testing shows this is solid now so lets re-enable the test.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 tests/tcg/sh4/Makefile.target | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 35ebe6b4e3..32b019bdf1 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -13,12 +13,6 @@ run-signals: signals
 run-plugin-signals-with-%:
 	$(call skip-test, $<, "BROKEN")
 
-# This test is currently broken: https://gitlab.com/qemu-project/qemu/-/issues/704
-run-linux-test: linux-test
-	$(call skip-test, $<, "BROKEN")
-run-plugin-linux-test-with-%:
-	$(call skip-test, $<, "BROKEN")
-
 # This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
 run-threadcount:
 	$(call skip-test, $<, "BROKEN")
-- 
2.34.1


