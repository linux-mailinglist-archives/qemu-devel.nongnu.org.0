Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7B67A0D3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:04:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNc3-0001Sz-A1; Tue, 24 Jan 2023 13:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc0-0001SM-Pt
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:36 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNbv-00064M-Rj
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id k16so12098563wms.2
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTOc6BslTu4XuaEYX7MXs0kB6TdJdUghGGaY2xfvGaw=;
 b=b/VlKRasij4DAXwPM4iZvMJQop8Wq8URWEN94HTi+qorMeZx0AfLBp48sVxJc0pmme
 5JoCKsZ6FToSmB9plhm4xufsIsGHTErGdh/ALS/DsCrYkJBFgVcb5Z6IYqThMMzYK6RI
 b0wzY8caamMKwzByqzA1d8o9v49pQb49Mmj1k3NK3yu+E8eUpqwo1kmAwWVP6PfdoH9e
 w2bcAQfuzSlmKDkrUIGCZTEqaHJupArBFo73c/VxGR78ImfPZP9CpCQcDmHGOmc65QhP
 Q/IqHgumfPjKUR3XhW/HtdI1jl5rx/5dXhYSVg1qNPH8ljr3FOdoLduzkUGn1w5QVPFp
 Ngpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTOc6BslTu4XuaEYX7MXs0kB6TdJdUghGGaY2xfvGaw=;
 b=PlnB+jaJdq/6l9mrzbpnoxfuptZnkaFVMssJG5xbo9vdNsCWtWvb+fY3KSQip1jMkh
 Cwy7VkQgx/T3JvsKfOVspK8ZUfReiRsCiq44AwUxHvQgOZhFjfA3aJfcKUAwSCb9gqy3
 Iqo4ebJC4HQjwRt8mM8M5bs5NS+zb0ubBGIMO9sL+3kVT1aLQVbJ8MYI9lkFsQRMhvBF
 Lcp85t61Ll1SoiVAiqUV4mWyxF+XE4C1g7l25LVtWgMxmqQ6tswdhUoBqcqLYIcGrmkq
 4obe8HGn4GPdBMQ3Yto1PHwdLNK70bhAFZCNQ0XNKe6CWWWDx3Z97+ZcAZsD8DN5L6oJ
 zcqw==
X-Gm-Message-State: AFqh2kpL3yIRfsbqQx9Blw3XLfOD9jIA7uSuqcyAsfP9IkUzjFaszmRh
 Mz7cU1tUgHP6aXnOqJMZjm3D9g==
X-Google-Smtp-Source: AMrXdXuwcVXA4gzOcxo7ssyqWD1cgnVxSEnzhfPBzx+woJa86BUvAgs/1i9UUjSzAnoTyhceQV2eXg==
X-Received: by 2002:a05:600c:3b29:b0:3da:f678:1322 with SMTP id
 m41-20020a05600c3b2900b003daf6781322mr30021865wms.38.1674583289016; 
 Tue, 24 Jan 2023 10:01:29 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a5d4c46000000b002bbb2d43f65sm2403737wrt.14.2023.01.24.10.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E28051FFBB;
 Tue, 24 Jan 2023 18:01:27 +0000 (GMT)
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
Subject: [PATCH v2 03/35] gitlab: just use plain --cc=clang for custom runner
 build
Date: Tue, 24 Jan 2023 18:00:55 +0000
Message-Id: <20230124180127.1881110-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

I think this was because older Ubuntu's didn't alias clang to whatever
the latest version was. They do now so lets use that and not break.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


