Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53E39E85C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:24:06 +0200 (CEST)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLn3-0006GO-RB
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXG-0004bJ-UD
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWz-0006YW-ER
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJKSyaG5GvppvHaM5g2i8F+h46QUiR6jQEhlJ4nKF6A=;
 b=afaEnEVJ39enEajLgAgLDZ0Jl3BAeJPw+KOlv+MqfLAg3ovcLO/kF1SndOjrGLKsAOuVrn
 fCjhS1Mpi5lk0ZegxdqJ5CU3uTrCoDPzcVCxkkpCCtZm6GOxZqPY3N8EkwtJfiVSKS5QLs
 c3Z3+xBW+yWVd4jtz74333VvBmCSGzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-3T4m_a4FPya6_TH2RItRkg-1; Mon, 07 Jun 2021 16:07:27 -0400
X-MC-Unique: 3T4m_a4FPya6_TH2RItRkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B41ECC653;
 Mon,  7 Jun 2021 20:07:26 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34D7A5C1C2;
 Mon,  7 Jun 2021 20:07:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/42] scripts/qmp-shell: use logging to show warnings
Date: Mon,  7 Jun 2021 16:06:39 -0400
Message-Id: <20210607200649.1840382-33-jsnow@redhat.com>
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

A perfect candidate is non-fatal shell history messages.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index ec028d662e..0199a13a34 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -67,6 +67,7 @@
 import argparse
 import ast
 import json
+import logging
 import os
 import re
 import readline
@@ -85,6 +86,9 @@ from qemu import qmp
 from qemu.qmp import QMPMessage
 
 
+LOG = logging.getLogger(__name__)
+
+
 class QMPCompleter:
     # NB: Python 3.9+ will probably allow us to subclass list[str] directly,
     # but pylint as of today does not know that List[str] is simply 'list'.
@@ -167,13 +171,15 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         except FileNotFoundError:
             pass
         except IOError as err:
-            print(f"Failed to read history '{self._histfile}': {err!s}")
+            msg = f"Failed to read history '{self._histfile}': {err!s}"
+            LOG.warning(msg)
 
     def _save_history(self) -> None:
         try:
             readline.write_history_file(self._histfile)
         except IOError as err:
-            print(f"Failed to save history file '{self._histfile}': {err!s}")
+            msg = f"Failed to save history file '{self._histfile}': {err!s}"
+            LOG.warning(msg)
 
     @classmethod
     def __parse_value(cls, val: str) -> object:
-- 
2.31.1


