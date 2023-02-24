Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626756A2130
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVcVK-00056J-8h; Fri, 24 Feb 2023 13:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVD-000543-TE
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:03 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVB-0004p1-3Q
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:03 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so8752wmi.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFFga98mTvSLpaYsI5+GZ2pTSutF+AdzB9RPsTcdBPA=;
 b=wMoORnegUQjEk2IjUZqiUrD7tyYazQa+DKsPXxSdgn9jU8FsdP4hEOHCgTKttfRVdZ
 3iq7Y9IB57jaGXAP2fTV4sHA04OagDhhik9wMIoNeVd/q9tNb9Px0Ho/J9eCFF3POq62
 8k4h+31PMOGW0S+B/3/QHXLJaq/Nqbo84Xg3bpyYDYBfXgvM94A16jH5kH9+io3lBaae
 PAlUzrtyjgkH74jh9NojkrFyD9wdF50FjAUgHkJlJDo6WKCyyQJERFNSfWazWuoSP8gt
 XuApMmJGc9ZUWaa8Wi8r4tYwj/S38omRJ/Ia35E6qO5q8TQZIxlf98YqAaKjPZiaUViG
 /l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFFga98mTvSLpaYsI5+GZ2pTSutF+AdzB9RPsTcdBPA=;
 b=7zkdKFqPg9d5zlVzvRA0yfjc59hwHzvGl93SJmqEItyxvgriw+fekUzBAZN5FHBTMO
 kTngPBOSgKjeYHh/lG2500W2C1eHsLPByInIG/zkOEhtqmJrw9lFFGLGC8cfWheC3TwB
 Hg9f98rOoLviS6zfgl62G+R6a04m7CoqMOvCpLRuTVF2TtEB4TdCft52Dkm8Jr+Zcg4o
 9DdMevAEeCSVNnV3FY5IuGPALmxbHOgUzsH6U5Ty78AXbsGamM7KtJA1egg0EUjEVRo1
 1aprqmFJG2Ao1fGAQC+a1a2Q2gMuj/IaFfIW3m8J7ac7ysgQmdOhdeQfGCnFpf57ctDv
 5H4Q==
X-Gm-Message-State: AO0yUKWUVRa1R/NnpnVPp/6hvKgilYgLb+JhumTtNTGdwakOWW9ayb4b
 Yqy5pyepQfOIriN30EqMK1OXQw==
X-Google-Smtp-Source: AK7set+iYRwTBB2jUk7rZVLv3GktAh5KqJrIOMrkoTQ0jSvWlf5DqgJTVSRExt/SKsl+2kmPt5PMPw==
X-Received: by 2002:a05:600c:1895:b0:3df:1673:90b6 with SMTP id
 x21-20020a05600c189500b003df167390b6mr12652229wmp.39.1677262139675; 
 Fri, 24 Feb 2023 10:08:59 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a7bc00b000000b003e91b9a92c9sm3864655wmb.24.2023.02.24.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:08:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C71B01FFBA;
 Fri, 24 Feb 2023 18:08:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH 2/7] tests/dockerfiles: unify debian-toolchain references
Date: Fri, 24 Feb 2023 18:08:52 +0000
Message-Id: <20230224180857.1050220-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224180857.1050220-1-alex.bennee@linaro.org>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
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

We use the debian release number elsewhere so fix it for consistency
along with the broken comment.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
2.39.1


