Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A147377D45
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:39:18 +0200 (CEST)
Received: from localhost ([::1]:58734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0VU-0001IT-FV
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0SB-0001WI-Mi
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0S2-0003cL-NN
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620632138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QalkaH9xjNaMN2pKTqKYyYDUvbEsE5qtxlc6rdSgBjk=;
 b=SfplR/COAg9wZp3YX/7PvKlU23nIvQ9Zen2Ew/hj4bgCLVumiB41f/2A6HzdXWMAFgY96a
 CSpNQk3Rb3/5DCfy6TfxCr1vg4aPb4wLF3T9JZLR7UbC5TnUaGwpTDqdJislANCmRahnwJ
 8cCf6zfLzmLhWqsI2lLjNolDEMcl2mY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-17jwwQKtPr-Fv4QWG511RA-1; Mon, 10 May 2021 03:35:35 -0400
X-MC-Unique: 17jwwQKtPr-Fv4QWG511RA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 937878BEDA9;
 Mon, 10 May 2021 07:35:34 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21DA517A9B;
 Mon, 10 May 2021 07:35:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/9] pc-bios/s390-ccw: Use reset_psw pointer instead of
 hard-coded null pointer
Date: Mon, 10 May 2021 09:35:18 +0200
Message-Id: <20210510073524.85951-4-thuth@redhat.com>
In-Reply-To: <20210510073524.85951-1-thuth@redhat.com>
References: <20210510073524.85951-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 cohuck@redhat.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210423142440.582188-1-thuth@redhat.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/jump2ipl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
index b9c70d64a5..73e4367e09 100644
--- a/pc-bios/s390-ccw/jump2ipl.c
+++ b/pc-bios/s390-ccw/jump2ipl.c
@@ -82,8 +82,8 @@ void jump_to_low_kernel(void)
         jump_to_IPL_code(KERN_IMAGE_START);
     }
 
-    /* Trying to get PSW at zero address */
-    if (*((uint64_t *)0) & RESET_PSW_MASK) {
+    /* Trying to get PSW at zero address (pointed to by reset_psw) */
+    if (*reset_psw & RESET_PSW_MASK) {
         /*
          * Surely nobody will try running directly from lowcore, so
          * let's use 0 as an indication that we want to load the reset
-- 
2.27.0


