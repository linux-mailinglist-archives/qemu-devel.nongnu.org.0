Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D49240BC4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:16:39 +0200 (CEST)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5BPa-0000Wb-7Y
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIl-0005di-JG
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIj-0002jz-Qq
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RB16TkvXhLvFPihuq4ukJeWY99r3fvG59MAW5QDNv6c=;
 b=afgT3uqWYqvT4tmwwde0kD2XWbHDF4FI6aYMHco3lF+M077Smay5tnVYH3cELqW0yhNf1W
 zmSVXsSC/hBkx5Zm0TZPn93KzMi+tU+v3fgu9+Q/F4iviFpTmZg5d4bDk5atZKwiDw0yTv
 Gqms9D/I6AIT+sdLg9jKKBi8nrTjRMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-WOCYkhHiPTuzwapTdEN3rw-1; Mon, 10 Aug 2020 13:09:31 -0400
X-MC-Unique: WOCYkhHiPTuzwapTdEN3rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E5B480183C
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:30 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1215F1E9;
 Mon, 10 Aug 2020 17:09:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 012/147] configure: expand path variables for meson configure
Date: Mon, 10 Aug 2020 19:06:50 +0200
Message-Id: <1597079345-42801-13-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 13:09:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/configure b/configure
index 606c327..373bb22 100755
--- a/configure
+++ b/configure
@@ -415,16 +415,7 @@ LDFLAGS_SHARED="-shared"
 modules="no"
 module_upgrades="no"
 prefix="/usr/local"
-mandir="\${prefix}/share/man"
-datadir="\${prefix}/share"
 firmwarepath="\${prefix}/share/qemu-firmware"
-qemu_docdir="\${prefix}/share/doc/qemu"
-bindir="\${prefix}/bin"
-libdir="\${prefix}/lib"
-libexecdir="\${prefix}/libexec"
-includedir="\${prefix}/include"
-sysconfdir="\${prefix}/etc"
-local_statedir="\${prefix}/var"
 confsuffix="/qemu"
 slirp=""
 oss_lib=""
@@ -979,12 +970,6 @@ if test "$mingw32" = "yes" ; then
     LIBS="-liberty $LIBS"
   fi
   prefix="c:/Program Files/QEMU"
-  mandir="\${prefix}"
-  datadir="\${prefix}"
-  qemu_docdir="\${prefix}"
-  bindir="\${prefix}"
-  sysconfdir="\${prefix}"
-  local_statedir=
   confsuffix=""
   libs_qga="-lws2_32 -lwinmm -lpowrprof -lwtsapi32 -lwininet -liphlpapi -lnetapi32 $libs_qga"
 fi
@@ -1638,6 +1623,26 @@ for opt do
   esac
 done
 
+libdir="${libdir:-$prefix/lib}"
+libexecdir="${libexecdir:-$prefix/libexec}"
+includedir="${includedir:-$prefix/include}"
+
+if test "$mingw32" = "yes" ; then
+    mandir="$prefix"
+    datadir="$prefix"
+    qemu_docdir="$prefix"
+    bindir="$prefix"
+    sysconfdir="$prefix"
+    local_statedir=
+else
+    mandir="${mandir:-$prefix/share/man}"
+    datadir="${datadir:-$prefix/share}"
+    qemu_docdir="${qemu_docdir:-$prefix/share/doc/qemu}"
+    bindir="${bindir:-$prefix/bin}"
+    sysconfdir="${sysconfdir:-$prefix/etc}"
+    local_statedir="${local_statedir:-$prefix/var}"
+fi
+
 case "$cpu" in
     ppc)
            CPU_CFLAGS="-m32"
-- 
1.8.3.1



