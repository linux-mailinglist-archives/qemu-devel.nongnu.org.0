Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3746A2132
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVcVO-0005DO-Cx; Fri, 24 Feb 2023 13:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVK-00059s-EW
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:10 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVD-0004yP-7B
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id k37so266911wms.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ymc1XvDfx+x5msJ4IYnnHFWuI1gzH/mezTScRKBnzt4=;
 b=Fk3v2jd18TMXUGLnQ21lKSCQymzXYwUuq259UDIhfukKgjNxYXhjjBZgz2EpW2CdMD
 hTtFDkKiU8gbeVvCgNk8e0VIPsQXIt9mx63j9YG7Z9voO5mpN0VDr2SeC3r9KdnjVc/L
 9yMzjwamKHvaF8BBCRX/TOqkY4dLSluLKOAbKr2/mTajNwwvjV68IbEz2serknEKJh5f
 6V/QR5XHjtnCzdyOjGk8mEY1PkGR/C6zGifF1KYLiZ8cO3k8rgaP0QfbQMfNK0sFIQY7
 38Rq4riNfIWLOD1cA9CrWv7vfdeTj6F0tqElj9LcCxSNRi45S4Wfv2mVKL6ZVjwdQpLF
 iF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ymc1XvDfx+x5msJ4IYnnHFWuI1gzH/mezTScRKBnzt4=;
 b=rfvfz+px5/6T4XyFnDXHJrAp+MHeUeK6RuGSi02zLo7LqGqsi8XyKnYtuT4G91FicT
 xjbeSzM3mJyasr5zoNC6S+zAK0NnGBgFIOSMnaBi4rabG/7ccIH1nh1QFtvVEMjKh6Jj
 xrjgR3CIh9IFkdPxxivwp/E3DVAZWSb9Lw7CuEiDuZVkEku4YlCneTovrkaKcGALoC88
 ++OuqMZM+U9E2L7KFDte0sy/2U2uX9wjlEFMhE/4QQTMj2fMGIjRzWVTMjC11frG/8CF
 V2q20wBsMblK5OG85mdqMTUGR2GY88luqx/zK3d3xuZ4viCm3G2OFCLFBYty/rKUY0Zr
 8X3Q==
X-Gm-Message-State: AO0yUKWNIH1WXXvLtEDxE90qKgvoo41Q2TpY8wZMOgTkCu5OoXRqx4BQ
 4BseW1Wx4ObDwAVfIQBI9kcBLQ==
X-Google-Smtp-Source: AK7set9vq7J7nxZG06X5dn/vKdhksqowyiSJ7N4pk5k2gIi+EL3OYEyv/iV2+HtlqbQctISEvk4CBA==
X-Received: by 2002:a05:600c:154e:b0:3eb:29fe:f91e with SMTP id
 f14-20020a05600c154e00b003eb29fef91emr1737859wmg.21.1677262141521; 
 Fri, 24 Feb 2023 10:09:01 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n31-20020a05600c3b9f00b003e8dcc67bdesm4176942wms.30.2023.02.24.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:08:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 958561FFBD;
 Fri, 24 Feb 2023 18:08:58 +0000 (GMT)
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
Subject: [PATCH 6/7] tests/docker: use direct RUNC call to run test jobs
Date: Fri, 24 Feb 2023 18:08:56 +0000
Message-Id: <20230224180857.1050220-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224180857.1050220-1-alex.bennee@linaro.org>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9e73ff5cf3..cee1b34703 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -223,8 +223,9 @@ docker-run: docker-qemu-src
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
2.39.1


