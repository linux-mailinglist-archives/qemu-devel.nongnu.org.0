Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E6A6A5F5C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:11:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5Ka-0002sA-KX; Tue, 28 Feb 2023 14:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jq-0002Li-F5
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:25 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jm-0002qv-M4
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:22 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so10313052wmb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bwZjYJyzhOZhmyFNjraG9Agw+3XX7xlS2XkV5ff6A7I=;
 b=DEQQx5ChZ5MAaykpkZQv4I7hxf/e7KfsauK2NVdr4LbWR3sl3KAMx1gvOhkAVnTpoG
 1dVYzLzEHgOldiTyOemeaFFU2DBRSI/pq5xbU5Mw7fhVIbjluQk0yUdxYc6YuUDPMe0O
 vBKlhVnDpKsvaxjW6blW0uP8abjVMs2iCmyO+86o7OTduPp2dkwdq4CXK753H3O2MWin
 esUpQy5XFd+oBhXcbY0VlMbBtlJwcyDFJq7Ur3I1V5hTCq12yvLE+LyAWCQWJQL04g7U
 uHoHTObvVP1yrUKX1vzEHGX3IEuXmyvKlKGI+nYOpQpzjk6MRMcopHnUI8SYrr8t4fcZ
 +K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwZjYJyzhOZhmyFNjraG9Agw+3XX7xlS2XkV5ff6A7I=;
 b=gFPeGxQopQaCooAmHIt0lN6TsttK6GwbSyMpSiWBGNTjZHWhjJLwEAr/6SPXtTVN0o
 E+oMnZdtsW9TuPJM1i8EPOOWhy8gPQAqXPt8yDsvAEyPgir8uFEFaoxiMlvT7a+5oxql
 4LLWq8frKA63YCogOCZxV8eZNTQpmVxGkca+u/i5Jdl7lOdiGUzzQ5bATLjfmVOKwPeQ
 +hP7exljBKab6L8vVkBWLgMQsTJNCfaYY1kCN5iR+PM4SniRL/X0rMXtBcQ+HHlPjR91
 vGVX/s/4BLKm6YUml+KtiAJtyCLv2PbiLVH8lxa/xcTer69V8QjKQNFMklWKewn0wHpn
 a9tg==
X-Gm-Message-State: AO0yUKXcC1v6Zu1BWZ/nfVcAzz3WO30VuWQFibVwZyuP43h8POejzmfL
 PFau+VK+d9YHBO4IY4NMOG64Iw==
X-Google-Smtp-Source: AK7set/JOG9DKohDa6xcZv+qx9si7lvNoPxf+r82sembKbt/jD0FWxFlhcKyfUWBkR/VB0Qt6IfjjA==
X-Received: by 2002:a05:600c:458b:b0:3e9:f4c2:b604 with SMTP id
 r11-20020a05600c458b00b003e9f4c2b604mr3325954wmo.24.1677611221243; 
 Tue, 28 Feb 2023 11:07:01 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 ja6-20020a05600c556600b003dfefe115b9sm13569534wmb.0.2023.02.28.11.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C7EEF1FFC3;
 Tue, 28 Feb 2023 19:06:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 13/24] cirrus.yml: Improve the windows_msys2_task
Date: Tue, 28 Feb 2023 19:06:42 +0000
Message-Id: <20230228190653.1602033-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Thomas Huth <thuth@redhat.com>

There's no need to run a full-blown bash just to create a directory.
And we can skip the "cd build" each time by doing it once at the
beginning.

Additionally, let's exclude some targets (that we already compile-test
with MinGW in the gitlab jobs) from the build, since the build time of
this task is very long already (between 80 and 90 minutes).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230208103046.618154-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230221094558.2864616-15-alex.bennee@linaro.org>
---
 .cirrus.yml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 4895987da4..5fb00da73d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -100,9 +100,11 @@ windows_msys2_task:
       tar xf C:\tools\archive\msys64.tar
       Write-Output "Extract msys2 time taken: $((Get-Date).Subtract($start_time))"
   script:
-    - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure --python=python3"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j8"
+    - mkdir build
+    - cd build
+    - C:\tools\msys64\usr\bin\bash.exe -lc "../configure --python=python3
+        --target-list-exclude=i386-softmmu,ppc64-softmmu,aarch64-softmmu,mips64-softmmu,mipsel-softmmu,sh4-softmmu"
+    - C:\tools\msys64\usr\bin\bash.exe -lc "make -j8"
     - exit $LastExitCode
   test_script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
-- 
2.39.2


