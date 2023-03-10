Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2376B4FB5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:04:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5j-0001uR-3M; Fri, 10 Mar 2023 13:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5d-0001sz-7F
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5b-0004bV-FN
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso3991067wms.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XczyquXWutz5BsXSRjc8e6sUIjQw2SVaTAHi+P9/vU0=;
 b=OW8Yq61qromx745sAK40MK9cM4xifkT1dtm6ky3PecGHoweh8+xJDfHR/+eKewcIsh
 7DNOQ/oFDhSO+dHPzqnn/LDRuFkP/GoACKySDlsUXA3afFXBNkGNoe8TONhiY6ma6Xci
 gNr3zwcEgGkeKct9VssVFUF7Qg09W2J+bgYqlv1qgzZA5FNK3Ug6DhpRIk5QTO6GMRlE
 PC3sng/A3A5Vo2Xjs9vCHEFcHMJ/D/FzIojFCkQSUafX0o07yZgS2Xx5xiEdc935e8ir
 knrIAJ7+0PZ7xM5EspCGdPG2lHk2dJL8mzc4Qy2B5Uh9q6MyQs8A5D1/c1G3kJdLM63m
 W8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XczyquXWutz5BsXSRjc8e6sUIjQw2SVaTAHi+P9/vU0=;
 b=jxp8316BssW6vCvhYsZ+Zn3X/Kx1NTmkijmphsxPdFfWp+TqhTHNEb5ty7w7GavxV1
 rpRCLn8xwIANnVjZBKcOoRhgQACBnbX3oBNG88kV0rWPE7sebCBJDga4FbW7YS2H1tfz
 +Osq2mOaGJaWDGtp091v/AjAPm0WV7GB3eH/QlO5nuGfh7SIXvDd6lNXGb6sWwE/ZDbX
 6u3h2AztgbKHAohh+SrrL/qnVAVvbPKOmGwbp4WiJ6yYRLDZkUDhifeidjjL1mCvAob9
 FmJpoF0XCT+OVGDX2kZ71ClOmKYduMtU+BczbLm8QYItObDvxnj2mt07hq+yjqUfiNQv
 y4Tg==
X-Gm-Message-State: AO0yUKW4qsWOnaS8bKn2JjUQRf746SxQfJ4kDBxH3f3wuV+YMTEHjGeP
 +9xBKP29sgOMbihiAuSyzoASYw==
X-Google-Smtp-Source: AK7set8IAg8kPxJOKI9oM1pD5cKr4HniJ3FZmAxoxHhqqS1tKwVo5PrrLM5wiSyp1ob/0FCfCtwUZg==
X-Received: by 2002:a05:600c:4450:b0:3eb:36fa:b791 with SMTP id
 v16-20020a05600c445000b003eb36fab791mr3486242wmn.31.1678471413955; 
 Fri, 10 Mar 2023 10:03:33 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b003eb0d6f48f3sm636677wmq.27.2023.03.10.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 126361FFBA;
 Fri, 10 Mar 2023 18:03:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 eopXD <yueh.ting.chen@gmail.com>
Subject: [PATCH v2 02/10] contrib/gitdm: add a group map for SiFive
Date: Fri, 10 Mar 2023 18:03:24 +0000
Message-Id: <20230310180332.2274827-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
index 907ffde017..75b55b3603 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -38,6 +38,7 @@ GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-netflix Netflix
 GroupMap contrib/gitdm/group-map-redhat Red Hat
+GroupMap contrib/gitdm/group-map-sifive SiFive
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
 # Also group together our prolific individual contributors
-- 
2.39.2


