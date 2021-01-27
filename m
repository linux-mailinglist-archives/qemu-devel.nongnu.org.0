Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C930578D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 10:58:36 +0100 (CET)
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hau-00045i-0j
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 04:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXR-0007Xl-Ty
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:55:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXP-0000AF-Q4
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611741299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPgoZsuouhdZNP6+15iiRkfjNG6c1sOaA8KYB4jFe4E=;
 b=XvjNk06ks+lcGRhfMoDRKwuIwFwtWNX8iP4JClJf4yBx1jCyf8iovFz86WSjg3qWVHrVfa
 fJ3G5pwB6D96cuLLgpFs2+HrNyWzJqa+/90rqwcIdorI0nggKaqkvSKJuf/O7RpEB2fFg1
 Lr2rdjsEoncTT/jBzOfFydtULfa4VP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-3SGSpk9OMfCdAcQH6YxEVg-1; Wed, 27 Jan 2021 04:54:55 -0500
X-MC-Unique: 3SGSpk9OMfCdAcQH6YxEVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB79D8017FB;
 Wed, 27 Jan 2021 09:54:54 +0000 (UTC)
Received: from thuth.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ACCA5D9C6;
 Wed, 27 Jan 2021 09:54:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/9] gitlab-ci: Test building linux-user targets on CentOS 7
Date: Wed, 27 Jan 2021 10:54:37 +0100
Message-Id: <20210127095444.114495-3-thuth@redhat.com>
In-Reply-To: <20210127095444.114495-1-thuth@redhat.com>
References: <20210127095444.114495-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a configuration tested by Peter Maydell (see [1] and [2])
but not covered in our CI [3]:

  [705/2910] Compiling C object libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
  FAILED: libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
  ../linux-user/strace.c: In function 'do_print_sockopt':
  ../linux-user/strace.c:2831:14: error: 'IPV6_ADDR_PREFERENCES' undeclared (first use in this function)
           case IPV6_ADDR_PREFERENCES:
                ^

This job currently takes 31 minutes 32 seconds ([4]).

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05086.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05379.html
[3] https://gitlab.com/philmd/qemu/-/jobs/977408284
[4] https://gitlab.com/philmd/qemu/-/jobs/978223286

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210121172829.1643620-3-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index de3a3d25b5..af4d74757d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -411,6 +411,13 @@ build-user-plugins:
     MAKE_CHECK_ARGS: check-tcg
   timeout: 1h 30m
 
+build-user-centos7:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos7
+    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
+    MAKE_CHECK_ARGS: check-tcg
+
 build-some-softmmu-plugins:
   <<: *native_build_job_definition
   variables:
-- 
2.27.0


