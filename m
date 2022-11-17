Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C5962E302
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:28:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieE-0006Ph-Ux; Thu, 17 Nov 2022 12:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovidu-0006HR-Me
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:40 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovidr-0006Dc-Vd
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:38 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5624592wme.5
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0janOlTSK9f2YU19w2PIDrRXkTKP3g2+mNpYWnPVHh4=;
 b=Xj9r//p85ViHct1+SZq+cQ5mxkpNPgF/rQ8S4yad3+Arwpg1jwZTnUQEephsL6Ix01
 9Ad02SwAc8A2Tijgqmo3QEs6EOslKvMGPc3PkqRjJ2yGwuLmtK144p5X63T4xzBANtSG
 dbfM7WPqf91PqtnQrTMVFU/7/jVJeKOOStX04Fjn2SM4fpLReFNpWqmrG8kWxRchc62S
 jVMdQK+JgX8MZf96T7Xcu7qrFFHiGpmbFGPDk7ZMiuPN1wdYDAHAkItXAwn9W8QshJU7
 3Dxch5fQmO4+oFXYSBoyoRceGcbBGmQXFHZogPNvml9Tnhoih3sNZ6AiIiZmrjFRgPsb
 NQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0janOlTSK9f2YU19w2PIDrRXkTKP3g2+mNpYWnPVHh4=;
 b=f+67+1nLhQD/MhSUiHzZV7wknR4rvOl1IXCBq7mXvYodvD7kEGMWWNMYlnPhwKxjPD
 maIRwkjrZvqIFDPEdHR0yqIcisuDoKTn2z3ckNh43LuG8+1xpYosAh2JYv7kRls70qpN
 FgpDI9R24XRTAXr+6YUqGbYADCEvR45ZgXQNaymUfHRd/UmrFWIe/V5xzk0w4yW48lXa
 9ZmVTS4USjK+eauNlG1gCf7FXtfX2eEC/z6hjWsmPHL8rTxv10yX5WG2keYDlkHHRXoG
 hPrG+O2c6zbc1j230lW944NxvWrST6qoZxyoONpFc/WCsISai78arz8KZVhZoMuuTshn
 a4iQ==
X-Gm-Message-State: ANoB5pma9dNUvyadbfH1OJ4vkXKGgBhedpccFKNlhAl8X9yNTCl9rJVd
 aehGeinp5TCbkvqS8U3LITsppA==
X-Google-Smtp-Source: AA0mqf6QnVz51Fr6r+ZBaW7hW6fTQnyyhYhEbvvoMa+XhqIQQ6Be8Re/4GgRlw/GF+9G7jcxJjdKNg==
X-Received: by 2002:a05:600c:15d6:b0:3cf:54a5:b7ee with SMTP id
 v22-20020a05600c15d600b003cf54a5b7eemr5949174wmf.106.1668705934111; 
 Thu, 17 Nov 2022 09:25:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a5d61c5000000b002362f6fcaf5sm1543712wrv.48.2022.11.17.09.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7ED71FFB8;
 Thu, 17 Nov 2022 17:25:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 01/13] Run docker probe only if docker or podman are
 available
Date: Thu, 17 Nov 2022 17:25:20 +0000
Message-Id: <20221117172532.538149-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


