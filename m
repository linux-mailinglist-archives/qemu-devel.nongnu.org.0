Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEAE3937EF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:27:31 +0200 (CEST)
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNXO-0005AY-9r
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNOA-0001mb-VE
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNO7-0008Gl-NR
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622150275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwrTT2qkQZciJ9bA6Dbm8rGrg7RswV824H1jgqdNc+w=;
 b=dXloRWhtlkl3WUXT723l2ulLf1Prz/FWTBrtCE6pjj95keiWm0aTPQFmSIVyVAkQBIvEdn
 EwnvvzpO736Gj9qoWxpl/o9LI/Ff50LomiDN+CVHqa+u36siOkNV5EAr6+nIyVvCrRvka5
 7/WT9z9brnukzc1QLdofJGGlmRInmD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-ZbK6HmUjOBeCJ4Prx1AlbQ-1; Thu, 27 May 2021 17:17:53 -0400
X-MC-Unique: ZbK6HmUjOBeCJ4Prx1AlbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 282E88042AD;
 Thu, 27 May 2021 21:17:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 585685D9C6;
 Thu, 27 May 2021 21:17:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/31] python/machine: Disable pylint warning for open() in
 _pre_launch
Date: Thu, 27 May 2021 17:16:49 -0400
Message-Id: <20210527211715.394144-6-jsnow@redhat.com>
In-Reply-To: <20210527211715.394144-1-jsnow@redhat.com>
References: <20210527211715.394144-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shift the open() call later so that the pylint pragma applies *only* to
that one open() call. Add a note that suggests why this is safe: the
resource is unconditionally cleaned up in _post_shutdown().

_post_shutdown is called after failed launches (see launch()), and
unconditionally after every call to shutdown(), and therefore also on
__exit__.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210517184808.3562549-6-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 04e005f3811..c66bc6a9c69 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -306,7 +306,6 @@ def _base_args(self) -> List[str]:
 
     def _pre_launch(self) -> None:
         self._qemu_log_path = os.path.join(self.temp_dir, self._name + ".log")
-        self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
         if self._console_set:
             self._remove_files.append(self._console_address)
@@ -321,6 +320,11 @@ def _pre_launch(self) -> None:
                 nickname=self._name
             )
 
+        # NOTE: Make sure any opened resources are *definitely* freed in
+        # _post_shutdown()!
+        # pylint: disable=consider-using-with
+        self._qemu_log_file = open(self._qemu_log_path, 'wb')
+
     def _post_launch(self) -> None:
         if self._qmp_connection:
             self._qmp.accept()
-- 
2.31.1


