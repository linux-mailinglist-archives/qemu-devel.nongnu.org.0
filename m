Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FABF5365D9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:19:07 +0200 (CEST)
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucg6-0002kF-Na
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8Q-0003AK-20
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8N-0003t2-Uf
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:17 -0400
Received: by mail-wr1-x432.google.com with SMTP id t13so6356819wrg.9
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dowmkd6o4OYW0pvXlQuxuJkXABZKayFcBX57LMSByIc=;
 b=wlFfXH4/pThehDcgoXW1x/lM/LDvTlvF3CRPj5etyxl1XWfBwOPF2Ym9S/c+6odN0n
 5VLtCeE+fIEgxg5+c3EieJ1HKLffSXSfN4MSefPQ/P2NnxW1SvUSvtAv8tIMQhZXpwIS
 jb663iOSVVyVXLTwUKnmAM8kOfhInPRwj4Btu+09FC+1Wekm+OBp8nINSoVh97aXYwFM
 4IuKkC5IRsWRoWytqiao6ErMT9GRYzw8LhmhOdbBlInKIcJNEN81CAOlhb6qoyRKO/YH
 gityS2x3eFQFjAwkqbU8xNx88EJvGMkPr9PklXCPdO3Y7X9ObMhkkRyIEcEM/VHAX93I
 8p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dowmkd6o4OYW0pvXlQuxuJkXABZKayFcBX57LMSByIc=;
 b=8BjfyafcqUxtizzkJZvVlOGtxwNREV8hi3Q7FFxbIDICSX2ylmA4HqACMhl5KCN905
 //jIM7wQGT+6RcWaIPM5j7IX3iloLJKT8Rf6NJdXZSs7u0XyY8xB8r3nYY1Pajqlzaic
 wLc7gn8NqnC2gBijpNQQqOJeGt0QTD2HFSKhSRxJHpRxuq5FYzmzwj/itPBdRTdHlW+Q
 w3MNZ/qGr+oQabDYxmgdM4wzQyR6U7/zvJZt2IZevK9LiF/80D4Q4LvDeLPOcxU8T+D/
 dmkMT5cHhbgPMG3tXmYISF/0PbXut1QFNyKFu3CF4C80wVx/gD49sL/pYC762Nr5aXJO
 OAEg==
X-Gm-Message-State: AOAM531/JW9QylRE2H8RL19n2YLtcDBTnchZUDsM8LlOFr6PJTlo3l7w
 xZSCavWwJ6hn3AGOIYtHxRJDDg==
X-Google-Smtp-Source: ABdhPJxy56aCu/ta++O8ohDDHDIQFVnBCVz/jJsrD290Cx4v+m2o5xTozUqMEp7KOhD1LDmobbXJMg==
X-Received: by 2002:a5d:6782:0:b0:20f:dd3a:3edf with SMTP id
 v2-20020a5d6782000000b0020fdd3a3edfmr22159638wru.517.1653666254563; 
 Fri, 27 May 2022 08:44:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 10-20020a056000154a00b0020ff4b8efc6sm2088537wry.80.2022.05.27.08.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4EB41FFD8;
 Fri, 27 May 2022 16:36:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 33/33] docs/devel: clean-up the CI links in the docs
Date: Fri, 27 May 2022 16:36:03 +0100
Message-Id: <20220527153603.887929-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
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
---
 docs/devel/ci-jobs.rst.inc        |  2 ++
 docs/devel/ci.rst                 | 11 +++++-----
 docs/devel/submitting-a-patch.rst | 36 ++++++++++++++++---------------
 docs/devel/testing.rst            |  2 ++
 4 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index 13d448b54d..6d88449250 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -1,3 +1,5 @@
+.. _ci_var:
+
 Custom CI/CD variables
 ======================
 
diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index d106610096..8f4a28fbdf 100644
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
+`project wiki testing page<https://wiki.qemu.org/Testing/CI>`_.
 
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


