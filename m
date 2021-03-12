Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3113339061
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:53:46 +0100 (CET)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjAf-00049V-IZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKj8j-0001sC-QE
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:51:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKj8i-0003KZ-0i
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615560702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MJn1KA1Td6Lxw9kbAP3W6PfqEjxUs+qFnhlAJ2yqef8=;
 b=KIdnU3fVNSvlyWlzOWIGtGtpfWixDst8LY9xi853pSWnBCLX72LziDqLy/IzV30p/zzCeK
 63cj9Ji/gLT214aoBR6vk05Vz/dFHpvgfrWxoJ+EUsbWgKM3z0BbF3TGzt31yDPoATavYw
 /JiGuV2zTQQH9J4/8S1jK8tOOoy3wBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-Zd9GokqHPeqWiHiIbdSmfA-1; Fri, 12 Mar 2021 09:51:40 -0500
X-MC-Unique: Zd9GokqHPeqWiHiIbdSmfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA2F1760C5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 14:51:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 656CB60636;
 Fri, 12 Mar 2021 14:51:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] net: validate that ids are well formed
Date: Fri, 12 Mar 2021 09:51:38 -0500
Message-Id: <20210312145138.1077707-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: jasowang@redhat.com
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
because QMP skips all the steps above.  At the same time we know that every
call chain should go through either QMP or (for legacy) through QemuOpts.
Because the id for -net and -nic is automatically generated and not
well-formed by design, just add the check to QMP.

Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/net.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/net.c b/net/net.c
index 6002ba50db..3f47490117 100644
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
@@ -1133,6 +1134,11 @@ void netdev_add(QemuOpts *opts, Error **errp)
 
 void qmp_netdev_add(Netdev *netdev, Error **errp)
 {
+    if (!id_wellformed(netdev->id)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id", "an identifier");
+        return;
+    }
+
     net_client_init1(netdev, true, errp);
 }
 
-- 
2.26.2


