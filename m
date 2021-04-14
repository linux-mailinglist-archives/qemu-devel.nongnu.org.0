Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796635F96E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 19:08:55 +0200 (CEST)
Received: from localhost ([::1]:46144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWj0X-0004ob-DM
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 13:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWiwE-0002j0-BD
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:04:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWiwC-0008OV-PQ
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618419864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaAhRidBDLXrIRci8mcCPOCrAIAvgKwWIswrtJdzdoE=;
 b=R9xz8G5CtyNWebXluI6qwqe9PHm/4zoyt1gdr6cuGh96qXlMRMcptDwllgVr+d8hosEPuZ
 9TQkswQ611RwpGSuqKafB0BHDPk/7DFohNJ+ehTOA6UFV+bqDfvR6bC8lFgTUNvaxKtxAp
 sGLJD82nm6kckWZhIHU5Mrtpfh6fQFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-LoEUgZMYOn-ECBgO9eYzKw-1; Wed, 14 Apr 2021 13:04:22 -0400
X-MC-Unique: LoEUgZMYOn-ECBgO9eYzKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB0881746C;
 Wed, 14 Apr 2021 17:04:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-18.ams2.redhat.com
 [10.36.114.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8D9C10023AC;
 Wed, 14 Apr 2021 17:04:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 05/15] qemu-iotests: delay QMP socket timers
Date: Wed, 14 Apr 2021 19:03:42 +0200
Message-Id: <20210414170352.29927-6-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attaching a gdbserver implies that the qmp socket
should wait indefinitely for an answer from QEMU.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 python/qemu/machine.py        |  3 +++
 tests/qemu-iotests/iotests.py | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 12752142c9..d6142271c2 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -409,6 +409,9 @@ def _launch(self) -> None:
                                        stderr=subprocess.STDOUT,
                                        shell=False,
                                        close_fds=False)
+
+        if 'gdbserver' in self._wrapper:
+            self._qmp_timer = None
         self._post_launch()
 
     def _early_cleanup(self) -> None:
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 05d0dc0751..380527245e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -478,7 +478,10 @@ def log(msg: Msg,
 
 class Timeout:
     def __init__(self, seconds, errmsg="Timeout"):
-        self.seconds = seconds
+        if qemu_gdb:
+            self.seconds = 3000
+        else:
+            self.seconds = seconds
         self.errmsg = errmsg
     def __enter__(self):
         signal.signal(signal.SIGALRM, self.timeout)
@@ -684,6 +687,11 @@ def qmp_to_opts(self, obj):
             output_list += [key + '=' + obj[key]]
         return ','.join(output_list)
 
+    def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
+        if qemu_gdb:
+            wait = 0.0
+        return super().get_qmp_events(wait=wait)
+
     def get_qmp_events_filtered(self, wait=60.0):
         result = []
         for ev in self.get_qmp_events(wait=wait):
-- 
2.30.2


