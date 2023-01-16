Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7E366CD16
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:33:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTLh-0005Pm-8b; Mon, 16 Jan 2023 12:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHTLf-0005Pd-Oi
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:32:43 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHTLd-0004bn-Rn
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:32:43 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k8so13690420wrc.9
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I0FrZ6m+/DDXlf1KBSDr4ILm73xZLFUqafMmPw3ilEY=;
 b=dpFglBZ/cYvIB5IQLvEhl9ck0+qj5eAQZYgLKYVgOZn3mV2KC6fr5KfS3gQQtqovUb
 pVQ5XKghTUJwLXLFpBDbW7xTNF698RzwhGNqf3xNppKCtKdTXjfb+J1sWecpEqFVxVVy
 JaHFrsq/ZWA0Zrek5kC6cis2JKJjgXuV+sBf9GGhRdurlxGFKIQSuQVxE6kkLcQWcEAT
 0iRvS5/N0btbEvLULyZlfrVuV0Vzb+A9vu0oEYKxMepONkNXhwlM+4fEPg/O0sQDBByJ
 Dlw8+fHyF/ZSVjftvZbdCI+2FamidFrVT1nW6MDxtkO04Ig/M7a68vq21Vqi59giuH+9
 CP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I0FrZ6m+/DDXlf1KBSDr4ILm73xZLFUqafMmPw3ilEY=;
 b=N2q5B+P9OvXPQp97z6NYtttomk7wQEV4Ayl362+MjNImXtmHY8zZqluLIp40disr43
 1kK8QRyUT0TuPXtHajS/qA0JVbVeg5MwYD6sVy9RVAXA7z/bQstRrshtMVu5/huU7565
 L0bgIW6lX0g+dXjnvmovhikr8CbDInokFRg/pAtK6CxDxLY3S5M5vrtDs/Io1MBHpcbc
 jnV7cpvGN1kbwqxhDYuwNRpmJCELRb/kGBOhV/JVQlNk5KQFCNaLge59G8+yQZ82l1rN
 wCnJGSKF8lcZGhkbBSWp/BMjWNEqR96p0Mb7ONZlZM6qmBCD83P1SBtiqeHlplwJWWgJ
 l3BA==
X-Gm-Message-State: AFqh2kpmmoDyapGniauLY86CceHkkiXDSwBnJBYGMr8vn/ZEb8K2f/lK
 +eVh3DriY8Dla17Ko7sgsuNk93Q21iM72n7D
X-Google-Smtp-Source: AMrXdXv0KV2Nw4eh3QYK2K+H40HvgrHZY6YO4XaS3VZqNcdhk4yCMpm6EWuECIiK8YwNDZcjd0m/IQ==
X-Received: by 2002:a5d:5451:0:b0:2ba:4ee8:d708 with SMTP id
 w17-20020a5d5451000000b002ba4ee8d708mr264624wrv.32.1673890359934; 
 Mon, 16 Jan 2023 09:32:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bx11-20020a5d5b0b000000b002366f9bd717sm33197607wrb.45.2023.01.16.09.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 09:32:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F37D1FFB7;
 Mon, 16 Jan 2023 17:32:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH] tests/tcg: skip the vma-pthread test on CI
Date: Mon, 16 Jan 2023 17:32:33 +0000
Message-Id: <20230116173233.2948746-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We are getting a lot of failures that are not related to changes so
this could be a flaky test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/Makefile.target | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index e7213af492..ae8b3d7268 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -42,6 +42,15 @@ munmap-pthread: LDFLAGS+=-pthread
 vma-pthread: CFLAGS+=-pthread
 vma-pthread: LDFLAGS+=-pthread
 
+# The vma-pthread seems very sensitive on gitlab and we currently
+# don't know if its exposing a real bug or the test is flaky.
+ifneq ($(GITLAB_CI),)
+run-vma-pthread: vma-pthread
+	$(call skip-test, $<, "flaky on CI?")
+run-plugin-vma-pthread-with-%: vma-pthread
+	$(call skip-test, $<, "flaky on CI?")
+endif
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
-- 
2.34.1


