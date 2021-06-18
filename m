Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AA73AD628
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:50:22 +0200 (CEST)
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luOFh-0003Am-OI
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZH-0000Mf-37
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZA-0006oz-Ki
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oO0DDcWKpyErCPQdBimJOrllY21iWyuJTvKERj3nBAs=;
 b=bee3+VGR0u2gRfkWT71/wLybumFhbVakKs4ro2GjhJVWwAXkX826Uxai0otnHKQ8PkUzW+
 ixO+TGxEONGxzzbLkZoj9t66eyxeYT6FjwJfe7YfaCfuVd5i4vMkCKFsIj+OkAvwWBKaMa
 8FYvZMzVec+RLlJFhysQJeEkyKw86xA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-piZIKBTLNRuVE-VXgPio4w-1; Fri, 18 Jun 2021 19:06:19 -0400
X-MC-Unique: piZIKBTLNRuVE-VXgPio4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F04B18D6A2C;
 Fri, 18 Jun 2021 23:06:18 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C41C9101E24F;
 Fri, 18 Jun 2021 23:06:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 62/72] scripts/qmp-shell: use logging to show warnings
Date: Fri, 18 Jun 2021 19:04:45 -0400
Message-Id: <20210618230455.2891199-63-jsnow@redhat.com>
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

A perfect candidate is non-fatal shell history messages.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-33-jsnow@redhat.com
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


