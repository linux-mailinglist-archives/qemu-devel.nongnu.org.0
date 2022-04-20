Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD1508FF3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:05:45 +0200 (CEST)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFe4-0008H0-4k
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEr4-0008LA-AE
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:15:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEqq-0002LR-KK
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:14:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id bv16so3364813wrb.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=83gLTTG2aqYl6u3PlbkF17eXMVRlI6kRYYejCjl0OX8=;
 b=oSqPVDpzyzTz7Ats4kYbTSTX6yIXSvCs/Lc2uXvd+N+ZBNt37++lxgb7RhTPhajrh7
 q+oO7Av4/UI/uyCdbbKpzZ7BVQ2DpZe2ebquDAc6JYs4PHkErFlhNpoZxI3oC9IxKhen
 uUpiR0KLgzuPX7U8NvTi4CZ0PLRbTcnllwM9FvtRb0QY1sSa18bhIuKecYPuLGtXM9WJ
 rqzd+ID6lpKA7cCm3HJUPBbAr/+kFhaFa6H9LRuX+kjrLnHzWOwjb4j3I5AoCP1/AGYA
 JyS8SfOnvSB+iEeKZVJthPIrln3ahAESrbHvh+/ywiy/97E3sbNR8/vRXj0mzknkR+PW
 K2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83gLTTG2aqYl6u3PlbkF17eXMVRlI6kRYYejCjl0OX8=;
 b=xO11aDUtwDSeEFwVmezX/91erWqNG/IXcbhZ15qKarrMX15yY8PN3XhzWzB9lEwjYd
 jjsu4sTUzb2mrNibvp1NPAD2RIP3Nq7o3UBDVJujunXqJzHcm/p0qVSsZkBfo+elUtv3
 7wMZINvWoxhoJdzkoaXBGFAoUZ4g1A+5U67oFqDBszkq3Omuw0M6f8giA+5Wx6Ktvfpy
 TLJvdse+I746pywYUDLla1ffVIYIVY8bqkUDyLDAXge96JnZy1sXtJCLhNjYrkMVdy6z
 igDZ/a4E1vWGzkdbW847ciA6fsUMQVvlMN0BGZ1OhQlJMq2tgvqwftzv8GJwUyolbdGG
 rxeA==
X-Gm-Message-State: AOAM530/kxdaaeYKpablL+svXUfNNlYT4duMiQd2M1YDki4O9bUvOFre
 No/4dny+scBknQHsdMJUsYmZvA==
X-Google-Smtp-Source: ABdhPJwQoseNCeOEiyizg+YYzjJeordmoio3PLvwOuQWWRIUzNelvJmWp/oardZ+Ngl/m3ObVZMMhQ==
X-Received: by 2002:a5d:6c61:0:b0:20a:a261:876a with SMTP id
 r1-20020a5d6c61000000b0020aa261876amr8902394wrz.251.1650478491299; 
 Wed, 20 Apr 2022 11:14:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm53683wmq.46.2022.04.20.11.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:14:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E755C1FFCB;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 19/25] tests/docker: remove SKIP_DOCKER_BUILD
Date: Wed, 20 Apr 2022 19:08:26 +0100
Message-Id: <20220420180832.3812543-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

It is now unused.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-17-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-20-alex.bennee@linaro.org>

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


