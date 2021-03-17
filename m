Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477033EF2D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:07:20 +0100 (CET)
Received: from localhost ([::1]:41872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMU1H-00074a-4Y
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMTzS-00061g-CE
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMTzQ-0007tP-N7
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615979123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7YnC0D9GVQLso4id/fWNky95g1OLCS9iyvslacTf6I=;
 b=RM1+sceChbLUYZJdjwgHcMYvugo9fKSWbvv6ptYkECVmeMMx8m0lFPJvtkbGTZH7JzFz/e
 uBeIWX8S9oypvVBd4gSWy92jSqs77xEukWQFSM8/+IqxAmxUMDUicqVn9RiErx81tt5t94
 TEt5zIntUHYwEhNsfPLBGKcDoyNUF7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569--Au-ey6nNAKGh7LHk8iGWg-1; Wed, 17 Mar 2021 07:05:19 -0400
X-MC-Unique: -Au-ey6nNAKGh7LHk8iGWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79DC118C8C00;
 Wed, 17 Mar 2021 11:05:18 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8252F6C32F;
 Wed, 17 Mar 2021 11:05:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH 1/2] configure: Don't use the __atomic_*_16 functions for
 testing 128-bit support
Date: Wed, 17 Mar 2021 12:05:11 +0100
Message-Id: <20210317110512.583747-2-thuth@redhat.com>
In-Reply-To: <20210317110512.583747-1-thuth@redhat.com>
References: <20210317110512.583747-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test for 128-bit atomics is causing trouble with FreeBSD 12.2 and
--enable-werror:

 cc -Werror -fPIE -DPIE -std=gnu99 -Wall -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautological-type-limit-compare -fstack-protector-strong -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -pie -Wl,-z,relro -Wl,-z,now -m64 -fstack-protector-strong
 config-temp/qemu-conf.c:4:7: error: implicit declaration of function '__atomic_load_16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   y = __atomic_load_16(&x, 0);
       ^
 config-temp/qemu-conf.c:5:3: error: implicit declaration of function '__atomic_store_16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   __atomic_store_16(&x, y, 0);
   ^
 config-temp/qemu-conf.c:5:3: note: did you mean '__atomic_load_16'?
 config-temp/qemu-conf.c:4:7: note: '__atomic_load_16' declared here
   y = __atomic_load_16(&x, 0);
       ^
 config-temp/qemu-conf.c:6:3: error: implicit declaration of function '__atomic_compare_exchange_16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   __atomic_compare_exchange_16(&x, &y, x, 0, 0, 0);
   ^
 3 errors generated.

Looking for they way we are using atomic functions in QEMU, we are not
using these functions with the _16 suffix anyway. Switch to the same
functions that we use in the include/qemu/atomic.h header.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index f7d022a5db..4526af87b2 100755
--- a/configure
+++ b/configure
@@ -4761,9 +4761,9 @@ if test "$int128" = "yes"; then
 int main(void)
 {
   unsigned __int128 x = 0, y = 0;
-  y = __atomic_load_16(&x, 0);
-  __atomic_store_16(&x, y, 0);
-  __atomic_compare_exchange_16(&x, &y, x, 0, 0, 0);
+  y = __atomic_load(&x, 0);
+  __atomic_store(&x, y, 0);
+  __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
   return 0;
 }
 EOF
-- 
2.27.0


