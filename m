Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2056A0ACC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:41:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBpx-0002qo-Lm; Thu, 23 Feb 2023 08:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBpv-0002lf-Gu
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBpt-0008FE-Oy
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYI2UiqrPex76EB48PbOIRyRyTHlpRFQNKj55OSTW0I=;
 b=Vy0OJgagqSbhRdJyoTv5hIPYM5e4IVgMh0gGI3/Ixjv/sgoorInApoXOV0XP3UC1pS1v10
 QgCybfSboXeQ6Z96NUPzjJHIiEf+OU2+52ipcGf/ToIAHwi9Xj6aqi36CoWRfy48fnkULR
 96qzkiMvEs/Hr+lJvvcxyvCa5ntpX7I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-p88LJlZeMvq0ZXNCvWMezg-1; Thu, 23 Feb 2023 08:40:34 -0500
X-MC-Unique: p88LJlZeMvq0ZXNCvWMezg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A46AE800050;
 Thu, 23 Feb 2023 13:40:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EC2140C1106;
 Thu, 23 Feb 2023 13:40:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Het Gala <het.gala@nutanix.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/3] qapi: use env var to trigger qapi test output updates
Date: Thu, 23 Feb 2023 13:40:26 +0000
Message-Id: <20230223134027.2294640-3-berrange@redhat.com>
In-Reply-To: <20230223134027.2294640-1-berrange@redhat.com>
References: <20230223134027.2294640-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is possible to pass --update to tests/qapi-schema/test-qapi.py
to make it update the output files on error. This is inconvient
to achieve though when test-qapi.py is run indirectly by make/meson.

Instead simply allow for an env variable to be set:

 $ QAPI_TEST_UPDATE=1 make check-qapi-schema

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qapi-schema/test-qapi.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index 2160cef082..75f2759fd6 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -215,7 +215,8 @@ def main(argv):
         (dir_name, base_name) = os.path.split(t)
         dir_name = dir_name or args.dir
         test_name = os.path.splitext(base_name)[0]
-        status |= test_and_diff(test_name, dir_name, args.update)
+        update = args.update or "QAPI_TEST_UPDATE" in os.environ
+        status |= test_and_diff(test_name, dir_name, update)
 
     exit(status)
 
-- 
2.39.2


