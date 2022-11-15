Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC614629AAA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouw6z-0006zE-Ac; Tue, 15 Nov 2022 08:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5O-0006I3-Lg
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:49 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5L-0004Ia-W8
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:46 -0500
Received: by mail-wr1-x429.google.com with SMTP id h9so24317995wrt.0
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D1q/nYWnv7CC9RJOw7+MRs0h1KGh/HdTVV3GAzdd4uM=;
 b=ye8AjOgVDLjvAN3QziHEMI3XCoTwtN7ulYk9iRWj7PZ+TBZK/y3rfS7GG3syvUSiR1
 kyLjJ4T2mVh+yhC8rfTPP5xdtUnZeZ+say91r6PImvoVgxdRCM1FzEo9dOYCJXMpxmYj
 k7yDpYSeRoGJ4gvNLOhtLQM5MlfcoykLwIDGg/pzU7Kd/DNl2t3D/+3UdD+LQ5Fg9tWB
 7i/rZLXNGd4aHxO77g4vPRs2jbyVQlcIxcZHUIpk/SVOEVzfwqWjk2rLIwggbBjF/Brs
 6WgwsDVZPPIrJH0rNalApYLxuYENGJUPXcCWDxi4TS/X9jkIUrb+sim9xsPrdyxBMbxs
 bJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1q/nYWnv7CC9RJOw7+MRs0h1KGh/HdTVV3GAzdd4uM=;
 b=gl0qLoarUeQgd40uId8LhTeztiLRP9wSSVKAPK39Li9kH3hkyiPXCvodQrs/g2wj3O
 iSeNvWHtGQQdQvhBLfleZ09wiLmUPIaKQsQ01HJBHlAE/4waRQsJ+1dz7AN5CTfpne4L
 yZk9T5sK8Anow+nCh6wpc5pv56oqgHbcOHAHVmrBrdT9wJpKJK03bAG1I77fepAErK96
 J8GmXL+N0cMWSJzISMxftxqUVyFD1qeZAo6Tl5+sMKSnohr5BQLA2/u7Aesuy3smHjlX
 c8ECWGwnptY5G1EX3VEauUp7Bxg6tzhFGNyk/cRJND33zW0r9U2d7xsLhViOuy7atC+2
 gO1w==
X-Gm-Message-State: ANoB5pliR4JNwEBewnmWmXtLyXlclkdTb9TRFDDqi4sytwN/0fstwYDb
 JbE4vRSqDV4onBxg1knVHESBug==
X-Google-Smtp-Source: AA0mqf4i+d8yYefomhrCcD6l4a8rLs1UBaUFuuGduqgNseYnP30cbp4vSbpuqdOw5JHxvgPn4DOIGw==
X-Received: by 2002:a5d:42c6:0:b0:235:cebf:8a0f with SMTP id
 t6-20020a5d42c6000000b00235cebf8a0fmr10738827wrr.220.1668519282145; 
 Tue, 15 Nov 2022 05:34:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t67-20020a1c4646000000b003cfa622a18asm21515616wma.3.2022.11.15.05.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:34:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 521EB1FFB8;
 Tue, 15 Nov 2022 13:34:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 01/10] Run docker probe only if docker or podman are available
Date: Tue, 15 Nov 2022 13:34:30 +0000
Message-Id: <20221115133439.2348929-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133439.2348929-1-alex.bennee@linaro.org>
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

From: Stefan Weil <sw@weilnetz.de>

The docker probe uses "sudo -n" which can cause an e-mail with a security warning
each time when configure is run. Therefore run docker probe only if either docker
or podman are available.

That avoids the problematic "sudo -n" on build environments which have neither
docker nor podman installed.

Fixes: c4575b59155e2e00 ("configure: store container engine in config-host.mak")
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20221030083510.310584-1-sw@weilnetz.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221111145529.4020801-2-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 66928692b0..26c7bc5154 100755
--- a/configure
+++ b/configure
@@ -1780,7 +1780,7 @@ fi
 # functions to probe cross compilers
 
 container="no"
-if test $use_containers = "yes"; then
+if test $use_containers = "yes" && (has "docker" || has "podman"); then
     case $($python "$source_path"/tests/docker/docker.py probe) in
         *docker) container=docker ;;
         podman) container=podman ;;
-- 
2.34.1


