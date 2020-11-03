Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7842A3EF8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 09:32:39 +0100 (CET)
Received: from localhost ([::1]:47028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZrk5-0000wO-Kt
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 03:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZrjI-0000Ve-Pl
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 03:31:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZrjH-0003px-1x
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 03:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604392305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ucFyqj6VlRWZDcFPD9Jho38yFiNOgohvFrOnBq5r98w=;
 b=ECcPcpolMPG1CVBlIQiROFuxTum5bGoRJfnkxr7zgpygv6Lj1Q+RPixRvtrzNfbMXjxzXt
 VaIOHLm+jVlnSvabR//QHUnU0v5w42YoICq1JN3DxJ9zvwSKX6bTyBTxvSEWoCfz8ZnHCz
 eGImzdvMdwAUb42px9B12oyDwH1Jpmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-kzU0KSNIM36RF_PTWm5piw-1; Tue, 03 Nov 2020 03:31:42 -0500
X-MC-Unique: kzU0KSNIM36RF_PTWm5piw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33D891074649
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 08:31:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBFEA73670
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 08:31:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2] meson: use b_staticpic=false for meson >=0.56.0
Date: Tue,  3 Nov 2020 03:31:39 -0500
Message-Id: <20201103083139.18634-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson 0.56.0 correctly builds non-PIC static libraries with -fPIE if
b_pie=true.  We do not have to pass b_staticpic=true if PIE is requested
if Meson is new-enough, which improves performance.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 6 +++++-
 meson.build | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 6df4306c88..b9a3984365 100755
--- a/configure
+++ b/configure
@@ -6953,6 +6953,10 @@ fi
 mv $cross config-meson.cross
 
 rm -rf meson-private meson-info meson-logs
+unset staticpic
+if ! version_ge "$($meson --version)" 0.56.0; then
+  staticpic=$(if test "$pie" = yes; then echo true; else echo false; fi)
+fi
 NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
@@ -6972,7 +6976,7 @@ NINJA=$ninja $meson setup \
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
         -Dstrip=$(if test "$strip_opt" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
-        -Db_staticpic=$(if test "$pie" = yes; then echo true; else echo false; fi) \
+        ${staticpic:+-Db_staticpic=$staticpic} \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
diff --git a/meson.build b/meson.build
index 47e32e1fcb..205ba6b6f8 100644
--- a/meson.build
+++ b/meson.build
@@ -1,6 +1,6 @@
 project('qemu', ['c'], meson_version: '>=0.55.0',
-        default_options: ['warning_level=1', 'c_std=gnu99', 'cpp_std=gnu++11',
-                          'b_colorout=auto'],
+        default_options: ['warning_level=1', 'c_std=gnu99', 'cpp_std=gnu++11', 'b_colorout=auto'] +
+                         (meson.version().version_compare('>=0.56.0') ? [ 'b_staticpic=false' ] : []),
         version: run_command('head', meson.source_root() / 'VERSION').stdout().strip())
 
 not_found = dependency('', required: false)
-- 
2.26.2


