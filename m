Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67833AD5C7
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:22:21 +0200 (CEST)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNoa-00046q-V6
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYI-00073Z-1E
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYE-0006EW-Ty
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnFjqPWHHgmngJWuze4KbaNnkBWjXqRZyAbad5QumOg=;
 b=RCMGcrtgVXR40zURAzrsYrzo0g9ylawll1L9+kwSqzHU/3ADcncgY6iRN1y8Y4vSdYJatG
 N7HZIhl1mjPHWRRQV2iUTnidb4SZfHzSrwXTV/CsH0BiOUGLc7VIsS4RT94aiN2s8GKXKW
 g4OMuy+vMtcHFJAOQhUh0h6HyBjGYpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-OBEUveEcO0eZGPSN_D7RlA-1; Fri, 18 Jun 2021 19:05:24 -0400
X-MC-Unique: OBEUveEcO0eZGPSN_D7RlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E96801596;
 Fri, 18 Jun 2021 23:05:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E72151017CE5;
 Fri, 18 Jun 2021 23:05:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/72] scripts/qemu-ga-client: Fix exception handling
Date: Fri, 18 Jun 2021 19:04:05 -0400
Message-Id: <20210618230455.2891199-23-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

Fixes: 50d189c

These error classes aren't available anymore. Fix the bitrot.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210604155532.1499282-4-jsnow@redhat.com
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


