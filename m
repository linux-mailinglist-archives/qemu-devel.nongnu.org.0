Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6573BE3FC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 09:53:12 +0200 (CEST)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12Mp-0000sf-Gz
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 03:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1m12La-0007tF-US
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:51:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1m12LY-0001z7-7a
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625644310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OiBhNlNRtMQXDDnDp9DzilBUnrkXWbk++rkvigYuKiY=;
 b=CuJkG7KqQRXYB4Sy5z7sN1DUGVOc7xKmSnFMAE/ea/+z15hRfr0BVPq9RWkcqZ3nom6OhM
 o1St9puX/yKUl9mIeEK+5Qi/Zt1b0rFQg05Uzk4DrGhPB24DjRr4X5dqCnzNSfiKi7EoN6
 lZhhn0VJuxw9TBWsnrc56B7L4+Kdz5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415--C86U83eMsecUBDW3_WORQ-1; Wed, 07 Jul 2021 03:51:49 -0400
X-MC-Unique: -C86U83eMsecUBDW3_WORQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8F8036304
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 07:51:47 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (unknown [10.40.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 137A419C79;
 Wed,  7 Jul 2021 07:51:46 +0000 (UTC)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Fix libpmem configuration option
Date: Wed,  7 Jul 2021 03:51:44 -0400
Message-Id: <20210707075144.82717-1-mrezanin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: pbonzini@redhat.com, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some reason, libpmem option setting was set to work in an opposite
way (--enable-libpmem disabled it and vice versa). Fixing this so
configuration works properly.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 7994bdee92..ffa93cc5fd 100755
--- a/configure
+++ b/configure
@@ -1501,9 +1501,9 @@ for opt do
   ;;
   --disable-debug-mutex) debug_mutex=no
   ;;
-  --enable-libpmem) libpmem=disabled
+  --enable-libpmem) libpmem="enabled"
   ;;
-  --disable-libpmem) libpmem=enabled
+  --disable-libpmem) libpmem="disabled"
   ;;
   --enable-xkbcommon) xkbcommon="enabled"
   ;;
-- 
2.27.0


