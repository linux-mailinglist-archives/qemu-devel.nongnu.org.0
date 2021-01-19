Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070162FB104
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 06:46:34 +0100 (CET)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1jqa-0001Cd-GS
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 00:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1jpF-0000iI-Hh
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 00:45:09 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1jpD-0007hf-7P
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 00:45:09 -0500
Received: by mail-ed1-x534.google.com with SMTP id g24so20020700edw.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 21:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUfq9iUTTeJbfUFfp93xinjLhYmr1UXMYsejJJiGQ/k=;
 b=CtWXlz5JAWz9TCsh/9j6u347OmFSVl7J0fRMg1lbhAp2QeWv4qTQl0bCc83WvpPMW2
 vIBWkcKaLUaxN6VkB+UhCEzVTZjXanAm5oOcdRQBPgcgtJaaOtTUzd7hwQtpKETrWyuq
 TcxjVTGh2XFuFWfYn62k6ochivlLdD+Vwbw9RmPl06/jFTJj8jXe6si4MQtnAkphruIW
 zjmcFWLUyY4JUx342LOEQn1AKZ24v2636SPkXBP2pOfTG1cr479+jxYJhWRmL25d9kuK
 ud2IKlbz2rQLEVZaRBm1tGpoqLpBzyX8lUDnCZExVImgJC68n10eQp03ZrRfSM47Y7v+
 4axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yUfq9iUTTeJbfUFfp93xinjLhYmr1UXMYsejJJiGQ/k=;
 b=NYqQUSWYC7OgYudm9eLvmuhDTs1t5ugTEp4cDM+8MNtiWHrcQ7tk/A7zOr7zHupltc
 2CNTAnU9h4bf7ND/S8MjfuwOLKKt9IL9lFaUX87jB7diB5T7Qcf9zi05jFofV8etoeyh
 HL91VhHI+WSPYqSUF41PMAW0DU9UK8B8mK2j6xRfJZlqkvJiJviuGXbu50/CZGCWM1Ek
 INCOLofXNK1MfrPpZgpaBOOAwquvy522O51kcxyhozfwRbotvgzvndttlHZ8DWi40JNO
 RKgRbjn/ZMelKPogshZlr2/ynE8oL81BRzcdTM1hnd0oUOtlUuL7PwtEJOQuRkF2rRfW
 yqqw==
X-Gm-Message-State: AOAM5327VlXTaqA1U3mu324lD+TjfSy+pY8Q0KSJGPkqfho8NG72nPWl
 wyuqxOdErUr4XxgK3Ujiy/auDT1NHAY=
X-Google-Smtp-Source: ABdhPJwzvJ6/uz5gLiJX9KOhaXnuZNqxOagDalyU9dITZAvRA7tQGIp1qdBrymYKuYuO7kpv+NEGHg==
X-Received: by 2002:a05:6402:2683:: with SMTP id
 w3mr2063229edd.378.1611035105007; 
 Mon, 18 Jan 2021 21:45:05 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g90sm2960014edd.30.2021.01.18.21.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 21:45:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/docker: Allow passing --network option when
 building images
Date: Tue, 19 Jan 2021 06:45:02 +0100
Message-Id: <20210119054502.531451-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the Docker engine, build fails because the container is
unable to resolve hostnames:

  $ make docker-image-debian-s390x-cross NETWORK=host ENGINE=docker
    BUILD   debian10
  #6 9.679 Err:1 http://deb.debian.org/debian buster InRelease
  #6 9.679   Temporary failure resolving 'deb.debian.org'
  #6 16.69 Err:2 http://security.debian.org/debian-security buster/updates InRelease
  #6 16.69   Temporary failure resolving 'security.debian.org'
  #6 22.69 Err:3 http://deb.debian.org/debian buster-updates InRelease
  #6 22.69   Temporary failure resolving 'deb.debian.org'
  #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster/InRelease  Temporary failure resolving 'deb.debian.org'
  #6 22.74 W: Failed to fetch http://security.debian.org/debian-security/dists/buster/updates/InRelease  Temporary failure resolving 'security.debian.org'
  #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster-updates/InRelease  Temporary failure resolving 'deb.debian.org'
  #6 22.74 W: Some index files failed to download. They have been ignored, or old ones used instead.
  Traceback (most recent call last):
    File "./tests/docker/docker.py", line 709, in <module>
      sys.exit(main())
    File "./tests/docker/docker.py", line 705, in main
      return args.cmdobj.run(args, argv)
    File "./tests/docker/docker.py", line 498, in run
      dkr.build_image(tag, docker_dir, dockerfile,
    File "./tests/docker/docker.py", line 353, in build_image
      self._do_check(build_args,
    File "./tests/docker/docker.py", line 244, in _do_check
      return subprocess.check_call(self._command + cmd, **kwargs)
    File "/usr/lib64/python3.8/subprocess.py", line 364, in check_call
      raise CalledProcessError(retcode, cmd)
  make: *** [tests/docker/Makefile.include:61: docker-image-debian10] Error 1

Fix by passing the NETWORK variable with --network= argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index bdc53ddfcf9..b65fd684011 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -63,6 +63,7 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 		$(if $V,,--quiet) \
 		$(if $(NOCACHE),--no-cache, \
 			$(if $(DOCKER_REGISTRY),--registry $(DOCKER_REGISTRY))) \
+		$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--network=$(NETWORK))) \
 		$(if $(NOUSER),,--add-current-user) \
 		$(if $(EXTRA_FILES),--extra-files $(EXTRA_FILES))\
 		$(if $(EXECUTABLE),--include-executable=$(EXECUTABLE)),\
-- 
2.26.2


