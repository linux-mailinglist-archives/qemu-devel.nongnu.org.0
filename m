Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5AE6FE134
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:09:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPE-0006rN-Nx; Wed, 10 May 2023 11:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPC-0006qC-NG
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPB-0001VY-2h
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f315712406so251111885e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731219; x=1686323219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=99DNC/4lLE0xZWvew5hDcmfunBndkIFWBRsqHIG+Brc=;
 b=X2V2f0oKXzm4wQNVe1xDfs338r4j09gsXTR+vt/Qc/OorlyxF/vvUqIaxzsTr+ETFr
 AR3+t4zALA07qxSaEhykPsrlj9SuwiITTWoZyDYuKHjsq5kQp629ti+WKvR7w5r4vHom
 zeSEYRp/AX5TITex6bbB0r8mtS5bDum8lPAOBZG06PxEF0qml9In19x32LoDe0ZrvWSh
 Iq4QVsy4nJtVhOxBEkgr2+cGNY4rhgV1poawtH2CTr/i1BU8yrQcFHRfwVDJCsEqDyqe
 7rxM0ANZxhkPdujs1Yx+xS0kbbXlTSVbrpVP7Brsd4RK6pRu9Qs8sWnrdOvaywK31tn7
 s0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731219; x=1686323219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=99DNC/4lLE0xZWvew5hDcmfunBndkIFWBRsqHIG+Brc=;
 b=XZgkFxeZgYIrRaYVTRSkNz0/uN4C+tLQxI07S/KYO6IBl4YDxSIofdKes0+2gDUj0s
 9K9qF6Tuc+xyIaHA1IO493YxfJubC7nSosmn32VpZ3MT5OftV5jClAyyE/iNH5WZh0bX
 ZooV2akf5mm21+VQtr6/ZAZVrPNBowEYrYGItSryLZUvy8gibQVAdM3D3EidwTyP863C
 ANI7BECZqj0+crYpMcLl8Kgi0SaYL9eHbs3Sw/MsXYr45Doeec5wtBeYJrvY9oSh6UG9
 hwW8U8dMg6KVYSJ5EDxnTtFj+3AhbDbWj08spOYjiX5Hmvhoo4xMzlp2O6KbfRQ9xME2
 OzXg==
X-Gm-Message-State: AC+VfDzPVDDYupRSeyASSb57QLKw6IzlE/o6ec8myHPdEgz1B8KYMIuR
 L9mwIPq/rdxmQ3lYZgNxuaav6g==
X-Google-Smtp-Source: ACHHUZ6vbSBW25Ll5i4GF7esAEIFwJn8VJ69PSs5xWhT64cl8V7100qTX+kMEcr/wglkKzh4qQ+OQw==
X-Received: by 2002:adf:e948:0:b0:306:2c20:c4fb with SMTP id
 m8-20020adfe948000000b003062c20c4fbmr17446800wrn.2.1683731219499; 
 Wed, 10 May 2023 08:06:59 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfe8c9000000b0030642f5da27sm17580779wrn.37.2023.05.10.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:06:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C33901FFBC;
 Wed, 10 May 2023 16:06:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 1/8] tests/docker: bump the xtensa base to debian:11-slim
Date: Wed, 10 May 2023 16:06:51 +0100
Message-Id: <20230510150658.1399087-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Stretch is going out of support so things like security updates will
fail. As the toolchain itself is binary it hopefully won't mind the
underlying OS being updated.

Message-Id: <20230503091244.1450613-3-alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/docker/dockerfiles/debian-xtensa-cross.docker
index 082b50da19..72c25d63d9 100644
--- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
+++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
@@ -5,7 +5,7 @@
 # using a prebuilt toolchains for Xtensa cores from:
 # https://github.com/foss-xtensa/toolchain/releases
 #
-FROM docker.io/library/debian:stretch-slim
+FROM docker.io/library/debian:11-slim
 
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-- 
2.39.2


