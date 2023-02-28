Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A8E6A5F4E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5KB-0002Td-97; Tue, 28 Feb 2023 14:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jb-0002G8-T1
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:15 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JS-0002o5-9l
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:03 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so6514589wmq.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0snCxknU51VUiIyOYYXzqb7lXY8Z5Vkr/7qnzRTdnE=;
 b=jxXSJywnNu0PLak5jn92nBPa5UJuUl5rRmwSrHfecXKSJwwFeXOo34e46hs2exhJr4
 uig/+YUIfQkOfetcsfwn8k2rJB91hgp+1EPDFy2hPvq8nVVla/zQ6ZI3/yQwz80Tunte
 YKL/Ru9VM+iPlWc9zQO4nGaBX28uizr+noVM96+o/3c9n1trUqn0udW5wpncxtsQlsIn
 5FF8LSRMHt1/1q9RK0D3GGgNXISyPR0DMR34zLwwjWnB3VPQ/GDV1OaKtAguQKO5ukyI
 ev3zpbR8+XoB06E4QCuqAZTd09Zl7koxiZEYlxX4hKrnaBJQEFX+TnhOiuk4Hf/3caca
 FuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T0snCxknU51VUiIyOYYXzqb7lXY8Z5Vkr/7qnzRTdnE=;
 b=5D2j9kuLunt2rqBogv11z4TU7gAaTBjrPbuP75ClJqwVQjJGx/fQ82ZTNyfdFueMyu
 G4TeTSAG2Y2TFItRWmzlZAgadJcvp+nkiBo4jE68C7TcjbAcoJaud7oBP+6/DHiY+TaM
 7tfXTlsdnohpN1ttQW4HDbIdWDoVk6nMD2JbrxjIqQQuyQdnApwQYpwkPcVW/xF4m2y8
 9WeVeq7gBbEH3emFbPVSIEMb6tWHTx9+6BFggfgZUJ/pQfL05l3k3ewjaiVEA9R7ecmK
 gENZwXYdNLe4/you65bCNhgDnCmJ7HiQ+2C+GU5r+hPmp/szxivAQvh/Yh3UNWJuLCdB
 FCBw==
X-Gm-Message-State: AO0yUKUoY8M1WxSqcR8B9ndDTeJB9m01nwNrd3J8vgCLuJJH4iY4bPgm
 EGcXy2XEPNqmIjjdrRvjzHWe4w==
X-Google-Smtp-Source: AK7set+aubwquuAe8WxkIZthp96quK2fvtERnvGr512fRzO//xJV/I7mtFYymHX9cNEMHz7uAZwi4Q==
X-Received: by 2002:a05:600c:3506:b0:3ea:d620:579b with SMTP id
 h6-20020a05600c350600b003ead620579bmr3066036wmq.0.1677611216721; 
 Tue, 28 Feb 2023 11:06:56 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bi22-20020a05600c3d9600b003dc42d48defsm13548583wmb.6.2023.02.28.11.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D455A1FFBD;
 Tue, 28 Feb 2023 19:06:53 +0000 (GMT)
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
Subject: [PATCH v3 05/24] gitlab-ci: Use artifacts instead of dumping logs in
 the Cirrus-CI jobs
Date: Tue, 28 Feb 2023 19:06:34 +0000
Message-Id: <20230228190653.1602033-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

The meson log files can get very big, especially if running the tests in
verbose mode. So dumping those logs to the console was a bad idea, since
gitlab truncates the output if it is getting too big. Let's publish the
logs as artifacts instead. This has the disadvantage that you have to
look up the logs on cirrus-ci.com now instead, but that's still better
than not having the important part of the log at all since it got
truncated.

Fixes: 998f334722 ("gitlab: show testlog.txt contents ...")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230215142503.90660-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230221094558.2864616-7-alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus/build.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index 7ef6af8d33..a9444902ec 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -32,6 +32,9 @@ build_task:
     - $MAKE -j$(sysctl -n hw.ncpu)
     - for TARGET in $TEST_TARGETS ;
       do
-        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
-        || { cat meson-logs/testlog.txt; exit 1; } ;
+        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
       done
+  always:
+    build_result_artifacts:
+      path: build/meson-logs/*log.txt
+      type: text/plain
-- 
2.39.2


