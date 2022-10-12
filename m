Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E825FC51E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:16:52 +0200 (CEST)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiafI-0002Wl-7n
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaaf-0006U3-95
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:12:01 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiaac-0006Tc-Ji
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:12:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a10so25889700wrm.12
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CKTdhbx6tlAZWIAIdhc6Vldni/ktTJ3HMieMzD9m98=;
 b=KIJjR0yweqha8kdyh4iak5ahw34wEFIkzGZlOfTtwZ4P8uZ3Js/pZgSNyRd2hJ55ku
 XIVUcyA+dRYgSAUZdSW1vLQLLyTaFOjfudxfnRsxHtuUnbrUXJQ4aU3H7tSSpI+d8NBL
 dNFLf8FaTPEubkU+0cvRR4EMBGtnCkEIaGmZmkCjW4gVYro5Ad6ft8++5tImgkXFStAt
 oUcE1b5sQoZcUTmbz+i6k2uVPuzubC1KSOwvL6L1730sfHJWcBf8+JvQQn07Xmb/Vz58
 AXbNCYdA/NnDCrXRw955hO3gSPE9AC00NXvUcpsSxIJMXo7MDZbf/ztu5dvBFtqAt1kn
 MMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CKTdhbx6tlAZWIAIdhc6Vldni/ktTJ3HMieMzD9m98=;
 b=ghcydJua0AkC21HAxCyuf1+VGMa6jYTVV4MQLriYIYjU7PLKHThx/58XSotpeJ4lnd
 +Pd/80alBNIZcOLL68yAxJ6tgp4ukwEZdmt1NysGngee9i+GzJEVlYFlaZt/NYdeetCm
 UTxdl4dQRjgR3aIOMuG6i5gyW2HNKMM/dDs3DSa3nig7Qc9cLcWwakRo2iFCpjCrK1pb
 3W+d5/BARAEVNCNyTsC0KpLGYSm9WxSHgypnOkppnINsVn8iMRau5j6dPWWgqsthrQAH
 ed8p+2dPfy/ubiduxK0Gm6NM7+q4KExHx6Ith83rXlMjWeiCN+3sAW6fojnuOTsGRt1l
 sA8Q==
X-Gm-Message-State: ACrzQf0I8UEfjHzVjV0lb2ggsik1aiw5ffeaxp+yvotOcvCVpL434qVv
 cFCAmcM8Sh1kmf/9v2ONr5IEQA==
X-Google-Smtp-Source: AMsMyM6dWhX2GekLGyaJOqOcmRIhmSLLmaJNL3IJkL7xeUQiCK/nvea2qsMsYMoR7hkrkcTgIFwDdA==
X-Received: by 2002:adf:fc10:0:b0:22e:55e5:9bb5 with SMTP id
 i16-20020adffc10000000b0022e55e59bb5mr18089317wrr.112.1665576717190; 
 Wed, 12 Oct 2022 05:11:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 da5-20020a056000408500b00225239d9265sm14423480wrb.74.2022.10.12.05.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 05:11:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D18CB1FFBB;
 Wed, 12 Oct 2022 13:11:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  3/4] docs/devel: simplify the minimal checklist
Date: Wed, 12 Oct 2022 13:11:51 +0100
Message-Id: <20221012121152.1179051-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221012121152.1179051-1-alex.bennee@linaro.org>
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

The bullet points are quite long and contain process tips. Move those
bits of the bullet to the relevant sections and link to them. Use a
table for nicer formatting of the checklist.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/submitting-a-patch.rst | 75 ++++++++++++++++++++-----------
 roms/qboot                        |  2 +-
 2 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index fb1673e974..41771501bf 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -12,25 +12,18 @@ be committed faster.
 This page seems very long, so if you are only trying to post a quick
 one-shot fix, the bare minimum we ask is that:
 
--  You **must** provide a Signed-off-by: line (this is a hard
-   requirement because it's how you say "I'm legally okay to contribute
-   this and happy for it to go into QEMU", modeled after the `Linux kernel
-   <http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__
-   policy.) ``git commit -s`` or ``git format-patch -s`` will add one.
--  All contributions to QEMU must be **sent as patches** to the
-   qemu-devel `mailing list <https://wiki.qemu.org/Contribute/MailingLists>`__.
-   Patch contributions should not be posted on the bug tracker, posted on
-   forums, or externally hosted and linked to. (We have other mailing lists too,
-   but all patches must go to qemu-devel, possibly with a Cc: to another
-   list.) ``git send-email`` (`step-by-step setup
-   guide <https://git-send-email.io/>`__ and `hints and
-   tips <https://elixir.bootlin.com/linux/latest/source/Documentation/process/email-clients.rst>`__)
-   works best for delivering the patch without mangling it, but
-   attachments can be used as a last resort on a first-time submission.
--  You must read replies to your message, and be willing to act on them.
-   Note, however, that maintainers are often willing to manually fix up
-   first-time contributions, since there is a learning curve involved in
-   making an ideal patch submission.
+.. list-table:: Minimal Checklist for Patches
+   :widths: 35 65
+   :header-rows: 1
+
+   * - Check
+     - Reason
+   * - Patches contain Signed-off-by: Author Name <author@email>
+     - States you are legally able to contribute the code. See :ref:`patch_emails_must_include_a_signed_off_by_line`
+   * - Sent as patch emails to ``qemu-devel@nongnu.org``
+     - The project uses an email list based workflow. See :ref:`submitting_your_patches`
+   * - Be prepared to respond to review comments
+     - Code that doesn't pass review will not get merged. See :ref:`participating_in_code_review`
 
 You do not have to subscribe to post (list policy is to reply-to-all to
 preserve CCs and keep non-subscribers in the loop on the threads they
@@ -229,6 +222,19 @@ bisection doesn't land on a known-broken state.
 Submitting your Patches
 -----------------------
 
+The QEMU project uses a public email based workflow for reviewing and
+merging patches. As a result all contributions to QEMU must be **sent
+as patches** to the qemu-devel `mailing list
+<https://wiki.qemu.org/Contribute/MailingLists>`__. Patch
+contributions should not be posted on the bug tracker, posted on
+forums, or externally hosted and linked to. (We have other mailing
+lists too, but all patches must go to qemu-devel, possibly with a Cc:
+to another list.) ``git send-email`` (`step-by-step setup guide
+<https://git-send-email.io/>`__ and `hints and tips
+<https://elixir.bootlin.com/linux/latest/source/Documentation/process/email-clients.rst>`__)
+works best for delivering the patch without mangling it, but
+attachments can be used as a last resort on a first-time submission.
+
 .. _if_you_cannot_send_patch_emails:
 
 If you cannot send patch emails
@@ -314,10 +320,12 @@ git repository to fetch the original commit.
 Patch emails must include a ``Signed-off-by:`` line
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-For more information see `SubmittingPatches 1.12
-<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__.
-This is vital or we will not be able to apply your patch! Please use
-your real name to sign a patch (not an alias or acronym).
+Your patches **must** include a Signed-off-by: line. This is a hard
+requirement because it's how you say "I'm legally okay to contribute
+this and happy for it to go into QEMU". The process is modelled after
+the `Linux kernel
+<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__
+policy.
 
 If you wrote the patch, make sure your "From:" and "Signed-off-by:"
 lines use the same spelling. It's okay if you subscribe or contribute to
@@ -327,6 +335,11 @@ include a "From:" line in the body of the email (different from your
 envelope From:) that will give credit to the correct author; but again,
 that author's Signed-off-by: line is mandatory, with the same spelling.
 
+There are various tooling options for automatically adding these tags
+include using ``git commit -s`` or ``git format-patch -s``. For more
+information see `SubmittingPatches 1.12
+<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__.
+
 .. _include_a_meaningful_cover_letter:
 
 Include a meaningful cover letter
@@ -397,9 +410,19 @@ Participating in Code Review
 ----------------------------
 
 All patches submitted to the QEMU project go through a code review
-process before they are accepted. Some areas of code that are well
-maintained may review patches quickly, lesser-loved areas of code may
-have a longer delay.
+process before they are accepted. This will often mean a series will
+go through a number of iterations before being picked up by
+:ref:`maintainers<maintainers>`. You therefor should be prepared to
+read replies to your messages and be willing to act on them.
+
+Maintainers are often willing to manually fix up first-time
+contributions, since there is a learning curve involved in making an
+ideal patch submission. However for the best results you should
+proactively respond to suggestions with changes or justifications for
+your current approach.
+
+Some areas of code that are well maintained may review patches
+quickly, lesser-loved areas of code may have a longer delay.
 
 .. _stay_around_to_fix_problems_raised_in_code_review:
 
diff --git a/roms/qboot b/roms/qboot
index 8ca302e86d..a5300c4949 160000
--- a/roms/qboot
+++ b/roms/qboot
@@ -1 +1 @@
-Subproject commit 8ca302e86d685fa05b16e2b208888243da319941
+Subproject commit a5300c4949b8d4de2d34bedfaed66793f48ec948
-- 
2.34.1


