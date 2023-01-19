Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E6674084
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHF-0003NA-1F; Thu, 19 Jan 2023 13:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH3-0003I6-4K
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH0-00011Q-59
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e3so2637133wru.13
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fZnQvIJIidUw8gfSAFc62jHoyrBtFd/nsmfx/H20uY=;
 b=vMVb4FH2anD1kRUrcBW2w2QRaa8U8gsa0T2VBJKAH8I0lMIW8Y25QNQ4A+sHVtW3La
 /DLk3jD6oUK5AxzpM1oFJu2HM7BNHRQJYcDZs10xu6d34BlLHN1bK+Qx9+TPGbEI6Iu2
 62kxdVfcQzpF07iiQ6TTDBolJsRaVWL0mEqxWrg71bzo8FH63mbF8o9yPLFDDlNpE8WV
 RQ2C9tCRmM+VunTi6WlGarJb2fpufXeW5wrKZ1Qo79mO3e0/dOkHuh/yLcX0ClNSuwug
 Q3hyTplgVaQDoZ5QfMNWvkwta2UaqxL824dqkm8uElVYFwEH7HS8dTCLPfMZuk2c0W9U
 IV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fZnQvIJIidUw8gfSAFc62jHoyrBtFd/nsmfx/H20uY=;
 b=qTV8RbXN8xk2lJVkw+sMVQZbaBOLwRtuNs3iHS0eNiDSQe/gDIpbhOkKYkCRAGFPwN
 Wkc5sKQLr4LB1fHjzsoxomJF5zvpbg6DjltM6AgRceQrGNAzebR0xPUYxbeeFJVwUOUo
 1kLiR58b62bAgfI8vVmfE3q1Bq5UKfEKB4UM01fsggCue6mx5ffR+0arTmGeTsVS9Gxz
 jlSB/Z22GVgQ4ZbyImqn691S0k+2933nkq80uzo+kwWRtFjXYYhibER/yMJGhgklvRHb
 xmUYMhuHz191CyqlXHAtbwBkPh2dRrNPfYu3T8LBP9BM9TOcZBu7WyRgr/dq24mInFda
 hgTQ==
X-Gm-Message-State: AFqh2kob3nw4hV0IEGic8BQK8laIuISlYsh/aiPquPctFzSx5wcHzDF2
 SztqakMmAza0rvwGLgC4Er+5QQ==
X-Google-Smtp-Source: AMrXdXstEHgsoha3h1xlGqikvHifzVvxUR4KHnhXc0/c0ZHhS/1AniXZJj/PYK0e04ts8fA2EAGsaw==
X-Received: by 2002:a5d:66c9:0:b0:2b9:d6ba:21ef with SMTP id
 k9-20020a5d66c9000000b002b9d6ba21efmr10299183wrw.65.1674151463811; 
 Thu, 19 Jan 2023 10:04:23 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adfe0c5000000b002bdfe3aca17sm11909035wri.51.2023.01.19.10.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 152B41FFBE;
 Thu, 19 Jan 2023 18:04:20 +0000 (GMT)
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
Subject: [PATCH 06/18] .gitlab-ci.d/windows: do not disable opengl
Date: Thu, 19 Jan 2023 18:04:07 +0000
Message-Id: <20230119180419.30304-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The previous patch should fix shader compilation.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230110132700.833690-3-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/windows.yml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index a1d5790580..cf445b77f6 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -71,7 +71,7 @@ msys2-64bit:
   # for the msys2 64-bit job, due to the build could not complete within
   # the project timeout.
   - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
-      --without-default-devices --disable-opengl'
+      --without-default-devices'
   - ..\msys64\usr\bin\bash -lc 'make'
   # qTests don't run successfully with "--without-default-devices",
   # so let's exclude the qtests from CI for now.
@@ -113,8 +113,7 @@ msys2-32bit:
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - mkdir output
   - cd output
-  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu
-        --disable-opengl'
+  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu'
   - ..\msys64\usr\bin\bash -lc 'make'
   - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=\"--no-suite qtest\" ||
                                 { cat meson-logs/testlog.txt; exit 1; }'
-- 
2.34.1


