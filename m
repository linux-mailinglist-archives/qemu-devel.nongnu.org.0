Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEC8380929
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:08:10 +0200 (CEST)
Received: from localhost ([::1]:46488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWby-0003k2-0W
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWYa-0004o5-06
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhWYY-00066c-Fk
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620993877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjGv+pg1NQQyZlLaqmNbc+6hWXAk36eXjqKFoxFvng8=;
 b=Qnvxb9KifhZTfR30jFxoAH5zd/3wFLTYxeggCYJONLUR+klm/bEUTRER2tgfgghcakrDpR
 I6aWhUsLB17zn3U/ViLLjiw6JA1D8Cj/DX52lDqZ7lr55tOfhmQnBDO/fCxG3zL8DEC4dA
 CagJ6/GT0K43MY9I9rwXk7ecFN4zdQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-wHa1uOFGOuivSEJ-ElCBqw-1; Fri, 14 May 2021 08:04:34 -0400
X-MC-Unique: wHa1uOFGOuivSEJ-ElCBqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E026801B12;
 Fri, 14 May 2021 12:04:33 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3BA19C59;
 Fri, 14 May 2021 12:04:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] patchew: move quick build job from CentOS 7 to
 CentOS 8 container
Date: Fri, 14 May 2021 13:04:05 +0100
Message-Id: <20210514120415.1368922-3-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-1-berrange@redhat.com>
References: <20210514120415.1368922-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It has been over two years since RHEL-8 was released, and thus per the
platform build policy, we no longer need to support RHEL-7 as a build
target.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.31.1


