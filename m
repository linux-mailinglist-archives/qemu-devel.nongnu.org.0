Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B4C37F551
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:06:04 +0200 (CEST)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8EF-0004JH-Qr
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh84I-0006mQ-O6
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh84C-0006bO-MK
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620899739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjqQZgKV3fxTWSyxuWua9CdTtbe0EIR2KMfKdCEVPWQ=;
 b=iCWSDF7emwvneKfwbxgEGByimrzz27kZWQXsvST8kVFPQd/pl11yAHuusqCMDw0RS8LysS
 IBlmqTNsO+yZDmoyiAL4xR8vJQzItKSTp+2jTAtdXjPJMVaYreht1qgPveiOTBwgU60qcl
 8iWJzT4lqZVK/gSDinfFn2ok2d0rEw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-KMRurt08MOWWgwweDJbzMA-1; Thu, 13 May 2021 05:55:36 -0400
X-MC-Unique: KMRurt08MOWWgwweDJbzMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE2A86D4F4;
 Thu, 13 May 2021 09:55:35 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FE7010023AF;
 Thu, 13 May 2021 09:55:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/22] tests/docker: don't use BUILDKIT in GitLab either
Date: Thu, 13 May 2021 10:54:59 +0100
Message-Id: <20210513095519.1213675-3-berrange@redhat.com>
In-Reply-To: <20210513095519.1213675-1-berrange@redhat.com>
References: <20210513095519.1213675-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using BUILDKIT breaks with certain container registries such as CentOS,
with docker build reporting an error such as

  failed to solve with frontend dockerfile.v0:
  failed to build LLB: failed to load cache key:
  unexpected status code
  https://registry.centos.org/v2/centos/manifests/7:
  403 Forbidden

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/docker.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index d28df4c140..e9b3af8bfe 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -228,7 +228,9 @@ class Docker(object):
     def __init__(self):
         self._command = _guess_engine_command()
 
-        if "docker" in self._command and "TRAVIS" not in os.environ:
+        if ("docker" in self._command and
+            "TRAVIS" not in os.environ and
+            "GITLAB_CI" not in os.environ):
             os.environ["DOCKER_BUILDKIT"] = "1"
             self._buildkit = True
         else:
-- 
2.31.1


