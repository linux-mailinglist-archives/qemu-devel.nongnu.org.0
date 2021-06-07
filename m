Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA0E39E836
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:17:33 +0200 (CEST)
Received: from localhost ([::1]:32854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLgh-000465-Qv
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXI-0004ec-CL
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLX1-0006aV-Nw
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zV+e+y2+DzmyOBOZVWkGYPaZC9gbrIzL6764Vos/ObE=;
 b=IF6UyW/aQrbIodgkN1KBtlr25XR1RsD7cwQBwOGw/DdPen4yfcMWG/HiA13B+IJP6dbny0
 SCX+BMIwSXatTh6Q4ar9m7JxnkR2cDkxoIV1tgnAKHJLxbEjR03qw2vgGQtUDOjfx+9ktK
 lwPAjaodHGFRdR6H5UpztvbDgE/Eshk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-1lhLcm6pNf-EqFRcI5dILQ-1; Mon, 07 Jun 2021 16:07:29 -0400
X-MC-Unique: 1lhLcm6pNf-EqFRcI5dILQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14F44108C303;
 Mon,  7 Jun 2021 20:07:29 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB5175C1C2;
 Mon,  7 Jun 2021 20:07:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/42] scripts/qmp-shell: Fix empty-transaction invocation
Date: Mon,  7 Jun 2021 16:06:41 -0400
Message-Id: <20210607200649.1840382-35-jsnow@redhat.com>
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

calling "transaction( )" is pointless, but valid. Rework the parser to
allow this kind of invocation. This helps clean up exception handling
later by removing accidental breakages of the parser that aren't
explicitly forbidden.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 3c32b576a3..78e4eae007 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -244,11 +244,14 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         cmdargs = re.findall(argument_regex, cmdline)
         qmpcmd: QMPMessage
 
-        # Transactional CLI entry/exit:
-        if cmdargs[0] == 'transaction(':
+        # Transactional CLI entry:
+        if cmdargs and cmdargs[0] == 'transaction(':
             self._transmode = True
+            self._actions = []
             cmdargs.pop(0)
-        elif cmdargs[0] == ')' and self._transmode:
+
+        # Transactional CLI exit:
+        if cmdargs and cmdargs[0] == ')' and self._transmode:
             self._transmode = False
             if len(cmdargs) > 1:
                 msg = 'Unexpected input after close of Transaction sub-shell'
@@ -257,15 +260,14 @@ class QMPShell(qmp.QEMUMonitorProtocol):
                 'execute': 'transaction',
                 'arguments': {'actions': self._actions}
             }
-            self._actions = list()
             return qmpcmd
 
-        # Nothing to process?
+        # No args, or no args remaining
         if not cmdargs:
             return None
 
-        # Parse and then cache this Transactional Action
         if self._transmode:
+            # Parse and cache this Transactional Action
             finalize = False
             action = {'type': cmdargs[0], 'data': {}}
             if cmdargs[-1] == ')':
-- 
2.31.1


