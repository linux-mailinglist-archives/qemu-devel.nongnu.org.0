Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53924313E74
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:06:29 +0100 (CET)
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Brg-0005CQ-Cy
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95p2-0003eO-KO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:28 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95oa-0007kv-E1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:09 -0500
Received: by mail-wr1-x435.google.com with SMTP id h12so633107wrw.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fITS/ZIRcyY4uQvc1wHO8nnou5g7xUQ3JpD0PLMi4/A=;
 b=MHpV/F1e3taQvaVt2aNvhdTx5HWpgcuR3C8AF/6Mlq7sq5DnOX+2bggoMTLvpDHB0N
 SjiY5PF2doV1Z/ojPhp0VcT5LiTX3mycVzh0pXsVEJngJZ6QeZx7+ZALUYbAofMTM5w9
 3btaEzqte6LNAf5rNgWEFmN/naA0df+Halm5PngEb8fJ6KiOs8e0nmNdyFkwNyWJ6s+P
 ig2cq6/VlCx5SEA/BXnnsAnrRvC4j0reulGDO4TupbNwu3g7IlMNghgnqHwby7kdXN6e
 uPZ6td9o090GDqYKUL0JJQf0v5W3N/80b/dKZec6V+vVwQMh+RfRC42yzHMnAq7Cr/wQ
 egqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fITS/ZIRcyY4uQvc1wHO8nnou5g7xUQ3JpD0PLMi4/A=;
 b=J1nJ88sJCc5ESDkoRL8DVm7a3whdxko8rlMrcX+s7wFnrm1OTC6Vy7re/F5ntf7yTj
 QzryEo+kiJk2YFZ47Cm7Gx7071TfDhF4gzhb5YTWNPloVlmoUG1+hJ0AWTeC9vdA1t+T
 veRs3MRBqdnrIs7GDleG55cRqP31uzfJzqlqccvGF0lwSFQIHn2jEjKxrWeG1OwbMynt
 WcA87BoOPSCjFw+B0evuqyESe4eejCHurvX/oxwlMWxpeS3xNtOcZRHtgpbKSbo5JJv6
 Gsz3S8aayHcnnBxBsvg2IaHO7+XJGGM0J4F89KZdUgUqjnRNi+Bnd+5TwZUcxAgxovE9
 xfkA==
X-Gm-Message-State: AOAM531X8Siu0yfFnLycx/qjnngHehtU1Zo2PJN7q9/yicTzomA7Ng4u
 ZVxqy7t02XmnnExwD/RWWe4Olb26NbhEyyHv
X-Google-Smtp-Source: ABdhPJxA0CbMS8ALe0z3hOlQ4rAtJOvSWXGV4ZBriCrfrldj2+O57MoLQckP2J7yVQ0DGXH9YIIvww==
X-Received: by 2002:a5d:518d:: with SMTP id k13mr11961029wrv.158.1612787925302; 
 Mon, 08 Feb 2021 04:38:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm28306828wrl.95.2021.02.08.04.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D33571FF9B;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/16] tests/tcg: Replace /bin/true by true (required on macOS)
Date: Mon,  8 Feb 2021 12:38:17 +0000
Message-Id: <20210208123821.19818-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

/bin/true is missing on macOS, but simply "true" is available as a shell builtin.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210128135627.2067003-1-sw@weilnetz.de>
Message-Id: <20210202134001.25738-12-alex.bennee@linaro.org>

diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index c096c611a2..a56564660c 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -90,11 +90,11 @@ run-guest-tests: guest-tests
 
 else
 guest-tests:
-	$(call quiet-command, /bin/true, "BUILD", \
+	$(call quiet-command, true, "BUILD", \
 		"$(TARGET) guest-tests SKIPPED")
 
 run-guest-tests:
-	$(call quiet-command, /bin/true, "RUN", \
+	$(call quiet-command, true, "RUN", \
 		"tests for $(TARGET) SKIPPED")
 endif
 
-- 
2.20.1


