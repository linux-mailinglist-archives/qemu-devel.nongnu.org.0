Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1745383D6A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:29:45 +0200 (CEST)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liivv-0007ps-FY
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHt-00012Y-1F
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHq-0006tn-DF
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621277297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjPSneTvTI+TkbJZNubTGkNppSr91+Xv4DZST4sCK6Q=;
 b=bQowQs02j8ks8r4sPNqaVPi/7pZvSS37Vi7wx5lUSUboF117Kui+gJynLq+xoS28IIBixf
 nvBoBfIqZkIyxNjeZ1AJskJqpUpAHzItNQIycLB8IRwL+wsemkBCWYt0tCBv1/S9Phd9yf
 vWBMyB2K6f9sClfW9rzaJwlVqMnJeTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-S6HD-GcDPmiOJVbT0KbhzQ-1; Mon, 17 May 2021 14:48:16 -0400
X-MC-Unique: S6HD-GcDPmiOJVbT0KbhzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45DE28015F5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 18:48:15 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5490D19C46;
 Mon, 17 May 2021 18:48:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] python/machine: use subprocess.DEVNULL instead of
 open(os.path.devnull)
Date: Mon, 17 May 2021 14:48:04 -0400
Message-Id: <20210517184808.3562549-3-jsnow@redhat.com>
In-Reply-To: <20210517184808.3562549-1-jsnow@redhat.com>
References: <20210517184808.3562549-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One less file resource to manage, and it helps quiet some pylint >=
2.8.0 warnings about not using a with-context manager for the open call.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 python/qemu/machine.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6e44bda337e..41f51bd27d0 100644
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
@@ -393,7 +392,6 @@ def _launch(self) -> None:
         """
         Launch the VM and establish a QMP connection
         """
-        devnull = open(os.path.devnull, 'rb')
         self._pre_launch()
         self._qemu_full_args = tuple(
             chain(self._wrapper,
@@ -403,7 +401,7 @@ def _launch(self) -> None:
         )
         LOG.debug('VM launch command: %r', ' '.join(self._qemu_full_args))
         self._popen = subprocess.Popen(self._qemu_full_args,
-                                       stdin=devnull,
+                                       stdin=subprocess.DEVNULL,
                                        stdout=self._qemu_log_file,
                                        stderr=subprocess.STDOUT,
                                        shell=False,
-- 
2.30.2


