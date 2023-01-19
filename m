Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A275674085
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHH-0003PA-Oi; Thu, 19 Jan 2023 13:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH4-0003Ir-DU
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:31 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH0-000114-Ot
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id l8so2188479wms.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxoWU4Tw6BX+PJ5ddbeFgfV335pZMDd265PyUGg07yo=;
 b=D55lQFOw+OukFzRej76GyJzPGVXNmYTkUMnLn94Qr6P5q5sJ/BowhnCRsCqTFVZVeB
 ie2uAe4oREDAT2E2MTGh7TjiAlXqnNu0jeho/oSE45buDz/pSlyxZ83ZfdBcH1slSLdB
 M24oSkZbgVFYYvoBo8+Vh8uSwU08FwtcEK5y7T0OgbeMoDaoU+FN/ZO/0XWia7ZQhbY8
 d+vEv3sjp86rlMJVhJQsdvFj5IrS/dvvYbqqwFfSRAUtEuVWv4eaiX3Z6RD2vfGMgidv
 MXygtfJIdHmfrHYRPXXCjWlbqWuYbdehloqsRrHAqj3QSewF6qoHAQE/xIbvi2XxxisO
 Y2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxoWU4Tw6BX+PJ5ddbeFgfV335pZMDd265PyUGg07yo=;
 b=QDZ9sVoy7xA4KKz+O1zvFff71i2vhnZ6bnV24TLeiEV7XP9qJiEZFyv4ohbcMfTnrM
 IOeWlMGFnn+cECuhR07BhYQj94Gv/ZqBItLOLqfZdxBRX7HGyt2bGjWhNsyLlTivozhx
 z45T9pWDgIfxOgUlaZDxc+ueAgDhpCOVaCK/d64jTS2+S2PSqdA4yBxS7j7N8mUmv3MO
 NFPqHqGmIaSWHIBzaUaI37AkHqLk/Eraa9hk8TRrZ7GfgWlG5xv6gSWlOD6DUB+wKRyT
 clfZIDNPhziTl7K+IT4s8HHNzy40rfMW6uUPgbyr3pUy7tUMF7fmklkpQ+q6Xbln79Sl
 I/3w==
X-Gm-Message-State: AFqh2kpPTuOQuY2N81C2Y2X2AIJmOS7CxcDcwAN6WlLUHNwS9bxY8T85
 6BdkpeczotaikQLxF2vHApmlWQ==
X-Google-Smtp-Source: AMrXdXsMsHdBofHTzzZaccSCxFd+D4LjS/hkeDsfTHVBkU16YMZC/DYT7g2Se/+BiiyJ2BTtUizqZQ==
X-Received: by 2002:a05:600c:3d16:b0:3d0:6a57:66a5 with SMTP id
 bh22-20020a05600c3d1600b003d06a5766a5mr11232488wmb.0.1674151461749; 
 Thu, 19 Jan 2023 10:04:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a05600c384400b003d9862ec435sm5474970wmr.20.2023.01.19.10.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEE0A1FFBB;
 Thu, 19 Jan 2023 18:04:19 +0000 (GMT)
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
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 03/18] gitlab: just use plain --cc=clang for custom runner
 build
Date: Thu, 19 Jan 2023 18:04:04 +0000
Message-Id: <20230119180419.30304-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

I think this was because older Ubuntu's didn't alias clang to whatever
the latest version was. They do now so lets use that and not break.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index abeb33eaff..725ca8ffea 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -81,7 +81,7 @@ ubuntu-22.04-aarch64-clang:
  script:
  - mkdir build
  - cd build
- - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
+ - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-- 
2.34.1


