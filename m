Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468366D00D1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:13:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG8-0007YH-DE; Thu, 30 Mar 2023 06:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG6-0007WR-6U
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG0-0000IH-0s
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:52 -0400
Received: by mail-wm1-x336.google.com with SMTP id u1so10538828wmn.5
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lyj3DcfgcaLVAP419C5Q+1AY7dlGAjTujgK9jYBedDk=;
 b=jPcRwKl6DyEmfb52jjAFkxt6QDXhrbD9TF2IUtPRCP1KFl5du6CCTZitoczMEcq86R
 IRGwaT4DOVdp10oB5ZyBoQ2s350yrrPmnUIZmq+T2pQKe1qzkpIg42taguqYzap7Rug5
 i+L9ojmHQIUCcNxZXxZWMvKQQQGAFpBiy4nylR3D7Q5ArY6fT7/l22zceHVdlAzx1N1h
 iRji/MyNBjo9EGH9foctW5HdhSNU6yBzqE2lJLO+RqngtC3DSW/z4YFcFYqUjHc7TqSX
 cZF75dE5KsQhObGW08d8pq7UQu7hA4vxS/0V2eIFvWHj2uX11ud5Q8LLPGfPgjlL1Mtc
 c2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lyj3DcfgcaLVAP419C5Q+1AY7dlGAjTujgK9jYBedDk=;
 b=i9vNt7oqP5TlsnG4D6mhj6ZA384vX/fjujDGwUjEKDciTQp7y5A2CYrnORBLapDKaQ
 ihArWQffCN9dc8LyJSy0OEzvAcKHw00osfTcj1uhbFIe+AfFnzi/gfTYZyleBYcT9Tv7
 djJnzfI9o+MBuHPmurc2RY7nldSk1oKnRPn1WYx1Dx6233n5AGJLwf5oni2qr+vHJb5C
 eRgYWX7wP77XcMhdzc5sx+Zoy3SyI35t+I2KOdY4FVCE/wdXgIotil7mc8j9gUhiduFc
 /cz2pVrSxe7K247+9MvZsFRjwTo/O/fnLbZc9MtjeBEHn0HcMMtSoSMnr4qrpno0YN7J
 nXYg==
X-Gm-Message-State: AO0yUKWep/ohUy+zLDCAFtlNg3blC0+JrqgUw8sOeoHUw4vwm0U3hNyC
 UH5pI0wwBQc7egY7M7U2nQymUQ==
X-Google-Smtp-Source: AK7set/FXRc0rW33Z6juHoN1yFtKMP6bNOPfRtEOMCRDITTaTN0/zSPoc/eeY7NrEtINW87/b5Wbtw==
X-Received: by 2002:a1c:7c11:0:b0:3eb:399f:6b70 with SMTP id
 x17-20020a1c7c11000000b003eb399f6b70mr17277173wmc.31.1680171106620; 
 Thu, 30 Mar 2023 03:11:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c161500b003ef4cd057f5sm5184135wmn.4.2023.03.30.03.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC1EA1FFBE;
 Thu, 30 Mar 2023 11:11:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Marco Liebel <quic_mliebel@quicinc.com>, Brian Cain <bcain@quicinc.com>
Subject: [PATCH 06/11] Use hexagon toolchain version 16.0.0
Date: Thu, 30 Mar 2023 11:11:36 +0100
Message-Id: <20230330101141.30199-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Marco Liebel <quic_mliebel@quicinc.com>

Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
Reviewed-by: Brian Cain <bcain@quicinc.com>
Message-Id: <20230329142108.1199509-1-quic_mliebel@quicinc.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 5308ccb8fe..b99d99f943 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -27,7 +27,7 @@ RUN apt-get update && \
 
 
 ENV TOOLCHAIN_INSTALL /opt
-ENV TOOLCHAIN_RELEASE 15.0.3
+ENV TOOLCHAIN_RELEASE 16.0.0
 ENV TOOLCHAIN_BASENAME "clang+llvm-${TOOLCHAIN_RELEASE}-cross-hexagon-unknown-linux-musl"
 ENV TOOLCHAIN_URL https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/v${TOOLCHAIN_RELEASE}/${TOOLCHAIN_BASENAME}.tar.xz
 
-- 
2.39.2


