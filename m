Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3A0356DFA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:58:32 +0200 (CEST)
Received: from localhost ([::1]:46958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8hS-00048r-W2
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8Zw-0003uL-QB
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8Zq-0005te-Lm
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBydi4G2HMTWGs+miE3qhbLvy6VWo1EygufKXdW6AGY=;
 b=DcbW+XZQG0m4Q+YnPXyfNbfW0N+mO7iM0zQ0ZSVtCSdNulWgrqipASB/2FS9edZRkVYKKQ
 Cif6c5+vH6vs7xDHYwAn2MwO1RkpBIKEBFwhlllx82Ls4BO3X2H1Pr98m8x/UWD1o0+jgL
 Gwesc+Uu3A3neciNUPvD9IlQrQaC3wE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-FHlgrd-SPpS7H4wOhMCu7w-1; Wed, 07 Apr 2021 09:50:35 -0400
X-MC-Unique: FHlgrd-SPpS7H4wOhMCu7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49F04802B5B;
 Wed,  7 Apr 2021 13:50:34 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-163.ams2.redhat.com
 [10.36.115.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ACA21964B;
 Wed,  7 Apr 2021 13:50:27 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 01/11] python: qemu: add timer parameter for qmp.accept
 socket
Date: Wed,  7 Apr 2021 15:50:11 +0200
Message-Id: <20210407135021.48330-2-eesposit@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
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

Extend the _post_launch function to include the timer as
parameter instead of defaulting to 15 sec.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 python/qemu/machine.py | 4 ++--
 python/qemu/qtest.py   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6e44bda337..c721e07d63 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -321,9 +321,9 @@ def _pre_launch(self) -> None:
                 nickname=self._name
             )
 
-    def _post_launch(self) -> None:
+    def _post_launch(self, timer) -> None:
         if self._qmp_connection:
-            self._qmp.accept()
+            self._qmp.accept(timer)
 
     def _post_shutdown(self) -> None:
         """
diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
index 39a0cf62fe..0d01715086 100644
--- a/python/qemu/qtest.py
+++ b/python/qemu/qtest.py
@@ -138,9 +138,9 @@ def _pre_launch(self) -> None:
         super()._pre_launch()
         self._qtest = QEMUQtestProtocol(self._qtest_path, server=True)
 
-    def _post_launch(self) -> None:
+    def _post_launch(self, timer) -> None:
         assert self._qtest is not None
-        super()._post_launch()
+        super()._post_launch(timer)
         self._qtest.accept()
 
     def _post_shutdown(self) -> None:
-- 
2.30.2


