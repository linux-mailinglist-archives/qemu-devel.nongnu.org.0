Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470F456483
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 21:51:15 +0100 (CET)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnoNG-0001Tq-Cf
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 15:51:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIi-0001qH-Ig
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIh-0000OR-6a
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637268390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uK6BvNr0nSFx88TjfyzcxERx7R9UJc4NK57PTYpit4A=;
 b=B6FGiUJ35upbWIdJbSRsPatjhgItDEf2vWJtWu+WQujnQ2Ynztt+M8MT7N81vFuDqkXjGu
 xun+zM5EZc3IkZ/Q6xlny8yXWn7bS8rHZysGAsY4VUhTnTGEfWhuwwbdZcFFELpUgRy7F6
 AFR7bwCOAydhlBcopXwzq0emKDrEKsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-xPfTBnTSOOGsZ9B6_THCUA-1; Thu, 18 Nov 2021 15:46:26 -0500
X-MC-Unique: xPfTBnTSOOGsZ9B6_THCUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B04E41927802
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 20:46:25 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.18.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07D5667842;
 Thu, 18 Nov 2021 20:46:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] python/machine: move more variable initializations to
 _pre_launch
Date: Thu, 18 Nov 2021 15:46:17 -0500
Message-Id: <20211118204620.1897674-5-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-1-jsnow@redhat.com>
References: <20211118204620.1897674-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to clear them only to set them later.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index ad529fd92a..f92e73de40 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -327,6 +327,14 @@ def _pre_launch(self) -> None:
         self._qemu_log_path = os.path.join(self.log_dir, self._name + ".log")
         self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
+        self._iolog = None
+        self._qemu_full_args = tuple(chain(
+            self._wrapper,
+            [self._binary],
+            self._base_args,
+            self._args
+        ))
+
     def _post_launch(self) -> None:
         if self._qmp_connection:
             self._qmp.accept(self._qmp_timer)
@@ -390,8 +398,6 @@ def launch(self) -> None:
         if self._launched:
             raise QEMUMachineError('VM already launched')
 
-        self._iolog = None
-        self._qemu_full_args = ()
         try:
             self._launch()
             self._launched = True
@@ -410,12 +416,6 @@ def _launch(self) -> None:
         Launch the VM and establish a QMP connection
         """
         self._pre_launch()
-        self._qemu_full_args = tuple(
-            chain(self._wrapper,
-                  [self._binary],
-                  self._base_args,
-                  self._args)
-        )
         LOG.debug('VM launch command: %r', ' '.join(self._qemu_full_args))
 
         # Cleaning up of this subprocess is guaranteed by _do_shutdown.
-- 
2.31.1


