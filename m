Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76FA476E82
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:07:42 +0100 (CET)
Received: from localhost ([::1]:46726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnfp-0002Vw-Qw
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:07:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxndt-0000p6-HW
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxndq-0006Hi-UY
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639649136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0RxKXD5G1NuvoXLeFY370lk18q/NwsUB5PpSwYuQlRg=;
 b=DU/40yBDRftX0+KMfCoBbeY1r+l84S/T2JWEig5eSDLss7TOofzgyO9Jeh+WVzSBiWuZZu
 n3y3CFMviYLibxieUe4lHxVoaL2vfUauM6WwDGqqBIgtOqLcvEV0J5hkPyKErfQJ8cbBGm
 YDwO0hEx9zkubQfuIjUBd0kzQyqsnVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-Lk1YnLbJPAiGrQrH11v54g-1; Thu, 16 Dec 2021 05:05:35 -0500
X-MC-Unique: Lk1YnLbJPAiGrQrH11v54g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86DF41966321
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 10:05:34 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F6E492A6C;
 Thu, 16 Dec 2021 10:05:28 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] thunk: do not use HOST_* defines
Date: Thu, 16 Dec 2021 11:05:27 +0100
Message-Id: <20211216100527.103021-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use sizeof, avoiding the need to write down all the ABIs twice.

Cc: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/user/thunk.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
index 300a840d58..c50ba17317 100644
--- a/include/exec/user/thunk.h
+++ b/include/exec/user/thunk.h
@@ -22,6 +22,7 @@
 
 #include "cpu.h"
 #include "exec/user/abitypes.h"
+#include <asm/posix_types.h>
 
 /* types enums definitions */
 
@@ -109,16 +110,7 @@ static inline int thunk_type_size(const argtype *type_ptr, int is_host)
         break;
     case TYPE_OLDDEVT:
         if (is_host) {
-#if defined(HOST_X86_64)
-            return 8;
-#elif defined(HOST_ALPHA) || defined(HOST_IA64) || defined(HOST_MIPS) || \
-      defined(HOST_PARISC) || defined(HOST_SPARC64)
-            return 4;
-#elif defined(HOST_PPC)
-            return sizeof(void *);
-#else
-            return 2;
-#endif
+            return sizeof(__kernel_old_dev_t);
         } else {
 #if defined(TARGET_X86_64)
             return 8;
-- 
2.33.1


