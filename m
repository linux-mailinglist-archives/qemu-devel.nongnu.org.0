Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CB537D51A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 23:50:41 +0200 (CEST)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgwka-0000Rl-9X
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 17:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgx-0000mc-Pn
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgw-0007hF-2M
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620856013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRoXjpL1COvPFgYOg27IMS77Yp8odkYELVhLzf88+3w=;
 b=gnoX3EuUtB9lSxpED4Wkcmc64wES0pjjNXnerSmnG/DIwdQTDqbo8U3GGQxWAjTQsPHRaX
 11OyLd4ZlqnyoMZ4p4EWR/5qfSuLkAIQQAlGP/2ms4c8uv96UtPsCGHJU3BhzlOJWnU8Va
 8+0q2R6lqvG54E0iScRoLmf3kuc25zw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-coVwtcv7N42KBqvkTBtcqw-1; Wed, 12 May 2021 17:46:51 -0400
X-MC-Unique: coVwtcv7N42KBqvkTBtcqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA72E107ACE8;
 Wed, 12 May 2021 21:46:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26D0E5D6AC;
 Wed, 12 May 2021 21:46:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] python/machine: Disable pylint warning for open() in
 _pre_launch
Date: Wed, 12 May 2021 17:46:37 -0400
Message-Id: <20210512214642.2803189-6-jsnow@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
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
---
 python/qemu/machine.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index c13ff9b32bf..8f86303b48f 100644
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


