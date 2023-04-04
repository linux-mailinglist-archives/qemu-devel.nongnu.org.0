Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B445E6D66A0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:00:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji8v-0004my-KP; Tue, 04 Apr 2023 11:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8L-0004Iy-EJ
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8F-0005Bg-86
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r29so33108612wra.13
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcRxyZn3FQlBOoql67WkillcPr6cNAr+lCrFgofptWA=;
 b=uKGnDmyiQaoG5xBIVb50G9hpvbrCWXDpC9qdWP1VpqMwy7D12rq8BD2ahaQ3NqJh0h
 Oz+dCQuLA92U5KexmSBmEy61U7o6Wmj+MCg1wS9RJQInntOicmZVn/lcht8I7uKhkYJ8
 agq5o9SDks95AbqPcOSI3KXrMOfH6kly/uoCjPucKyKf88HMGlK8wu2Njnmy2NJNUwvu
 mgy8Ff5PItfUDeU8XCyLp1dD9eyHd5RUjSGwDb4FNe4Eh9PogDNjLfj3TW45l+YHw1tk
 BrbCfnfu9PHQdS7bRlAubbNJaForsvy1nWOOjyq+qfTctCFuD6ULnXEovpnPZm2KNm6V
 1V2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcRxyZn3FQlBOoql67WkillcPr6cNAr+lCrFgofptWA=;
 b=6+4rn5NqJxPCZzyrA8/WkXbPrhcWh2CZLFM0Vzue/Q2M8qeJLk/X/5TnjkD4hYvHVq
 qPKQY61suxaEBeRVki1LSUNfyH0fDSyQq8Eq0ewc8+7AcMxnCB+fZJM2GLVp8n71UfTv
 z3UWJ+9c4qh8iPi/HAiCGTq4Xw25YO7FxPEKME2O0YCPUC4iTYvBJBw3sWgBfBZclDiR
 weBeO51ywxhAvALwRWg3sBJXp/V0V7QngPG+msRNxFJhaTs+0gK2yET1mW73CsP9W+AC
 15dG+zlQIxCvjQ1SwppWkejRQmmGFax7YU1oKPdSWTfZH7jRCr23znUC+67wCJwTEjEu
 73Ng==
X-Gm-Message-State: AAQBX9eeqAicXP086FoJ4WExZKxeTCbWN0JHgoaXXAi+ZaAoS+qWohyb
 MQpV8ofvHsKoc4qWJhgKe9Ke+Q==
X-Google-Smtp-Source: AKy350Ze6RuwQpxqkNncE8JTTouAIiBhR7OQ3DAZGYzhNuc/Y58FIJiyUyGUa/mjwbdz17Ykpdt9Rg==
X-Received: by 2002:a5d:4573:0:b0:2e0:f63a:2324 with SMTP id
 a19-20020a5d4573000000b002e0f63a2324mr1805028wrc.23.1680620368158; 
 Tue, 04 Apr 2023 07:59:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a5d6744000000b002da76acfee1sm12451408wrw.28.2023.04.04.07.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A87401FFBE;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Marco Liebel <quic_mliebel@quicinc.com>,
 Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 06/10] Use hexagon toolchain version 16.0.0
Date: Tue,  4 Apr 2023 15:59:21 +0100
Message-Id: <20230404145925.2638152-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Marco Liebel <quic_mliebel@quicinc.com>

Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
Reviewed-by: Brian Cain <bcain@quicinc.com>
Message-Id: <20230329142108.1199509-1-quic_mliebel@quicinc.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230403134920.2132362-8-alex.bennee@linaro.org>

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


