Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B53476CA8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:59:51 +0100 (CET)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmcA-0004zz-5Y
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:59:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUP-0000aO-DH
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUN-0004A4-29
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ko7yDuy6KoAvLgHZ93uKWo0PSnLIVZJ7746abDOnL/I=;
 b=CtzZWevvJ07jVdJS8SKRduXzN8EdqYX2ZUlQkS77mBiFbqi9fQRIxkOPVSR/Z0oLEu7BET
 LWNmxH4zhKQhAT73sIKnxmtryaoFlIwRf1+NTqRBUcGiemzu4L58q6+7p9mIl+x73ow/BO
 eo84kOMJ97paUHXRYRewzEI5O42/fIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-_h8d9WDSP_mHCX9A_DizwQ-1; Thu, 16 Dec 2021 03:51:45 -0500
X-MC-Unique: _h8d9WDSP_mHCX9A_DizwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70EC1801AAB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:44 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2E3B2C1AB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] configure: do not set bsd_user/linux_user early
Date: Thu, 16 Dec 2021 09:51:33 +0100
Message-Id: <20211216085139.99682-5-pbonzini@redhat.com>
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

Similar to other optional features, leave the variables empty and compute
the actual value later.  Use the existence of include or source directories
to detect whether an OS or CPU supports respectively bsd-user and linux-user.

For now, BSD user-mode emulation is buildable even on TCI-only
architectures.  This probably will change once safe signals are
brought over from linux-user.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 157691d99e..a774086891 100755
--- a/configure
+++ b/configure
@@ -322,8 +322,8 @@ linux="no"
 solaris="no"
 profiler="no"
 softmmu="yes"
-linux_user="no"
-bsd_user="no"
+linux_user=""
+bsd_user=""
 pkgversion=""
 pie=""
 qom_cast_debug="yes"
@@ -541,7 +541,6 @@ gnu/kfreebsd)
 ;;
 freebsd)
   bsd="yes"
-  bsd_user="yes"
   make="${MAKE-gmake}"
   # needed for kinfo_getvmmap(3) in libutil.h
 ;;
@@ -586,7 +585,6 @@ haiku)
 ;;
 linux)
   linux="yes"
-  linux_user="yes"
   vhost_user=${default_feature:-yes}
 ;;
 esac
@@ -1280,18 +1278,25 @@ if eval test -z "\${cross_cc_$cpu}"; then
     cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
 fi
 
-# For user-mode emulation the host arch has to be one we explicitly
-# support, even if we're using TCI.
-if [ "$ARCH" = "unknown" ]; then
-  bsd_user="no"
-  linux_user="no"
-fi
-
 default_target_list=""
 deprecated_targets_list=ppc64abi32-linux-user
 deprecated_features=""
 mak_wilds=""
 
+if [ "$linux_user" != no ]; then
+    if [ "$targetos" = linux ] && [ -d $source_path/linux-user/host/$cpu ]; then
+        linux_user=yes
+    elif [ "$linux_user" = yes ]; then
+        error_exit "linux-user not supported on this architecture"
+    fi
+fi
+if [ "$bsd_user" != no ]; then
+    if [ -d $source_path/bsd-user/$targetos ]; then
+        bsd_user=yes
+    elif [ "$bsd_user" = yes ]; then
+        error_exit "bsd-user not supported on this host OS"
+    fi
+fi
 if [ "$softmmu" = "yes" ]; then
     mak_wilds="${mak_wilds} $source_path/configs/targets/*-softmmu.mak"
 fi
-- 
2.33.1



