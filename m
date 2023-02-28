Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF9E6A5F51
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5KQ-0002bY-PE; Tue, 28 Feb 2023 14:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jo-0002LU-7G
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:23 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jj-0002lF-Qz
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id q16so10890758wrw.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Qt5mFGK6sX05ojDaxMAjvkBlcEMddgn+Oj0DLlJ4YA=;
 b=mF+1ji7zNQ28pO6NBP3EfUyVvko1tHKSH/WLpIRB5b1/ecWQsUiPE0/PQHkNSO497S
 dSDF/QL8kNyi4JN5z6kmmLTkcwT4V41ySSXSEVAMA8YwsaYYsVEguuzmJgbLpaRrEB96
 X2WNyI3exEINI3enQ5wpkLLl01djvTBamv6arCZXvZzaVGlMKU5Ni863WnhQEuO4Jim0
 AZHPnu29qal5jVhIP/LJKcRdZm/prJWGv3SZRCYA/j//7ApParXCN94bDIgNyJGpRa/x
 W+N6qb9PYGvPrzTdoOXW/QzqGqcVQR4joOUSSN9QaaX2VEr0YqeXvdIHCKV+GjiALWou
 SYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Qt5mFGK6sX05ojDaxMAjvkBlcEMddgn+Oj0DLlJ4YA=;
 b=HvEv68TejT8g0tC5fy/dvnhbVHD0/CaTkrZb/ONFrnIWHHOLQbou4GzYzq9joBZYq+
 MrLuRB/tAf5D0QOMoUN2M0gN95r7a8OIDYA6NlkiI0s+0SqyyIknNHvJ5ybr43OA46G/
 RnN+z5K/sQXLF2ZfZORRoRuoExFHz9bd169/BSaBJUWl+boiX9ZvmDbUjtwIr9nXsTxn
 kNpqNKewp5X11L4qG6VsadlkcjlilCPZIjfh3RRO3XA8y3yAcymNl6vGiwE7xwN5vIg7
 NUPcBi8CPqJYq1VxDr24aWHLQSGw9HFX6HqaqqzvThFTcYS92lDcAm9kB9/JsZJoszzB
 qkww==
X-Gm-Message-State: AO0yUKXEnU/FVu+pJV0yKYy0nqqCEYIIf6/b5liFUn6IVBXS2V2YQkI7
 rNC/wB3jYyygN7NasR7IHrPdyw==
X-Google-Smtp-Source: AK7set+7sYY2Wj85mv08VszGc5IaPm73bTL/Pht6iWE/smmOSsXKR2lKnVDqHCBLHMvZ1bxgy5n5iw==
X-Received: by 2002:a05:6000:789:b0:2c5:3fce:423b with SMTP id
 bu9-20020a056000078900b002c53fce423bmr2819757wrb.4.1677611221534; 
 Tue, 28 Feb 2023 11:07:01 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d2-20020adfef82000000b002c5801aa9b0sm10730547wro.40.2023.02.28.11.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E10F31FFC4;
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
Subject: [PATCH v3 14/24] tests/dockerfiles: unify debian-toolchain references
Date: Tue, 28 Feb 2023 19:06:43 +0000
Message-Id: <20230228190653.1602033-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

We use the debian release number elsewhere so fix it for consistency
along with the broken comment.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/debian-toolchain.docker | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
index 6c73408b34..dc9545857f 100644
--- a/tests/docker/dockerfiles/debian-toolchain.docker
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -30,7 +30,7 @@ ADD build-toolchain.sh /root/build-toolchain.sh
 RUN cd /root && ./build-toolchain.sh
 
 # Throw away the extra toolchain build deps, the downloaded source,
-# and the build trees by restoring the original debian10 image,
+# and the build trees by restoring the original image,
 # then copying the built toolchain from stage 0.
-FROM docker.io/library/debian:bullseye-slim
+FROM docker.io/library/debian:11-slim
 COPY --from=0 /usr/local /usr/local
-- 
2.39.2


