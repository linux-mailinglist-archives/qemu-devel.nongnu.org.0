Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E855215355
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 09:32:20 +0200 (CEST)
Received: from localhost ([::1]:40240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsLbv-0007BO-5l
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 03:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsLYZ-0003PV-9X
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 03:28:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56784
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsLYW-0004JT-7s
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 03:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594020527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=jGUD4WlCyQd1mVPrOaPOyVNr+AJza26/lZEXObIon+Y=;
 b=ahJlcNplroVJqZLHVKT6GJ94kWjoYfnQ7BuXrWKAEvw35diZpfcSToLwk5gV254tzHSNjK
 TM0rmafPExVPYfI93AzN0dlTV0jfaFMx2onX3s0uOesaXYPg5LA/LILBIMmLs/yS055Ay2
 5DU+Rkys4/2GZfQ9P4DH6d05wj120Ig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-gWOa-RSwMR6EpfLydGNjLg-1; Mon, 06 Jul 2020 03:28:45 -0400
X-MC-Unique: gWOa-RSwMR6EpfLydGNjLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 300408014D4;
 Mon,  6 Jul 2020 07:28:44 +0000 (UTC)
Received: from thuth.com (ovpn-112-144.ams2.redhat.com [10.36.112.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 578985D9CC;
 Mon,  6 Jul 2020 07:28:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/6] configure / util: Auto-detect the availability of openpty()
Date: Mon,  6 Jul 2020 09:28:33 +0200
Message-Id: <20200706072835.23582-5-thuth@redhat.com>
In-Reply-To: <20200706072835.23582-1-thuth@redhat.com>
References: <20200706072835.23582-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:22:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recent versions of Solaris (v11.4) now feature an openpty() function,
too, causing a build failure since we ship our own implementation of
openpty() for Solaris in util/qemu-openpty.c so far. Since there are
now both variants available in the wild, with and without this function
(and illumos is said to not have this function yet), let's introduce a
proper HAVE_OPENPTY define for this to fix the build failure.

Message-Id: <20200702143955.678-1-thuth@redhat.com>
Tested-by: Michele Denber <denber@mindspring.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure           | 9 ++++++++-
 util/qemu-openpty.c | 5 ++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 8a65240d4a..f8dc64beab 100755
--- a/configure
+++ b/configure
@@ -5134,10 +5134,14 @@ extern int openpty(int *am, int *as, char *name, void *termp, void *winp);
 int main(void) { return openpty(0, 0, 0, 0, 0); }
 EOF
 
-if ! compile_prog "" "" ; then
+have_openpty="no"
+if compile_prog "" "" ; then
+  have_openpty="yes"
+else
   if compile_prog "" "-lutil" ; then
     libs_softmmu="-lutil $libs_softmmu"
     libs_tools="-lutil $libs_tools"
+    have_openpty="yes"
   fi
 fi
 
@@ -7380,6 +7384,9 @@ fi
 if test "$have_broken_size_max" = "yes" ; then
     echo "HAVE_BROKEN_SIZE_MAX=y" >> $config_host_mak
 fi
+if test "$have_openpty" = "yes" ; then
+    echo "HAVE_OPENPTY=y" >> $config_host_mak
+fi
 
 # Work around a system header bug with some kernel/XFS header
 # versions where they both try to define 'struct fsxattr':
diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
index 2e8b43bdf5..4b8df96f38 100644
--- a/util/qemu-openpty.c
+++ b/util/qemu-openpty.c
@@ -52,7 +52,9 @@
 #endif
 
 #ifdef __sun__
-/* Once Solaris has openpty(), this is going to be removed. */
+
+#if !defined(HAVE_OPENPTY)
+/* Once illumos has openpty(), this is going to be removed. */
 static int openpty(int *amaster, int *aslave, char *name,
                    struct termios *termp, struct winsize *winp)
 {
@@ -93,6 +95,7 @@ err:
         close(mfd);
         return -1;
 }
+#endif
 
 static void cfmakeraw (struct termios *termios_p)
 {
-- 
2.18.1


