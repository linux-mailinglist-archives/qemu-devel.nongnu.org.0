Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D135C43C237
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:29:21 +0200 (CEST)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbV2-0004qb-Td
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfbSw-0002ie-4V
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfbSu-0006s7-Ae
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635312427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhkz4fhSYwpACOwd0W4U78Tq1lX+yesCuM2UP3c4jwk=;
 b=D6r3HS0ktgI4I5m4p7tBiHCNfWnlKY8slP2HVeigc9o6fnmOksuM+N/MN4UrV5Ds0KoGtb
 p447tqvwAi3TxAjWqaFS1vc+k8arQ1nOGpEYNYMmKUU5qPjiSI911YsPBuixhF030Lsy4x
 eoFYgGggqA3Eh5b+MLsvovA8uWXNiss=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-s2kN_DQ9OPCKm_5rWxs9Ug-1; Wed, 27 Oct 2021 01:27:04 -0400
X-MC-Unique: s2kN_DQ9OPCKm_5rWxs9Ug-1
Received: by mail-wm1-f69.google.com with SMTP id
 b81-20020a1c8054000000b0032c9d428b7fso738026wmd.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 22:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nhkz4fhSYwpACOwd0W4U78Tq1lX+yesCuM2UP3c4jwk=;
 b=WIDdDXvlP0IBZ45dI9p1oT2ciMkpnx7u/LOmIPqXSG51uSEzak4GErPfT52RI7rlSF
 Tdwdj9TnsnLsoVdFnpTpHxPBgf/x+Rifi9Bi8yOyOp777lYJH5LMLpjtQJzgth+IK8Ek
 Fr0xgAPEkPg7yOzuF5j8LUuezUGQmhg14xXouL0IeLv7wSjsRTAOzi4rEvcw1Huv+hn4
 bmKO67HeKqCOywb1k1ZA+qcsqNMP7ry4l65QV6+Lj99mX2IDnzX710aYQZ21q0Ig0pXn
 jR9xtTxXVUcCSw4wyW1TX/ZDIl2hNqXE4+JsWHXDolo9UDQAim9DzUI/ejnUzsBj35vI
 ZhPg==
X-Gm-Message-State: AOAM530PJiYlnz8Y67hxVim17DUAnUUYs3EDhGDLxsiB82TbhzzueX9Q
 GxTVSu+HQtXBstZHMzVevrepBXDoDz04uXDMf8Ab4oyVEHaBKPmVmrEV1Lm1wEITzVIoHlsDjiE
 8tqxB1vo9jQr3ZqYhWh+zAypjZQ0JdKqE/0Xsn+0fOQZ64b1yjI5RENpMGxnrrtF3
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr3578308wmj.54.1635312423025; 
 Tue, 26 Oct 2021 22:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYouRo95jaHSafAznfs31z7vFbfFJVA2j70VDMYNUNRZN0TqaPJK4xf8+PwcPpBm4PnYbXaA==
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr3578275wmj.54.1635312422675; 
 Tue, 26 Oct 2021 22:27:02 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b7sm1778585wrv.72.2021.10.26.22.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 22:27:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0.1 1/2] gitlab: only let pages be published from
 default branch
Date: Wed, 27 Oct 2021 07:26:55 +0200
Message-Id: <20211027052656.1275436-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027052656.1275436-1-philmd@redhat.com>
References: <20211027052656.1275436-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

GitLab will happily publish pages generated by the latest CI pipeline
from any branch:

https://docs.gitlab.com/ee/user/project/pages/introduction.html

  "Remember that GitLab Pages are by default branch/tag agnostic
   and their deployment relies solely on what you specify in
   .gitlab-ci.yml. You can limit the pages job with the only
   parameter, whenever a new commit is pushed to a branch used
   specifically for your pages."

The current "pages" job is not limited, so it is happily publishing
docs content from any branch/tag in qemu.git that gets pushed to.
This means we're potentially publishing from the "staging" branch
or worse from outdated "stable-NNN" branches

This change restricts it to only publish from the default branch
in the main repository. For contributor forks, however, we allow
it to publish from any branch, since users will have arbitrarily
named topic branches in flight at any time.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210723113051.2792799-1-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit eafadbbbac06a8d72baa976f4d3c42b0e5f8cfc8)
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 52d65d6c04f..f8cc67baad9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -817,6 +817,17 @@ build-tools-and-docs-debian:
 
 # Prepare for GitLab pages deployment. Anything copied into the
 # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
+#
+# GitLab publishes from any branch that triggers a CI pipeline
+#
+# For the main repo we don't want to publish from 'staging'
+# since that content may not be pushed, nor do we wish to
+# publish from 'stable-NNN' branches as that content is outdated.
+# Thus we restrict to just the default branch
+#
+# For contributor forks we want to publish from any repo so
+# that users can see the results of their commits, regardless
+# of what topic branch they're currently using
 pages:
   image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
   stage: test
@@ -835,3 +846,10 @@ pages:
   artifacts:
     paths:
       - public
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
+      when: on_success
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
+      when: never
+    - if: '$CI_PROJECT_NAMESPACE != "qemu-project"'
+      when: on_success
-- 
2.31.1


