Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE15C620C1F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:24:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKpD-0007Da-3M; Tue, 08 Nov 2022 04:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKp7-0007CK-5X
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:13 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKp4-0005mb-VR
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:12 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso8650722wmp.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsIUPL4URppAX7w6NGrUdBT/BUmCRhwxzbv6AwfzKCA=;
 b=W5CvJjaZeWufGA+5W/omDak7/5f8CoqAIkChf0pWDiIq05dkeNceeKUEtRJCdYB7FN
 N3pAUJyRsOr3E+dRfcwsxblg9SWi6j7+EWxKUFRnonQ1xOQ0u6Kt7SS0JHvcD1jrxluq
 n5uTWcaInCx1zopeeqULNVcpOnErP8Ng01922eA+fskQsIZhY7dg20SlYehVMdeE7OVw
 O3nR7BYItRRgTrwRdwatYXjNYLa1wGfiPAndWHzsfDOy2QnNUECVlxYwpK47Wz1xHgjr
 i3AtjX6jZ7lIwQb95ms4Zakfy6UcopoItVnjzwXJZrVXWfrtsgOgeN6E1wWdOcOiUJVH
 Ig9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XsIUPL4URppAX7w6NGrUdBT/BUmCRhwxzbv6AwfzKCA=;
 b=e/orVsSXxXsquZ2Bg4aJpIm9Zzc4+Hl8z0dIZhPVFTC4RQSb6eDcs8np/Xm6RMq6tl
 PJadb3kz6bHzW6m65i/vSqljOskOppNEonCTdd/y55KGHivW5plfNyv4VPYOYJszlReb
 136+MTKny6fedLhX+zj/VD737/IbxZrNO8JpQ7SSncl06VGWqv8UE/YsXWBWC9s/EPhY
 zGYz57KbmHAD50OJYZPSGa/aWiUCLqZqmw7Q/FqoO7k3lX9f3e9UVyO6aYYdr6RMbTgc
 INAS3qB2AISWkKsnG5Za5cBNx6IfXRz8tSHUgcAe+TcRee5gU0MBZ9Da5VSElR/p2WtT
 R5XQ==
X-Gm-Message-State: ACrzQf0Js0EWcFOlv21yaMTiGEwfE9Mt680teRd8GzIkJA1fVu3VEPeD
 3o0Dvg5R/8yp/lwv4o6PTgKabQ==
X-Google-Smtp-Source: AMsMyM641Lgianvp3QAw6i6ZSH5fq7aWKzaKhYLl2rlEhzQqJRuq8jz9tEnSoqG6JCEk7vtKWk51oQ==
X-Received: by 2002:a05:600c:4e45:b0:3cf:3e69:9351 with SMTP id
 e5-20020a05600c4e4500b003cf3e699351mr47101397wmq.2.1667899389460; 
 Tue, 08 Nov 2022 01:23:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a5d4f02000000b002366553eca7sm9519221wru.83.2022.11.08.01.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:23:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3CE1F1FFB8;
 Tue,  8 Nov 2022 09:23:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v1 1/9] Run docker probe only if docker or podman are available
Date: Tue,  8 Nov 2022 09:23:00 +0000
Message-Id: <20221108092308.1717426-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108092308.1717426-1-alex.bennee@linaro.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


