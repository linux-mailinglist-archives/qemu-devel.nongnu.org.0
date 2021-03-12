Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9F3385B2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:20:44 +0100 (CET)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbAB-0005Do-JV
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6J-0008M6-BW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6H-0005f0-Ns
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615529800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=LPhbcqyxcyoyPXkD5fH7Pir5XGNglXAH1qxGcICQIdM=;
 b=FqH8a2BNG+8Ww3zDXMo0kpgAz9r+kVCZwg+HbhlOqkHvIqEuy39DamaTuNTlfK/hjpAI6h
 ZJxoodfwn9cyMMiyEgurry24bJAbDPf92NzpZ4VdCusjm4WgQD53VxH67tbrhGZlXSYfOd
 Gqf4dvxTNdXooYJ5u9aU05gfTZAnPUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-cyzFnnf_NYufnWEpe8Ssng-1; Fri, 12 Mar 2021 01:16:38 -0500
X-MC-Unique: cyzFnnf_NYufnWEpe8Ssng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 218A992504;
 Fri, 12 Mar 2021 06:16:37 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-126.pek2.redhat.com
 [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71AD6101F501;
 Fri, 12 Mar 2021 06:16:35 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 03/16] net: validate that ids are well formed
Date: Fri, 12 Mar 2021 14:16:13 +0800
Message-Id: <1615529786-30763-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

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
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/net.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/net.c b/net/net.c
index 9c784da..d36729f 100644
--- a/net/net.c
+++ b/net/net.c
@@ -44,6 +44,7 @@
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
2.7.4


