Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603A3D3934
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:12:15 +0200 (CEST)
Received: from localhost ([::1]:49404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6t6E-0005vn-9S
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2M-0008H3-8w
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2K-0000ye-6W
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627038491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuNQOS7IFKHEZ6XIucVdSxVJJVJQXJSBvjsX07/cOh8=;
 b=YaUwKgd8JAeI6T6T6l5cyE4jRZkfRaHvZn6nIxbhu/OkEP2fAdLxxEBYZGn/SFXeXVanIS
 U6NGckHxiDsoo5/XdxmNO10sNn83Ovl8nMpuHC5Gmo9l1LzM8NZ43tFpablrVpwBJiIc54
 HJ1NP3R0qNYqBDXX0JZg3uethHRONdw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-vDLLeMmmMvKak4fw7JjI2g-1; Fri, 23 Jul 2021 07:08:08 -0400
X-MC-Unique: vDLLeMmmMvKak4fw7JjI2g-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so92234wmj.8
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 04:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uuNQOS7IFKHEZ6XIucVdSxVJJVJQXJSBvjsX07/cOh8=;
 b=pRp+GxxFdy+f8ULO/PerK+OEBlAEzjPo3InPMK5zMoPpHZbFt6xRBWtisQ2ZLRaB3d
 zOhBAiTRiEsV3eegpb3rELjhWfxO/VtbmpH+SnlcUi6ds28FTMlgaBJOYVBVBa5QXSkf
 W11jmnLd0G+tOxahfyt2vqOnId0VscnEXmDk5pJJqUV0URx1olt2Cb88CJM+SjSV54Kk
 PYDys2TMhi5rHlk0JApIUA/ei7pI+g1Pv/XitvLJplUZSn1P6oC6NIfKWwVgslYIgkRe
 TpT23M7ome0brrOB8H802Lf3trwrlBIkG3Kn4GfP43ZuR5zk31tbEDbn+gJEQihIf3yb
 vYqw==
X-Gm-Message-State: AOAM53279xbjzCQvzcJTe2myJA/A9HasvVGQmL9ij22+D1w2KujOHsCo
 1FILLppjjE5+93HqNuLTVzLElDQyvVcJXqc6EPr6P+bUw7HkDj65U6SqfaSaN1sRdImPimAtjOQ
 TsEwbil+KpmYU+y/KbNyDY945MEYMq6UzbuzcS1pCJ4EcCrMHS2di2H2hfWrGIohU
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr4676575wrs.158.1627038487386; 
 Fri, 23 Jul 2021 04:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxP3mG+GuXTevCVV0LTYjQ9ixYNMx2XAwCl0CaOZlkJWlY6CY1X3JMumFu2kgTgoxcMWDjxZw==
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr4676533wrs.158.1627038487135; 
 Fri, 23 Jul 2021 04:08:07 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 z6sm5496223wmp.1.2021.07.23.04.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 04:08:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3 1/4] docs: Document GitLab custom CI/CD variables
Date: Fri, 23 Jul 2021 13:07:57 +0200
Message-Id: <20210723110800.855648-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723110800.855648-1-philmd@redhat.com>
References: <20210723110800.855648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We introduced the QEMU_CI_AVOCADO_TESTING variable in commit f56bf4caf
("gitlab: Run Avocado tests manually (except mainstream CI)"), but
forgot to document it properly. Do it now.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/ci.rst | 40 ++++++++++++++++++++++++++++++++++++++++
 .gitlab-ci.yml    | 19 ++-----------------
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index b3bf3ef615b..53df04afb7f 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -8,6 +8,46 @@ found at::
 
    https://wiki.qemu.org/Testing/CI
 
+Custom CI/CD variables
+======================
+
+QEMU CI pipelines can be tuned setting some CI environment variables.
+
+Set variable globally in the user's CI namespace
+------------------------------------------------
+
+Variables can be set globally in the user's CI namespace setting.
+
+For further information about how to set these variables, please refer to::
+
+  https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
+
+Set variable manually when pushing a branch or tag to the user's repository
+---------------------------------------------------------------------------
+
+Variables can be set manually when pushing a branch or tag, using
+git-push command line arguments.
+
+Example setting the QEMU_CI_EXAMPLE_VAR variable:
+
+.. code::
+
+   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
+
+For further information about how to set these variables, please refer to::
+
+  https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
+
+Here is a list of the most used variables:
+
+QEMU_CI_AVOCADO_TESTING
+~~~~~~~~~~~~~~~~~~~~~~~
+By default, tests using the Avocado framework are not run automatically in
+the pipelines (because multiple artifacts have to be downloaded, and if
+these artifacts are not already cached, downloading them make the jobs
+reach the timeout limit). Set this variable to have the tests using the
+Avocado framework run automatically.
+
 Jobs on Custom Runners
 ======================
 
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6dc5385e697..9762dda2ee3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,24 +16,9 @@
 # QEMU CI jobs are based on templates. Some templates provide
 # user-configurable options, modifiable via configuration variables.
 #
-# These variables can be set globally in the user's CI namespace
-# setting:
-# https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
-# or set manually each time a branch/tag is pushed, as a git-push
-# command line argument:
-# https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
+# See https://qemu-project.gitlab.io/qemu/devel/ci.html#custom-ci-cd-variables
+# for more information.
 #
-# Example setting the QEMU_CI_EXAMPLE_VAR variable:
-#
-#   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
-#
-# ----------------------------------------------------------------------
-#
-# List of environment variables that can be use to modify the set
-# of jobs selected:
-#
-# - QEMU_CI_AVOCADO_TESTING
-#   If set, tests using the Avocado framework will be run
 
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.31.1


