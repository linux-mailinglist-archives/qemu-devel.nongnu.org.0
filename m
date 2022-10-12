Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E35FC51C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:16:38 +0200 (CEST)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiaf6-0002SW-UR
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaad-0006SR-MH
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:12:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaab-0006TA-J5
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:11:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id bp11so13198568wrb.9
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/NA9YqO2FgVjXPSvc5SGYaN0q7zDb+Qmax6Cp2I/ug=;
 b=EGlO4wBH+HAAmelgG8hiYNOJ8fMbkHnhodu8ZzNtZXaZhq+urLSoOeKIUKcOblws+p
 tm8jbrjkyR+QiSofxR79ZBvQFkbC3pGZ+xXzrsIo1Hgi2drs1EKlVwe+GCB/x+w1KdTs
 Cxipl1UaEp9kVCXpcgWItLb+tqfQZNTDEUXopLMLFnOUgUfC8+xR0O8rrtm0YFyT+N/T
 CMRGpZIIzo8mn3FItolChknzIY6sJJ1E4n/cBiuoJ15bd/eNeTq753+d8miJcG73MZZA
 U7SDGfblhOhCwAuWeIBqREyOql7f7c4UJVbEwb5VdRCq8z8w7X1LzuQ+CgQ7ibQ6+QLt
 Po5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/NA9YqO2FgVjXPSvc5SGYaN0q7zDb+Qmax6Cp2I/ug=;
 b=Y1K6wrufn5hfq8QnqdoWBOAMQMXzbLLXy2n0E5TKPE85p5KwGNMuVxAeok5aR2sVis
 6ef7Rb4DecLl1hxAeLuzDZPm/EpoK8k//lDIGBwEwD2PIcEiXVkIkUxX5egIIiwTLM5M
 peYih8FeadW+vt09+MgPuqdgdAfTojw0X1t1TIpeSD7cFh2z8B06S3xMj1AGsJ5KwuQn
 FnCg9vD63knWIssKlsgD5xmPPcnOQ+t0Wjdc+wO7hArJVnoIbbGU4srcBE73OsT92GqH
 hTQOhWPIcdwyoL3pYniEQoCo6c4KDFnuhIEk/2CLw4T5oFXKjM/ckJUNZ+j4lYXlQrWT
 FvWg==
X-Gm-Message-State: ACrzQf12ufLzl4PZYlkBI0Nm+s7Q0vNzAlJNR2JBzXLccgDuIvxaaSj9
 gZUsOcqYGwKIfLvBsBFzWpjPxQ==
X-Google-Smtp-Source: AMsMyM5Kmz+msSOUGkrWuPoWNcsjtqUrF1AHqjB+xfnXVnrBz8jFJgMKn8Tw2V0uCXjQzXQFu4ZnlQ==
X-Received: by 2002:adf:dec3:0:b0:22e:6efe:7861 with SMTP id
 i3-20020adfdec3000000b0022e6efe7861mr18327375wrn.454.1665576715053; 
 Wed, 12 Oct 2022 05:11:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 co11-20020a0560000a0b00b00228d52b935asm14079089wrb.71.2022.10.12.05.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 05:11:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2EB81FFB8;
 Wed, 12 Oct 2022 13:11:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 1/4] docs/devel: add a maintainers section to development
 process
Date: Wed, 12 Oct 2022 13:11:49 +0100
Message-Id: <20221012121152.1179051-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221012121152.1179051-1-alex.bennee@linaro.org>
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't currently have a clear place in the documentation to describe
the rolls and responsibilities of a maintainer. Lets create one so we
can. I've moved a few small bits out of other files to try and keep
everything in one place.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/code-of-conduct.rst           |  2 +
 docs/devel/index-process.rst             |  1 +
 docs/devel/maintainers.rst               | 84 ++++++++++++++++++++++++
 docs/devel/submitting-a-pull-request.rst | 12 ++--
 4 files changed, 91 insertions(+), 8 deletions(-)
 create mode 100644 docs/devel/maintainers.rst

diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.rst
index 195444d1b4..f734ed0317 100644
--- a/docs/devel/code-of-conduct.rst
+++ b/docs/devel/code-of-conduct.rst
@@ -1,3 +1,5 @@
+.. _code_of_conduct:
+
 Code of Conduct
 ===============
 
diff --git a/docs/devel/index-process.rst b/docs/devel/index-process.rst
index d0d7a200fd..d50dd74c3e 100644
--- a/docs/devel/index-process.rst
+++ b/docs/devel/index-process.rst
@@ -8,6 +8,7 @@ Notes about how to interact with the community and how and where to submit patch
 
    code-of-conduct
    conflict-resolution
+   maintainers
    style
    submitting-a-patch
    trivial-patches
diff --git a/docs/devel/maintainers.rst b/docs/devel/maintainers.rst
new file mode 100644
index 0000000000..e3c7003bfa
--- /dev/null
+++ b/docs/devel/maintainers.rst
@@ -0,0 +1,84 @@
+.. _maintainers:
+
+The Roll of Maintainers
+=======================
+
+Maintainers are a critical part of the projects contributor ecosystem.
+They come from a wide range of backgrounds from unpaid hobbyists
+working in their spare time to employees who work on the project as
+part of their job. Maintainer activities include:
+
+  - reviewing patches and suggesting changes
+  - preparing pull requests for their subsystems
+  - participating other project activities
+
+They are also human and subject to the same pressures as everyone else
+including overload and burn out. Like everyone else they are subject
+to projects :ref:`code_of_conduct`.
+
+The MAINTAINERS file
+--------------------
+
+The `MAINTAINERS
+<https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS>`__
+file contains the canonical list of who is a maintainer. The file
+is machine readable so an appropriately configured git (see
+:ref:`cc_the_relevant_maintainer`) can automatically Cc them on
+patches that touch their area of code.
+
+The file also describes the status of the area of code to give an idea
+of how actively that section is maintained.
+
+.. list-table:: Meaning of support status in MAINTAINERS
+   :widths: 25 75
+   :header-rows: 1
+
+   * - Status
+     - Meaning
+   * - Supported
+     - Someone is actually paid to look after this.
+   * - Maintained
+     - Someone actually looks after it.
+   * - Odd Fixes
+     - It has a maintainer but they don't have time to do
+       much other than throw the odd patch in.
+   * - Orphan
+     - No current maintainer.
+   * - Obsolete
+     - Old obsolete code, should use something else.
+
+Please bare in mind that even if someone is paid to support something
+it does not mean they are paid to support you. This is open source and
+the code comes with no warranty and the project makes no guarantees
+about dealing with bugs or features requests.
+
+Becoming a maintainer
+---------------------
+
+Maintainers are volunteers who put themselves forward to keep an eye
+on an area of code. They are generally accepted by the community to
+have a good understanding of the subsystem and able to make a positive
+contribution to the project.
+
+The process is simple - simply sent a patch to the list that updates
+the ``MAINTAINERS`` file. Sometimes this is done as part of a larger
+series when a new sub-system is being added to the code base. This can
+also be done by a retiring maintainer who nominates their replacement
+after discussion with other contributors.
+
+Once the patch is reviewed and merged the only other step is to make
+sure your GPG key is signed.
+
+.. _maintainer_keys:
+
+Maintainer GPG Keys
+~~~~~~~~~~~~~~~~~~~
+
+GPG is used to sign pull requests so they can be identified as really
+coming from the maintainer. If your key is not already signed by
+members of the QEMU community, you should make arrangements to attend
+a `KeySigningParty <https://wiki.qemu.org/KeySigningParty>`__ (for
+example at KVM Forum) or make alternative arrangements to have your
+key signed by an attendee. Key signing requires meeting another
+community member **in person** so please make appropriate
+arrangements.
diff --git a/docs/devel/submitting-a-pull-request.rst b/docs/devel/submitting-a-pull-request.rst
index c9d1e8afd9..a4cd7ebbb6 100644
--- a/docs/devel/submitting-a-pull-request.rst
+++ b/docs/devel/submitting-a-pull-request.rst
@@ -53,14 +53,10 @@ series) and that "make check" passes before sending out the pull
 request. As a submaintainer you're one of QEMU's lines of defense
 against bad code, so double check the details.
 
-**All pull requests must be signed**. If your key is not already signed
-by members of the QEMU community, you should make arrangements to attend
-a `KeySigningParty <https://wiki.qemu.org/KeySigningParty>`__ (for
-example at KVM Forum) or make alternative arrangements to have your key
-signed by an attendee.  Key signing requires meeting another community
-member \*in person\* so please make appropriate arrangements.  By
-"signed" here we mean that the pullreq email should quote a tag which is
-a GPG-signed tag (as created with 'gpg tag -s ...').
+**All pull requests must be signed**. By "signed" here we mean that
+the pullreq email should quote a tag which is a GPG-signed tag (as
+created with 'gpg tag -s ...'). See :ref:`maintainer_keys` for
+details.
 
 **Pull requests not for master should say "not for master" and have
 "PULL SUBSYSTEM whatever" in the subject tag**. If your pull request is
-- 
2.34.1


