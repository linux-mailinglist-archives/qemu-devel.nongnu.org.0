Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D120398339
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:39:35 +0200 (CEST)
Received: from localhost ([::1]:34072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLTS-0004Ya-1i
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQS-0008Sv-Ff
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQQ-0003ob-OQ
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztTxlgm1Aw6BNlAg9BhKJNfNzQal40o/ll87wr61+pM=;
 b=Uzzt3sX8cWM2KkLoCUNAHVwTOhy0aCO1MKMGWugiYHjjC417mnlOe9IEvNzZPms7LvbytM
 BQijA1cPPf+5+a/12fQqYjnAo3F3iGD81QCHPs9mh85JOuvkMwIs3iwVT+BB8Y3wI8UBhw
 M4vY+2s4Ma2QkfhuMtRikMgcAWHA0Zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-NbPxJTe6M4ClwUOkdW7yZg-1; Wed, 02 Jun 2021 03:36:24 -0400
X-MC-Unique: NbPxJTe6M4ClwUOkdW7yZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3134C1854E34;
 Wed,  2 Jun 2021 07:36:23 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B70D5C737;
 Wed,  2 Jun 2021 07:36:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/17] patchew: move quick build job from CentOS 7 to CentOS 8
 container
Date: Wed,  2 Jun 2021 09:35:56 +0200
Message-Id: <20210602073606.338994-8-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

It has been over two years since RHEL-8 was released, and thus per the
platform build policy, we no longer need to support RHEL-7 as a build
target.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210514120415.1368922-3-berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .patchew.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.patchew.yml b/.patchew.yml
index 988c29261f..2638b7f564 100644
--- a/.patchew.yml
+++ b/.patchew.yml
@@ -88,7 +88,7 @@ email:
         more information:
 
         {{ logtext }}
-        {% elif test == "docker-mingw@fedora" or test == "docker-quick@centos7" or test == "asan" %}
+        {% elif test == "docker-mingw@fedora" or test == "docker-quick@centos8" or test == "asan" %}
         Hi,
 
         This series failed the {{ test }} build test. Please find the testing commands and
@@ -124,13 +124,13 @@ testing:
       script: |
         #!/bin/bash
         time make docker-test-debug@fedora TARGET_LIST=x86_64-softmmu J=14 NETWORK=1
-    docker-quick@centos7:
+    docker-quick@centos8:
       enabled: false
       requirements: docker,x86_64
       timeout: 3600
       script: |
         #!/bin/bash
-        time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
+        time make docker-test-quick@centos8 SHOW_ENV=1 J=14 NETWORK=1
     checkpatch:
       enabled: true
       requirements: ''
-- 
2.27.0


