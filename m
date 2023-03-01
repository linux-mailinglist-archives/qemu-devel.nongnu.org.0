Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344766A6F2E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:18:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOCK-0000Ix-Et; Wed, 01 Mar 2023 10:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBl-0008Ce-GX
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:17 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBj-0007eJ-Ce
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:17 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso11667390wmi.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmUrhgk0YSn7eAK1UZD+INIAeQ9KUq+cgoKOu+wodlw=;
 b=IfUdVQx7fJAROXgZ8cfWRfd6VzfyaU0hDHUskP3hejnstt+SwIEPyWWcPa08vNge2E
 7Vr2iAOFetiO9vbDMC1MVH8q6KjCtvWDQi6qJNfOjoaUqFJzUeY7R4IjlGFVNU6NiE+A
 u3MY/XtljoMHSroqaeNeMtdGxANMg15BHFTBd5NEGJsbPbBDi0tBSsg4OLZYYnix98T0
 8adQm9KD3Eo49M+MtnP5ECeTz4QIb9WukJbRDPNoXmO7mC4PfOH/FFJxENRSS+MQJo+x
 CTJqNEVSXe/FN09d0hpypuvNFkwPxBqsn0meRKY6O2j5G3rydAJ0OkRq+Go5eDvIqO3V
 oZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LmUrhgk0YSn7eAK1UZD+INIAeQ9KUq+cgoKOu+wodlw=;
 b=z3k5atjFOB1kb/YxioXVNtCqeAR/+oX1hs0Trj09k4PqNrLM+mJTYQ6/afOz6mb4hJ
 amdKfofwWybaOPKDp1VB7UHYGQeZx7Mve4pZ0kZF2DU9q/D5Hc+sV2xZJ7mVmmywP6l3
 L3+XeJMKupZFcfScw+u0+FtWSQ2GENTeFGrSk1B1Q2FYsCFYo6avRuVP+sr/gfwAlb3D
 XtxL4xcB7TZpmxJ2KW544oFyaiaSkZdQPUDZhzpijMd1yCx+FPONprTAbxA2VlIjCSuh
 ZY4kGICxdULbGvUTemdtXhOGMBMSuPAV6TAYakwQ49icq6Jr+8b0qE5ISJtFgrj9zYQP
 W3KA==
X-Gm-Message-State: AO0yUKV7ncxtVC/b0XnomKgn1sbc3UtGpCc+CK+AdtLxEtoE785ZPc40
 gsXF87zmJcraMXW31T9E7tc/CA==
X-Google-Smtp-Source: AK7set+nET5ki2JnWGLX/JvWSo87GgojsznW9bL7YbwKr/BRv4x9r+pXuRvggn5BiGcRBGScSFu8ZQ==
X-Received: by 2002:a05:600c:4450:b0:3dc:16d2:ae5e with SMTP id
 v16-20020a05600c445000b003dc16d2ae5emr5334026wmn.32.1677683773906; 
 Wed, 01 Mar 2023 07:16:13 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a1cf714000000b003db03725e86sm16025067wmh.8.2023.03.01.07.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E7321FFC4;
 Wed,  1 Mar 2023 15:16:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 14/24] tests/dockerfiles: unify debian-toolchain references
Date: Wed,  1 Mar 2023 15:15:54 +0000
Message-Id: <20230301151604.1948813-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

We use the debian release number elsewhere so fix it for consistency
along with the broken comment.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230228190653.1602033-15-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
index 6c73408b34..dc9545857f 100644
--- a/tests/docker/dockerfiles/debian-toolchain.docker
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -30,7 +30,7 @@ ADD build-toolchain.sh /root/build-toolchain.sh
 RUN cd /root && ./build-toolchain.sh
 
 # Throw away the extra toolchain build deps, the downloaded source,
-# and the build trees by restoring the original debian10 image,
+# and the build trees by restoring the original image,
 # then copying the built toolchain from stage 0.
-FROM docker.io/library/debian:bullseye-slim
+FROM docker.io/library/debian:11-slim
 COPY --from=0 /usr/local /usr/local
-- 
2.39.2


