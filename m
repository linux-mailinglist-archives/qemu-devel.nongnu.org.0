Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD16664B8A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:49:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb4-0003Sg-7H; Tue, 10 Jan 2023 12:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb0-0003Or-VR
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:34 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIax-0001Es-RM
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:34 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso6022111wms.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fZnQvIJIidUw8gfSAFc62jHoyrBtFd/nsmfx/H20uY=;
 b=jPPNsLbnnIxo/pXYTxvlQi3DAmoNmimjvXG/YU0TkjjsLv9DOqtRHcxSwCOwBCL6Mt
 E5H9kxSDQj7DnJXs+IORZgO5gNDBnWIY4VyhsFfHgTnQnqMoB6IM+1MH7vQcR0btoraX
 a8VNOpW7GwrX6Oy5BycpLwb9xUIOYTbww+/m8KlO+IDjv3fouOb67VFF9sL2XdQp/OgM
 OCkCEtAATrpH0kKfPqCNwXpBsCmoUKkHsUmaVQEk1KTrpVgCCd/BLr0SLyFM9qLuwpeY
 gfdJzXLHX0HjjACff3K/XJ65SIFEYAfsYMOx82Tnndu36WIJgpHARWJ7ikZNLxcZuan+
 uyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fZnQvIJIidUw8gfSAFc62jHoyrBtFd/nsmfx/H20uY=;
 b=lJ3gxmGKr0isaumdY/IC0LYdjF71/AvJD+1aEeelIWw+LSdvYoadGc/5/XvRzd4xYO
 rQ8wADtm7etTqb0Dk1hqsjbrlkLBpnpoT5EbehdntXCD5LPd8bsGOkDxWk45TRbISkAK
 4tilZnplupUzpFLa3e/RpvK7GGSnjutMWH5GFmRZdGe+OaREyJ6ZP/h+olsBXSSEN20S
 Dh42sScI8/VfEK461B/trOiZfB5u4CV5B8cpt5yP59hBKHLbsdV/ceI7z3GLmQOtexnA
 uaXXBS7x46OaTkqXYIxyO+6iXFghoftgEqg2NtwS85dAEFSJ7RoAyqDh/R9Kx4nzONrr
 21SQ==
X-Gm-Message-State: AFqh2kqspMCEgO+7zRd4JWrfupKKuirfuJNH26M5UuvGD3e/HVxr+SQi
 cAy0DpDh3KEKwQ0S6jpmTFhwMQ==
X-Google-Smtp-Source: AMrXdXu3dEYCDcksr01RBt5/HYJHQwtzPKeusv4t7+EOyfeWTYcyafT2303gU9zrNInlus6O6hsfZw==
X-Received: by 2002:a7b:c8ca:0:b0:3cf:728e:c224 with SMTP id
 f10-20020a7bc8ca000000b003cf728ec224mr50592798wml.6.1673372370441; 
 Tue, 10 Jan 2023 09:39:30 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003c6bd12ac27sm18087617wmq.37.2023.01.10.09.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67E481FFBE;
 Tue, 10 Jan 2023 17:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 06/26] .gitlab-ci.d/windows: do not disable opengl
Date: Tue, 10 Jan 2023 17:39:02 +0000
Message-Id: <20230110173922.265055-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


