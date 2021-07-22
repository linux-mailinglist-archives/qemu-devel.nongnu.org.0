Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530013D277D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:22:43 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bT8-00083T-DJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6bSG-0007Iv-Dj
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6bSE-00084k-1W
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626970905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eoweOhhiCEmNX1VP84g80yyY1icGxQ80DwzFC2dzdqk=;
 b=Bu13T1wccwr24JOnLN88N577n8x6OrfPQefEKK660Wyj8g+vCDHO5VVkpc+vd7bsnWU8i0
 BgDwbNIl+g30G2xWx/mHjnrVCMEHBub7j5i1rc84I9jWJ0QBBAeHahN1nUCt0iq1+9mZlp
 zo6zlTmviAspUTfXnBPJgcQty5X5AxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-0SxbhhaVO_uU-R4mzRLwSg-1; Thu, 22 Jul 2021 12:21:44 -0400
X-MC-Unique: 0SxbhhaVO_uU-R4mzRLwSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC83F105FF54;
 Thu, 22 Jul 2021 16:20:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-245.ams2.redhat.com
 [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 048C460936;
 Thu, 22 Jul 2021 16:20:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gitlab: don't run acceptance jobs if build jobs fail
Date: Thu, 22 Jul 2021 17:20:35 +0100
Message-Id: <20210722162035.2765755-3-berrange@redhat.com>
In-Reply-To: <20210722162035.2765755-1-berrange@redhat.com>
References: <20210722162035.2765755-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'when: always' clause tells gitlab to run the job even if the
dependant jobs have failed. This is wrong for the acceptance jobs,
since we need the build artifacts from the dependant jobs. This
results in the acceptance jobs given extra failures with wierd
messages about missing files.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 3e3e19d96b..fcbcc4e627 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -73,9 +73,9 @@
     # in its namespace setting or via git-push option, see documentation
     # in /.gitlab-ci.yml of this repository).
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: always
+      when: on_success
     - if: '$QEMU_CI_AVOCADO_TESTING'
-      when: always
+      when: on_success
     # Otherwise, set to manual (the jobs are created but not run).
     - when: manual
       allow_failure: true
-- 
2.31.1


