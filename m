Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBBB610DF3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:57:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooM6z-0003FX-5A; Fri, 28 Oct 2022 05:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooM6x-0003Ew-4D
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:57:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooM6v-0004Jb-Fv
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:57:10 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso6217063wma.1
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ly/X4zWZ5kUZzYKSDVQ63uGT5gJNyfmZoqB52rBLDRY=;
 b=ZCZRRqQmNIH0rrXLQASCICzZPCMXJXaaq6UtjyVoaqGXWib3UKINRQKP57wl1C1/NC
 GxNgigkIhq5sBuEg/uVeENT82OET05rUTBCt4ptUTVCUhRf1xCDoXZ6zpwApErZLu3pC
 MhNPzl6yXtdOYUtStDu39oPUK+f0KIH6/+D8d9Ry/drfWbF9zH9jkZWLnoJFFn7DVhcV
 DWRDjXGmDKCZerXR+99QtOGwyzDqV6PfKJmZacu+vU9SRaNU2UwiEIbwchCN78jo6u1T
 BBSxXhmFirQwVjpW4JS2wLlf+bENwGODDU3vxJ6C9qn7cKkd9R26XZN5Bjn0vxlnqQz7
 CGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ly/X4zWZ5kUZzYKSDVQ63uGT5gJNyfmZoqB52rBLDRY=;
 b=8HHH7hG6h3w+8dLPwTrgveYKmaTvcNa09k9h0Vf4sYM3syRD1roVp4xE33sFFbjFfG
 7K8gROo3otMEbpnOFwq1R8T2fxgDueGc/OfNYT9sFtPvbiCJmaEv6YV74Q1zLX+U9jZT
 oyTAn+eylxMOZjWWMS3AXiYlg2zhxmdZkXsDDstAF/JcRzmvc41ddc19V09VbqUpRaTA
 luMDvmKc8tJXm3N5jxnjkSAyip35VKUHozP1mRqM6E+jCOq9WtdP1p/UsYt1+uik4Lqf
 tQl1QcIqXdMrharuwNJzeI3Z/6mSnKlN32dMu+uyjKSATseoAAazvCq6jkMDNKL2f2Hv
 zjcg==
X-Gm-Message-State: ACrzQf2I/2xRiBqhPde9liYoupzlA7sPhPiIBgIq0ofuc0AiPGn3bU8D
 /XtwxyVdEK8Jf7SR3zI9yMZr34N+H4v1bDn7
X-Google-Smtp-Source: AMsMyM5SUy5vXIKQxY8X85iUYbYgTdIQoAnPcKFBBEoXLlEaSqz/ySDaI+ig7rqy+smw9E2ocTsBCA==
X-Received: by 2002:a5d:4804:0:b0:236:94d4:5472 with SMTP id
 l4-20020a5d4804000000b0023694d45472mr5272800wrq.286.1666951027722; 
 Fri, 28 Oct 2022 02:57:07 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c4fd500b003c43dc42b4dsm7704709wmq.16.2022.10.28.02.57.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 28 Oct 2022 02:57:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 1/3] tests/lcitool: Rename non-Debian specific helper
Date: Fri, 28 Oct 2022 11:56:57 +0200
Message-Id: <20221028095659.48734-2-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028095659.48734-1-philmd@linaro.org>
References: <20221028095659.48734-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alex Bennée <alex.bennee@linaro.org>

This helper is not Debian specific, rename it to cross_build().

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220929114231.583801-10-alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/lcitool/refresh | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

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
2.37.3


