Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ADD4EEFBE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:28:36 +0200 (CEST)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIGR-00067i-9t
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:28:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI2B-0003zj-7O
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:51 -0400
Received: from [2a00:1450:4864:20::62e] (port=45832
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI29-0006eF-4l
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id i16so6068749ejk.12
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mVMoyQUwRyf0fLFyo8grOh4IVJlHfanRANKzcd9NF3I=;
 b=doCQls8GxR4Hfs8VXhabLjDifj5ZssuJb1VzxBHnXOAdi0cyaujdaP1YdQiZulnyJA
 CwC+Jdo1xlTwtFNFNuuArTb8vIddhLVMsGZzmtF8osIHz7eTVxrCCp03gKoFmdRSs1Uf
 i7Aj4+cqPkGz8tpypnOEtoZ4S33QLaUNNyQ8uuABvZw8kI/a6R/uq9LWYurudpmHAjmp
 eCv3hZ2ScgxToE9u+pqf/e4ozQp01C1gfhwVEVXb37srEPErAVpz62NxkJgv8RbRUR1X
 P9NGOJK/PctFrPHrPWDp3+YYC7L2NkwCt8JlkULxtFBXRTsoBhMecDOIxfUmtB0zFjlg
 jgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mVMoyQUwRyf0fLFyo8grOh4IVJlHfanRANKzcd9NF3I=;
 b=KaMeaVrNKNqVpSFHgGbrASn5OHdZosE6jgXHv2cAXYdOHyS8zjxazRvnfLsyq8SCbN
 GBaBy7Gnf96VPIWn9onUkDAavYIh3X+UAmosrw7nT5dhR0tv4uR3KKE5dvtsN2GsWPUV
 bTa2LkP+7vxL/+ku/jI4mFY0TfUYPQEa093F9KELtCy1854jKIxBQbrwdSVRS/piHtgh
 i4g7TkTDoo44rnd/3Hmd3njdPcQs2wKe21ORHukyrqFZHVYBQrOcRV9BLS4FFy4/wQzG
 prmQ3QydJCSz3e0l6hN5Tk0ge0w/elA+uXakOY93oD0Smbl6khcvU/su70+MngbbTV86
 KZPA==
X-Gm-Message-State: AOAM5328tQrKuFQ4yz5tF2boba4zbPsoJQ+7E2qf/JWsrCR1J/W0CMl6
 f9ZZT8jIiXOc1B/GOxL8/+i3yYdZlcM=
X-Google-Smtp-Source: ABdhPJw5bFY5rzDtd0SX5mDgbrQ2sHdWkAejy14yeFrKoeWCRc8FmwqRzrk0SuBNkRhXINWqwSK9yQ==
X-Received: by 2002:a17:907:6e93:b0:6df:8c1a:d08b with SMTP id
 sh19-20020a1709076e9300b006df8c1ad08bmr9447270ejc.557.1648822427791; 
 Fri, 01 Apr 2022 07:13:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/17] tests/docker: remove SKIP_DOCKER_BUILD
Date: Fri,  1 Apr 2022 16:13:25 +0200
Message-Id: <20220401141326.1244422-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is now unused.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-15-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.35.1



