Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760326137D8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUib-0005W7-7l; Mon, 31 Oct 2022 09:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhx-00034O-Ru
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:07 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhq-0005RQ-H5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:04 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bs21so15954723wrb.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FuI+2RfMwlKN97j1s8Agb9GCuSAKdGwFGMgYag+90ro=;
 b=oRBweYIB42c/1k4+NFtNtKZq85R7bWD6TMphX/yzEK/o03NiIwzh8RVzXRSbXImQvN
 +iuCgh9xE7ZlJ8qRorxBuVN3oOWV7KBVK2j876/dYcST8SsnNLKd8OM9JDymXtTCzWOQ
 gkof77pvAMC9d8wPN5UYYX5lB54NRp4T7zk5oRxaOxFfEAiLC3Jo9NdnJKuyFxICCZnx
 VAiwwD9Wb/LyvGqLzzkUO+AIHWKLirdYmQEpddrubiwZtIKYLk+b3T5Pz85FFnL9I65x
 8Fqw21n1yJjPFZ7vkaE2VH/U0YVKWCCEScHOxkwoU6BzRdVcV+lbQXYiB2UpV+iehCcK
 kePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FuI+2RfMwlKN97j1s8Agb9GCuSAKdGwFGMgYag+90ro=;
 b=jKem8Xi2Yv/WKo2FWdAPh2IyXdejRddrsGPYRuDD3EEEbqtOuCJ8O7Gw5r1TBG25WP
 c3Aup8SamUXauDw9g75XOeBy4AYdmdVwHo2kwjCqyVBzSewTwHk9EAWgfSSJsGHqeuD2
 ixgb3nvMyHo5BW8zWXeIMg2tqjZ1aV0wxPcH2OuPXtBoDCdixOZVg8/FSNfn3dsE1aBP
 VMoXj0wPu+YzQwtQHGAzruIS33myJr7CUGQS2x03VX+BlWe1poWJi3P8jTcd0st2P77W
 4NpoMNNo9tPDCodJw4kluascvTccqI8az0UJxriffse2TLN3os3w8lg89GspgegUtyPe
 yPEg==
X-Gm-Message-State: ACrzQf3opR9gPEsnplpp+eYmdUVUd/zWA1reC9QcKiZ6GSAsEnhZn3FS
 UbRt8RJemJ2CZWR1HhrePgor7w==
X-Google-Smtp-Source: AMsMyM6B/YiPgmsKvJTd8QsEslVBkAQQpohdJd0ZXbpkBF8caVBQKRdiVBc0KhHQScIi/sK1UArguw==
X-Received: by 2002:a5d:4889:0:b0:22b:214:38dd with SMTP id
 g9-20020a5d4889000000b0022b021438ddmr8546102wrq.32.1667222396271; 
 Mon, 31 Oct 2022 06:19:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05600c4e4900b003c452678025sm7211718wmq.4.2022.10.31.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 068B21FFCC;
 Mon, 31 Oct 2022 13:10:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PULL 22/31] tests/tcg: re-enable linux-test for sh4
Date: Mon, 31 Oct 2022 13:10:01 +0000
Message-Id: <20221031131010.682984-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

This test was marked as broken due to bug #704 which was fixed by
aee14c77f4 (linux-user: Rewrite do_getdents, do_getdents64). Local
testing shows this is solid now so lets re-enable the test.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20221027183637.2772968-22-alex.bennee@linaro.org>

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


