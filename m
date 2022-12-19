Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C01650B5E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7N-0008GH-7p; Mon, 19 Dec 2022 07:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F72-0008B5-7J
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:21 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F70-0006UM-Dq
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so8684539wma.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lpk65U06s+dyZSluEuERslMQwRr/+80+8FPlxBvMVJ0=;
 b=l+FVWuvasIQxbMVC+cvoN9vDHV3mbHKd+1E2xTd2BphTEUS16x7E8K/ImlbgCHNJRj
 JYu2LIybohri/6ZBfi3GNv4+LqkPNNmx/BulNO4psU5ZMP88Iqi6g9fVDpcA2I594Jl2
 Pf6tIyYqerHRCDsAb7iPjHU81xstPj3T/CwqDiFMnfCkFFBEnbJwp71BYazHjIFyokYw
 2tpMJcm//FxvqoRmq06syaIz8A0lIIm/FeJWJwoRSrtU0eUE3LIg3TW1gUaT4Gfc4U/X
 m5oOAMlFjROgD2dP+GdzXyE6I8Wnts4vY+LnsGANUNfEnJBhgIVKzCIpyRdE1dkPs6Yx
 i9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lpk65U06s+dyZSluEuERslMQwRr/+80+8FPlxBvMVJ0=;
 b=uqJWBZx7DwW6S9wb8CeL3eMwAqPRDfeG6bcFCT3zCebUfHyqjYzlAEK5IkUJhp2282
 fdvRZdzrz3nFyRwYj/lmFaIx1rzdN3AanD+wVGHHTfDmSg2iAT5s98JE1Kqj80fyTz5v
 g87647o+bIDyXjK+yPBFyKG5uN9yf0uUEkqDG8HHsIWO1pBhbiSJpmcZ9g8yXnAQvDf9
 9R71N6u5oN1nsOfQZenrG6EzYLuuvlZ90Lfb1IbKCO5bsOUrWRACNPfSw4wc8ljvs1sh
 Ec4PZ2p40rTddJ5znn9MFdZLsF0N2KrRbLMU2COzZeFEUb8QkKdy4IJaGabSANgrxEla
 IQXg==
X-Gm-Message-State: ANoB5pnoLe4PT9qSE8WiuWmk+QXRyJ09QJY9scrcZFn5EvIHKCz9f7e6
 clcwMwrucxAwYaN0PpB34bhizQ==
X-Google-Smtp-Source: AA0mqf5nbqe23BgdUJ6uGspVzrNODF4DowWw7f7eWLWLY9b1lcjRGzn8Y5zhMc4+7XcztTeKwJbBNg==
X-Received: by 2002:a7b:c358:0:b0:3d1:f882:43eb with SMTP id
 l24-20020a7bc358000000b003d1f88243ebmr31826047wmj.10.1671452357041; 
 Mon, 19 Dec 2022 04:19:17 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b003d1e3b1624dsm21334321wmq.2.2022.12.19.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 031491FFBC;
 Mon, 19 Dec 2022 12:19:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 eopXD <yueh.ting.chen@gmail.com>
Subject: [PATCH 04/11] contrib/gitdm: add a group map for SiFive
Date: Mon, 19 Dec 2022 12:19:07 +0000
Message-Id: <20221219121914.851488-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
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

Some SiFive contributors use there personal emails. Add a group map
for those developers. Please confirm.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: eopXD <yueh.ting.chen@gmail.com>
---
 contrib/gitdm/group-map-sifive | 5 +++++
 gitdm.config                   | 1 +
 2 files changed, 6 insertions(+)
 create mode 100644 contrib/gitdm/group-map-sifive

diff --git a/contrib/gitdm/group-map-sifive b/contrib/gitdm/group-map-sifive
new file mode 100644
index 0000000000..6ba761eb22
--- /dev/null
+++ b/contrib/gitdm/group-map-sifive
@@ -0,0 +1,5 @@
+#
+# SiFive contributors using non-corporate email
+#
+
+yueh.ting.chen@gmail.com
diff --git a/gitdm.config b/gitdm.config
index 288b100d89..f79d39df63 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -37,6 +37,7 @@ GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-netflix Netflix
 GroupMap contrib/gitdm/group-map-redhat Red Hat
+GroupMap contrib/gitdm/group-map-sifive SiFive
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
 # Also group together our prolific individual contributors
-- 
2.34.1


