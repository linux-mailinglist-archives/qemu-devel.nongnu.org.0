Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EFA610110
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:04:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7sX-0005Vm-A4; Thu, 27 Oct 2022 14:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sA-0005S4-Pd
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:44:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7s5-0004jG-De
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:44:58 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so4830579wmr.2
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cs5TmjKcezt3JkgcMGANiOUnBXiwoc0FTsC3HKa90do=;
 b=jeZSkZ/P+mWWloCmi2504APHgOP+BT4zV3GcbigWb7KYflO+172AFQVCXoAIYusLQc
 TkeF+8dvDXkAy16BOPkcB05LO8DzsjCgCe7K34jB0tvQiWQlY7I/3juRjHKHWkKqBVTI
 Lb2z8D/UV4LmfsMAo7tvwt1uSjoz5UcZx9hyTf9pDJ9fXYQQ3grvEON0ts1ev3c6ImBN
 xvSmVnAIsIuY+ZYO5Ex6cMnULVqz7IfPz9zsezJ3sRqtoWzzIFj0p668qv1Tk9VOnARI
 txv7P3jvSW6DgWKS7HizWiyBpHtvm8VHbx/ecmj5LmUVT5NRxqYmhkdadzY3XxArROFE
 T4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cs5TmjKcezt3JkgcMGANiOUnBXiwoc0FTsC3HKa90do=;
 b=XRaN6cvMrzgWRkzj6gBbdQXtGsxgOuH/mwBBSCOB6wBlE2JttxuxRbatueqMQKabXT
 6qS7wgjCSaxJF0CmAmjB9lG9ATOYq5276KTTEqiT3YYbXR50yBFb0OQyE0JRTBF0xCty
 EZGjGH+pOAt/1Ee4An8dWlx1yTG3wjus4UNLJ/Ts6DiaeDy0lATzPIIOq9PyyN2Qvdwb
 7Ixtbe2s6XUH7fi5wMdtM63pTnZDgn9cFcGRHvPYjjTC1JR/mXgpklmtvtMdLjIQ5ynx
 wlDAtFiphgeWnmmHvU5C3Q6oW2PQouYiDVJTX18t75YaKm7t8IT94KrquR+8yTzEFZxR
 gKTA==
X-Gm-Message-State: ACrzQf2GzFl7QPcM65ZfkJCNl56ppzqXNkn5vYtGwmkC7t76qYycnXFd
 nRnsgkOTF5TLzZitlqpfjV7tcw==
X-Google-Smtp-Source: AMsMyM6TgDznU4231QY8VD1FW6UNH5G6gdF7ukpNke5+K/ZDKNh5DMKZV6e9RdtPOIHVTGxtmEOQ0Q==
X-Received: by 2002:a05:600c:3d13:b0:3cf:4d63:243d with SMTP id
 bh19-20020a05600c3d1300b003cf4d63243dmr5976892wmb.24.1666896291812; 
 Thu, 27 Oct 2022 11:44:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a05600c42d500b003b492753826sm2083113wme.43.2022.10.27.11.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 641831FFCC;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH  v4 22/30] tests/tcg: re-enable threadcount for sh4
Date: Thu, 27 Oct 2022 19:36:28 +0100
Message-Id: <20221027183637.2772968-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This test was marked as broken due to bug #856 which was fixed by
ab419fd8a0 (target/sh4: Fix TB_FLAG_UNALIGN). Local testing shows this
is solid now so lets re-enable the test.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 tests/tcg/sh4/Makefile.target | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 32b019bdf1..47c39a44b6 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -12,9 +12,3 @@ run-signals: signals
 	$(call skip-test, $<, "BROKEN")
 run-plugin-signals-with-%:
 	$(call skip-test, $<, "BROKEN")
-
-# This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
-run-threadcount:
-	$(call skip-test, $<, "BROKEN")
-run-plugin-threadcount-with-%:
-	$(call skip-test, $<, "BROKEN")
-- 
2.34.1


