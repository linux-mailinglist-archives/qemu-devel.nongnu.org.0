Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA96E476C76
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:58:38 +0100 (CET)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmb0-0003HQ-25
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUX-0000lU-3G
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUU-0004Cf-Ut
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gg50s1nfYGFLRkj5CFVRlRoEsFcXXd7SBiqjypnbxZg=;
 b=bSAA+vfFxZ5WES0KFLmNT7tIZZT6UBMpTq3UKtqGu7Gbrh8CxSS0NTszNfmI1RLnGw2ibd
 fgSnHs9Ow4HGR4bap6Tap2E59ufJtyllK5uheM8M4RALa0qmYhn07LQFT+OYYDznJBX0DH
 QWciFAcZdUMtsq0qB1YKqK9DXV9BGqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-vorzIHeQNIyJ_-vbB6fpDw-1; Thu, 16 Dec 2021 03:51:48 -0500
X-MC-Unique: vorzIHeQNIyJ_-vbB6fpDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A539100D682
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:47 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB4C2C1AB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:46 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] configure: unify x86_64 and x32
Date: Thu, 16 Dec 2021 09:51:36 +0100
Message-Id: <20211216085139.99682-8-pbonzini@redhat.com>
In-Reply-To: <20211216085139.99682-1-pbonzini@redhat.com>
References: <20211216085139.99682-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only difference between the two, as far as either configure or
Meson are concerned, is in the multilib flags passed to the compiler.

For QEMU, this fixes the handling of TYPE_OLDDEVT in
include/exec/user/thunk.h and enables testing of dirty ring buffer,
because both are using HOST_X86_64.

For tests/tcg, this means that on a hypothetical x32 host the
cross compiler will not be used to build the tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 6 ++----
 meson.build | 3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 741ff99f4f..741c33c7ad 100755
--- a/configure
+++ b/configure
@@ -646,6 +646,7 @@ case "$cpu" in
     cpu="i386"
     CPU_CFLAGS="-m32" ;;
   x32)
+    cpu="x86_64"
     CPU_CFLAGS="-mx32" ;;
   x86_64|amd64)
     cpu="x86_64"
@@ -3735,7 +3736,7 @@ fi
 if test "$linux" = "yes" ; then
   mkdir -p linux-headers
   case "$cpu" in
-  i386|x86_64|x32)
+  i386|x86_64)
     linux_arch=x86
     ;;
   ppc|ppc64)
@@ -3917,9 +3918,6 @@ if test "$skip_meson" = no; then
         i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
-        x86_64|x32)
-            echo "cpu_family = 'x86_64'" >> $cross
-            ;;
         *)
             echo "cpu_family = '$ARCH'" >> $cross
             ;;
diff --git a/meson.build b/meson.build
index 96de1a6ef9..903d4f3b10 100644
--- a/meson.build
+++ b/meson.build
@@ -355,7 +355,7 @@ if not get_option('tcg').disabled()
     tcg_arch = 'tci'
   elif config_host['ARCH'] == 'sparc64'
     tcg_arch = 'sparc'
-  elif config_host['ARCH'] in ['x86_64', 'x32']
+  elif config_host['ARCH'] == 'x86_64'
     tcg_arch = 'i386'
   elif config_host['ARCH'] == 'ppc64'
     tcg_arch = 'ppc'
@@ -1801,7 +1801,6 @@ disassemblers = {
   'hppa' : ['CONFIG_HPPA_DIS'],
   'i386' : ['CONFIG_I386_DIS'],
   'x86_64' : ['CONFIG_I386_DIS'],
-  'x32' : ['CONFIG_I386_DIS'],
   'm68k' : ['CONFIG_M68K_DIS'],
   'microblaze' : ['CONFIG_MICROBLAZE_DIS'],
   'mips' : ['CONFIG_MIPS_DIS'],
-- 
2.33.1



