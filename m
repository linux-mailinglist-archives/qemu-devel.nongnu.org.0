Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4B6A5F74
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:15:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5Qp-0000Pv-Mm; Tue, 28 Feb 2023 14:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Qo-0000PB-DG
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:14:34 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Qg-0004fN-DX
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:14:34 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r18so10913285wrx.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f5HeGCTtnDvYK2JOBc+Ar5DGwIfM59biXTeTnbWUumM=;
 b=cimG1UhTHHogOciz41WjK9qI22rkt8VBW0FU5zqgDzNzOj6NxZBP7s0p1+p9yHetGw
 YjCcwxmCEhdWXO+rjbmEH+V4jW/ITK6M1Va+7+I1SLlZuQE+bmBvdzVkY6f61/nx04Cb
 6Fmz/f9zzGFTxqkXSz26jsZpW+WCJFJJnOf+8DRiZsiVpZ7HGR8oPdCatE75h+4SDkdS
 GeCv1y3MHwoWP8hP9z1fG8tUAP6/yp/j2r4v40G2e6qrYDkUQARivJ5bsjViTP/SVudR
 NNpzrNf3ilHLIfutvMIqaA0eyPG+Gv9OHUgLSAq72yL6/4vJ1rXT1FazOJb3uWkmYf9y
 kdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f5HeGCTtnDvYK2JOBc+Ar5DGwIfM59biXTeTnbWUumM=;
 b=OXxp0iQBFltj04KoxEl+eXvntFhy+qNxAyTRewHx8cCefHzWR2sfTnrX/Reqh4ZjVC
 8Aen/7J0Cmfw2CsjvaZbLgBia4HortUQraH7e4S5sMyuq64lca5c7M59W+bm2l71cvul
 QkwO46GN2CHi9ykAfstMzvttv/H9ZtkuNnvLAe/5BUUqy65aCXWvTQyO3x1+cZTqK+Xo
 flI8Ku7g/gSUwcncKx2LmXkmIT1cqt4qSukOgajh/uy1wuHo9tTrJ9FSFR5qqNjlEXH0
 QqXpTg04YCZvcw3OoQNBUg2OP/JIXhk+Ue/KQuLb8cuHZaq7OXSQT3xtD9jm1TUji5F0
 uHRQ==
X-Gm-Message-State: AO0yUKX3kSG05Hi6p4YnbKdNlkp5NiySwVT7SoSEiRsD7DBFuu6JTCOT
 LM5gI6oj5EkPe4I4HkDMNtYobA==
X-Google-Smtp-Source: AK7set9HqcHfveBxZS7d081+vI4uW3WZAFXvge6aJ/I3NcA0tOBPa0/pSW50toapYprPp2PiqI1Cvg==
X-Received: by 2002:adf:ce10:0:b0:2c7:e05:2d1b with SMTP id
 p16-20020adfce10000000b002c70e052d1bmr3172076wrn.50.1677611660904; 
 Tue, 28 Feb 2023 11:14:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d4a50000000b002c5526234d2sm10694219wrs.8.2023.02.28.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A4101FFC8;
 Tue, 28 Feb 2023 19:06:56 +0000 (GMT)
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
Subject: [PATCH v3 21/24] tests/docker: use direct RUNC call to run test jobs
Date: Tue, 28 Feb 2023 19:06:50 +0000
Message-Id: <20230228190653.1602033-22-alex.bennee@linaro.org>
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

If we build them without the script we can certainly run them without
it.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 680afff952..54ed77f671 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -224,8 +224,9 @@ docker-run: docker-qemu-src
 			$(IMAGE) --executable $(EXECUTABLE),		\
 			"  COPYING $(EXECUTABLE) to $(IMAGE)"))
 	$(call quiet-command,						\
-		$(DOCKER_SCRIPT) run 					\
-			$(if $(NOUSER),,--run-as-current-user) 		\
+		$(RUNC) run 						\
+			--rm						\
+			$(if $(NOUSER),,-u $(UID)) 			\
 			--security-opt seccomp=unconfined		\
 			$(if $(DEBUG),-ti,)				\
 			$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--net=$(NETWORK)),--net=none) \
-- 
2.39.2


