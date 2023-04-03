Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888806D463A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:51:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYu-000308-PX; Mon, 03 Apr 2023 09:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYr-0002ww-R1
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:29 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYn-0004ur-Te
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:29 -0400
Received: by mail-wr1-x433.google.com with SMTP id y14so29447002wrq.4
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GjJ0WrIm2Di0AKuPGaQhGuqTtmI2bcqfL0u1knytYyA=;
 b=JaVTpA1WR5Yo7HRGCieD9YHpHG6U+azsDNIGhcFsSoWXaTyGJ5nteWKiXEEwk/kw5K
 4z/HoY6XttEATEGH7ML2L997lwjyaICp58vZdfBt7Ul4c19wLOOL8BaRtOmvSRUuhed7
 F7xab7P0e5GN5SX2AiIVAfbcRe/dg27YalMfRch9sGsLGTKbnuA8YicvcomfH+IfCH9r
 yVPY/U2gVCrVeue5OHDtNrUdHp/MGzzkoCWB1mxWhuzHAzkS8TVmgzbRXCEx5/h5OI/5
 cq4Yc7i4nLK00nhoQn/G9sEJn3XzQD/Ddu+otDQolTbDvgrnOtmxHCp7MTofBVl/bMtO
 ZnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GjJ0WrIm2Di0AKuPGaQhGuqTtmI2bcqfL0u1knytYyA=;
 b=GQOXwIWfzN2uWnOXV9P5sAiQuR4S/Q1vml/jQGnout/eEzyZnbs329HWvxuV/erRrx
 OhZY6Xnb+fK1TmjPyCcm4O1HuujRQBWYaU2CgtRj8fC5TFcLRoWdpt9yxNf8osWRfBM1
 lPiDbSFMSmCucbm2RY37aVp/Ff+Yz9fyCDnb1X1e9ALyN4FxzLVHcl6YuyOP/7Ca5HGA
 oKprnsCyR0rsKkUnjCbwO+FOLJM48aJCgjsRb4v45UeesYabb1IdPKUx/M05T5oVhtuV
 HyxVGSjxJMjUIKL5QdMZGWxzMFAwiGNyZGhxQUbrbFox4KDQi4HE8WTVGQFx9j0V79Dv
 72ig==
X-Gm-Message-State: AAQBX9cjlnHRTNp7l0XhIwuQpmMoqMpOBqNJyA97osfXrargt7Ui5F03
 +zDWfLTLF3wzlO++dUniF7PqhQ==
X-Google-Smtp-Source: AKy350Zih1/UPPhQr8jYeGyPYonELcT+rZRHLNBwD0ldfATP2SC3xnwB/VAGhSWQTnQNEnfb2Ap/xA==
X-Received: by 2002:adf:ce02:0:b0:2c7:cdf:e548 with SMTP id
 p2-20020adfce02000000b002c70cdfe548mr27185931wrn.71.1680529764201; 
 Mon, 03 Apr 2023 06:49:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4d06000000b002e6d4ac31a3sm7433916wrt.72.2023.04.03.06.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6799D1FFBF;
 Mon,  3 Apr 2023 14:49:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Marco Liebel <quic_mliebel@quicinc.com>,
 Brian Cain <bcain@quicinc.com>
Subject: [PATCH v2 07/11] Use hexagon toolchain version 16.0.0
Date: Mon,  3 Apr 2023 14:49:16 +0100
Message-Id: <20230403134920.2132362-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Message-Id: <20230330101141.30199-7-alex.bennee@linaro.org>
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


