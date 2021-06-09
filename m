Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901083A1F15
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 23:33:00 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr5oo-0003eF-Ui
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 17:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr5o0-0002UE-53
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 17:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr5nw-00086V-Pb
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 17:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623274323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjlOMYFCBS0j0CIBRF1icOA6b4r7YvADaLWy44mXJKs=;
 b=CZYJeiIgv/cY+6CYbFOgO9hD8NlvJyQk0iMS0cTjGgbghLfepg3/kq8vl4DAGOAfruolyX
 NUfVtk/LKRFimNZd8U5TDTwNoEj0llfk24DxajHXskQC/eNxP03iZTeM7hF9Pq/ffGwGU4
 sB1pFqUnb47if6VEiYwBBnKGnZEFwQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-LCXMELalMjaFpmRj14U0YQ-1; Wed, 09 Jun 2021 17:32:00 -0400
X-MC-Unique: LCXMELalMjaFpmRj14U0YQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA7111850606;
 Wed,  9 Jun 2021 21:31:58 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FFE75D6AD;
 Wed,  9 Jun 2021 21:31:55 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [RFC libnbd PATCH] info: Add support for new qemu:joint-allocation
Date: Wed,  9 Jun 2021 16:31:54 -0500
Message-Id: <20210609213154.1012848-1-eblake@redhat.com>
In-Reply-To: <20210609180118.1003774-1-eblake@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu is adding qemu:joint-allocation as a single context combining the
two bits of base:allocation and a compression of qemu:allocation-depth
into two bits [1].  Decoding the bits makes it easier for humans to
see the result of that context.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg02446.html
---

Obviously, this libnbd patch should only go in if the qemu RFC is
accepted favorably.  With this patch applied, the example listed in my
qemu patch 2/2 commit message [2] becomes

$ ~/libnbd/run nbdinfo --map=qemu:joint-allocation nbd://localhost
         0       65536    3  hole,zero,unallocated
     65536       65536    4  allocated,local
    131072       65536    7  hole,zero,local
    196608       65536    3  hole,zero,unallocated

[2] https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg02448.html

For what it's worth, you can also play with the qemu+libnbd patches at:
https://repo.or.cz/qemu/ericb.git/ master
https://repo.or.cz/libnbd/ericb.git/ master

(I sometimes rewind those branches, but they'll be stable for at least
a few days after this email)

 info/map.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/info/map.c b/info/map.c
index ae6d4fe..21e8657 100644
--- a/info/map.c
+++ b/info/map.c
@@ -226,6 +226,27 @@ extent_description (const char *metacontext, uint32_t type)
       return ret;
     }
   }
+  else if (strcmp (metacontext, "qemu:joint-allocation") == 0) {
+    /* Combo of base:allocation and stripped-down qemu:allocation-depth */
+    const char *base, *depth;
+    switch (type & 3) {
+    case 0: base = "allocated"; break;
+    case 1: base = "hole"; break;
+    case 2: base = "zero"; break;
+    case 3: base = "hole,zero"; break;
+    }
+    switch (type & 0xc) {
+    case 0: depth = "unallocated"; break;
+    case 4: depth = "local"; break;
+    case 8: depth = "backing"; break;
+    case 12: depth = "<unexpected depth>"; break;
+    }
+    if (asprintf (&ret, "%s,%s", base, depth) == -1) {
+      perror ("asprintf");
+      exit (EXIT_FAILURE);
+    }
+    return ret;
+  }

   return NULL;   /* Don't know - description field will be omitted. */
 }
-- 
2.31.1


