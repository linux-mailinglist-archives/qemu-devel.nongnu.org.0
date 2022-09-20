Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1265BEFEF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:16:32 +0200 (CEST)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalXb-0001fE-CT
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzR-0005gD-9J
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:24:58 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzO-0001nM-QA
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:24:57 -0400
Received: by mail-ej1-x631.google.com with SMTP id l14so7850445eja.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8ZUKtzGk7WPnEFS3PMm7d4pu0BGAkLQhtgRChbWSZVU=;
 b=S4JywhnZ9ig+hhir6jtm2ca+Bh83fPXqnvdjOwQ3P5+0OEn9RJqlrzZCNrotJmyaYm
 uQHCNSa+rbqXjXJOgdu6uzQ5Gb9L5wJEqEo1GKoo8RyY2QVSlp5VaLDafOCGF3ddYbQ/
 hh16RQNfEaaYTpbX5g+Ud+j9Ea1S29nklQx/Oj7McX2LStLtPwVdQUooedw7mPI3WB0t
 t4Ae3B7ra2sbEM0mgL3+BvqshrPJ133QDQ7vjLd20b2G1k2YCeO6iAAcXZ9nw34Y302G
 Eq8tLsGr+WAi/6iNHxoVuK/hJmXxSgTUooYV44sGVxCKhBB9e31GU0kJP2UiCVaGlBKq
 /Row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8ZUKtzGk7WPnEFS3PMm7d4pu0BGAkLQhtgRChbWSZVU=;
 b=Jf4XZbcTlSKZyXnbFjBrgyIO4/NXHzhw1uNgx4rKQ0BWKR7HBJhwjL2qgq1wUobUNj
 jHY4ciEoXdEgjN0hdWDfYrUpRYtpsKqaYF/M/zrQS8vX7lES1gHTAYgs75nirD+KbnMP
 XO9YifrZAjiaMWVNEyXnZOIKnOxdphtqYJpdeljUScfdudM0+n6XLxALp4rIw7lYfe4N
 lyQpnK1TLykmv1eG06zMnb/t6gZaSnMz9P8mPXFbfoY2PkHKoLfdaTW2B2E4VN+3dYVJ
 XzOZg3IV6SbSiyhkysxZQrnHlrjFD39zgfxfqZ42NiJtkLVaOaW8+S38JsYg8ohmPAXF
 eWYA==
X-Gm-Message-State: ACrzQf1GkjGWbP4YNOFWeH5adf6p1jp1IKHOOpMCmO5o5aKJHp33DMR3
 1apU24RIz0Nm8nx3G4r7bHhkFA==
X-Google-Smtp-Source: AMsMyM5/XoFZVkuynMVZKs7Zgju4bgPsdeizv81m1Ma/2sDNhhWtdmalUTZSYhNsLDHB1POEPbHR5A==
X-Received: by 2002:a17:907:86ac:b0:780:df48:6a74 with SMTP id
 qa44-20020a17090786ac00b00780df486a74mr12903922ejc.656.1663694692909; 
 Tue, 20 Sep 2022 10:24:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x16-20020aa7dad0000000b004548dfb895asm226586eds.34.2022.09.20.10.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 589AE1FFC8;
 Tue, 20 Sep 2022 18:15:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 16/30] tests/docker: remove amd64 qemu/debian10 dependency
Date: Tue, 20 Sep 2022 18:15:19 +0100
Message-Id: <20220920171533.1098094-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We missed removing this dependency when we flattened the build.

Fixes 9e19fd7d4a (tests/docker: update debian-amd64 with lcitool)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-17-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 5c9398bbc9..c3375f89c5 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -73,7 +73,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
 ifeq ($(HOST_ARCH),x86_64)
-docker-image-debian-amd64: docker-image-debian10
 DOCKER_PARTIAL_IMAGES += debian-amd64-cross
 else
 docker-image-debian-amd64-cross: docker-image-debian10
-- 
2.34.1


