Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7733B674090
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHH-0003O5-3j; Thu, 19 Jan 2023 13:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH6-0003Jy-5Y
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH2-00011y-Sn
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:31 -0500
Received: by mail-wr1-x431.google.com with SMTP id b7so2675752wrt.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZLHCuh0wigKWde+YAzRi65bgogzVgt43O8RyRryEl8=;
 b=WlmXnpffOo4sCwLXgcztoYdJ2n4VSzM/TLpHnjNDqqIqyb4iYdpY9+hfZIDyU00rJm
 85uqxOZa6tPuJkQ+l4sXJsSNN6Iu8vfP0GfbbiCGVm+MlXI28c4ivtxwqqRYKY+GA7XC
 8gGKdZyd7Fp4YPiL254Cx2r8fqcbbSniQDgA7xR2AmgKJloStbnKkTPF8OdEPSlF5Nx0
 s+vdcZLyFZw/6sKbIAQxzEQMzq0qnZBWi7gYD68GVremGn6Rra1YZGAFcF568IKWJVNC
 TdK6uziqzT4LxRxuyiiiihBhDLGBuyGkXfk4qDFbn5k3nXd59R1PHXFpxhaLc2pwkFMv
 OSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZLHCuh0wigKWde+YAzRi65bgogzVgt43O8RyRryEl8=;
 b=WppnsTdzBDIdRPoHVtTZYbsnNYn4PQ2Z0GPAVa/bWq2X3AEj+BI7v2od7c4kLI7hFx
 A3O30sKAbpKj98FHTANlMKeXPk9lzjgm/4Yv+M0b0x94pY1tn0ZwZ5FEzFj5trC4qQW3
 3JMdJxulBl4HranhtiGO/CZ9+y5zDHaPNwh08GsuxC26Mize6mCVE/zBFhHU8LovFHrB
 xe2SZo5iLDaTICBCLxuqmgZ68jxdEwOByEL15ZmQfj2bM8lml7PUoNjk7vRgOY+rK7xe
 IdeP/uoiq+aG2WKFI8nLgLag2edag+xyv8c/e9hF2IKCBClTLVC5mfBwFSmpTy245Pop
 oMOQ==
X-Gm-Message-State: AFqh2kqqWOgwvFNJKJ97me0DS12Xem/8neaYOIJ88Pu48Q1W5yzWSCQl
 +0l8vzIgcvWoD5WzptV9YkEIdw==
X-Google-Smtp-Source: AMrXdXvi5pxdEHz5WnkG62V33pzC8YsknZ/D19JXBKKY0PbkHZ1I2ebcgMKzO9/ZOAVEigi0V8+yHg==
X-Received: by 2002:adf:e310:0:b0:2bd:d8f1:2edf with SMTP id
 b16-20020adfe310000000b002bdd8f12edfmr10351550wrj.49.1674151467290; 
 Thu, 19 Jan 2023 10:04:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5186000000b002bbddb89c71sm30592743wrv.67.2023.01.19.10.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A6081FFC4;
 Thu, 19 Jan 2023 18:04:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 14/18] tests/docker: drop debian-tricore-cross's partial status
Date: Thu, 19 Jan 2023 18:04:15 +0000
Message-Id: <20230119180419.30304-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

This image is perfectly capable of building QEMU, and indeed we do
that on gitlab. Drop the DOCKER_PARTIAL_IMAGES setting so we can also
test the gitlab build locally.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 665ddde518..bfb0dcac21 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -128,7 +128,6 @@ DOCKER_PARTIAL_IMAGES += debian-mips-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
 DOCKER_PARTIAL_IMAGES += debian-riscv64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
-DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 
-- 
2.34.1


