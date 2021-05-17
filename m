Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A973383CF1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:09:14 +0200 (CEST)
Received: from localhost ([::1]:39470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liic5-0002DJ-Hc
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHw-0001H9-FT
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHu-0006yl-Mb
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621277302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmnghhsnUzWbhD2nTSMoSTOwXPhtYm3cPAUtB3aZmyg=;
 b=TeRUiZ8h7kbwSHxzL/Tg6ahc4FkT9TnAR6y+gv+HLFnpTqDOTlSrbr5K7+o553dFy27U9x
 f/cxTuJbYaRJq7QNZfNQzXknSceIZ0RNTwty46rUK8in/A3ADxIQrDAnkHu4Funzkln4Qb
 jcUtYZprpTj5toM6vYiNY9BAoSh8/n4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-fK3u9zwHMgee4ogN3k2nKw-1; Mon, 17 May 2021 14:48:20 -0400
X-MC-Unique: fK3u9zwHMgee4ogN3k2nKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 741FB1854E21
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 18:48:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C41EB19C46;
 Mon, 17 May 2021 18:48:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] python/machine: Disable pylint warning for open() in
 _pre_launch
Date: Mon, 17 May 2021 14:48:07 -0400
Message-Id: <20210517184808.3562549-6-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

Shift the open() call later so that the pylint pragma applies *only* to
that one open() call. Add a note that suggests why this is safe: the
resource is unconditionally cleaned up in _post_shutdown().

_post_shutdown is called after failed launches (see launch()), and
unconditionally after every call to shutdown(), and therefore also on
__exit__.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/qemu/machine.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 2e55e2c8bd8..f021127f0fc 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -308,7 +308,6 @@ def _pre_launch(self) -> None:
         self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
                                           dir=self._test_dir)
         self._qemu_log_path = os.path.join(self._temp_dir, self._name + ".log")
-        self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
         if self._console_set:
             self._remove_files.append(self._console_address)
@@ -323,6 +322,11 @@ def _pre_launch(self) -> None:
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
2.30.2


