Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48EC34FA52
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 09:35:10 +0200 (CEST)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRVNd-0004lM-P9
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 03:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRVM9-0004Kj-Vy
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 03:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRVM7-0008SH-Vz
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 03:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617176015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+yvLtFEzIICfNkARpa1NxjXzEhzkLa+6+HPTJYwwgeY=;
 b=LgMzF/sJDcc6+yIbCSbciVQyKpBmf2lK+/hj6ury3isGu0RH6hUiRAXXwo66A3gPvWUsSz
 8OGFFJQmgcSYlRkm8pEMU166WWBAH/7i8SVbCTGu7I8O4HFPzzF4iihTgMkADjRJb/BxG6
 lw42TEikl9Vlr0FN8CiykyUirv87KhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-OdK8b8FIOiiYwLmP77yA4A-1; Wed, 31 Mar 2021 03:33:27 -0400
X-MC-Unique: OdK8b8FIOiiYwLmP77yA4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF1281746E;
 Wed, 31 Mar 2021 07:33:26 +0000 (UTC)
Received: from thuth.com (ovpn-112-75.ams2.redhat.com [10.36.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 607C1A4FBF;
 Wed, 31 Mar 2021 07:33:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] gitlab-ci.yml: Fix the filtering for the git submodules
Date: Wed, 31 Mar 2021 09:33:16 +0200
Message-Id: <20210331073316.2965928-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 7d7dbf9dc15be6e introduced a new line starting with
"GIT_SUBMODULES_ACTION=" in the config-host.mak file. The grep that
tries to determine the submodules in the gitlab-ci.yml file matches
this new line, too, causing a warning message when updating the modules:

 warn: ignoring non-existent submodule GIT_SUBMODULES_ACTION=update

Fix it by matching the "GIT_SUBMODULES=..." line only.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 148320ec91..ebf3f80a39 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -57,7 +57,7 @@ include:
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
     - scripts/git-submodule.sh update
-        $(grep GIT_SUBMODULES build/config-host.mak | sed 's/GIT_SUBMODULES=//')
+        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
     - cd build
     - find . -type f -exec touch {} +
     # Avoid recompiling by hiding ninja with NINJA=":"
-- 
2.27.0


