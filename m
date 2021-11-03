Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151474446FD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:23:02 +0100 (CET)
Received: from localhost ([::1]:42796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJyV-0003go-Ez
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJpe-00017Q-F4
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:13:50 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJpc-0007EG-D8
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:13:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id u18so4668449wrg.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6L7V8FBbm3jTst1al+hCD3I4R6kwO4ndmzZB8XWsSP8=;
 b=rhp8yviM69pwVywInLctt4hyQJ8Aj9+VExCxKuJ27tPxX2y5SfSbir2S+WUFX/B/IR
 4GqhWvdvbruJEj+HlzgddJ3A+ab9zmH4aT1qOv+GtAJzWtpBTcEZYlNunEt2Sl0A+QaQ
 IUuoC7s45JXZ+SVd+nxS3NEHv3i2H9hgYhlpuQCx4c2EBPnoIcrWJ340EJAIpocWmCI7
 lCd6xgz9WC046kjJ5acl5dMGtpekcxPPlBh+VxBh0han6SIMAYWw7rbwJEGPAknXuTN7
 M4P+bVdaN17fZgLNfnqSAMuCvvCioUVtiu3EHIRcujxmtErcKt/gkhn8jwSSelvu0LM4
 3sCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6L7V8FBbm3jTst1al+hCD3I4R6kwO4ndmzZB8XWsSP8=;
 b=ek9esDxXCkE0THwQvu8dIqzTwKqQ4GNVOz2BZzSI76i3u0ouLezYzJ94bjxrtm+Zm9
 Vd/WAAEgB2zi2kwQP788zn/TafDWX0sIBjIBbxN5Rn31dvF4ldiwnLBAdlgQZhRy5XPM
 CFiOVWf9eKtuV0ztcDfQxInrvPY8mZ5wEbxzTTzqvYAMtIxq4YGW8pNsCyJwmu7z7Ajq
 qmg3wwh5RKBxD0UYqzqSx6i7E5A5mE6AtEiNTmR85t1MWRw6APQnv97tx0RzLtgTtZFG
 h3v9swsaEDvRNZyyZ41cN596o0z+Up1zOw7tpKvhKXD52jMWfeD+Shql07i5q2fm/cos
 1+gA==
X-Gm-Message-State: AOAM530xGJTg5l7g7RTnxFbI0JuEGFYpFZqgX4DXYxQ0WHhuK2I22l+V
 GDdEPm+2hC/ojJ2pQws7CUeXyg==
X-Google-Smtp-Source: ABdhPJxZAcCaNbwLZ/ydbx8J3Nx4AldScvG2TKEgPYQA6ILBsLpcPnrYS4Pefe8GPYFVeHLsenEsXg==
X-Received: by 2002:adf:f681:: with SMTP id v1mr36501976wrp.367.1635959626869; 
 Wed, 03 Nov 2021 10:13:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t1sm2769470wre.32.2021.11.03.10.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:13:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 597661FF96;
 Wed,  3 Nov 2021 17:13:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/docker: force NOUSER=1 for base images
Date: Wed,  3 Nov 2021 17:13:39 +0000
Message-Id: <20211103171339.721910-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As base images are often used to build further images like toolchains
ensure we don't add the local user by accident. The local user should
only exist on local images and not anything that gets pushed up to the
public registry.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 5bbbaceed1..462a3758d7 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -150,6 +150,10 @@ docker-image-debian-sparc64-cross: docker-image-debian10
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
 
+# base images should not add a local user
+docker-image-debian10: NOUSER=1
+docker-image-debian11: NOUSER=1
+
 debian-toolchain-run = \
 	$(if $(NOCACHE), 						\
 		$(call quiet-command,					\
-- 
2.30.2


