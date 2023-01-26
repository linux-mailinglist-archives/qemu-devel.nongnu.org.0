Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342E567C9E9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:30:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LV-0002t0-Sn; Thu, 26 Jan 2023 06:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LL-0001tt-Df
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LI-0003jP-Vk
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q8so893874wmo.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzqwfdK21RM5z6fK6OdNzPsFVArHMF3Y75c3I4gjb7Q=;
 b=f9HICVH6R4imhHw4uEMQuLF8xLhU5452Ky/vfAECiau/TLCF349I7bmBOjDyyB8shy
 jtCAVH7NxmVPmMBMgUmENckVsFMAdLIZR7EvBaYTWHJhIRqV9a08pLjWeNsNr6aufyv5
 GwPTOG9ejN0iTrB+LV9W571yY2rAWqVU8MJ1m+PmqZudf5xiaUSE4PvZPsxL0g1c5u4y
 I8igsFj+mJES+knBoD3X1HoRRm8EpxptTjrNX/t6V3haETSxvUJnSCzF+yAJOZwDoZmX
 Az36MbvXR3ptDh3fdp+xy8u69eeAEeg3HC8TI0Zh06CDNqDqZpdN3iLZLMhIbabnwnRC
 w9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzqwfdK21RM5z6fK6OdNzPsFVArHMF3Y75c3I4gjb7Q=;
 b=MhaqMzGPyONLTiuomqTseN60Fa+63PigafuEXuMZdNMs/7zRuVanZx9x12ZGia7vaj
 W1cexR33rUJjNc5Q52cxjN4yzo8o4DlHrjoT9HdgRQWcb7XGPCI/D8sFsNn8PniJNE4Y
 Zfa9v4jckoKt0cKnTh3KEXvdCA9YeB63PEcwvVnQoglyJxloILMRd11EdXfCsUqrP8yh
 a1S1Wlr/zpMutMNr4NLB0FhR+9HfUD4hBm07SI8A7m3FGJWdGnvzQCEi5hRjrOpWCYXa
 +hK8uTEH57LbF9loaliBna0KJSbjIpWy1TIPyvqBUMgYUnS4pABEEYZ9tGBKi4cJwOcn
 ck3g==
X-Gm-Message-State: AFqh2ko04c7H/JqYslslBxlwTYyxex8Cisw+7xniZR9yABdCqDEWz8Z1
 XDFmisiYBJYxYo/MHolNkzaOBw==
X-Google-Smtp-Source: AMrXdXuCT8bBo90/bzDY+gUzULZMsBp45G67yzV09mOxNzBzkb2bC5igJNFxE+b5kQEqoQKmaHSG6g==
X-Received: by 2002:a05:600c:4928:b0:3d2:2043:9cb7 with SMTP id
 f40-20020a05600c492800b003d220439cb7mr35276437wmp.5.1674732175297; 
 Thu, 26 Jan 2023 03:22:55 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c420a00b003c6b70a4d69sm1133311wmh.42.2023.01.26.03.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D2511FFBD;
 Thu, 26 Jan 2023 11:22:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 06/35] .gitlab-ci.d/windows: do not disable opengl
Date: Thu, 26 Jan 2023 11:22:21 +0000
Message-Id: <20230126112250.2584701-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

The previous patch should have fixed shader compilation.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230110132700.833690-3-marcandre.lureau@redhat.com>
[AJB: tweak commit message]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-7-alex.bennee@linaro.org>

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


