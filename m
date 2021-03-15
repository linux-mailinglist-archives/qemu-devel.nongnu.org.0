Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A821933AE7E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:19:39 +0100 (CET)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjNt-00044q-OR
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJS-0007e4-Ea
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:14:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJQ-0007eH-Pg
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=e9UQYhxlWEU9Mu20iWeA4OMqZZIO/1zzU2SifCrGhZU=;
 b=dmSsSHHj+qSMCD8UbJkLUqt+ret0ioTNYjITRBAlb9pL4LZnYBxC1T1BRE4xUQs0L5gb6q
 3BWltCotylG5jkvWAYBJrLun05yAft+oGo92GX2gmHCGR56b2xsJNaR5/kTTnPbAodIHkF
 kxPbfhEWmmAavak6pfhi5JVRi7C8S7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-JBnhB3fGPiCUimRKKutAhw-1; Mon, 15 Mar 2021 05:14:53 -0400
X-MC-Unique: JBnhB3fGPiCUimRKKutAhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E230A805727;
 Mon, 15 Mar 2021 09:14:52 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DC17100164C;
 Mon, 15 Mar 2021 09:14:48 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 03/20] net: validate that ids are well formed
Date: Mon, 15 Mar 2021 17:14:16 +0800
Message-Id: <1615799673-31549-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
because QMP skips all the steps above.  At the same time we know that every
call chain should go through either QMP or (for legacy) through QemuOpts.
Because the id for -net and -nic is automatically generated and not
well-formed by design, just add the check to QMP.

Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/net.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/net.c b/net/net.c
index 16a87cc..77b35ea 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1134,6 +1134,11 @@ void netdev_add(QemuOpts *opts, Error **errp)
 
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
2.7.4


