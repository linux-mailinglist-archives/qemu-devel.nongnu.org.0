Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E78E3515CC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:00:27 +0200 (CEST)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRyo6-00012d-4m
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lRyml-0000bd-6b
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lRymi-0008Go-JF
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617289138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tc9845wrIWnD6GyeGGHSuF/su66/ransIV2/IdKmVgU=;
 b=OR4rmoJscP0ePwUUBgJnED+kQkFjWa0WRb3JrTOvUvdsl6w2nUxBd0Yx9U1vSPRRzPRaui
 +fV43seu8roBqLLHQFkddQcRIQ2W96iGRmn04WV1cq9Jwu7z5dV2e4OoOZd7Ch0B4tuB2t
 OiVaABg/cRW/Jlp3YuddBuCUsFSnlvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-VWBNjnvINQa7Hzkd43-5Fw-1; Thu, 01 Apr 2021 10:58:56 -0400
X-MC-Unique: VWBNjnvINQa7Hzkd43-5Fw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3656801814
 for <qemu-devel@nongnu.org>; Thu,  1 Apr 2021 14:58:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-173.ams2.redhat.com
 [10.36.114.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C56335944C;
 Thu,  1 Apr 2021 14:58:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH] virtiofsd: Fix security.capability comparison
Date: Thu,  1 Apr 2021 15:58:45 +0100
Message-Id: <20210401145845.78445-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

My security fix for the security.capability remap has a silly early
segfault in a simple case where there is an xattrmapping but it doesn't
remap the securty.capability.

Fixes: e586edcb41054 ("virtiofs: drop remapped security.capability xattr as needed")
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index b144320e48..1553d2ef45 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2636,7 +2636,8 @@ static void parse_xattrmap(struct lo_data *lo)
                 strerror(ret));
         exit(1);
     }
-    if (!strcmp(lo->xattr_security_capability, "security.capability")) {
+    if (!lo->xattr_security_capability ||
+        !strcmp(lo->xattr_security_capability, "security.capability")) {
         /* 1-1 mapping, don't need to do anything */
         free(lo->xattr_security_capability);
         lo->xattr_security_capability = NULL;
-- 
2.31.1


