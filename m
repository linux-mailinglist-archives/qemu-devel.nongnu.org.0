Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8F69DD27
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:48:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPEC-0006pR-KU; Tue, 21 Feb 2023 04:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDv-0006Yq-Rn
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:14 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDp-0005jm-Vf
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:11 -0500
Received: by mail-wr1-x431.google.com with SMTP id z8so3430903wrm.8
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZxilB3yNWFWB7/hvwhbCfncsMYWzYUYFV0McBYO3N4=;
 b=Y5pcMeuD6wgCirMcP2uYe3tCgZkdsrpFssEpaBXThOkO/MDa/gdaWj2zcF+sxutpU8
 72YmAZzoM59x8GqEL8qYxHHku/mSbLTkwlIQMjC3bfOFXjdtv1/x3RWd3kUkkKOqBh11
 0mf3+Ssr7YxR0wTJ58OpoYHDz5jQXEhIaCeTKebx9CMDggVCmdPtXZfAjZp2YPHVinCa
 2zjaua69W8p/pOQw2g6AJnN2/vBcdUp8uAp3Vq39veDuAeA9Wsxk1IUWONs9AedsjVrF
 7uBne4BAw4OyoSv+NzvAaA04N6F8UFSxzyabhWmPKbHy+1s6Mi3Y3VZxnykckGeVaG6X
 4Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZxilB3yNWFWB7/hvwhbCfncsMYWzYUYFV0McBYO3N4=;
 b=EprL9Ltk2nkNhGYaJJqEw3q4R2/9XK/T3Y1MDIItVsJR9XZpen5DAz+mxzS75qmkAW
 Jrz6sUGQiS51dtGi0+QjWAsNHHU3F6l0/D/v2MV1Tp5pJhfHwhhhtOTes0tdMLaUSsxD
 0iGc2b0Sv/LwyBW6OF8hA1SSuXf/RJ2VHKdx4lH961+Q8KSUvJknz9WeUlpqaiYi2bmt
 FdYsQFls9RlBt8mL8aga8qU1YBkmvWIsXB61zY6aZk/yjLCgApzSyWlPEH429Y3W1f2R
 /b5V3n3IqvVozxaynBFuJO+vFVjCInD17JGNuSWu6NHyqT4A10H2amcnEYIDkVvvqXIq
 pA+A==
X-Gm-Message-State: AO0yUKXhuPHxpIg9CC9QSHVgv1r7YutfYxyUyiY6CM1ns/BeY+j2kaHK
 Rstvo/Y7yg5qyETkNa47DLs3yg==
X-Google-Smtp-Source: AK7set/PE3i4m6lzmtk1Y3u5DliwKyyQEF8ZmxA6IEwMjwFmcCg+yfUcFQcbzyey3JZsNXJHNoh6fA==
X-Received: by 2002:adf:e689:0:b0:2c5:5da4:a3b1 with SMTP id
 r9-20020adfe689000000b002c55da4a3b1mr4458091wrm.69.1676972763846; 
 Tue, 21 Feb 2023 01:46:03 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm2005375wrj.70.2023.02.21.01.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:46:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E6E241FFBF;
 Tue, 21 Feb 2023 09:45:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 08/14] tests: don't run benchmarks for the tsan build
Date: Tue, 21 Feb 2023 09:45:52 +0000
Message-Id: <20230221094558.2864616-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

All we are really doing here is checking that TSAN builds compile and are
therefor a tool available to developers. The benchmarks are not
representative of QEMU's actual threading behaviour and they burn
precious CI time. Indeed switching to check-unit reveals many
unaddressed issues which have been logged at:

  https://gitlab.com/qemu-project/qemu/-/issues/1496

So for now disable the make check and make this a build only
test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8f332fc36f..e9a67e0191 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -465,7 +465,6 @@ tsan-build:
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
           --enable-trace-backends=ust --enable-fdt=system --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
-    MAKE_CHECK_ARGS: bench V=1
 
 # gcov is a GCC features
 gcov:
-- 
2.39.1


