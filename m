Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FBD4E521C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:23:17 +0100 (CET)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX01E-0002VH-Ki
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:23:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz9D-00024m-Gu
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:28 -0400
Received: from [2a00:1450:4864:20::32d] (port=52974
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz9C-00065K-0T
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id r7so737211wmq.2
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EbPi7aKk0OUa54wx1fTCvHSTKEthjD7URQXEnJXtxNE=;
 b=rHi9In4BgIEwsVz7JqJyTRnvi/7xNJ3riAS7cPvw9c57ulvdIQvXFEB5Cg9AWhvuLl
 sjxTrmQ2FewZRG9Povr72G4lb4Dno83J51ROL2XsoE1FcAlAwZA7JZz78OxeiWTXhwK/
 60CwzLOQlew+fgUJFGmfpEe2/ku4aUkZMerQjKcj/zt0NkvvuNBJ9EirVZrwTpIR82D/
 YrtFZNzbArm2PXumzpHbgiLkQOEHUcs66nv99Bh/xp0IzXbuNBFq5GyViXssLXDoL1xl
 eA1EFzJDIGW+tzuck0qr71sAEaeBbeCt3DWQM/chZ+8z+l/+NnhwxFltyEH6J1ul2Y5m
 kDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EbPi7aKk0OUa54wx1fTCvHSTKEthjD7URQXEnJXtxNE=;
 b=GnRpgWYYzn8VvsZ33F+vHIrduDHutCygYoDpATijskTutVTdYpQk/mWLrt4a7qTNJa
 gzRfa1ZZVjpjBB3JmEI4uCQj6zrC/KNQSx++y1RsRw8I+UmMV7dET4uX1Iy4YZin7/Tv
 h/9Dc/QwH+9oXc5H9kuuwsE1BZgc9QJ9ZHVucBs0uAHPUVXnAkD53pCa8E06O6HNdCQv
 j9HSbGdZX7IuKCAx6FDe4VidbQ1KOycKFIzcvHc4pP7olVTxmN4zd/QDO/oXhxHJivZs
 Iing1FcPADJa3fqr9Nu4eXSGwv1hRVELwHSGuUUz186sD4fUdONvBiNAMlEuZ/ahB6xR
 LLbw==
X-Gm-Message-State: AOAM5304RdYXOXImM0W1etTMRBFdPPPsbKublbDb0W1goKBC8YfbQUTI
 PM1y8qf7or5orqRXuK07sc2GXQ==
X-Google-Smtp-Source: ABdhPJy8ArfgZhqkqOV7IUc7Gb9aOzkGl6ZlXq+1Vmuhgezgw5zMtEKGe8UudXJF8Qqd3ZMYO6lYCA==
X-Received: by 2002:a05:600c:3d14:b0:38c:9d85:781d with SMTP id
 bh20-20020a05600c3d1400b0038c9d85781dmr8681188wmb.191.1648034844658; 
 Wed, 23 Mar 2022 04:27:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0038c6c8b7fa8sm3885830wms.25.2022.03.23.04.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:27:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F19B11FFBE;
 Wed, 23 Mar 2022 11:27:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 6/8] gitlab: include new aarch32 job in custom-runners
Date: Wed, 23 Mar 2022 11:27:09 +0000
Message-Id: <20220323112711.440376-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323112711.440376-1-alex.bennee@linaro.org>
References: <20220323112711.440376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without linking it in it won't be presented on the UI. Also while
doing that fix the misnamed job from 20.40 to 20.04.

Fixes: cc44a16002 ("gitlab: add a new aarch32 custom runner definition")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220315121954.2283887-1-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 3e76a2034a..15aaccc481 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -16,4 +16,5 @@ variables:
 include:
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml'
   - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
similarity index 100%
rename from .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
-- 
2.30.2


