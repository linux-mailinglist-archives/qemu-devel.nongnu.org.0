Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAE0620C28
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKpI-0007F0-WD; Tue, 08 Nov 2022 04:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKpA-0007Cz-Vs
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:17 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKp8-0005os-Cz
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 i5-20020a1c3b05000000b003cfa97c05cdso637969wma.4
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PETkHCmmDlOk/l4eNJN9a+MTbBUaCZh7Q5yajW/EJQg=;
 b=hPbtvtK/7aEGeHJZpkm4fTHtiVHpzEFss7EumU/eRkqyVZIyvC0m35J6KiCV5OuXJs
 pumgm04atdVvG+YNmxxP6vePer5bfaKBWfGbLA+Pddf16j+1urASApV3kc+m6AnOrUCa
 DJnn5jOVCOQ54Y3P54yIwG3f27TBYA0PYUwDRWKJevMzJSG0FYJzP5FtIWUIjwUgAtnV
 9das+x+WtVlkjR8G2nzfvtBEPBRKS4DJyja50hpKwBKrPFcTx9f2b5gmFRQxsDbIP9kj
 CElS34VgLZSbKfKH/NGYrSau+q7REkPUmvjnRfwzv8zG8ZvcLOK+3eK1VP0CkVnhKsa9
 B4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PETkHCmmDlOk/l4eNJN9a+MTbBUaCZh7Q5yajW/EJQg=;
 b=byGZI2phifqaPXblQ9V2PaDNgSMBx3qLVBzNzRB1TLQcDwGuydS2RFsFAzU5kjZc3O
 iJz7Nc1YHQkZe60rT3zDpjvNTaqX/RG44oT5RuYNIkyDGnD3vPg99LGWdcRzxsX+/+Lu
 inZ/O/ZzS1lKstvtMsdnkX70ckhyewci5uYIW8spPbdHDTX7n0kzFzdBIWpfliDbtzEI
 gTaiS8psba93F7bPyvd6ahSae2m4Z0GO40qNOxKQYA7A4acw2wlUHwupJIYBJ728nw7W
 rn9m9yI0AwxQ4iR4XiCZnfGPFc76oJwe/THZLhgZdOqXZbaCftmkKx9A7z9EBSF1cDYb
 ltXQ==
X-Gm-Message-State: ACrzQf2aEZ5lJf/iwdYvVNCi/xPrObzIahdy4GMiaJRigJB+l8Isi0Xf
 S6iSTVBBanwFtujvPWKqIOCOYg==
X-Google-Smtp-Source: AMsMyM6csYomq8VuV7oHFu8DzTyBwjBkDsLd9w0hDcO6R9weKfH6LGJJiaUL7alO2OTNOxHOmH+ojQ==
X-Received: by 2002:a05:600c:3c82:b0:3b5:60a6:c80f with SMTP id
 bg2-20020a05600c3c8200b003b560a6c80fmr36754347wmb.199.1667899392914; 
 Tue, 08 Nov 2022 01:23:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adfec91000000b002366e8eee11sm9508857wrn.101.2022.11.08.01.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:23:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF83E1FFBE;
 Tue,  8 Nov 2022 09:23:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 6/9] docs/devel: add a maintainers section to development
 process
Date: Tue,  8 Nov 2022 09:23:05 +0000
Message-Id: <20221108092308.1717426-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108092308.1717426-1-alex.bennee@linaro.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Message-Id: <20221012121152.1179051-2-alex.bennee@linaro.org>

---
v2
  - s/roll/role
  - s/projects/project's
  - mention looking after the long term health of area
  - add a section on becoming a reviewer
  - expand becoming section
  - add footnote about key signing
---
 docs/devel/code-of-conduct.rst           |   2 +
 docs/devel/index-process.rst             |   1 +
 docs/devel/maintainers.rst               | 106 +++++++++++++++++++++++
 docs/devel/submitting-a-pull-request.rst |  12 +--
 4 files changed, 113 insertions(+), 8 deletions(-)
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
index 0000000000..05110909d1
--- /dev/null
+++ b/docs/devel/maintainers.rst
@@ -0,0 +1,106 @@
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
+will ensure that patches touching a given subsystem will automatically
+be CC'd to you.
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
-- 
2.34.1


