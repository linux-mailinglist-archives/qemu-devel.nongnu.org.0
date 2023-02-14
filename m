Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D588696269
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:26:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtNp-00079i-KJ; Tue, 14 Feb 2023 06:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNn-00078j-Uv
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:21:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNl-0002Gx-G9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:21:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jU6DItbaOvu5RvGKKdqRmaxDZU3UQjeOzTjk360yS8Q=;
 b=DcDrFFBVZy38FfUl2vg3VEa/d9bF/9sFXNyZ+RpTmyMNwAg5NROB701sFywCXgwYPcYN4x
 FYC5QRkPPoJuopUNaNYNBe9NJs0yjHe3ekeI7tJyzd3NFkRuLMwRmZtd/ptQCelYqtEnwQ
 ORGeKfaUp2KgCKQGVhnMxbpi1MpKPsk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-KzWQBVF7P02ExY5JZR4cXw-1; Tue, 14 Feb 2023 06:21:53 -0500
X-MC-Unique: KzWQBVF7P02ExY5JZR4cXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DD933C0F191;
 Tue, 14 Feb 2023 11:21:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BEBB400D927;
 Tue, 14 Feb 2023 11:21:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 02/22] meson: Add missing libdw knobs
Date: Tue, 14 Feb 2023 12:21:28 +0100
Message-Id: <20230214112148.646077-3-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add the missing meson infrastructure bits for the new libdw
dependency. Model them after the existing capstone knobs.

Fixes: 7c10cb38ccb8 ("accel/tcg: Add debuginfo support")
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230210005208.438142-1-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build                   | 11 +++++++----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index c626ccfa82..50eb670511 100644
--- a/meson.build
+++ b/meson.build
@@ -1649,10 +1649,13 @@ if libbpf.found() and not cc.links('''
 endif
 
 # libdw
-libdw = dependency('libdw',
-                   method: 'pkg-config',
-                   kwargs: static_kwargs,
-                   required: false)
+libdw = not_found
+if not get_option('libdw').auto() or have_system or have_user
+    libdw = dependency('libdw',
+                       method: 'pkg-config',
+                       kwargs: static_kwargs,
+                       required: get_option('libdw'))
+endif
 
 #################
 # config-host.h #
diff --git a/meson_options.txt b/meson_options.txt
index e5f199119e..56415c5c23 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -131,6 +131,8 @@ option('gio', type : 'feature', value : 'auto',
        description: 'use libgio for D-Bus support')
 option('glusterfs', type : 'feature', value : 'auto',
        description: 'Glusterfs block device driver')
+option('libdw', type : 'feature', value : 'auto',
+       description: 'debuginfo support')
 option('libiscsi', type : 'feature', value : 'auto',
        description: 'libiscsi userspace initiator')
 option('libnfs', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c2982ea087..180c11665a 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -109,6 +109,7 @@ meson_options_help() {
   printf "%s\n" '  kvm             KVM acceleration support'
   printf "%s\n" '  l2tpv3          l2tpv3 network backend support'
   printf "%s\n" '  libdaxctl       libdaxctl support'
+  printf "%s\n" '  libdw           debuginfo support'
   printf "%s\n" '  libiscsi        libiscsi userspace initiator'
   printf "%s\n" '  libnfs          libnfs block device driver'
   printf "%s\n" '  libpmem         libpmem support'
@@ -312,6 +313,8 @@ _meson_option_parse() {
     --enable-libdaxctl) printf "%s" -Dlibdaxctl=enabled ;;
     --disable-libdaxctl) printf "%s" -Dlibdaxctl=disabled ;;
     --libdir=*) quote_sh "-Dlibdir=$2" ;;
+    --enable-libdw) printf "%s" -Dlibdw=enabled ;;
+    --disable-libdw) printf "%s" -Dlibdw=disabled ;;
     --libexecdir=*) quote_sh "-Dlibexecdir=$2" ;;
     --enable-libiscsi) printf "%s" -Dlibiscsi=enabled ;;
     --disable-libiscsi) printf "%s" -Dlibiscsi=disabled ;;
-- 
2.31.1


