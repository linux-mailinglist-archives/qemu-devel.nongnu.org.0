Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD445383D32
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:22:40 +0200 (CEST)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liip5-00007i-QK
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHu-00017s-7i
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHr-0006vM-L4
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621277299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIdjOIYQU/8dr4ot+ceebUgIw/IQfCn148/ZsV5GQUc=;
 b=NGm1pmly2VO5X5wKP8KoopA/LDs+wPuY00WXJQ/qGSQKFHLJpMep8AHKI05NdG+QQtGj73
 CW8jK3AflJFGvIrOHzDfUNCvcqPGymvuy3IR8MewnC4wtW2bUlweDEka6alhK0p4OTxpMR
 Ql2OhODCbhx6jysMNH3iBrJO5XSzg5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-T-xyvXDCNdmy8VkmRU7QTQ-1; Mon, 17 May 2021 14:48:17 -0400
X-MC-Unique: T-xyvXDCNdmy8VkmRU7QTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BB36A40C5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 18:48:16 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 730771F6;
 Mon, 17 May 2021 18:48:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] python/machine: use subprocess.run instead of
 subprocess.Popen
Date: Mon, 17 May 2021 14:48:05 -0400
Message-Id: <20210517184808.3562549-4-jsnow@redhat.com>
In-Reply-To: <20210517184808.3562549-1-jsnow@redhat.com>
References: <20210517184808.3562549-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

use run() instead of Popen() -- to assert to pylint that we are not
forgetting to close a long-running program.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 41f51bd27d0..2e55e2c8bd8 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -223,13 +223,16 @@ def send_fd_scm(self, fd: Optional[int] = None,
             assert fd is not None
             fd_param.append(str(fd))
 
-        proc = subprocess.Popen(
-            fd_param, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
-            stderr=subprocess.STDOUT, close_fds=False
+        proc = subprocess.run(
+            fd_param,
+            stdin=subprocess.DEVNULL,
+            stdout=subprocess.PIPE,
+            stderr=subprocess.STDOUT,
+            check=False,
+            close_fds=False,
         )
-        output = proc.communicate()[0]
-        if output:
-            LOG.debug(output)
+        if proc.stdout:
+            LOG.debug(proc.stdout)
 
         return proc.returncode
 
-- 
2.30.2


