Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007A37D554
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 23:52:19 +0200 (CEST)
Received: from localhost ([::1]:43468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgwmA-0003Nx-Br
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 17:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgy-0000nB-Im
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgx-0007hj-82
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620856014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+n4WeStCk9DHrLUSIwDiLlWUE6zkA9YSqLHpnur8GE=;
 b=JcJX5VVoFj4WAuA9rIb7td1PV2rslu3quLm3eH/rh64l7G98TeXj+mE8uCpgbLLqsYSEJ7
 Qf1Ong+QC4iGTsxdlOgByGIc3NdYcBauisIUYWGqywfum2KztQa7YORgLJtj/7uiTcnN1V
 cqo8bBzgw6PaUz+tlSs5Jb+iSDmrS5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-F3FDLRx1OJeL8brL_aAKWw-1; Wed, 12 May 2021 17:46:49 -0400
X-MC-Unique: F3FDLRx1OJeL8brL_aAKWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07018FC8E;
 Wed, 12 May 2021 21:46:49 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32F485D6AC;
 Wed, 12 May 2021 21:46:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] python/machine: use subprocess.run instead of
 subprocess.Popen
Date: Wed, 12 May 2021 17:46:35 -0400
Message-Id: <20210512214642.2803189-4-jsnow@redhat.com>
In-Reply-To: <20210512214642.2803189-1-jsnow@redhat.com>
References: <20210512214642.2803189-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

use run() instead of Popen() -- to assert to pylint that we are not
forgetting to close a long-running program.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 41f51bd27d0..c13ff9b32bf 100644
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
+            check=True,
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


