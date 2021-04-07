Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA6356E32
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 16:10:27 +0200 (CEST)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8sh-0006FP-DJ
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 10:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8aa-0004QU-Vh
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8aC-000655-GA
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxqLC6J1dFzu0Fdk8XGoctTfOUij5tQwR5NAj6F5ld0=;
 b=U3/ehtZOIqV4AdJqZ7HyoY7TlW9KRGPYER1YNqRh08VkaAP4910YorqxOn+TFs4FMvUKUL
 ws2TMNUYiCosaj9uBX5JtAazKyP2GHvmIGA74tG1YQE5gOWPuB5p9DzDCGie9qTjc/uQ6a
 EUMy5Vl0v3DpSCafF+xsb7YPuohpEOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-VCK7H7fKO2aY3WKyoOyFcg-1; Wed, 07 Apr 2021 09:50:57 -0400
X-MC-Unique: VCK7H7fKO2aY3WKyoOyFcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 012E8801814;
 Wed,  7 Apr 2021 13:50:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-163.ams2.redhat.com
 [10.36.115.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34694690F1;
 Wed,  7 Apr 2021 13:50:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 09/11] qemu_iotests: allow valgrint to print/delete the
 generated log file
Date: Wed,  7 Apr 2021 15:50:19 +0200
Message-Id: <20210407135021.48330-10-eesposit@redhat.com>
In-Reply-To: <20210407135021.48330-1-eesposit@redhat.com>
References: <20210407135021.48330-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using valgrind on the test scripts, it generates a log file
in $TEST_DIR that is either print (if valgrind finds problems) or
otherwise deleted. Provide the same exact behavior when using
-valgrind on the python tests.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/iotests.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 56733954b2..b6166b6f7b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -597,6 +597,26 @@ def __init__(self, path_suffix=''):
                          sock_dir=sock_dir)
         self._num_drives = 0
 
+    def subprocess_check_valgrind(self, valgrind) -> None:
+
+        if not valgrind:
+            return
+
+        valgrind_filename =  test_dir + "/" + str(self._popen.pid) + ".valgrind"
+
+        if self.exitcode() == 99:
+            with open(valgrind_filename) as f:
+                content = f.readlines()
+            for line in content:
+                print(line, end ="")
+            print("")
+        else:
+            os.remove(valgrind_filename)
+
+    def _post_shutdown(self) -> None:
+        super()._post_shutdown()
+        self.subprocess_check_valgrind(qemu_valgrind)
+
     def add_object(self, opts):
         self._args.append('-object')
         self._args.append(opts)
-- 
2.30.2


