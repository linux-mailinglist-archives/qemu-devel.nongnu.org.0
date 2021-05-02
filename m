Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC36B371010
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:14:02 +0200 (CEST)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldMDp-00088g-PY
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLyF-0007sU-6Y
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:55 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLyB-0000ik-56
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:54 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so2323743pjb.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6eMYlPkz/xwpAiWOHwYMrr3yr7efGsUc6A7ETsQFoo=;
 b=Ynu0GwpQ3e3NfzdQBevIiDFuKwQyhHgeCftVnetMeKcH9KZMWfRYZXf5XvMKGpXC8T
 TGzdhxJqz/Qk1UV2w2JW5sI1KgvfbHqg5Lbtg+3+9cKMn8UsdtUifgN4Obvtm/EQfeRw
 OjeXtNZ98dxYUXqGQRHyfxF1jyYNFuPqh+SIFC6qwb9i5lPNtaficiingwYFZAvAL22L
 c7QsGjnyELWcl5Q8qppJspN2cqeiVH8K7XkEIYhCRKJBpkqUetHc+SXJvv7oefRvsqUM
 NEYb023FyMFjeW14JTiQAnhLUkTRZkFO2hZ2mP/y0GIbXmEJ/uc2inXVVL+5rJHTU7lK
 Wbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6eMYlPkz/xwpAiWOHwYMrr3yr7efGsUc6A7ETsQFoo=;
 b=HS3oA/4bBFFbBXZ6kjhfjbe6S+HMjCW5/HYRo5va8ZRFGao8LNldSfZKvJcZ8Wyzmc
 hCtwNvwoKXDeCtB7RTpwUJE71/nlVm2E+cVZHfMvZq98NE4ZCrmazoSl1dJgiFByVeYY
 FyinmGF8clZPvBb0AEjUrEAfgpfNcJT1x0eQosfZZbzFXZ2+my16tikRogjxfE6Fm/qy
 4iy5zLy7YtyX7n7UxmctVGmz1PzrWUktcspNCzLmurzquMmCivys6iNYMFgIkMGtGR9/
 jQlOiSEaoXz5ypsskG1erzG+Axoe8L4CfWnzfBt88EWnsN5zyb8dQy/IQJvkqreT8YI+
 WiMw==
X-Gm-Message-State: AOAM533w9wr+Ktyi3Ki6SVrkBXW7whLCxyVU8bo5YmGz0ecjGNx5TbLB
 fGEBT4hEN2lvbF5McrZcNsZyQ4oOqMEdPQ==
X-Google-Smtp-Source: ABdhPJwZdOrgX0sFDsBzs50kgp/haQ+ZDz2va9eqeB5YwNiQvaeNWnAgB5RPwLMxkYATnowTiX6dQQ==
X-Received: by 2002:a17:90a:9203:: with SMTP id
 m3mr8287286pjo.21.1619999869909; 
 Sun, 02 May 2021 16:57:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 26/26] gitlab: Enable cross-i386 builds of TCI
Date: Sun,  2 May 2021 16:57:27 -0700
Message-Id: <20210502235727.1979457-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're currently only testing TCI with a 64-bit host -- also test
with a 32-bit host.  Enable a selection of softmmu and user-only
targets, 32-bit LE, 64-bit LE, 32-bit BE, as there are ifdefs for each.

Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index fbf7b7a881..bbf3cccf6d 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -27,7 +27,7 @@
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 .cross_user_build_job:
   stage: build
@@ -98,6 +98,15 @@ cross-i386-user:
     IMAGE: fedora-i386-cross
     MAKE_CHECK_ARGS: check
 
+cross-i386-tci:
+  extends: .cross_accel_build_job
+  timeout: 60m
+  variables:
+    IMAGE: fedora-i386-cross
+    ACCEL: tcg-interpreter
+    EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
+    MAKE_CHECK_ARGS: check check-tcg
+
 cross-mips-system:
   extends: .cross_system_build_job
   needs:
-- 
2.25.1


