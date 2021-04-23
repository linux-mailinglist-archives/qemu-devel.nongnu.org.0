Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BBB368F13
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 10:48:48 +0200 (CEST)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZrUV-0004of-Lc
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 04:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZrIN-0003SJ-Uh
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZrIM-0002Xx-Do
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619166973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d8m8k67lCSl16qXKy9BWNNOiaaAEfyJwXJH0nbtXn1o=;
 b=QIuMw6kCPkNDcegay066toqhxHLFsDVAPpT7lfQSgz4qNfV3fp17wvADDAGzcdR5DKUQuW
 2yQhohLfxUd3zveQLvE9ZReyrTdvJ3SyCOEGmcUq0a/yaDvSFFjeepZ7a3rLbXElN9/GJ+
 E04TnC8r1mKr0ESIHG6XVsxDjTJJpS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-FnUjs0XsMvK945Sa9hkyGA-1; Fri, 23 Apr 2021 04:36:09 -0400
X-MC-Unique: FnUjs0XsMvK945Sa9hkyGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891C38B19F5;
 Fri, 23 Apr 2021 08:36:08 +0000 (UTC)
Received: from thuth.com (ovpn-112-74.ams2.redhat.com [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F420F6A916;
 Fri, 23 Apr 2021 08:36:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH] pc-bios/s390-ccw: Use reset_psw pointer instead of hard-coded
 null pointer
Date: Fri, 23 Apr 2021 10:36:04 +0200
Message-Id: <20210423083604.526367-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-s390x@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling the s390-ccw bios with clang, it emits a warning like this:

 pc-bios/s390-ccw/jump2ipl.c:86:9: warning: indirection of non-volatile null
  pointer will be deleted, not trap [-Wnull-dereference]
     if (*((uint64_t *)0) & RESET_PSW_MASK) {
         ^~~~~~~~~~~~~~~~
 pc-bios/s390-ccw/jump2ipl.c:86:9: note: consider using __builtin_trap() or
  qualifying pointer with 'volatile'

We could add a "volatile" here to shut it up, but on the other hand,
we also have a pointer variable called "reset_psw" in this file already
that points to the PSW at address 0, so we can simply use that pointer
variable instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/jump2ipl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
index b9c70d64a5..de1541ea5d 100644
--- a/pc-bios/s390-ccw/jump2ipl.c
+++ b/pc-bios/s390-ccw/jump2ipl.c
@@ -83,7 +83,7 @@ void jump_to_low_kernel(void)
     }
 
     /* Trying to get PSW at zero address */
-    if (*((uint64_t *)0) & RESET_PSW_MASK) {
+    if (*reset_psw & RESET_PSW_MASK) {
         /*
          * Surely nobody will try running directly from lowcore, so
          * let's use 0 as an indication that we want to load the reset
-- 
2.27.0


