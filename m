Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A667A0C9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNcC-0001VX-A0; Tue, 24 Jan 2023 13:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc2-0001TW-Vq
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:39 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNbx-00064l-Nv
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:38 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso1487478wmb.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRU3Ah95SUqUsxi4cqMn3+PmSbRjKec9E/zr7EwVQEo=;
 b=AZBE0Z/CjtHQ4YT7eBqFgmPoNRFpHXRKcW/UKHojEaXOEGIpYoVdyn9BrDWDjkKsTn
 ry/sxH3+5B1vGhI9V8dLWJtweJFqHVlXY46iLuhJCDq9mPu8fPoNKSzes7kUiX0lSMYl
 jgkq7KarEcpTx/TvP1V/C4qjWDRvsnyv41GxorhHNLzB6bFjhv/25mrkPvaBDHeB1YPB
 84VB6pcGUgGSs9dPgOPaEkym6Cpl1kLs2WP3L7OTBWQVWHCanWOocplBuVW7BXIW61WH
 uLFDcMRZWf1S1KsTc2GWSMb3hl0PBx0f8Y1+xO3s8d/FA4DWZj3TGaGp1Z8sIhIQbfJ0
 hMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRU3Ah95SUqUsxi4cqMn3+PmSbRjKec9E/zr7EwVQEo=;
 b=gnw2K/qd/cWgDVdyNW3qbDYVZ7G/HJCMKEA8Afvlt5AORVELie1LlDlyhS0IkgtNYw
 XcQZauFmVzLbl/e2PgR9ma5Dyf6SDOYaIIm9vD+fXkHE+LCm72B61KwDkN7gJywpEVcr
 MpKhTVnTdBtE3gwfMNBGJkxxlrZ64k211bUBPbo5j0hmtp/caEcCJlolVnpTCccBY6aB
 vml4ei0ovLG0oEFd0/tHy0kkt9G7LWsp7GZ66SouHM+0kk/n+1BQ9Bo2MOTk0fR9POp4
 i+3aZpncgiwps6rqVMLl3OUcRHYHTZJ0BNIyHLl+eNz7W0Ht/eXKKKbHjTyKelZKLlYU
 7Cgw==
X-Gm-Message-State: AFqh2kp5f0eDtNl5KiGq5HkeN5Saf3k9s6TQw9TadDGulsiKKRKvIMPe
 GWSO/GB3YZ3QzaengRtE+fDtAA==
X-Google-Smtp-Source: AMrXdXsMdPBkZGIRsxxgpqIg72MvVq1mBqdg2nIC8AzuN8OLRYhsVnakBDBhaI18c1j+zfzbUKRHNg==
X-Received: by 2002:a1c:4c0a:0:b0:3db:210:6a24 with SMTP id
 z10-20020a1c4c0a000000b003db02106a24mr27476797wmf.8.1674583290918; 
 Tue, 24 Jan 2023 10:01:30 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c429300b003db03725e86sm2566214wmc.8.2023.01.24.10.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3AD2F1FFBE;
 Tue, 24 Jan 2023 18:01:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/35] .gitlab-ci.d/windows: do not disable opengl
Date: Tue, 24 Jan 2023 18:00:58 +0000
Message-Id: <20230124180127.1881110-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
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


