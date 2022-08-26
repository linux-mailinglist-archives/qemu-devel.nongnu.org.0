Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF095A2D62
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:24:11 +0200 (CEST)
Received: from localhost ([::1]:59542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd3y-0001Oi-QB
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1S-0004Fe-Qy
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:35 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1Q-0002K2-FZ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id s23so1214082wmj.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uHWW49R19jP2Yvs/UREQQpbclbuebuQgL5x7aK3Czsc=;
 b=zaYxy/gI2GOKSlK+zWUv2rVfii+HUPmpdaf6INvM78A2CfDroj1p1BOz98OeucWNOE
 NWLPoM9U/4BhrzIMe3Z/iyyLf9gXevD5GYUqFeFBEdB5TfOCZi6RdTlvOizkZE24IWOQ
 LgBygHk1SIzvnAaxmois/ARS5Dr8IbFqNRdiRP6jBFYl/AdS801ZOrD19eFIkZUWVbSK
 xa8kSglTkg3Jin7Z1nPQnTtLpTm5R2PsKQeOnYdUxpbnUziDg2+tGa/evyyOa8UukteP
 +CqW3XeBbb2EphuVCJm8M/dIN7Pp3LPxPAxsOy5AXtEUdqOZib59hVq89m9bheAO9vIJ
 VrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uHWW49R19jP2Yvs/UREQQpbclbuebuQgL5x7aK3Czsc=;
 b=JJ+OgUacx3S4gu5YNA1Je18ipKAc665STGbrz1vHKYYBS3SWTr2bTCowr6Xb0GxFGM
 y1apIWqvGhgP+ApGpMzi0wzL6shMfBTmdOouCb/hJABMrJRfAwAsNOrw0GPQukR6Dapm
 zoHb+9R98sjdTZGhh8xPJ86A+IJYd4/xzH0Uj1pJdadUZ7dJ2D6DilJzrciTPLymDio0
 KVM7uD97yGYlQ9uegCXnnlLZP+4UHq0ZQlgl+mGu5VUNKSwgAtpUR6HXYOKRKy7T0++C
 VeKGxmC2slvC7wADMDL9Zcw+5nWJ6QbIbKZSt7lsXV7WxU73KwhHTd5RnZrqPZ/FPGLu
 dBFA==
X-Gm-Message-State: ACgBeo3Z7jlEPdqxwhz63E3l1JUhPfkKvxpcYpbQtn7n+67+Cr71ckU4
 HvGTOHBNYaY/OWZxZ0YWu+M+qQ==
X-Google-Smtp-Source: AA6agR6huGH7djs70cFer7ZwXCxFr3eh3PZiKlOtVYjU/SRIIXvmKZkzdcibCxlbB0WIu0y6S2tNQg==
X-Received: by 2002:a05:600c:4f01:b0:3a6:12a6:8d7 with SMTP id
 l1-20020a05600c4f0100b003a612a608d7mr350702wmq.107.1661534491073; 
 Fri, 26 Aug 2022 10:21:31 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b003a5ea1cc63csm151586wmb.39.2022.08.26.10.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D98B21FFBA;
 Fri, 26 Aug 2022 18:21:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 02/25] tests/avocado: reduce the default timeout to 120s
Date: Fri, 26 Aug 2022 18:21:05 +0100
Message-Id: <20220826172128.353798-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should be aiming to keep our tests under 2 minutes so lets reduce
the default timeout to that. Tests that we know take longer should
explicitly set a longer timeout.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 9d17a287cf..0efd2bd212 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -229,7 +229,7 @@ def exec_command_and_wait_for_pattern(test, command,
 class QemuBaseTest(avocado.Test):
 
     # default timeout for all tests, can be overridden
-    timeout = 900
+    timeout = 120
 
     def _get_unique_tag_val(self, tag_name):
         """
-- 
2.30.2


