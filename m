Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC68629CE41
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 06:51:14 +0100 (CET)
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXeMb-0002Bk-Rq
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 01:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kXeLU-0001dC-TV
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 01:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kXeLS-00074D-10
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 01:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603864200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hlSSCJq34kO9WCPoZvfYxs4XFItURFq5/AqXIvHBd04=;
 b=f0mofB8etoisxCR5eBFWlT+VO1og+fhM/btCkUYont94+oB6ImBfyr8/sWg7LLwuX1r1Dn
 57aGlor3xxf4/EofkIm6pDu7mY0GAJ33VnuUwqwaCJamViZG0McBGx64RtIQ6adlaIJktQ
 TGuWUA+IZrQw0USNo0V0dOBruIHB8N4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-72afPjCLPyac187mXczIKA-1; Wed, 28 Oct 2020 01:49:58 -0400
X-MC-Unique: 72afPjCLPyac187mXczIKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BFA51018F60
 for <qemu-devel@nongnu.org>; Wed, 28 Oct 2020 05:49:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CFB85D9EF;
 Wed, 28 Oct 2020 05:49:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4883F16E18; Wed, 28 Oct 2020 06:49:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] modules: turn off lazy binding
Date: Wed, 28 Oct 2020 06:49:44 +0100
Message-Id: <20201028054944.5772-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want missing symbols fail module load right away instead of having
qemu abort later on in case lazy binding fails.  Can happen -- for
example -- when trying to load a module for a pci device
(virtio-gpu-pci) into a qemu without pci support (qemu-system-avr).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 503c399421c5..c65060c167df 100644
--- a/util/module.c
+++ b/util/module.c
@@ -132,7 +132,7 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
 
     assert(QTAILQ_EMPTY(&dso_init_list));
 
-    flags = G_MODULE_BIND_LAZY;
+    flags = 0;
     if (!export_symbols) {
         flags |= G_MODULE_BIND_LOCAL;
     }
-- 
2.27.0


