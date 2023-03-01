Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE16A6F6A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:26:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOK1-00018w-7p; Wed, 01 Mar 2023 10:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJi-0000b8-5e
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJd-00011r-Du
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:29 -0500
Received: by mail-wr1-x42e.google.com with SMTP id e13so2104146wro.10
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b27PuU+rWXLWaY/k0uD9Sf2qA77t6AY1zW87Orqns2o=;
 b=SvCyZrz1TIaWLSn7SMpXEyBZSXrPkefQGzyGISTKqrR7mvO2zRShttLndxtcejQ7v8
 IcXWrDvAK+W0vOgZE3vc6YSArtjtu0woh7yxj9bfy9pw12RWNJwec2HBenUOb68uolUq
 fezwuhDvyBn9LcUGgDoW1YfX9R2brk6/RSl2XMGSqdL39z0ihLsu+IXMguDaPFVEGUi8
 VQXEM9kpPwVaVWwfg1diuP4iPgKsPwaXnh/AKVEDnT0/3Wz2R9TXADPYFlTomk9QeHgM
 LY9uKKKlKOtiSL2xQFoGtSG8avZ+LXM/96ZVGW75SuWv7iClf7yDQFgYFnYJxn9hdUyu
 Y2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b27PuU+rWXLWaY/k0uD9Sf2qA77t6AY1zW87Orqns2o=;
 b=r8bOACErlBv1yM+N4dk+a8JBycdLA+Ju3mHLLm9jM9ytFMw1LA/Fr2/Ni3FwJ260cq
 9z7rF2hA33AQMb6Eta4PTqS43oBkWez8yuvBbd8jYfzfihw8IYuZVlhIouq96awRAa4J
 JAlGsSMenEyUE+5krxT+yJXOKGFhD3PajTvJ1uXUCn3fZnBLWe3/FCamr4xvBdTBZjU/
 T0jC8ScH/CS8HKeryU8wOEHpwOf+FmETwYDG7YvjmSSpUceVKschb4u+/nzKe5sAUAZV
 hw+16YJABlxgj+HUhLuAkxii2AnPMGop1nwz8IXq1fbZC0e3PTsnmil8uezrtAhcyYzl
 xrQw==
X-Gm-Message-State: AO0yUKUatqfnzpNlbmePZofhHoGZHWs0m9KglnsusqBl5xKa4E2c5Sac
 SXdHNjDDICZnod0bI3QN3aYmgA==
X-Google-Smtp-Source: AK7set+z2Ivcq9Atf/XregHtHkrK88fOgknGTeXdG4gLDu8RQXXW0qJsi0z55I98fsjn3C2EtKsSrA==
X-Received: by 2002:a05:6000:1f83:b0:2c9:b9bf:e20c with SMTP id
 bw3-20020a0560001f8300b002c9b9bfe20cmr4545122wrb.2.1677684262159; 
 Wed, 01 Mar 2023 07:24:22 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d49c3000000b002c5804b6afasm13240400wrs.67.2023.03.01.07.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:24:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 306EE1FFC9;
 Wed,  1 Mar 2023 15:16:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 21/24] tests/docker: use direct RUNC call to run test jobs
Date: Wed,  1 Mar 2023 15:16:01 +0000
Message-Id: <20230301151604.1948813-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

If we build them without the script we can certainly run them without
it.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230228190653.1602033-22-alex.bennee@linaro.org>

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


