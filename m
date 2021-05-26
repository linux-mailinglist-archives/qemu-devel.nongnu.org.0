Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D659390D57
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 02:35:16 +0200 (CEST)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llhVz-0001cP-JB
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 20:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhMM-0003b6-KI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhMJ-0006aT-Qw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621988715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qifxhGbIIW3jJYdwCvPlOZZ/iEIUOfnWfM2Zp+tBOx8=;
 b=fI7u30y65bJyr00x79nVuWZEbzaTCEoNcoyJJqcBFIQpljY9B0/walWLdZDm2o+ooGeLxH
 Nm+OgblLzr3Hauo7tgaC17vs5qwOYZkp9vSA1uGVvAgFhS1vPf8fJ3Jd7d9bfLCK5n0weq
 RHXnakv5d6Liy14nMWEUhxDPPDqeYOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-5tgQncNcOBug5LSqra_lCw-1; Tue, 25 May 2021 20:25:13 -0400
X-MC-Unique: 5tgQncNcOBug5LSqra_lCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B0F4107ACE3;
 Wed, 26 May 2021 00:25:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECA9860D54;
 Wed, 26 May 2021 00:25:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/31] python/machine: use subprocess.DEVNULL instead of
 open(os.path.devnull)
Date: Tue, 25 May 2021 20:24:25 -0400
Message-Id: <20210526002454.124728-3-jsnow@redhat.com>
In-Reply-To: <20210526002454.124728-1-jsnow@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One less file resource to manage, and it helps quiet some pylint >=
2.8.0 warnings about not using a with-context manager for the open call.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210517184808.3562549-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index b379fcbe726..5b87e9ce024 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -223,9 +223,8 @@ def send_fd_scm(self, fd: Optional[int] = None,
             assert fd is not None
             fd_param.append(str(fd))
 
-        devnull = open(os.path.devnull, 'rb')
         proc = subprocess.Popen(
-            fd_param, stdin=devnull, stdout=subprocess.PIPE,
+            fd_param, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
             stderr=subprocess.STDOUT, close_fds=False
         )
         output = proc.communicate()[0]
@@ -391,7 +390,6 @@ def _launch(self) -> None:
         """
         Launch the VM and establish a QMP connection
         """
-        devnull = open(os.path.devnull, 'rb')
         self._pre_launch()
         self._qemu_full_args = tuple(
             chain(self._wrapper,
@@ -401,7 +399,7 @@ def _launch(self) -> None:
         )
         LOG.debug('VM launch command: %r', ' '.join(self._qemu_full_args))
         self._popen = subprocess.Popen(self._qemu_full_args,
-                                       stdin=devnull,
+                                       stdin=subprocess.DEVNULL,
                                        stdout=self._qemu_log_file,
                                        stderr=subprocess.STDOUT,
                                        shell=False,
-- 
2.31.1


