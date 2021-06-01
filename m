Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F039397713
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:47:37 +0200 (CEST)
Received: from localhost ([::1]:58628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6cC-0002jg-6U
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lo6am-0001FD-7d
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lo6ak-0006kp-IO
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622562365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9OgL86LZE/BUyOgy/nJasqOY3sTbue5duRSM33T79I=;
 b=f+gyLSRZkCKUcHAwGa6ZsRRcFgRxlkQ0arOjdWbWcvwWqTMO88I65pvYZ271q+BxPqiYEN
 Zjpuk9/GYVh1dq5jAhIiSws4ybHzOKaWPkADzS+RFDWOcfAtdyhoC055kHSCoKiqTu/2hC
 4S4XKm+7cfkQR4wNC4JM/1dlqwJwsM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-8gQGh8FROkO0BorUl20Fpg-1; Tue, 01 Jun 2021 11:46:04 -0400
X-MC-Unique: 8gQGh8FROkO0BorUl20Fpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAF951009446;
 Tue,  1 Jun 2021 15:46:02 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-153.phx2.redhat.com
 [10.3.112.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7567460C0F;
 Tue,  1 Jun 2021 15:46:01 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] VM tests: account for changes in
 qemu.utils.get_info_usernet_hostfwd_port()
Date: Tue,  1 Jun 2021 11:45:46 -0400
Message-Id: <20210601154546.130870-2-crosa@redhat.com>
In-Reply-To: <20210601154546.130870-1-crosa@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
 <20210601154546.130870-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The utility function actually accepts a string, and not the raw
dictionary response from QMP.  Also, it returns (optionally) an
integer, so that must also be accounted for.

Signed-off-by: John Snow <jsnow@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/vm/basevm.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 6f4f0fc95e..0f2e436ed3 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -227,7 +227,7 @@ def _ssh_do(self, user, cmd, check):
                    "-o", "UserKnownHostsFile=" + os.devnull,
                    "-o",
                    "ConnectTimeout={}".format(self._config["ssh_timeout"]),
-                   "-p", self.ssh_port, "-i", self._ssh_tmp_key_file]
+                   "-p", str(self.ssh_port), "-i", self._ssh_tmp_key_file]
         # If not in debug mode, set ssh to quiet mode to
         # avoid printing the results of commands.
         if not self.debug:
@@ -305,7 +305,7 @@ def boot(self, img, extra_args=[]):
         # Init console so we can start consuming the chars.
         self.console_init()
         usernet_info = guest.qmp("human-monitor-command",
-                                 command_line="info usernet")
+                                 command_line="info usernet").get("return")
         self.ssh_port = get_info_usernet_hostfwd_port(usernet_info)
         if not self.ssh_port:
             raise Exception("Cannot find ssh port from 'info usernet':\n%s" % \
-- 
2.25.4


