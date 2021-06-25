Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B593B482B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 19:24:40 +0200 (CEST)
Received: from localhost ([::1]:45654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwpZH-0003RS-G7
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 13:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwpXC-0001Yq-2C
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:22:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwpX9-00025t-Ii
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624641746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDGAwU2w1qI6/NG0bvhbjeemR2XJJMhtdv+ttGGAdqE=;
 b=bRI3S1BpClnK9tDgVrM/ZebQKfR+aGDxAyYpennP922hmEf9gJ3phJ4HDxnx4IpJRES8vh
 M1/tHQ5va729ASrcYGUvlWOf6ft0KLlKSqyRY/kxt4/tTg8RLsYBnyp+BfcBke2ql+BB+7
 D11lS+6JoH4ME4nFYHOvmph02pJnltY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-78Ly6JpqMPicW-qjMdVKkA-1; Fri, 25 Jun 2021 13:22:25 -0400
X-MC-Unique: 78Ly6JpqMPicW-qjMdVKkA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D30E362F8;
 Fri, 25 Jun 2021 17:22:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-183.ams2.redhat.com
 [10.36.114.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A68D31017CE5;
 Fri, 25 Jun 2021 17:22:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] build: validate that system capstone works before using it
Date: Fri, 25 Jun 2021 18:22:09 +0100
Message-Id: <20210625172211.451010-2-berrange@redhat.com>
In-Reply-To: <20210625172211.451010-1-berrange@redhat.com>
References: <20210625172211.451010-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some versions of capstone have shipped a broken pkg-config file which
puts the -I path without the trailing '/capstone' suffix. This breaks
the ability to "#include <capstone.h>". Upstream and most distros have
fixed this, but a few stragglers remain, notably FreeBSD.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meson.build b/meson.build
index d8a92666fb..9979ddae71 100644
--- a/meson.build
+++ b/meson.build
@@ -1425,6 +1425,19 @@ if capstone_opt in ['enabled', 'auto', 'system']
                         kwargs: static_kwargs, method: 'pkg-config',
                         required: capstone_opt == 'system' or
                                   capstone_opt == 'enabled' and not have_internal)
+
+  # Some versions of capstone have broken pkg-config file
+  # that reports a wrong -I path, causing the #include to
+  # fail later. If the system has such a broken version
+  # do not use it.
+  if capstone.found() and not cc.compiles('#include <capstone.h>',
+                                          dependencies: [capstone])
+    capstone = not_found
+    if capstone_opt == 'system'
+      error('system capstone requested, it it does not appear to work')
+    endif
+  endif
+
   if capstone.found()
     capstone_opt = 'system'
   elif have_internal
-- 
2.31.1


