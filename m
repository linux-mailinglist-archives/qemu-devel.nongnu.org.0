Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C075067BC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:33:52 +0200 (CEST)
Received: from localhost ([::1]:57762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkF5-0002ry-Q7
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1Y-0007RR-RO
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:54 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk1W-0001PZ-FF
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:19:52 -0400
Received: by mail-ed1-x533.google.com with SMTP id b24so20406490edu.10
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sajppsGrhPdrcRGlnuwcRv5kXGwBsA65wFB/nwUgBP8=;
 b=OIE4gpFyLTSVKc5gva/yGgsIgAKg5KYZ6qnoaJjYIpDqRTB1antQ1Bgyy+GM3RV7kY
 kGZ4YwL4gB/5JHEl77hSzm9MlnwP4iizA+JEQ8UGSqWDZBrRQavPmDx9+skKhMppbeQ7
 qq4mVNoKln+WA9cg+zcy6jdIW74hiXSXIBMSF0bNg4MAyCixpZeJias6bj/8qVDmSgFW
 82s6DDbPtfgwxMVMp21C7fTu06hEDYgWrTwMU/gmYTWbFEJBa0dYCKtVZRS/TA618bWd
 eLVe4wNmP2zUVqj+vXVGvMcnqDCU+kOVau+xGsqkghD8qwVJEXwCFsHhxAHXNDUWlZzy
 gl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sajppsGrhPdrcRGlnuwcRv5kXGwBsA65wFB/nwUgBP8=;
 b=J2jjitpiEhkFJtQBSLXbCxaTlEn+4jx9qNwCIXKfZWUrOp7W4EAT7P72rCi+T034Yd
 CqXdYPxh3I4hFX+E3P2SYul7nnPueoZaTz/2dLmm57pfGBjF/z97ZwCVqD+OiGdITSmM
 tQhj6deqNZgnUN9vTfUdfw4nxEEEx9teBjCdOxMEslLXrf7+t5VDHoks9AHdLzwmnUcY
 G9aRJ8vdUWMcGLz/NlUhK2V1Z1Fh+vjqQ6RNg4jbTtgRhocRDcjheGioHDYl+J5GpefF
 NyA6L1lrOPcXWsfAQ7fw5M2ZeC0n+TowR2nlCU6b5lM7+fjNHpcudXb+HZy8iDuzA3mb
 LE0g==
X-Gm-Message-State: AOAM533GTPGyHorhnDU62x/JVI0510OpsQiDgb2zjpYvSHDADYZXXjj3
 dwSNccQSveJAShyXG6tuy7qazA==
X-Google-Smtp-Source: ABdhPJxMqvquprfgdr60xn0EOtp77Htbg7kvRkrQgZP2bmz9NCF0dmHxvmGYwfycPW9Pp1l/k68l6A==
X-Received: by 2002:a05:6402:34c4:b0:419:e00e:64c1 with SMTP id
 w4-20020a05640234c400b00419e00e64c1mr16251367edc.88.1650359987261; 
 Tue, 19 Apr 2022 02:19:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a170906435500b006e8669fae36sm5483169ejm.189.2022.04.19.02.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:19:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A5501FFCB;
 Tue, 19 Apr 2022 10:10:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 19/25] tests/docker: remove SKIP_DOCKER_BUILD
Date: Tue, 19 Apr 2022 10:10:14 +0100
Message-Id: <20220419091020.3008144-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

It is now unused.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-17-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 12 +-------
 tests/docker/docker.py        | 57 -----------------------------------
 2 files changed, 1 insertion(+), 68 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index eb100c294f..ca2157db46 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -33,15 +33,7 @@ $(DOCKER_SRC_COPY):
 
 docker-qemu-src: $(DOCKER_SRC_COPY)
 
-# General rule for building docker images. If we are a sub-make
-# invoked with SKIP_DOCKER_BUILD we still check the image is up to date
-# though
-ifdef SKIP_DOCKER_BUILD
-docker-image-%: $(DOCKER_FILES_DIR)/%.docker
-	$(call quiet-command, \
-		$(DOCKER_SCRIPT) check --quiet qemu/$* $<, \
-		"CHECK", "$*")
-else
+# General rule for building docker images.
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 	$(call quiet-command,\
 		$(DOCKER_SCRIPT) build -t qemu/$* -f $< \
@@ -77,8 +69,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 			{ echo "You will need to build $(EXECUTABLE)"; exit 1;},\
 			"CHECK", "debian-$* exists"))
 
-endif
-
 # Enforce dependencies for composite images
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 78dd13171e..d0af2861b8 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -676,63 +676,6 @@ def run(self, args, argv):
                             as_user=True)
 
 
-class CheckCommand(SubCommand):
-    """Check if we need to re-build a docker image out of a dockerfile.
-    Arguments: <tag> <dockerfile>"""
-    name = "check"
-
-    def args(self, parser):
-        parser.add_argument("tag",
-                            help="Image Tag")
-        parser.add_argument("dockerfile", default=None,
-                            help="Dockerfile name", nargs='?')
-        parser.add_argument("--checktype", choices=["checksum", "age"],
-                            default="checksum", help="check type")
-        parser.add_argument("--olderthan", default=60, type=int,
-                            help="number of minutes")
-
-    def run(self, args, argv):
-        tag = args.tag
-
-        try:
-            dkr = Docker()
-        except subprocess.CalledProcessError:
-            print("Docker not set up")
-            return 1
-
-        info = dkr.inspect_tag(tag)
-        if info is None:
-            print("Image does not exist")
-            return 1
-
-        if args.checktype == "checksum":
-            if not args.dockerfile:
-                print("Need a dockerfile for tag:%s" % (tag))
-                return 1
-
-            dockerfile = _read_dockerfile(args.dockerfile)
-
-            if dkr.image_matches_dockerfile(tag, dockerfile):
-                if not args.quiet:
-                    print("Image is up to date")
-                return 0
-            else:
-                print("Image needs updating")
-                return 1
-        elif args.checktype == "age":
-            timestr = dkr.get_image_creation_time(info).split(".")[0]
-            created = datetime.strptime(timestr, "%Y-%m-%dT%H:%M:%S")
-            past = datetime.now() - timedelta(minutes=args.olderthan)
-            if created < past:
-                print ("Image created @ %s more than %d minutes old" %
-                       (timestr, args.olderthan))
-                return 1
-            else:
-                if not args.quiet:
-                    print ("Image less than %d minutes old" % (args.olderthan))
-                return 0
-
-
 def main():
     global USE_ENGINE
 
-- 
2.30.2


