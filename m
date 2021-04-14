Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB2735F9D7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 19:31:25 +0200 (CEST)
Received: from localhost ([::1]:58312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWjMK-0003In-3k
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 13:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWiwj-00032F-00
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWiwS-0008WG-W9
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618419880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w39ZM+MsWatc/sFtqbvtjivwo4ieJRLRJnfsxpvIkWM=;
 b=InN1ICIV7BMp6XcLYHgm6AusidTDAtwwB2FIwCiA58L8Iae/6AbkOnghQadtq6viujPUvM
 Iwuei7FMNiabUPYjej4M6xbWY7/ZWebaanJCNkCtipvh4+rhjRKZnVnwjMXWRHEdTD0+Ai
 ZLGojNOZS8nMXUL+LIR7R5fQNorEoIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-ex4Ab5YDMFaDP9dZVYkx_Q-1; Wed, 14 Apr 2021 13:04:38 -0400
X-MC-Unique: ex4Ab5YDMFaDP9dZVYkx_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6797181744F;
 Wed, 14 Apr 2021 17:04:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-18.ams2.redhat.com
 [10.36.114.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE73E10023AC;
 Wed, 14 Apr 2021 17:04:34 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 10/15] qemu_iotests: extent QMP socket timeout when using
 valgrind
Date: Wed, 14 Apr 2021 19:03:47 +0200
Message-Id: <20210414170352.29927-11-eesposit@redhat.com>
In-Reply-To: <20210414170352.29927-1-eesposit@redhat.com>
References: <20210414170352.29927-1-eesposit@redhat.com>
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

As with gdbserver, valgrind delays the test execution, so
the default QMP socket timeout timeout too soon.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 python/qemu/machine.py        | 2 +-
 tests/qemu-iotests/iotests.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index d6142271c2..dce96e1858 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -410,7 +410,7 @@ def _launch(self) -> None:
                                        shell=False,
                                        close_fds=False)
 
-        if 'gdbserver' in self._wrapper:
+        if 'gdbserver' in self._wrapper or 'valgrind' in self._wrapper:
             self._qmp_timer = None
         self._post_launch()
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index a2e8604674..94597433fa 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -489,7 +489,7 @@ def log(msg: Msg,
 
 class Timeout:
     def __init__(self, seconds, errmsg="Timeout"):
-        if qemu_gdb:
+        if qemu_gdb or qemu_valgrind:
             self.seconds = 3000
         else:
             self.seconds = seconds
@@ -700,7 +700,7 @@ def qmp_to_opts(self, obj):
         return ','.join(output_list)
 
     def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
-        if qemu_gdb:
+        if qemu_gdb or qemu_valgrind:
             wait = 0.0
         return super().get_qmp_events(wait=wait)
 
-- 
2.30.2


