Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C9B69847D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPc-0006nU-5Q; Wed, 15 Feb 2023 14:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPN-0006iS-In
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPK-0001gO-QU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:37 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so2355723wms.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ksx/F/K3dTVIJkDAMxrmn1DlQigNnBQDzfuo/jbZ/g=;
 b=IJmBD5hYpXPfk4f5QZVrf03H181gFhyxu0mw/GRc4K/qRZnM8nG3sexu5N5TVXth27
 NNVfLIIqEtbKL1gGz0oJacgBLeRH+8KguFODYylIVk4TpLmD146Z76pmYma8DudgGdMl
 6wvkimTRMcK/QKJE0tqb68uN8Ogx8wgkrDm9jzpyEHwRhB15P7GrDQvaGQploIjLg5qE
 1ohP2Es+F26fsLOOdA2EN579q0dTp1Cx+BFWJKPtcF36MBb+Cgp75FljfXHSsdJUK0TE
 487AIpgev0XxrmS/qPz8bwraCOZg7tRb732Sf7dLnPktPU0m5Sy8hQktwMv9eYRP8p+j
 PDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ksx/F/K3dTVIJkDAMxrmn1DlQigNnBQDzfuo/jbZ/g=;
 b=1MazjoJYWUYpo4UcqpOH+6Yu1Ff7CAb77SN0aj6c47b3rkQXveXY1NOnRgoMsCaxjC
 x7cM64QOmCgR83k/tV6V5tR+eNsMzYR0qqZqm3FlfgxnNC5MFzIXsk6t56duArjRGG51
 uZljCBh7HX2sGYdbXsetC/d1hLpyGIbqNx/4SqNx57JCLlEY5tVv4hNUlYw7IynzDFyZ
 4aOi32CI30o4XBJn5xiR1Cu7tjGDakq1sOHo+t06cVwZWpA8m9/ICY0xVlET/07H6OZg
 vr8FqaRkaEbsDRlFpJ2CF7iDDxrUUhs/42CfyBDO/a3a/Y8SDY7cCcQDvW6hKQyHmiSV
 tX7Q==
X-Gm-Message-State: AO0yUKWWJ/lv3OLsSmE5STR09jmWomYBKC1ZUPVABMpwprLvjZAjY+kP
 60qIDvICqMNVlBe2EKfeYqSoNQ==
X-Google-Smtp-Source: AK7set8DEhJRm/f86KmuvZHH8GVdyFp4YTJb52xmtRaeXZae4bd5tmQWV9UkdePs7zcSXb5PBrHXwA==
X-Received: by 2002:a05:600c:1714:b0:3df:f71b:3f68 with SMTP id
 c20-20020a05600c171400b003dff71b3f68mr2764924wmn.39.1676489133219; 
 Wed, 15 Feb 2023 11:25:33 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c188700b003cffd3c3d6csm2742432wmp.12.2023.02.15.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21D041FFBD;
 Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 05/12] gitlab: reduce default verbosity of cirrus run
Date: Wed, 15 Feb 2023 19:25:23 +0000
Message-Id: <20230215192530.299263-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We also truncate the echoing of the test log if we fail. Ideally we
would want the build aretefact to be available to gitlab but so far
how to do this eludes me.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/cirrus/build.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index 7ef6af8d33..6563ff3c7a 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -32,6 +32,6 @@ build_task:
     - $MAKE -j$(sysctl -n hw.ncpu)
     - for TARGET in $TEST_TARGETS ;
       do
-        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
-        || { cat meson-logs/testlog.txt; exit 1; } ;
+        $MAKE -j$(sysctl -n hw.ncpu) $TARGET
+        || { tail -n 200 meson-logs/testlog.txt; exit 1; } ;
       done
-- 
2.39.1


