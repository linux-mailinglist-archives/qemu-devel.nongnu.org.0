Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D7830E9B5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:54:31 +0100 (CET)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tqo-0005ZS-R1
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Thz-0004XO-11
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:23 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Thx-0003XU-At
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d13so905261plg.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C3tpiU3zelsjFSQQuB1ZzEawshUyJREYmvhF2hEYIiM=;
 b=Lsga50J3Bb6Bfy1Df6O/QA443/VfrkhBkUx5unmEi8UJ2M5fyC2q25127EGJLvz3IL
 gQzeuPmCIkLadfLPEOpq8dyZXAcP6+FmAu0LXjl1Il0wFy3WQ4x99T7YPs+BCUiqLeRM
 /45K8Zq9T+V5VNjNwTWfWbYnNmqbZoHzfobqrgWl2OIi6tR+f4IbYTgHfdcyHQYlfQZ5
 XygnzwpQuYMJmjkRGRbpJ4IX2G4VX2+aKuM35Jwf80Pw5VExqWOdLxFTqznBvbzewxSw
 rsu9ZkqIQGOJhycftrchSEx8m8Y3Qx2K60+g1K9negiar9b/cImflr4zEQfuITjVAPcm
 t5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C3tpiU3zelsjFSQQuB1ZzEawshUyJREYmvhF2hEYIiM=;
 b=s9sanZXPNiCoAKkax5MB+OCYHrSsOtKD+TgQ+CGvlXYYtYa8HUFjFHMhdBx3JkEqS6
 776Zam6U9ci62wqGxjmU52Fn3lEoQ8TURKhkgIKS5thDh744og17YJyU+xZAPv29yDOs
 A7hyFgpQBnCHUaVPJsa1as5LTwIGzL/jRE2Y2cOu3pxvZ4obfL3fueJE9uCuZV1IBK3O
 FGfw6ef6pHvQUMkcWZ11n3EtzceJzKhN+FCRS8yHR8onHZTk4rOhto+u2tSr82ZtOLSR
 KSGKl5To39kpR2W/v5OHvJXIeijcNVkwsVtLFAixwavhlIT95KOpzWN2uNiZQTz67//G
 ZZTA==
X-Gm-Message-State: AOAM532vwfClNlo8xCJiiaa6mqvDJsQTmw8iX2gD1Y9IAzcrJKdBRHsd
 5FE3OxXy59P8+UcMSOIP32F4TyPvmE+XgZ9W
X-Google-Smtp-Source: ABdhPJwQbJIqh1PYswrsCWsEoq28AYrkeNJb6LTC00TOFwxtpzRbAVBhPwRZcwrV5RuTGM1DbN9vZw==
X-Received: by 2002:a17:902:e211:b029:e2:843c:426e with SMTP id
 u17-20020a170902e211b02900e2843c426emr5543556plb.16.1612403120092; 
 Wed, 03 Feb 2021 17:45:20 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/93] configure: Fix --enable-tcg-interpreter
Date: Wed,  3 Feb 2021 15:43:39 -1000
Message-Id: <20210204014509.882821-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: sw@weilnetz.de,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The configure option was backward, and we failed to
pass the value on to meson.

Fixes: 23a77b2d18b ("build-system: clean up TCG/TCI configury")
Tested-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index e85d6baf8f..a34f91171d 100755
--- a/configure
+++ b/configure
@@ -1110,9 +1110,9 @@ for opt do
   ;;
   --enable-whpx) whpx="enabled"
   ;;
-  --disable-tcg-interpreter) tcg_interpreter="true"
+  --disable-tcg-interpreter) tcg_interpreter="false"
   ;;
-  --enable-tcg-interpreter) tcg_interpreter="false"
+  --enable-tcg-interpreter) tcg_interpreter="true"
   ;;
   --disable-cap-ng)  cap_ng="disabled"
   ;;
@@ -6417,6 +6417,7 @@ NINJA=$ninja $meson setup \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
+	-Dtcg_interpreter=$tcg_interpreter \
         $cross_arg \
         "$PWD" "$source_path"
 
-- 
2.25.1


