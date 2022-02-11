Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C54B29B3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:08:35 +0100 (CET)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYTK-0002mv-NE
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:08:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOV-0007NQ-3L
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:38 -0500
Received: from [2a00:1450:4864:20::62b] (port=33683
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYON-0005As-9u
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:34 -0500
Received: by mail-ej1-x62b.google.com with SMTP id fy20so23742843ejc.0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2fP8uSb/eYaDLZpEznfNBVAbpBrXdH2X5eOjJpJH0s=;
 b=Yd1J6dL19Urjlnlcorl/amncph7Pns1rQuUHGfx9YZraTHmJl4FKvKTAohB9nRsTsZ
 ZN9NpresTpYDiLwtSvDLENhrVXKJoRecoPF/Mnby9qM7TWeBFb3BnkbfpPHkQ0k5Ip0e
 +8xS+yN4eEvZvaqzCYxikkmYm6fDAFoKloR0y7YfqUSX3eNEgdJ4YXCwxb0dF+7l/01+
 sGx69w/kl6eYXcVci2yHlAkXcpddtoOT1kxz1FXVM4RSb7iGgtwn4pSmmabKjI9R9dd2
 cXKQnC30+/onID/+hSudPuduugnVpQccs36OtoRsE7UVqvzGBY7qgwL9tMLA/SNd1FDX
 dBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r2fP8uSb/eYaDLZpEznfNBVAbpBrXdH2X5eOjJpJH0s=;
 b=LI0hkLL+eaLRFAOSvSaOb9dIsYJFdPMdzNzS1AlKtTobqmGm65Nita8YxEuIOkJoTj
 ukPv4wS1bkC6/jl2QXaz28dI4rnTpm2yK/XwOYw8ISP3eT7RNv1eA4U2oLZP0VVH+ODg
 +N2JICrA+PYZXWfN+evCBJHxEUmhJQ7TsdnXmIu52Cq3DM95BWCHXDbRMSp1CA63QaT+
 9BJvgaE82odm6mK5X0YHw96zCCwfZ8Vqwq/B5Dfb0LoSu7QmboAB1eGzRY1gshn7Stc9
 dTyOnMLl0hmYzX4p74EXJ/dih1rlKHrwfitz+8CetkYWvH9Y97+jkrtAsS3ilZ1KTns2
 VDFQ==
X-Gm-Message-State: AOAM532BBsC6IOaGeJdrAD2vgPIqvltnpbySB5QZl7b7F3lDcet/eTvf
 oBd+QeWbtJnGh8Dk+jxxi1uhCg==
X-Google-Smtp-Source: ABdhPJxU61jH2dS5MRymy+nIuKS1/Xo30mq6PYLj0oaC8/zVOB7xVldliFcjIvdp5diMwN9LzXMwww==
X-Received: by 2002:a17:907:1610:: with SMTP id
 hb16mr1961695ejc.449.1644595394369; 
 Fri, 11 Feb 2022 08:03:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id eq6sm6794188edb.83.2022.02.11.08.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C8D461FFBA;
 Fri, 11 Feb 2022 16:03:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/11] tests/docker: add NOUSER for alpine image
Date: Fri, 11 Feb 2022 16:03:00 +0000
Message-Id: <20220211160309.335014-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The alpine image doesn't have a standard useradd binary so disable
this convenience feature for it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0ec59b2193..286f0ac5b5 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -158,6 +158,9 @@ docker-image-debian-native: DOCKER_REGISTRY=
 docker-image-debian10: NOUSER=1
 docker-image-debian11: NOUSER=1
 
+# alpine has no adduser
+docker-image-alpine: NOUSER=1
+
 #
 # The build rule for hexagon-cross is special in so far for most of
 # the time we don't want to build it. While dockers caching does avoid
-- 
2.30.2


