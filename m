Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D0F2D793D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:30:02 +0100 (CET)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkMr-0001KP-Az
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHh-0004NU-JA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHe-0005yS-Ng
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DdwlKdc8b3ZF0MgVlSA+4QtNJ7CUlNJsKC5XrmkCd7Y=;
 b=QdBGNSJHuQnpKK4UXR9sS85cZTb/PJdN8i7fHx5A9T4H4XzpvfmF0j3LSlz4/LCUM9zbIb
 Gx+rNl3GLjxKe7fyc1+96EvxUYV7wTm1YfOtVDUyFhHhueWVNMicUnmoxRJD/4elyXGzG/
 ynuQWDmUSns3jNlPQ2aFMeZ7V2rUA5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-lKMBOd0lMRWk1FJktGG4KA-1; Fri, 11 Dec 2020 10:24:34 -0500
X-MC-Unique: lKMBOd0lMRWk1FJktGG4KA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5AFB87300D;
 Fri, 11 Dec 2020 15:24:32 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4820710023B4;
 Fri, 11 Dec 2020 15:24:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 01/12] disas/libvixl: Fix fall-through annotation for GCC >= 7
Date: Fri, 11 Dec 2020 16:24:15 +0100
Message-Id: <20201211152426.350966-2-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
References: <20201211152426.350966-1-thuth@redhat.com>
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
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
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


