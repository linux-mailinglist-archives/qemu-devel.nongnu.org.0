Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B844A3BB785
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:08:22 +0200 (CEST)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0IiL-0006fc-QK
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IYJ-0002rU-Sj
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IYI-0004Px-9P
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625468277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjI/eatHq+wW/YDjZadaObYIUBK6vvUrROY6sLPTnYQ=;
 b=HNxUwNs4/CW55AIeWdvCGLABIUwRrzYIKSNifYDFWBfsH2VIU2kzIraseYdI+lrC8QExIp
 truKL4Xori80NDwbnY5oP+8pKqGbbwIdakNIJNgCV3RBH97QvJSrY/GStapVWS97G1/tmZ
 NqcKcMp3G9lidm9A+ot6DUXLtKizbjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-TrYrPhKpNLGb1tnmKr6fPA-1; Mon, 05 Jul 2021 02:57:56 -0400
X-MC-Unique: TrYrPhKpNLGb1tnmKr6fPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24584362FD;
 Mon,  5 Jul 2021 06:57:55 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-244.ams2.redhat.com
 [10.36.112.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2AC6100EBAF;
 Mon,  5 Jul 2021 06:57:52 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 12/16] qemu-iotests: allow valgrind to read/delete the
 generated log file
Date: Mon,  5 Jul 2021 08:57:07 +0200
Message-Id: <20210705065711.127119-13-eesposit@redhat.com>
In-Reply-To: <20210705065711.127119-1-eesposit@redhat.com>
References: <20210705065711.127119-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using -valgrind on the script tests, it generates a log file
in $TEST_DIR that is either read (if valgrind finds problems) or
otherwise deleted. Provide the same exact behavior when using
-valgrind on the python tests.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 26c580f9e7..85d8c0abbb 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -598,6 +598,17 @@ def __init__(self, path_suffix=''):
                          sock_dir=sock_dir, qmp_timer=timer)
         self._num_drives = 0
 
+    def _post_shutdown(self) -> None:
+        super()._post_shutdown()
+        if not qemu_valgrind or not self._popen:
+            return
+        valgrind_filename =  f"{test_dir}/{self._popen.pid}.valgrind"
+        if self.exitcode() == 99:
+            with open(valgrind_filename) as f:
+                print(f.read())
+        else:
+            os.remove(valgrind_filename)
+
     def add_object(self, opts):
         self._args.append('-object')
         self._args.append(opts)
-- 
2.31.1


