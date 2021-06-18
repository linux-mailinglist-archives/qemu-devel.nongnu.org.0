Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21AD3AD621
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:49:06 +0200 (CEST)
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luOEU-0001A8-1r
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZO-0000ZA-5r
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZM-0006u7-Km
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYmqfGIYgFT+fgywIHZ9t1PJso0wkHySxy9QfwUAYXg=;
 b=V75lplxFsyDNu76wzfb05Ay47AOQ6fU3dPMutzhYNHN7CUUPhXZNrCjcqwT7pWthYXk3Ma
 M4q6Md2uaHVlOEsXQ+9TpUd1fza8Ypv3DIvNzsSMPzbumLWMsoF1k6JB43PfJMqkB0H3a9
 lEPlha+/p+IQLaCTmcrQclKUzZL2fVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-jhBHzzjmOiegBx5iFQMwLQ-1; Fri, 18 Jun 2021 19:06:34 -0400
X-MC-Unique: jhBHzzjmOiegBx5iFQMwLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ED13100C665;
 Fri, 18 Jun 2021 23:06:33 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 904E31000358;
 Fri, 18 Jun 2021 23:06:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 72/72] scripts/qmp-shell: add redirection shim
Date: Fri, 18 Jun 2021 19:04:55 -0400
Message-Id: <20210618230455.2891199-73-jsnow@redhat.com>
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

qmp-shell has a new home, add a redirect for a little while as the dust
settles.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-43-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100755 scripts/qmp/qmp-shell

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
new file mode 100755
index 0000000000..4a20f97db7
--- /dev/null
+++ b/scripts/qmp/qmp-shell
@@ -0,0 +1,11 @@
+#!/usr/bin/env python3
+
+import os
+import sys
+
+sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
+from qemu.qmp import qmp_shell
+
+
+if __name__ == '__main__':
+    qmp_shell.main()
-- 
2.31.1


