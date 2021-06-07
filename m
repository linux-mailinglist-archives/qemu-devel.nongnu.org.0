Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9943239E821
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:11:31 +0200 (CEST)
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLas-0003wr-KD
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWs-0003u6-Bc
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWq-0006Sq-Gu
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MGenEmQCy7A7wWLmQu/WXlCAa7L+/WkY6uv/P9+IJg=;
 b=J+083Ngh2AMe1nqeZMJGKWmBmlR9ESfPn8jvmC086b+4huqbbzcL+9hdRYoT6Vbbcx8jXH
 NjVDBZ3anrxTei08LbbScVdlRKaib1W2xVq3x8i2TzrKUKuqG0lAqdZymcl0UdOAHv7/Xz
 Mu5g7FJI/96MekEYikAdTX3XRyc0YH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-xzbl0VztP6qjdXyHqHPm5Q-1; Mon, 07 Jun 2021 16:07:16 -0400
X-MC-Unique: xzbl0VztP6qjdXyHqHPm5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A41B106BD1E;
 Mon,  7 Jun 2021 20:07:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 651A15C1C2;
 Mon,  7 Jun 2021 20:07:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/42] scripts/qmp-shell: remove prompt argument from
 read_exec_command
Date: Mon,  7 Jun 2021 16:06:28 -0400
Message-Id: <20210607200649.1840382-22-jsnow@redhat.com>
In-Reply-To: <20210607200649.1840382-1-jsnow@redhat.com>
References: <20210607200649.1840382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's only ever used by one caller, we can just absorb that logic.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 3b86ef7d88..31269859c4 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -298,14 +298,14 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             return 'TRANS> '
         return '(QEMU) '
 
-    def read_exec_command(self, prompt):
+    def read_exec_command(self):
         """
         Read and execute a command.
 
         @return True if execution was ok, return False if disconnected.
         """
         try:
-            cmdline = input(prompt)
+            cmdline = input(self.prompt)
         except EOFError:
             print()
             return False
@@ -436,7 +436,7 @@ def main():
         die(f"Couldn't connect to {args.qmp_server}: {err!s}")
 
     qemu.show_banner()
-    while qemu.read_exec_command(qemu.prompt):
+    while qemu.read_exec_command():
         pass
     qemu.close()
 
-- 
2.31.1


