Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079449BA80
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:39:13 +0100 (CET)
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPmi-0008Bc-H9
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:39:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCPjt-0005yG-Oq
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:36:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCPjr-0000Xa-8j
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643132174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z3njYf57YdAfp5A7ZTfqQ7UdYFW5bhznXacDjF6y9Vs=;
 b=Ds9vaTwNZdUOqGvAOmZc4gteNikLbXJhv5oXmJCrT+u6P5C324YadzWwQ3JQ/o0+YaUyb5
 FeZNNZg9Df/kHVa/6955T7vN8mTji1mxY2U5OyTRJUiElpP5FrLnzuukEPj8/5HBn9vLn6
 D0A96I/sQ8lzpM8NCjHrvKERGkZIY14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-MptXVvuSM4OxIPBl5zgkAQ-1; Tue, 25 Jan 2022 12:36:11 -0500
X-MC-Unique: MptXVvuSM4OxIPBl5zgkAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A96638143E5;
 Tue, 25 Jan 2022 17:36:10 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFE357AB58;
 Tue, 25 Jan 2022 17:34:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab: fall back to commit hash in qemu-setup filename
Date: Tue, 25 Jan 2022 17:34:54 +0000
Message-Id: <20220125173454.10381-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Personal repos may not have release tags (v6.0.0, v6.1.0, etc) and this
causes cross_system_build_job to fail when pretty-printing a unique
qemu-setup-*.exe name:

  version="$(git describe --match v[0-9]*)";
             ^^^^^^^^^^ fails ^^^^^^^^^^^
  mv -v qemu-setup*.exe qemu-setup-${version}.exe;

Fall back to the short commit hash if necessary. This fixes CI failures
that Greg Kurz and I experienced in our personal repos.

Cc: Greg Kurz <groug@kaod.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 10d22dcf6c..29c3c2b826 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -14,7 +14,7 @@
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
       then make installer;
-      version="$(git describe --match v[0-9]*)";
+      version="$(git describe --match v[0-9]* 2>/dev/null || git rev-parse --short HEAD)";
       mv -v qemu-setup*.exe qemu-setup-${version}.exe;
       fi
 
-- 
2.34.1


