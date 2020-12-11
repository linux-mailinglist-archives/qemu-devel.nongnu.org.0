Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD81F2D7E6E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:48:25 +0100 (CET)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnSq-0003Yt-KN
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnJf-0005w6-CD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:38:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnJZ-0007oi-Cf
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607711925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0vZ+467TU+E0FScNzvCRQz+Rcc/qwLh9mMJ7V5DsAo=;
 b=JNrN8Nxqa7Rv3qfkFfCHBXDeM2LE536S7MxMCxiOVBDrg21uRD03LFb65JbC+/0t5D1cfZ
 oFWUkTgI4uiPPXO2vN9mcMQJlew9L4QCu5nYmyPq0Mb8gnooUwtRsoAIAJH5NhY3xHQXRO
 ioVTWqxGc+0p9Lzg7TVQKEvjCErqaPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-vVtmwUBbNoKDy3MHdXgyzg-1; Fri, 11 Dec 2020 13:38:43 -0500
X-MC-Unique: vVtmwUBbNoKDy3MHdXgyzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB9AE18B9F0C;
 Fri, 11 Dec 2020 18:38:41 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4EE310023AC;
 Fri, 11 Dec 2020 18:38:39 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] gitlab-ci: Refactor code that show logs of failed
 acceptances
Date: Fri, 11 Dec 2020 15:38:26 -0300
Message-Id: <20201211183827.915232-3-wainersm@redhat.com>
In-Reply-To: <20201211183827.915232-1-wainersm@redhat.com>
References: <20201211183827.915232-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: willianr@redhat.com, alex.bennee@linaro.org, thuth@redhat.com,
 philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the code (python) on after_script of the acceptance jobs that
is currently used to show the logs of failed tests. Instead it is used
the Avocado's testlogs plug-in which works likewise.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98bff03b47..85aa20ffde 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -58,13 +58,14 @@ include:
     - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
     - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
            >> ~/.config/avocado/avocado.conf
+    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL"]'
+           >> ~/.config/avocado/avocado.conf
     - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
         du -chs ${CI_PROJECT_DIR}/avocado-cache ;
       fi
     - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
   after_script:
     - cd build
-    - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP", "CANCEL")]' | xargs cat
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
 
 build-system-ubuntu:
-- 
2.28.0


