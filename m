Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA90C633929
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0s-0002Rm-22; Tue, 22 Nov 2022 04:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0p-0002Lj-9L
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:19 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0n-0003sF-6w
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:19 -0500
Received: by mail-wr1-x42b.google.com with SMTP id n3so7318825wrp.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=noAWK4Tr2C3oo56ITKJfPI3QYAkN6x1CbswUT/w7uoM=;
 b=kEGqoUowkhR9NjDmEdDbwWqRTfoinf+M4aMTW+PMyzv2y7tGA6WlCA9Dov0aWN8dj4
 IHlhW11nOMstUGKXOhaB0/vBQFZQ8QQxohmwnLtW4wSedHfDXqivB1Z1iwxYhWlGsoRL
 7j/HCYMVJSrdM6qKWClMxdW5pV0tH5BI9ODS2EM1H4FjeXdRa4I09Y63+1szoUWafCxh
 dFx4js+rSQrsoMYtNep1jBJ+lsowGGOl/aFeXCBRaRMiyas/5nsuODpRaf4fRKRTpmug
 9cZVZlC/COr/LzNAM5s/73U+uoXhOncOyvcr6Z9P+RAnuramo4kT0kF/F8eWpczrcE4O
 4vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=noAWK4Tr2C3oo56ITKJfPI3QYAkN6x1CbswUT/w7uoM=;
 b=cwy8MciveAElifkxTgknAEAoFbv1IFWmZV6ctVLeBtFfP3fm8R9O5fFrASpjkNRom9
 60TlE2UR/5IkieQw/j56PLu5QwImXyYNb+Y9hVWeGQo098CacDJQF81v97RcVda8wJZH
 QogLwPEYTw7BKR/OqH7bIaaV1AdKMjfCY8Oqr0v5edu4y0yvQDZqXAQQvFzVgBbilSQY
 GIZY9noLvnPCEjnn8Mn8IhoXxFUN9/vi0evLMi0m6z9gcYBLPFxAzK0e9AuRSrhOuHrc
 D9Qtd2B9IBatZAMMiQExEum3gxi9yOg5YtgYTF7Izvilp8HxRGrYsw7+v5i32pz6v7bk
 ij3g==
X-Gm-Message-State: ANoB5pkj8JEUdh5oiwREkRvUuC786qYSVj6P3F/Wbq4gzpPJLb+Ui1hw
 SFLiIse30baPQFbhSPXDtfGcng==
X-Google-Smtp-Source: AA0mqf5P9uzmLwmnqEqhPhNJSHwbh9FDUIgZZZwsqCB6M7wXlpOzfasHtFrEtSGuvEoVEisWgMH9mA==
X-Received: by 2002:adf:d841:0:b0:236:5655:13a5 with SMTP id
 k1-20020adfd841000000b00236565513a5mr13405199wrl.477.1669110975720; 
 Tue, 22 Nov 2022 01:56:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a5d6dd0000000b0022584c82c80sm13391628wrz.19.2022.11.22.01.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 264311FFBE;
 Tue, 22 Nov 2022 09:56:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 06/11] docs/devel: simplify the minimal checklist
Date: Tue, 22 Nov 2022 09:56:05 +0000
Message-Id: <20221122095610.3343175-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

The bullet points are quite long and contain process tips. Move those
bits of the bullet to the relevant sections and link to them. Use a
table for nicer formatting of the checklist.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221117172532.538149-7-alex.bennee@linaro.org>

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 1319dfd3c2..b2a162ff4c 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -12,25 +12,18 @@ likely to be accepted and committed faster.
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
+   * - Patches contain Signed-off-by: Real Name <author@email>
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
+:ref:`maintainers<maintainers>`. You therefore should be prepared to
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
 
-- 
2.34.1


