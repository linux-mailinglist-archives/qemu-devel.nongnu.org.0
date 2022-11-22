Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05DD633924
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:56:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0p-0002L9-LR; Tue, 22 Nov 2022 04:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0n-0002I9-JQ
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:17 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0k-0003j0-RG
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:17 -0500
Received: by mail-wr1-x432.google.com with SMTP id n3so7318685wrp.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3oXSHmwdautTP+92zVqOXWCVdOjJ8KuBUb1XxW28Mg=;
 b=hncCIKap49ckLc3vaZfoOUyOZM0jjF8NOIGRs9dTEzzMFggD5LPaCpgz//b+6cxAQ8
 PXS9ThleJYNw+Ta+x3UfnmLQRPzcVgKLfk0/SFWm5K9TGxZ7Xf6nfqPx18llv2rsbNKW
 evkpd0oN39nPIObUrGgk1v+NvXCmUAzd4aH+Bp4x8laHH/S4B//dU5S5L4AqsbAPOgDe
 PJpmq2t+IPTTT+dU8DZjrHgSSLT+ptu6OHf2n27BrQIPGK7UeEUHg8cyrS6y36aLyTzA
 6k15T6jmOHkvrBugmC/qCuW/3rRgtp7crXhwbWEzLAQFu8m+zL7gkSJlGx6zXy/SuDC3
 PXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3oXSHmwdautTP+92zVqOXWCVdOjJ8KuBUb1XxW28Mg=;
 b=IB0i5uUs1N8n48qy9ulmA5tVqPjOdKRao4YjGmE9GC3hXproyl/00aK77YKu9zFxV7
 sR9kAmALhvPCpZTmfj1SP8aVcrQ6DUmjTvJiAaotjK3UWQy6W/grtw+grasJwh0lCFr6
 HRde2NLKrgFn7QUpHruEfzDUZ5uJnOctXiLpxjsptLCPFaoBcanRXqddgaRJ4wJyd1cO
 iZiqjV+s5BJVH/a5K8L+qvKQmNjYTK9SiqiB2Ca+c7ziypikWFmd7rMZstdRSgIh4ByW
 6n392tLet1otsKb+osmmr0WG0ea+A3vmgUMMP/XZSmqOicmD2se46rkeMid8pdDqd7wn
 EGng==
X-Gm-Message-State: ANoB5pno+RNErSjQo+PlfTmrxXR2ye12duf3NBnfdeUyIowO4xDOsN4w
 MTrpe3W2etOc7LonJRTvsIo8HQ==
X-Google-Smtp-Source: AA0mqf5q1zkDnAvvNVi/gEZ7BGhYuQ7fEJYk+2Pxi84v98CRY58im7EpM2Y66ZIPWu8w1TLBvMCJqw==
X-Received: by 2002:a5d:4607:0:b0:241:bfc1:4211 with SMTP id
 t7-20020a5d4607000000b00241bfc14211mr11653959wrq.397.1669110973454; 
 Tue, 22 Nov 2022 01:56:13 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c024600b003b50428cf66sm16144018wmj.33.2022.11.22.01.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F08521FFBC;
 Tue, 22 Nov 2022 09:56:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 04/11] docs/devel: add a maintainers section to development
 process
Date: Tue, 22 Nov 2022 09:56:03 +0000
Message-Id: <20221122095610.3343175-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We don't currently have a clear place in the documentation to describe
the roles and responsibilities of a maintainer. Lets create one so we
can. I've moved a few small bits out of other files to try and keep
everything in one place.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221117172532.538149-5-alex.bennee@linaro.org>

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
index 0000000000..5c907d901c
--- /dev/null
+++ b/docs/devel/maintainers.rst
@@ -0,0 +1,107 @@
+.. _maintainers:
+
+The Role of Maintainers
+=======================
+
+Maintainers are a critical part of the project's contributor ecosystem.
+They come from a wide range of backgrounds from unpaid hobbyists
+working in their spare time to employees who work on the project as
+part of their job. Maintainer activities include:
+
+  - reviewing patches and suggesting changes
+  - collecting patches and preparing pull requests
+  - tending to the long term health of their area
+  - participating in other project activities
+
+They are also human and subject to the same pressures as everyone else
+including overload and burnout. Like everyone else they are subject
+to project's :ref:`code_of_conduct` and should also be exemplars of
+excellent community collaborators.
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
+Please bear in mind that even if someone is paid to support something
+it does not mean they are paid to support you. This is open source and
+the code comes with no warranty and the project makes no guarantees
+about dealing with bugs or features requests.
+
+
+
+Becoming a reviewer
+-------------------
+
+Most maintainers start by becoming subsystem reviewers. While anyone
+is welcome to review code on the mailing list getting added to the
+MAINTAINERS file with a line like::
+
+  R: Random Hacker <rhacker@example.com>
+
+marks you as a 'designated reviewer' - expected to provide regular
+spontaneous feedback. This will ensure that patches touching a given
+subsystem will automatically be CC'd to you.
+
+Becoming a maintainer
+---------------------
+
+Maintainers are volunteers who put themselves forward or have been
+asked by others to keep an eye on an area of code. They have generally
+demonstrated to the community, usually via contributions and code
+reviews, that they have a good understanding of the subsystem. They
+are also trusted to make a positive contribution to the project and
+work well with the other contributors.
+
+The process is simple - simply send a patch to the list that updates
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
+community member **in person** [#]_ so please make appropriate
+arrangements.
+
+.. [#] In recent pandemic times we have had to exercise some
+       flexibility here. Maintainers still need to sign their pull
+       requests though.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index be151f0024..366538f9e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23,7 +23,7 @@ Descriptions of section entries:
 	W: Web-page with status/info
 	Q: Patchwork web based patch tracking system site
 	T: SCM tree type and location.  Type is one of: git, hg, quilt, stgit.
-	S: Status, one of the following:
+	S: Status, one of the following (keep in sync with docs/devel/maintainers.rst):
 	   Supported:	Someone is actually paid to look after this.
 	   Maintained:	Someone actually looks after it.
 	   Odd Fixes:	It has a maintainer but they don't have time to do
-- 
2.34.1


