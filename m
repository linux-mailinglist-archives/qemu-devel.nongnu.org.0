Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22253ACE6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:38:15 +0200 (CEST)
Received: from localhost ([::1]:49672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTEU-0003tK-73
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrF-00027M-FU
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:13 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrD-0006ah-Ky
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:13 -0400
Received: by mail-ed1-x52b.google.com with SMTP id 25so3038430edw.8
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGHJqDPZiBsXA4KMwayHRfHrfRJevIHycdJ2aG2O/T8=;
 b=DxZeShGLnpqpvMerxQeTkKBU9e8VTNADRgKgFW7u6LUFboMr9aR/u1WaLuqMHWJQBw
 PqJXVTEYw6yIOfuqqPYo/9M9bDdt6m/XReckuS0zsQ21gh96ogiO9fExEL+dRnltNlKj
 SwWD5N8ZJ1x+NsHv/g8IinIFVEbIZKOnYlLk3Wke32YXOPvWDPNEv12ReiUqCXMS1B2t
 dt4exus8PPQ5ZZuJXjfBfuGxbgh7iJHwD6pvEQkMCxGu6FG4olVb/holNx/70NUqRMeV
 jj4Fa4N0GIQsKv+qeA7CpleCaDBQJXq7K+1S4cnYIH4LE0BDIbbBIP0/w/9OrI5TL5Kc
 CkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGHJqDPZiBsXA4KMwayHRfHrfRJevIHycdJ2aG2O/T8=;
 b=ehmaCaALbTP8kl+zGRyaIMG/t6UmUFUHa4HNWek5yHxckjthHUQYTFLyHqo3il7v9n
 svpQGFIGnLUNA4qV7zgIe/VQN9sgkESNrrhvXrcVVganvWhyhVfpB4gssidGTXje/MuM
 6x37D9PHEPaJxGId77JOrUYNnLHSU99tbDyGWhyKVl1pbbRsU8qMj1JjwpsDLV2Yna1Y
 H6j8RZ+7gnwJZbOlPOVKcKE70zgfsY2+AjuRiutND+Iq9lM3hu8ZBXD+duCtHCrOQRRM
 5txct38ot+X7FdvR8dD8WNizm/VZo4Gk1DY69BQ8irhnS/bgWW5zA5oA8rOhhdy3c0HF
 ObBw==
X-Gm-Message-State: AOAM530kJnJT3j+Tinb82DKAG+CDxT5s2EFAOYysoi3SEVBD5/oblQmY
 jH7Fu7YOqKrXvRP7nxIaVplS+g==
X-Google-Smtp-Source: ABdhPJxxuXfCbHtGaUd8xE2WpJj1aR8cCAfv0F1tX/qRfka4rQMxwru2iB3Ldfyrhm6cXiqNZwf/Cw==
X-Received: by 2002:a05:6402:280a:b0:42d:d562:9b01 with SMTP id
 h10-20020a056402280a00b0042dd5629b01mr1114337ede.290.1654107250339; 
 Wed, 01 Jun 2022 11:14:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 hz22-20020a1709072cf600b006fec4ee28d0sm952343ejc.189.2022.06.01.11.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:14:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E53851FFD8;
 Wed,  1 Jun 2022 19:05:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 33/33] docs/devel: clean-up the CI links in the docs
Date: Wed,  1 Jun 2022 19:05:37 +0100
Message-Id: <20220601180537.2329566-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There where some broken links so fix those up with proper references
to the devel docs. I also did a little light copy-editing to reflect
the current state and broke up a paragraph to reduce the "wall of
text" effect.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220527153603.887929-34-alex.bennee@linaro.org>

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index 9118a61a17..1f28fec0d0 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -1,3 +1,5 @@
+.. _ci_var:
+
 Custom CI/CD variables
 ======================
 
diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index d106610096..ed88a2010b 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -1,12 +1,13 @@
+.. _ci:
+
 ==
 CI
 ==
 
-QEMU has configurations enabled for a number of different CI services.
-The most up to date information about them and their status can be
-found at::
-
-   https://wiki.qemu.org/Testing/CI
+Most of QEMU's CI is run on GitLab's infrastructure although a number
+of other CI services are used for specialised purposes. The most up to
+date information about them and their status can be found on the
+`project wiki testing page <https://wiki.qemu.org/Testing/CI>`_.
 
 .. include:: ci-definitions.rst.inc
 .. include:: ci-jobs.rst.inc
diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index e51259eb9c..d3876ec1b7 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -204,23 +204,25 @@ log`` for these keywords for example usage.
 Test your patches
 ~~~~~~~~~~~~~~~~~
 
-Although QEMU has `continuous integration
-services <Testing#Continuous_Integration>`__ that attempt to test
-patches submitted to the list, it still saves everyone time if you have
-already tested that your patch compiles and works. Because QEMU is such
-a large project, it's okay to use configure arguments to limit what is
-built for faster turnaround during your development time; but it is
-still wise to also check that your patches work with a full build before
-submitting a series, especially if your changes might have an unintended
-effect on other areas of the code you don't normally experiment with.
-See `Testing <Testing>`__ for more details on what tests are available.
-Also, it is a wise idea to include a testsuite addition as part of your
-patches - either to ensure that future changes won't regress your new
-feature, or to add a test which exposes the bug that the rest of your
-series fixes. Keeping separate commits for the test and the fix allows
-reviewers to rebase the test to occur first to prove it catches the
-problem, then again to place it last in the series so that bisection
-doesn't land on a known-broken state.
+Although QEMU uses various :ref:`ci` services that attempt to test
+patches submitted to the list, it still saves everyone time if you
+have already tested that your patch compiles and works. Because QEMU
+is such a large project the default configuration won't create a
+testing pipeline on GitLab when a branch is pushed. See the :ref:`CI
+variable documentation<ci_var>` for details on how to control the
+running of tests; but it is still wise to also check that your patches
+work with a full build before submitting a series, especially if your
+changes might have an unintended effect on other areas of the code you
+don't normally experiment with. See :ref:`testing` for more details on
+what tests are available.
+
+Also, it is a wise idea to include a testsuite addition as part of
+your patches - either to ensure that future changes won't regress your
+new feature, or to add a test which exposes the bug that the rest of
+your series fixes. Keeping separate commits for the test and the fix
+allows reviewers to rebase the test to occur first to prove it catches
+the problem, then again to place it last in the series so that
+bisection doesn't land on a known-broken state.
 
 .. _submitting_your_patches:
 
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 5b60a31807..3f6ebd5073 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1,3 +1,5 @@
+.. _testing:
+
 Testing in QEMU
 ===============
 
-- 
2.30.2


