Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C364239BD11
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:26:26 +0200 (CEST)
Received: from localhost ([::1]:33906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCeP-0007XY-RL
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAt-0001CZ-Tw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAn-0001XB-Qk
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzPV9CgOJaFpL4vWMvp4NcJALn7nIyGj2HsGlAmaJnQ=;
 b=UCUj5KIqV/0J69I8xfDWOdIkvPtDwv4I+lR+SV6qMcDG+A7bED701C4pQuxSrBmdgUZdWM
 9b8+NzQutydaiWxaH0uygAQC5nrrcgqaN1hGJ8NTBe1GgmFfeLNGMxi9T89F/3XC4XTvGP
 1dkGXZNavp8hRLXEFzOJuM5sJUBhQGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-WLUVfOIvPVmao6B83HwmXQ-1; Fri, 04 Jun 2021 11:55:45 -0400
X-MC-Unique: WLUVfOIvPVmao6B83HwmXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FBFF9F92C;
 Fri,  4 Jun 2021 15:55:45 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A95B5B4A4;
 Fri,  4 Jun 2021 15:55:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] scripts/qemu-ga-client: Add forwarder shim
Date: Fri,  4 Jun 2021 11:55:32 -0400
Message-Id: <20210604155532.1499282-12-jsnow@redhat.com>
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

Add a little forwarder shim until we are sure that everyone is
comfortable with how to use the tools in their new packaged location.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100755 scripts/qmp/qemu-ga-client

diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
new file mode 100755
index 0000000000..102fd2cad9
--- /dev/null
+++ b/scripts/qmp/qemu-ga-client
@@ -0,0 +1,11 @@
+#!/usr/bin/env python3
+
+import os
+import sys
+
+sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
+from qemu.qmp import qemu_ga_client
+
+
+if __name__ == '__main__':
+    sys.exit(qemu_ga_client.main())
-- 
2.31.1


