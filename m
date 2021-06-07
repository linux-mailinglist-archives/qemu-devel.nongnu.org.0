Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD83E39E863
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:25:59 +0200 (CEST)
Received: from localhost ([::1]:41232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLos-0003EJ-VD
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXM-0004kW-Gd
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLX4-0006au-Br
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAzzHCMk2rbmO5fnugwgd1vprQvI9nXdQ6sXcsz86Po=;
 b=W11AueBnJe6OmVTtwzLdjsAtR3I00BzZoc3oEQSJKJN4+sdq+9BP/jG1We3CzqyURM7PQJ
 MNwKywHVlgWD0e97Pa4W+S4fvRbY/Dxuf252v6MhffqD8KDarHv8pKj/nyxDmfwSAP56qu
 EwWaQuKpRkgNfLfVNR1rGb3/ijUKfFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-FFANlAZ8NcG9Tj_uuyDbiQ-1; Mon, 07 Jun 2021 16:07:31 -0400
X-MC-Unique: FFANlAZ8NcG9Tj_uuyDbiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E98D19253E0;
 Mon,  7 Jun 2021 20:07:30 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 717F05C1C2;
 Mon,  7 Jun 2021 20:07:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 35/42] scripts/qmp-shell: Remove too-broad-exception
Date: Mon,  7 Jun 2021 16:06:42 -0400
Message-Id: <20210607200649.1840382-36-jsnow@redhat.com>
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

We are only anticipating QMPShellErrors here, for syntax we weren't able
to understand. Other errors, if any, should be allowed to percolate
upwards.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 78e4eae007..8d5845ab48 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -291,10 +291,13 @@ class QMPShell(qmp.QEMUMonitorProtocol):
     def _execute_cmd(self, cmdline: str) -> bool:
         try:
             qmpcmd = self.__build_cmd(cmdline)
-        except Exception as err:
-            print('Error while parsing command line: %s' % err)
-            print('command format: <command-name> ', end=' ')
-            print('[arg-name1=arg1] ... [arg-nameN=argN]')
+        except QMPShellError as err:
+            print(
+                f"Error while parsing command line: {err!s}\n"
+                "command format: <command-name> "
+                "[arg-name1=arg1] ... [arg-nameN=argN",
+                file=sys.stderr
+            )
             return True
         # For transaction mode, we may have just cached the action:
         if qmpcmd is None:
-- 
2.31.1


