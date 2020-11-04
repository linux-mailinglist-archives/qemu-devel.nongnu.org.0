Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9232A70D3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 23:52:32 +0100 (CET)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaRdn-0003kM-KS
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 17:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaRYI-0005Xh-LM
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 17:46:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaRYG-0006xy-B4
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 17:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604530006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MWl5vDwzLcy8Zov/XDOnc/IDx3/z+3tMGxYwpmBuCno=;
 b=HW8N8XZZzc5xrad93sRIgnpHpPlbl/h67XsMjbNau0yugE56HTFwhEFr9JY37uLcRv+mcP
 tUfIGpBtPhueCPv4jFpN9DcijtUavD4/j1vK/ymMJKsS6wPyFPn9Bv0wAgjS95QXcsOuqx
 oS2jEF/SKyUXZfqM4LQ2xt99hHRqMRM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-i1htJr5_P2GWFvI3Nw5Oog-1; Wed, 04 Nov 2020 17:46:45 -0500
X-MC-Unique: i1htJr5_P2GWFvI3Nw5Oog-1
Received: by mail-wm1-f72.google.com with SMTP id c10so1808787wmh.6
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 14:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MWl5vDwzLcy8Zov/XDOnc/IDx3/z+3tMGxYwpmBuCno=;
 b=aKYQDs/SYV3bPQw4ICuVp6ZrQMg9agHPe5GoL8ouWaJ8R7yn8rVFcu17NraunHzVNO
 UpV9WYt9tWfw9fPUiC3P84gIILtD4z6sVc22/Naw1fkfYO1tdwDNZ5LQ4xzQiR2sAOzJ
 5xZq5fjkJ/aMGyKjluvxWj8oFA4QJlrd1GvwJZP0vdqzPKAyaS0TZi0Oh9RDTjHyS2es
 Q6RED+oW+KNcUprx8Sn4B0B6sBMlL+o9QixxgvPm9Gv1VgM2g3M5lX4ZsbojkpsE8XoS
 udrd1/LLvdi8s6td+aBKFklXafUazEkl7NxOYdRCwOlWU/cXIWUnZfp52HnpUkLhvlc8
 bgyQ==
X-Gm-Message-State: AOAM533REsKk4pcK6DmpI0BhW3RUaWIpnBfdtRTktq/s+R7Vkcq0uf6A
 0pNQl4ev+5x/PeViBIQpcppr/8M/fkj0YG4ELdHDNm67hOzGhLLaOo8NMyQbueqwdYNHxIQTYGR
 9ntwam/NLF2m4Q0I=
X-Received: by 2002:a1c:9a8d:: with SMTP id c135mr6725664wme.173.1604530003491; 
 Wed, 04 Nov 2020 14:46:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSOQxvQSTa+LBitUJ5i0cYXK8vrDRaB3lyc2khopQC1QgTTAL5JMfPmSD3NhpMZ0zKLDYMwg==
X-Received: by 2002:a1c:9a8d:: with SMTP id c135mr6725648wme.173.1604530003334; 
 Wed, 04 Nov 2020 14:46:43 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id e6sm4663274wrs.7.2020.11.04.14.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 14:46:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 8/9] gitlab-ci: Add rules to skip building cross-jobs
Date: Wed,  4 Nov 2020 23:45:57 +0100
Message-Id: <20201104224558.3384595-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104224558.3384595-1-philmd@redhat.com>
References: <20201104224558.3384595-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add rules to skip some crossbuild jobs.

The following tags are available to skip CI jobs:
- cross  (skip all cross-jobs)
- system (skip all cross-system jobs)
- user   (skip all cross-user jobs)

Developers can combine tags in the SKIP_BUILD variable when
pushing a branch (or tag) to repositories. Examples:

  $ git push -o ci.variable="SKIP_BUILD=user"        myrepo mybranch
  $ git push -o ci.variable="SKIP_BUILD=user,system" myrepo mybranch

References:
- https://docs.gitlab.com/ee/ci/yaml/#rulesif
- https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 701550f028c..08f27649eb2 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,6 +1,16 @@
 .cross_common_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  rules:
+    # If the if statement is true, the job is excluded from a pipeline.
+    - if: $SKIP_BUILD =~ /cross/
+      when: never
+    - if: $CI_JOB_NAME =~ /system/ && $SKIP_BUILD =~ /system/
+      when: never
+    - if: $CI_JOB_NAME =~ /user/ && $SKIP_BUILD =~ /user/
+      when: never
+    # In all other cases, the job is added to the pipeline.
+    - when: on_success
 
 .cross_system_build_job:
   extends: .cross_common_job
-- 
2.26.2


