Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE939BCC5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:13:09 +0200 (CEST)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCRY-000111-Kr
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAm-0000yQ-7J
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAg-0001Tz-Dh
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ycxcFGaMDTWzJx8TIXaLYprHmj4HRWdv/WbRcDaQ+1Y=;
 b=icNi5MemOHM40vMQUhsIpxzsbShYituqM31pVXhcptENvki1hb/HboxBxxGkxexIH9cy6z
 tKZX37FZAvXKA+mZZZCNnbLZleuY4AoVS5CEuU8yc2+SPovw6LXBC5MSTICZ8a9xBfpMG7
 iFr9F6wbrVvbUyRszsAVTrmx8tnp++Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-tvTI1fxOPmWQ31EOet5phA-1; Fri, 04 Jun 2021 11:55:38 -0400
X-MC-Unique: tvTI1fxOPmWQ31EOet5phA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE5849F92D;
 Fri,  4 Jun 2021 15:55:37 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A32D39A66;
 Fri,  4 Jun 2021 15:55:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] scripts/qemu-ga-client: Fix exception handling
Date: Fri,  4 Jun 2021 11:55:24 -0400
Message-Id: <20210604155532.1499282-4-jsnow@redhat.com>
In-Reply-To: <20210604155532.1499282-1-jsnow@redhat.com>
References: <20210604155532.1499282-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 50d189c

These error classes aren't available anymore. Fix the bitrot.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index 566bddc89d..7aba09f0fe 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -56,8 +56,6 @@ class QemuGuestAgent(qmp.QEMUMonitorProtocol):
 
 
 class QemuGuestAgentClient:
-    error = QemuGuestAgent.error
-
     def __init__(self, address):
         self.qga = QemuGuestAgent(address)
         self.qga.connect(negotiate=False)
@@ -137,7 +135,7 @@ class QemuGuestAgentClient:
         self.qga.settimeout(timeout)
         try:
             self.qga.ping()
-        except self.qga.timeout:
+        except TimeoutError:
             return False
         return True
 
@@ -269,11 +267,11 @@ def main(address, cmd, args):
 
     try:
         client = QemuGuestAgentClient(address)
-    except QemuGuestAgent.error as e:
+    except OSError as err:
         import errno
 
-        print(e)
-        if e.errno == errno.ECONNREFUSED:
+        print(err)
+        if err.errno == errno.ECONNREFUSED:
             print('Hint: qemu is not running?')
         sys.exit(1)
 
-- 
2.31.1


