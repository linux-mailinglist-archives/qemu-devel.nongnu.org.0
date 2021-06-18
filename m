Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E163AD600
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:35:31 +0200 (CEST)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luO1K-0003Cp-6o
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYn-0007uG-TK
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYm-0006Zv-9o
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUlLLxQH2O6U5BfUkbH20wJi3M4aC/+C9t5Hp4ubsk4=;
 b=h2gZ3DtqbZFi7ZotseKjgbkA1KQP4fF3yHmLD4dhZc2F44Scb5DU2CnKt3oE0MTDVJIfrH
 m38mXB/0nEOd2GbOmmz3X5KMfERBgtRhigj59iXspt42k3Ihh0H+KMJoTgzb5zPtAziJ7w
 Mqe7kESPMZeoYq9pXXGFmFsJZaqd/ZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-MR3iWQ9QO8-ypZ_7HKgVrQ-1; Fri, 18 Jun 2021 19:05:58 -0400
X-MC-Unique: MR3iWQ9QO8-ypZ_7HKgVrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33E6F5074B;
 Fri, 18 Jun 2021 23:05:57 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 793801017CE5;
 Fri, 18 Jun 2021 23:05:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 50/72] scripts/qmp-shell: move get_prompt() to prompt property
Date: Fri, 18 Jun 2021 19:04:33 -0400
Message-Id: <20210618230455.2891199-51-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Small tidying; treat "prompt" like an immutable property instead of
function/method/routine.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-21-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index cfcefb95f9..3b86ef7d88 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -292,10 +292,11 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         version = self._greeting['QMP']['version']['qemu']
         print("Connected to QEMU {major}.{minor}.{micro}\n".format(**version))
 
-    def get_prompt(self):
+    @property
+    def prompt(self):
         if self._transmode:
-            return "TRANS> "
-        return "(QEMU) "
+            return 'TRANS> '
+        return '(QEMU) '
 
     def read_exec_command(self, prompt):
         """
@@ -435,7 +436,7 @@ def main():
         die(f"Couldn't connect to {args.qmp_server}: {err!s}")
 
     qemu.show_banner()
-    while qemu.read_exec_command(qemu.get_prompt()):
+    while qemu.read_exec_command(qemu.prompt):
         pass
     qemu.close()
 
-- 
2.31.1


