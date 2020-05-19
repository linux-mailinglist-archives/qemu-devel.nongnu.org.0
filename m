Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DB31D97B6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 15:28:15 +0200 (CEST)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb2I2-0006Yp-IA
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 09:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jb2Gj-0004sl-P6
 for qemu-devel@nongnu.org; Tue, 19 May 2020 09:26:53 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jb2Gi-0008IZ-Sb
 for qemu-devel@nongnu.org; Tue, 19 May 2020 09:26:53 -0400
Received: by mail-qv1-xf34.google.com with SMTP id ee19so6434027qvb.11
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+y0IgPmlfVnjZR162DiqslSd5vZGc2ONWoWhFiDtAY=;
 b=ebSQYtXSG4NomsMXtPE+MTofd1V0sgvWS3VKiCC7lcjPPmfRpQd6cZTkeZhfAE9VEd
 aWOVIlHDY4X+2zXeU1HCDW3rRiQJXOABlf9pEma9i8Ckh7CrTsx1CenOK1ZTK+2ZtNmY
 w6tJAWzFMaZ99TbEV/Qvg/aVOuKKAQoZnTTfdfzrtay2sykd0rKTBMbuMriaoH297D4f
 uWHtZN00fZJt2z4z0ln/hPUNGyiEBsKagYQNqlFep7vAOLfC8sFKyDNV4NWpFJ1Fv6sD
 xtQORCmf9wX9tM3AiE8+OKMlL/jaeUkzwxKP1pSUpR4rgHhG1qF5FJwHGBhHksQ+Mw6i
 msaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+y0IgPmlfVnjZR162DiqslSd5vZGc2ONWoWhFiDtAY=;
 b=P3eyiqFFktI3PN68KfohxgG5lPUsnYeHYAQRpzOGqszUzzH2BUqpGraiA/GJfLm1ep
 eVPdb63PBpejO3jfI5N80rknZFK0939BzPfCJQiBTl00wBjLfLqrEXvjzSbEIIrFIRHy
 e/FhjXVGknnnZu1w93eR5+PigcWOWXMLjcWjwNjLEY+a3cmj0KVPZK8vuBckvz5okw+x
 s8fIyFqaFUnDJhAqSt1evA0eNJ8gXs6Z/pPctl2JEG1Hf1NFlsEynUqh8bGsJ7ZDxv+i
 I+i9Vh5YtsNV48LtbKVvk0SAfKu3Lefr544+12yXt9huRPHS1oXgyq0AJ34zu2tDVIp4
 HqAA==
X-Gm-Message-State: AOAM532TcqAo0JwJl27A5kpqqhY8BX29XDi2uYN03DUYER4fHwFycPA3
 NkOqY36LQ57+RROIC09+MI2NAPkTAeRdKQ==
X-Google-Smtp-Source: ABdhPJw0ZfUwwjnCMTSvxMrm510WyAf0KSaaGlImd6wYt84SJwzHdhMPKnENsGUMRCtrZxZw6bABDg==
X-Received: by 2002:a0c:8e84:: with SMTP id x4mr21673348qvb.175.1589894810572; 
 Tue, 19 May 2020 06:26:50 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:dd6a:8c63:cd9d:ad15])
 by smtp.gmail.com with ESMTPSA id d74sm3482136qke.100.2020.05.19.06.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 06:26:49 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/12] tests/vm: pass --genisoimage to basevm script
Date: Tue, 19 May 2020 09:22:49 -0400
Message-Id: <20200519132259.405-3-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519132259.405-1-robert.foley@linaro.org>
References: <20200519132259.405-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=robert.foley@linaro.org; helo=mail-qv1-xf34.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: philmd@redhat.com, alex.bennee@linaro.org, robert.foley@linaro.org,
 peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

If we have an alternative to genisoimage we really need to tell the
script about it as well so it can use it. It will still default to
genisoimage in case it is run outside our build machinery.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 tests/vm/Makefile.include |  1 +
 tests/vm/basevm.py        | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 1bf9693d19..74ab522c55 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -56,6 +56,7 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 	$(call quiet-command, \
 		$(PYTHON) $< \
 		$(if $(V)$(DEBUG), --debug) \
+		$(if $(GENISOIMAGE),--genisoimage $(GENISOIMAGE)) \
 		--image "$@" \
 		--force \
 		--build-image $@, \
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 756ccf7aca..a2d4054d72 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -61,8 +61,9 @@ class BaseVM(object):
     # 4 is arbitrary, but greater than 2,
     # since we found we need to wait more than twice as long.
     tcg_ssh_timeout_multiplier = 4
-    def __init__(self, debug=False, vcpus=None):
+    def __init__(self, debug=False, vcpus=None, genisoimage=None):
         self._guest = None
+        self._genisoimage = genisoimage
         self._tmpdir = os.path.realpath(tempfile.mkdtemp(prefix="vm-test-",
                                                          suffix=".tmp",
                                                          dir="."))
@@ -381,12 +382,12 @@ class BaseVM(object):
             udata.writelines(["apt:\n",
                               "  proxy: %s" % proxy])
         udata.close()
-        subprocess.check_call(["genisoimage", "-output", "cloud-init.iso",
+        subprocess.check_call([self._genisoimage, "-output", "cloud-init.iso",
                                "-volid", "cidata", "-joliet", "-rock",
                                "user-data", "meta-data"],
-                               cwd=cidir,
-                               stdin=self._devnull, stdout=self._stdout,
-                               stderr=self._stdout)
+                              cwd=cidir,
+                              stdin=self._devnull, stdout=self._stdout,
+                              stderr=self._stdout)
 
         return os.path.join(cidir, "cloud-init.iso")
 
@@ -424,6 +425,8 @@ def parse_args(vmcls):
                       help="Interactively run command")
     parser.add_option("--snapshot", "-s", action="store_true",
                       help="run tests with a snapshot")
+    parser.add_option("--genisoimage", default="genisoimage",
+                      help="iso imaging tool")
     parser.disable_interspersed_args()
     return parser.parse_args()
 
@@ -435,7 +438,8 @@ def main(vmcls):
             return 1
         logging.basicConfig(level=(logging.DEBUG if args.debug
                                    else logging.WARN))
-        vm = vmcls(debug=args.debug, vcpus=args.jobs)
+        vm = vmcls(debug=args.debug, vcpus=args.jobs,
+                   genisoimage=args.genisoimage)
         if args.build_image:
             if os.path.exists(args.image) and not args.force:
                 sys.stderr.writelines(["Image file exists: %s\n" % args.image,
-- 
2.17.1


