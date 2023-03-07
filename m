Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3173F6AE2D0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:39:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYSf-0005Qp-Qd; Tue, 07 Mar 2023 09:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSO-0005I1-RR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:27 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSM-0000ak-2u
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:24 -0500
Received: by mail-wr1-x431.google.com with SMTP id f11so12336751wrv.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678199900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9R+WJAtyA8SeJ/1as6Ou9Go9GUXAmG0Tw994EVyLcw=;
 b=mfcQAQR+3DsaXY3k/iv9dwnpTr08JdV2kb+X9L4oYq89EIh+n5d1+9N1AaXK4+OR+t
 kg7nioxnlLkbazc9sU0CmMkKgJu0wJcyXaPR7VWFIA5B26U2Dz5bNFdDGQPR4RPRgK1x
 iU9vZyY4Xyk72r1KOWcaW4beYB+TSK8azhr4lUou9MNu4j3OZ5LAoBZZV750wDt7FS0v
 8HUIK4uYp8RtdVfafJ0w2tZgXykUFnSCm8nWQy2x6WuDrOdJjnl7+or0CCkZuxZCoNhp
 rB9FcU2dlma5bqYskEAaFhCstZgbk1n7rER/719947MR+TyeR843c197W3RIcTfSPj/2
 ydag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678199900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9R+WJAtyA8SeJ/1as6Ou9Go9GUXAmG0Tw994EVyLcw=;
 b=llSRPtFO0oMB2TwqDALlFhfK0go0SIH0I3+vP7ltBJaI9rSmfLownEflNl1/I2ujiv
 Tc/jjDIMKzqvw/fj13cs2JC2by716Y4yH9m1D6DPfoWgSeTtk/+knQ4JfNcPdv+s+YFt
 2vnnDI68hIw2mkxPJVLwxN3yEVJ3hhn5siJAGnmeEtxuy2GhVS4lOZkNAbDSC2r2A3IJ
 pIzQ3anbl8cOVhaUcSorz0+1egoXADoPrPodC3FoU4bJpRaK7sXxYDs1glf0EA02CyAG
 zkBRsFBGuVkX1lyVhE/DTrHcM1px2JlaUlBgJ+1UtNXodgXq1SFsrbfrGaVsOsN08tNz
 cnug==
X-Gm-Message-State: AO0yUKWgxDqhD40N+3FVAyT5498AOGJ6YJ1GDsfOVIQheLm38pYi7nrP
 APwvk5dgX8Sx28rWmqmWyieU2w==
X-Google-Smtp-Source: AK7set9Xx6AIqBJh6ewhxjr/CR024kPBpC+DH3UaVGmCdrNUVs3XDshGuSq5Zdn35bdpIPajUPfkTw==
X-Received: by 2002:adf:e888:0:b0:2c7:f56:28d9 with SMTP id
 d8-20020adfe888000000b002c70f5628d9mr10329444wrm.54.1678199900417; 
 Tue, 07 Mar 2023 06:38:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a5d4d47000000b002c5706f7c6dsm12771855wru.94.2023.03.07.06.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:38:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94A8D1FFBA;
 Tue,  7 Mar 2023 14:38:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 2/5] tests/docker: all add DOCKER_BUILDKIT to RUNC environment
Date: Tue,  7 Mar 2023 14:38:16 +0000
Message-Id: <20230307143819.510186-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307143819.510186-1-alex.bennee@linaro.org>
References: <20230307143819.510186-1-alex.bennee@linaro.org>
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

It seems we also need to pass DOCKER_BUILDKIT as an argument to docker
itself to get the full benefit of caching.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Fabiano Rosas <farosas@suse.de>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 54ed77f671..9401525325 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -39,7 +39,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
 # General rule for building docker images.
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 	  $(call quiet-command,			\
-		$(RUNC) build				\
+		DOCKER_BUILDKIT=1 $(RUNC) build		\
 		$(if $V,,--quiet)			\
 		$(if $(NOCACHE),--no-cache,		\
 			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \
-- 
2.39.2


