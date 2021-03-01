Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC68328190
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:58:18 +0100 (CET)
Received: from localhost ([::1]:41836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGk01-0002ou-FA
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGjyr-0002Gj-9s
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:57:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGjyp-0003HG-0T
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614610621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7t4wOn1anX7FI4iB3hYxxVAUpkYFSv+cqCRq+WFxCIg=;
 b=REuf+03xrYGFcLITQZ34s5BCcAssiiLW3vzGyx6OcuJURJAv0LFbUxRIhPvRkQHpCMvM/5
 6Vd6BEyc32Za162hpsIcnzs2d7UhdywEf5H+EvmOpRBguJn83YSjWndmntP6ZqZvWKzgQJ
 +MN1sL2R7j9WjbNAr+SRO3gnxmZoYww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-QF4csbT1MZilg1VooVuibA-1; Mon, 01 Mar 2021 09:57:00 -0500
X-MC-Unique: QF4csbT1MZilg1VooVuibA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B98107ACC7
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 14:56:59 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B79510013DB;
 Mon,  1 Mar 2021 14:56:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] net: validate that ids are well formed
Date: Mon,  1 Mar 2021 09:56:58 -0500
Message-Id: <20210301145658.286342-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a network or network device is created from the command line or HMP,
QemuOpts ensures that the id passes the id_wellformed check.  However,
QMP skips this:

   $ qemu-system-x86_64 -qmp stdio -S -nic user,id=123/456
   qemu-system-x86_64: -nic user,id=123/456: Parameter id expects an identifier
   Identifiers consist of letters, digits, -, ., _, starting with a letter.

   $ qemu-system-x86_64 -qmp stdio -S
   {"execute":"qmp_capabilities"}
   {"return": {}}
   {"execute":"netdev_add", "arguments": {"type": "user", "id": "123/456"}}
   {"return": {}}

After:

   $ qemu-system-x86_64 -qmp stdio -S
   {"execute":"qmp_capabilities"}
   {"return": {}}
   {"execute":"netdev_add", "arguments": {"type": "user", "id": "123/456"}}
   {"error": {"class": "GenericError", "desc": "Parameter "id" expects an identifier"}}

Validity checks should be performed always at the bottom of the call chain,
because QMP skips all the steps above.  Do this for the network subsystem.

Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/net.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/net.c b/net/net.c
index fb7b7dcc25..f7835aa0a8 100644
--- a/net/net.c
+++ b/net/net.c
@@ -43,6 +43,7 @@
 #include "qemu/cutils.h"
 #include "qemu/config-file.h"
 #include "qemu/ctype.h"
+#include "qemu/id.h"
 #include "qemu/iov.h"
 #include "qemu/qemu-print.h"
 #include "qemu/main-loop.h"
@@ -1011,6 +1012,17 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
         }
     }
 
+    /*
+     * The id for -net has already been checked by QemuOpts and
+     * could be automatically generated, in which case it is not
+     * well-formed by design.  HMP and QMP only call us with
+     * is_netdev == true.
+     */
+    if (is_netdev && !id_wellformed(netdev->id)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id", "an identifier");
+        return -1;
+    }
+
     nc = qemu_find_netdev(netdev->id);
     if (nc) {
         error_setg(errp, "Duplicate ID '%s'", netdev->id);
-- 
2.26.2


