Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827402DC567
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:34:04 +0100 (CET)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpagd-0002Gf-JT
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpacn-0008Mg-2H
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpacj-000127-U7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xk5OvThqMihubCF0P3A0z7+E9P5KeyCisuh+GKV4O6w=;
 b=dkPUlMfGO/2c37BApQLBVA1I9sO1FuzNiPb8/texpk40MrtrHcIhkAXX1G2JR3f/jsoYZ8
 pjuPO3+pH1KJ1AjVYWo4dB5BzIiiaR8FSU3bamQLoQdjfgJs5gqKBkTZZgs8G32Sx3+NM0
 OH6R1jGvgHZ6nF7VuoX0JQWsCv8skCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-Fj8MuVT7NpyhBFIiu2yFEg-1; Wed, 16 Dec 2020 12:29:58 -0500
X-MC-Unique: Fj8MuVT7NpyhBFIiu2yFEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E910D801817;
 Wed, 16 Dec 2020 17:29:56 +0000 (UTC)
Received: from thuth.com (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C9E310016F4;
 Wed, 16 Dec 2020 17:29:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 01/12] disas/libvixl: Fix fall-through annotation for GCC >= 7
Date: Wed, 16 Dec 2020 18:29:38 +0100
Message-Id: <20201216172949.57380-2-thuth@redhat.com>
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
References: <20201216172949.57380-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For compiling with -Wimplicit-fallthrough we need to fix the
fallthrough annotations in the libvixl code. This is based on
the following upstream vixl commit by Martyn Capewell:

 https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337

 "GCC 7 enables switch/case fallthrough checking, but this fails in
  VIXL, because the annotation we use is Clang specific.

  Also, fix a missing annotation in the disassembler."

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201211152426.350966-2-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 disas/libvixl/vixl/a64/disasm-a64.cc | 4 ++++
 disas/libvixl/vixl/globals.h         | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/disas/libvixl/vixl/a64/disasm-a64.cc b/disas/libvixl/vixl/a64/disasm-a64.cc
index 7a58a5c087..f34d1d68da 100644
--- a/disas/libvixl/vixl/a64/disasm-a64.cc
+++ b/disas/libvixl/vixl/a64/disasm-a64.cc
@@ -2985,6 +2985,10 @@ int Disassembler::SubstituteImmediateField(const Instruction* instr,
           }
           return 3;
         }
+        default: {
+          VIXL_UNIMPLEMENTED();
+          return 0;
+        }
       }
     }
     case 'C': {  // ICondB - Immediate Conditional Branch.
diff --git a/disas/libvixl/vixl/globals.h b/disas/libvixl/vixl/globals.h
index 61dc9f7f7e..7099aa599f 100644
--- a/disas/libvixl/vixl/globals.h
+++ b/disas/libvixl/vixl/globals.h
@@ -108,10 +108,12 @@ inline void USE(T1, T2, T3, T4) {}
   #define __has_warning(x)  0
 #endif
 
-// Note: This option is only available for Clang. And will only be enabled for
-// C++11(201103L).
+// Fallthrough annotation for Clang and C++11(201103L).
 #if __has_warning("-Wimplicit-fallthrough") && __cplusplus >= 201103L
   #define VIXL_FALLTHROUGH() [[clang::fallthrough]] //NOLINT
+// Fallthrough annotation for GCC >= 7.
+#elif __GNUC__ >= 7
+  #define VIXL_FALLTHROUGH() __attribute__((fallthrough))
 #else
   #define VIXL_FALLTHROUGH() do {} while (0)
 #endif
-- 
2.27.0


