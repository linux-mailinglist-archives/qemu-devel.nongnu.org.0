Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832F20A2F0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 18:30:57 +0200 (CEST)
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joUm8-0003fj-3q
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 12:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1joUky-0002dT-2t
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 12:29:44 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35230
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1joUkw-0002TK-Hv
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 12:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593102581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6DlQfx4ERDr8imxa0nlFWolD5gVXxlxA3CSYrP+pEw=;
 b=SPshYVGD0lK3P1OPwIPo2ijZZr+GVUnde+YZutw9zW8SZnKlrOUmmiJpIAQNoW3J+nbPyZ
 3jvhGs88IvjjElQy8ic0g8rES2SgQKxosFLnpCO/nKKmROb0H/Z8Pk1XkiBsdD/N5idxYP
 gzEf44UP91XBWc7N9jI9z2aWUjw773E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-dedZBiT3OQa9MUuDXW83PQ-1; Thu, 25 Jun 2020 12:29:40 -0400
X-MC-Unique: dedZBiT3OQa9MUuDXW83PQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E189464
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 16:29:39 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-254.ams2.redhat.com
 [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6003DA09BF;
 Thu, 25 Jun 2020 16:29:38 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs@redhat.com, stefanha@redhat.com,
 vgoyal@redhat.com
Subject: [PATCH 1/3] virtiofsd: Terminate capability list
Date: Thu, 25 Jun 2020 17:29:27 +0100
Message-Id: <20200625162929.46672-2-dgilbert@redhat.com>
In-Reply-To: <20200625162929.46672-1-dgilbert@redhat.com>
References: <20200625162929.46672-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

capng_updatev is a varargs function that needs a -1 to terminate it,
but it was missing.

In practice what seems to have been happening is that it's added the
capabilities we asked for, then runs into junk on the stack, so if
we're unlucky it might be adding some more, but in reality it's
failing - but after adding the capabilities we asked for.

Fixes: a59feb483b8 ("virtiofsd: only retain file system capabilities")
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 2ce7c96085..e373e3b36e 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2598,7 +2598,9 @@ static void setup_capabilities(void)
             CAP_SETGID,
             CAP_SETUID,
             CAP_MKNOD,
-            CAP_SETFCAP);
+            CAP_SETFCAP,
+            -1);
+
     capng_apply(CAPNG_SELECT_BOTH);
 
     cap.saved = capng_save_state();
-- 
2.26.2


