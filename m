Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826FD39E837
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:17:34 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLgj-0004AU-HK
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWu-00040r-3y
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWr-0006Td-CO
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFdMebTZtktL5NyDif849KWKWu9G8Vjv7Rd+8LY3fiE=;
 b=U0akUwGTh0mgpnazKRVbIbkrf2pAOVolhmU8NIZ9Lj32gmzoRQ4d9Gpeq15cTXgiH91BXm
 M5+ZaqTZS20J7ixZCbv5YEv7sjFc8Nj4WXNhJe1vDXoPJD1tjWNKqxPLZ/wEUyReIlS2HA
 7SiFpT0HeQUwnr6iQia8yL3T049HMjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-ntZYl8WHN8aMsJeQEz1hhQ-1; Mon, 07 Jun 2021 16:07:19 -0400
X-MC-Unique: ntZYl8WHN8aMsJeQEz1hhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66A7581843A;
 Mon,  7 Jun 2021 20:07:06 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E50C5C1C2;
 Mon,  7 Jun 2021 20:07:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/42] scripts/qmp-shell: fix shell history exception handling
Date: Mon,  7 Jun 2021 16:06:21 -0400
Message-Id: <20210607200649.1840382-15-jsnow@redhat.com>
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

We want to remove exceptions that are too broad here; we only want to
catch IOErrors that get raised as a direct result of the open call.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index afb4b0c544..80cd432607 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -67,7 +67,6 @@
 
 import ast
 import atexit
-import errno
 import json
 import os
 import re
@@ -143,19 +142,17 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         readline.set_completer_delims('')
         try:
             readline.read_history_file(self._histfile)
-        except Exception as e:
-            if isinstance(e, IOError) and e.errno == errno.ENOENT:
-                # File not found. No problem.
-                pass
-            else:
-                print("Failed to read history '%s'; %s" % (self._histfile, e))
+        except FileNotFoundError:
+            pass
+        except IOError as err:
+            print(f"Failed to read history '{self._histfile}': {err!s}")
         atexit.register(self.__save_history)
 
     def __save_history(self):
         try:
             readline.write_history_file(self._histfile)
-        except Exception as e:
-            print("Failed to save history file '%s'; %s" % (self._histfile, e))
+        except IOError as err:
+            print(f"Failed to save history file '{self._histfile}': {err!s}")
 
     @classmethod
     def __parse_value(cls, val):
-- 
2.31.1


