Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A046137A0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:15:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZR-0002hw-SH; Mon, 31 Oct 2022 09:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYj-0007wn-Fy
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYR-0001CZ-Pr
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id v1so15889108wrt.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EGpVj/x6emk+Gk8JKMkbCIdsGLC6yCTvoW6GyyQvtYM=;
 b=msg1uJihni8aDVMTGZNA4efDITHV8HGQJ2OGQQYv/HS2ZFBjvkzfg7s7ESdTITocWT
 OAMV50fGLU9gKL3zcYuc2FWiJo3jGBgcIlDq88z03+dUwmVPMzDlk8reV94dfrnAElQR
 k0DKNEVKKENEfGfNw2ImpTGpMd3NJsvrSGwra7Wo5GLz/z1Uu5KZtTbxhNtTLvuw2ngF
 hMriFNyfoI1ypQUe8ATELiNjOLJb4L52A4fj2a+B1tj4UGHMfL/+eMPSxQOGh8xsG6Ir
 yir9uRKlC4hnaxCHA1PgusZTAl1wMld/tq5pQpBzarMtoA9ZsTMLcZr4QZeXHwPgyqiH
 aWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EGpVj/x6emk+Gk8JKMkbCIdsGLC6yCTvoW6GyyQvtYM=;
 b=jSWxtMTbsSJl1I9qbfKi4XzvEq73sNmtxNXKVCHmetbNT2sagxLXOaYC0ig7h7YClO
 11/y3ThhvpshXc2VDOXisASHO4NN6stuiYwtVMPp2fD7qKtT57wt5zIWRZq2+3PT07CQ
 mTT5BAqjRyarK30yhAQqx7eCoii8kB2xjtQOSTOGOJoXKDvXBdUnVPj8GWZS+Vtnwx9c
 1Mp95Trc01q9eGIs5pNd0eE8A9NuhyunEdPcJL0xCh1ph52D2Dmirk+YibcQpjVeJT5c
 GaJrToJ2L4Dn7a6cs5x6KOot9IpSpV9cSQ/axkT3ukeWfGsrLItftK9bVA8BHOWGc0Qf
 5Pyw==
X-Gm-Message-State: ACrzQf37NohCtgMcuEfIlN5KZcCD+1SGPBUdPEYZsyG1bjcGOXM88l1y
 KOzLRiNHWuChaJPMtT7KMDdy8g==
X-Google-Smtp-Source: AMsMyM6hJPCVJO5r99oduzHAeOs0Ga2v+tDI9PcnkrH1QiQWUiQV1i9NjIN2vxk3pVKoevGiD+NFjw==
X-Received: by 2002:adf:e84f:0:b0:235:d53a:2d7f with SMTP id
 d15-20020adfe84f000000b00235d53a2d7fmr8215645wrn.334.1667221812169; 
 Mon, 31 Oct 2022 06:10:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c314a00b003a1980d55c4sm7435671wmo.47.2022.10.31.06.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF06E1FFB8;
 Mon, 31 Oct 2022 13:10:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 01/31] tests/lcitool: Rename non-Debian specific helper
Date: Mon, 31 Oct 2022 13:09:40 +0000
Message-Id: <20221031131010.682984-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

This helper is not Debian specific, rename it to cross_build().

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220929114231.583801-10-alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221028095659.48734-2-philmd@linaro.org>

diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index e45c99adbe..a6a7c23c1d 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -93,7 +93,7 @@ debian11_extras = [
 ]
 
 
-def debian_cross_build(prefix, targets):
+def cross_build(prefix, targets):
     conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
     targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
     return "".join([conf, targets])
@@ -121,45 +121,45 @@ try:
     #
     generate_dockerfile("debian-amd64-cross", "debian-11",
                         cross="x86_64",
-                        trailer=debian_cross_build("x86_64-linux-gnu-",
-                                                   "x86_64-softmmu,"
-                                                   "x86_64-linux-user,"
-                                                   "i386-softmmu,i386-linux-user"))
+                        trailer=cross_build("x86_64-linux-gnu-",
+                                            "x86_64-softmmu,"
+                                            "x86_64-linux-user,"
+                                            "i386-softmmu,i386-linux-user"))
 
     generate_dockerfile("debian-arm64-cross", "debian-11",
                         cross="aarch64",
-                        trailer=debian_cross_build("aarch64-linux-gnu-",
-                                                   "aarch64-softmmu,aarch64-linux-user"))
+                        trailer=cross_build("aarch64-linux-gnu-",
+                                            "aarch64-softmmu,aarch64-linux-user"))
 
     generate_dockerfile("debian-armel-cross", "debian-11",
                         cross="armv6l",
-                        trailer=debian_cross_build("arm-linux-gnueabi-",
-                                                   "arm-softmmu,arm-linux-user,armeb-linux-user"))
+                        trailer=cross_build("arm-linux-gnueabi-",
+                                            "arm-softmmu,arm-linux-user,armeb-linux-user"))
 
     generate_dockerfile("debian-armhf-cross", "debian-11",
                         cross="armv7l",
-                        trailer=debian_cross_build("arm-linux-gnueabihf-",
-                                                   "arm-softmmu,arm-linux-user"))
+                        trailer=cross_build("arm-linux-gnueabihf-",
+                                            "arm-softmmu,arm-linux-user"))
 
     generate_dockerfile("debian-mips64el-cross", "debian-11",
                         cross="mips64el",
-                        trailer=debian_cross_build("mips64el-linux-gnuabi64-",
-                                                  "mips64el-softmmu,mips64el-linux-user"))
+                        trailer=cross_build("mips64el-linux-gnuabi64-",
+                                            "mips64el-softmmu,mips64el-linux-user"))
 
     generate_dockerfile("debian-mipsel-cross", "debian-11",
                         cross="mipsel",
-                        trailer=debian_cross_build("mipsel-linux-gnu-",
-                                                   "mipsel-softmmu,mipsel-linux-user"))
+                        trailer=cross_build("mipsel-linux-gnu-",
+                                            "mipsel-softmmu,mipsel-linux-user"))
 
     generate_dockerfile("debian-ppc64el-cross", "debian-11",
                         cross="ppc64le",
-                        trailer=debian_cross_build("powerpc64le-linux-gnu-",
-                                                   "ppc64-softmmu,ppc64-linux-user"))
+                        trailer=cross_build("powerpc64le-linux-gnu-",
+                                            "ppc64-softmmu,ppc64-linux-user"))
 
     generate_dockerfile("debian-s390x-cross", "debian-11",
                         cross="s390x",
-                        trailer=debian_cross_build("s390x-linux-gnu-",
-                                                   "s390x-softmmu,s390x-linux-user"))
+                        trailer=cross_build("s390x-linux-gnu-",
+                                            "s390x-softmmu,s390x-linux-user"))
 
     #
     # Cirrus packages lists for GitLab
-- 
2.34.1


