Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C66100C0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:54:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7mJ-0002Ny-Qg; Thu, 27 Oct 2022 14:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kF-0001L2-Tp
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kD-0003Kq-TD
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id g12so3663053wrs.10
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSKoEKy838qRPHg6Chx0DQGUg+u8i2XhLvKie7+MNIE=;
 b=DPyX2USaVEKjtlZPefTcZexn0x0GhsFZFv/Y1/7y5TyNxWvc+KhWtnyixD5jcXidLp
 wQ2Yhff3al56W/+IoKIibFnql1dkLu7B62ebDQUQ65hd1DcSM/Bi92L7tlcNheyLKUCH
 dpt6WyypFixT1263LCFzI+GozWE5PTW+Aka3nl07U6odh28k8k3i5fkW9FsFywGd4W3G
 V8lxL3wE2kwHMlXo6h1KI8fK7mYYp0wfNkaxa4ZqTI8T/u5WmUVqiCe70TFp+Rg/Xfdx
 y78GWkubHM+qWP1OAJQaNKZJQfgSZMY+uFkgXOJ3YW/216ILVBWtiri55sivEnpQSVpE
 I2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSKoEKy838qRPHg6Chx0DQGUg+u8i2XhLvKie7+MNIE=;
 b=oKJlaJ4n4jzXCX+DgZsI+0wWRXrB0++61DolLCQlp0cptYswSaXJqgJBVp4zUMmcZr
 /UxvnNnxJpIe9/Sb9SD8CEIlnVvp7tkekneYZtUy80/HdtZkKWvmlVTebp4wZvHXmADL
 QRK+Vffu2kjxzibcGLdj8icTiWRKX4QpDHRHMoniDmlrCbYYRtl+YY4cMtMdvmZBMOAn
 Hp8d0mehZKnSmpxokfljKAwYO6s3YJ0U0GvBQALuLFLrgVTpBsFX55eO63FDa9crdd1j
 S0dcWQrM0egEuG8gA4J5KohkCe6JhYaz24oZQvQurPVAoYMGMKHa5betpjsRdj2wn0He
 u1BQ==
X-Gm-Message-State: ACrzQf1oOpA6+vuD7ideIj00t2XuxL5H1K9KSU2VvwdihwqxZmX57/nV
 fJH+BMN/xpIlFW+G9hB5KPXPfA==
X-Google-Smtp-Source: AMsMyM506xOIBAK0OjzFnjUgkDQ2FjM3sF9P+pDvzJa5B7fT9mjs5/2FatujzEOGvDg2X9MDiFWkgQ==
X-Received: by 2002:a05:6000:188c:b0:231:115e:9bd9 with SMTP id
 a12-20020a056000188c00b00231115e9bd9mr32852426wri.314.1666895803251; 
 Thu, 27 Oct 2022 11:36:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d6847000000b00236545edc91sm1787389wrw.76.2022.10.27.11.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 072011FFBF;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Anton Johansson <anjo@rev.ng>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v4 07/30] tests/docker: Add flex/bison to
 `debian-hexagon-cross`
Date: Thu, 27 Oct 2022 19:36:13 +0100
Message-Id: <20221027183637.2772968-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

From: Anton Johansson <anjo@rev.ng>

debian-hexagon-cross contains two images, one to build the toolchain
used for building the Hexagon tests themselves, and one image to build
QEMU and run the tests.

This commit adds flex/bison to the final image that builds QEMU so that
it can also build idef-parser.

Note: This container is not built by the CI and needs to be rebuilt and
updated manually.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221014223642.147845-1-anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 8d219bb81d..c4238e893f 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -43,7 +43,7 @@ RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.lis
 # Install QEMU build deps for use in CI
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy git ninja-build && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy bison flex git ninja-build && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy --arch-only qemu
 COPY --from=0 /usr/local /usr/local
-- 
2.34.1


