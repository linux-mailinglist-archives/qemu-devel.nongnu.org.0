Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938182F6779
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:25:45 +0100 (CET)
Received: from localhost ([::1]:55990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06NU-0005Du-KF
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wS-0003jS-AI
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:48 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wP-0004xV-32
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a6so5138130wmc.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqnOb9f6RdPAtD9oWhgI1kyYb0MroTHpdmyrfz9hrbA=;
 b=QIzEH9aNkjoEOMbwIhnwGfZ4NB1/7gZ4ca6OUhskWREQYeCHuhmz1FRVx3tC4WU1wb
 jRJvt0VTpmsQiGygMjwhrFNqFRq7dfJ0uoIXrZ/gJzJyVZk5rTVmMU0EevIcX/oMRCri
 v+lPzTLuHjyWkR/OV6lp9RiNlfB2RL16n3Nh5zF3qlslItbETDWG/RmOsOSw4eGpoJaQ
 9a4cOC9AyF4UKZHDsjne3JZ+Sll9i67xjK0TlPRw7pEeAM8sIsBcmcPBpLDUXklMYCKd
 6QfyiSXZqbpnYJdawSGTejYHY4QtmrgyiphUdYtTnnaNE+J7Cho6dIW2Ym61xWzXcXf8
 dbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqnOb9f6RdPAtD9oWhgI1kyYb0MroTHpdmyrfz9hrbA=;
 b=pI2QORSRsjR2fVMxvmxjFbfWesyB66y3L9gDP7WbSXQJHH95/ZWAmew4Dbhv9pToku
 wa/fZM+ppCgDPsWSmwqeGvMCwHLyWV9lM4m9fxlx7GWcfajzNltTn8cN9+HkiXB9TiaE
 nJhZDoLHsvE6XgT02h6oPiVyaj4NGaWgb/x13d+5PTSPRhZYgG9HTHg7DNs0zPhkDa2F
 k8Cw4mQZLhfUPQdEducF1O5bbfiUl7at46Z4TuBvWn136zNtSkYzEeNXYo3WwIt7t4bg
 8X/ZXeJCSXtZYPs7N5Lye2Dvg8J0Ou7JNMixp1cGDe9nOpPbIyygabVny1w1EWzU9xW7
 WXPw==
X-Gm-Message-State: AOAM533G4lsEPxwHZZeOgTRdOl0IZbWJo7RItFds0qMyhR9bVhVnzeD7
 GqfzgoWWLhaG4Kz+4MvfNNSlnw==
X-Google-Smtp-Source: ABdhPJzgbZXd1c1XIbzP4TJ5raWwuhzfAMCWW5QepQ+NxGtReTX6FdEnp4TjWEPfGKCsgYIznd0PIQ==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr4850511wmg.189.1610643462276; 
 Thu, 14 Jan 2021 08:57:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b3sm4873776wrn.70.2021.01.14.08.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6F321FF96;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] docker: expand debian-amd64 image to include tag
 tools
Date: Thu, 14 Jan 2021 16:57:26 +0000
Message-Id: <20210114165730.31607-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is going to be helpful when we want to both test the tool
integration and in the case of global generate a xref doc build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-amd64.docker | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 55075d9fce..a98314757d 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -1,7 +1,7 @@
 #
 # Docker x86_64 target
 #
-# This docker target builds on the debian Stretch base image. Further
+# This docker target builds on the Debian Buster base image. Further
 # libraries which are not widely available are installed by hand.
 #
 FROM qemu/debian10
@@ -14,7 +14,10 @@ RUN apt update && \
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
+        cscope \
         genisoimage \
+        exuberant-ctags \
+        global \
         libbz2-dev \
         liblzo2-dev \
         libgcrypt20-dev \
-- 
2.20.1


