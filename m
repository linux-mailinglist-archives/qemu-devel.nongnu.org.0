Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B552B3BB787
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:10:34 +0200 (CEST)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0IkT-0002eD-Hy
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IYI-0002me-KP
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IYF-0004PG-Ic
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625468274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nduGZC0I5oAaAdS7E6A1VFYPhHC4ckjrNXi8h3sMrAk=;
 b=TiHbdOd7w2nWdfhwbme1n1yIp2WoNczNgOY6+hlxzECBN+GckiXpbnk329Q7Ga0q7NJFeh
 kC5EkpzrYJOTCxUreXbLYmbnurdoiXh1Aaa0KrN+ZFKHLH5iVn8NLCjAwaxJHi7DZx2/pm
 Ksa8rVDg6+gBoKcIjmMoSN34/HiXI/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-FUNIbjYqNGuzYp8CO1N8wg-1; Mon, 05 Jul 2021 02:57:53 -0400
X-MC-Unique: FUNIbjYqNGuzYp8CO1N8wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E3CC804140;
 Mon,  5 Jul 2021 06:57:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-244.ams2.redhat.com
 [10.36.112.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AE311002D71;
 Mon,  5 Jul 2021 06:57:49 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 11/16] qemu-iotests: extend QMP socket timeout when using
 valgrind
Date: Mon,  5 Jul 2021 08:57:06 +0200
Message-Id: <20210705065711.127119-12-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

As with gdbserver, valgrind delays the test execution, so
the default QMP socket timeout and the generic class
Timeout in iotests.py timeouts too soon.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6aa1dc48ba..26c580f9e7 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -488,13 +488,13 @@ def __init__(self, seconds, errmsg="Timeout"):
         self.seconds = seconds
         self.errmsg = errmsg
     def __enter__(self):
-        if qemu_gdb:
+        if qemu_gdb or qemu_valgrind:
             return self
         signal.signal(signal.SIGALRM, self.timeout)
         signal.setitimer(signal.ITIMER_REAL, self.seconds)
         return self
     def __exit__(self, exc_type, value, traceback):
-        if qemu_gdb:
+        if qemu_gdb or qemu_valgrind:
             return False
         signal.setitimer(signal.ITIMER_REAL, 0)
         return False
@@ -590,7 +590,7 @@ class VM(qtest.QEMUQtestMachine):
 
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
-        timer = 15.0 if not qemu_gdb else None
+        timer = 15.0 if not (qemu_gdb or qemu_valgrind) else None
         super().__init__(qemu_prog, qemu_opts, wrapper=qemu_gdb,
                          name=name,
                          base_temp_dir=test_dir,
-- 
2.31.1


