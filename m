Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9B459A2E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 03:43:18 +0100 (CET)
Received: from localhost ([::1]:40156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpLmA-00048K-2e
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 21:43:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLhl-00061K-Em
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLhh-0006D3-0D
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637635120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MPTfkSUtJ8e06jEWH63eHWQq8DnMH8hhJMrCrPhXSk=;
 b=VOB3PUrFw8WXZ1rUr2BhDAOEhGP61HoI25Q8OS52WcWNRxJQRZDW8ufRUz/neU6hK+JzSM
 hY0fHR/ucVEvr7ESnKaggISIg2mzV/S2ped8cbMjSdL1jUf6PrZV8Mi6ei3BmYSN4qDOkH
 nkf6GFNRppTfe9Q2oVl3owAOtfh0OvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-dZrzCmnrNSuJqpWIs7EjwQ-1; Mon, 22 Nov 2021 21:38:37 -0500
X-MC-Unique: dZrzCmnrNSuJqpWIs7EjwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AA3718414A1;
 Tue, 23 Nov 2021 02:38:36 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2094A56A8B;
 Tue, 23 Nov 2021 02:38:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] python/machine: move more variable initializations to
 _pre_launch
Date: Mon, 22 Nov 2021 21:38:02 -0500
Message-Id: <20211123023805.2745382-5-jsnow@redhat.com>
In-Reply-To: <20211123023805.2745382-1-jsnow@redhat.com>
References: <20211123023805.2745382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to clear them only to set them later.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-id: 20211118204620.1897674-5-jsnow@redhat.com
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


