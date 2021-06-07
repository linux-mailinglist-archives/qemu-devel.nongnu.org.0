Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EB539E868
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:28:40 +0200 (CEST)
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLrS-00022C-SW
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXF-0004Xg-LS
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWz-0006YO-74
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JFYZ5aWR4oY4cjKUnYQGoBn1ZloRqHNXwD6Qoqasz0=;
 b=X4k62bnYkgYW8l3mktiv3tL6oQSqYG1MwbGyvy4y2gxAzkcXYdfsk2cpsL8CIyr+G9rN5i
 RgAZpld6YLnxFfMKv8S3hcl/vkVTja1oZQjeAHa/iOukLFj22B8wU9X/OhSR+oM9I6gIms
 FzVKtrF7ahFlkGOulNqMiDDBEs8w0OQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-fGPw07k0MDWeotn2hC3ahg-1; Mon, 07 Jun 2021 16:07:27 -0400
X-MC-Unique: fGPw07k0MDWeotn2hC3ahg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 063BC106F8FB;
 Mon,  7 Jun 2021 20:07:16 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCF485C1C2;
 Mon,  7 Jun 2021 20:07:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/42] scripts/qmp-shell: move the REPL functionality into
 QMPShell
Date: Mon,  7 Jun 2021 16:06:29 -0400
Message-Id: <20210607200649.1840382-23-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of doing this in main, move it into the class itself. (This
makes it easier to put into the qemu.qmp package later by removing as
much as we can from the main() function.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 31269859c4..aa148517a8 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -318,6 +318,12 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
         return self._execute_cmd(cmdline)
 
+    def repl(self):
+        self.show_banner()
+        while self.read_exec_command():
+            yield
+        self.close()
+
 
 class HMPShell(QMPShell):
     def __init__(self, address, pretty=False, verbose=False):
@@ -435,10 +441,8 @@ def main():
     except OSError as err:
         die(f"Couldn't connect to {args.qmp_server}: {err!s}")
 
-    qemu.show_banner()
-    while qemu.read_exec_command():
+    for _ in qemu.repl():
         pass
-    qemu.close()
 
 
 if __name__ == '__main__':
-- 
2.31.1


