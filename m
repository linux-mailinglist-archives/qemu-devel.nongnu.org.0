Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3914C3FFBB1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:18:04 +0200 (CEST)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4Oh-0007S7-9T
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4L4-0002eo-6h
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4L0-0005Nl-FN
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630656851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gucglQp54SBiDE3lKFO8gNB3cPulnWiHPh6yAJ9iM8o=;
 b=EAlwQ/imHIm/cOYdE/ZXioPNf7B9Hu/TXGePZenmuAG2Q8ehUMekXuL5AQw3RPukU7BgdC
 /l/JNQMSavRh7ZAD9iEnFdoyNPrqJYnV5ODmGxqHk2/MmOz8++XJs+W6C7sC0+x13Uost+
 cjxUCc+Lj06ntwYfDnoA3eJQDtXcXAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-5Q_vHVQlNlORrUIHt3t3RQ-1; Fri, 03 Sep 2021 04:14:11 -0400
X-MC-Unique: 5Q_vHVQlNlORrUIHt3t3RQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC5D6107ACCA
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 08:14:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B79F25F706;
 Fri,  3 Sep 2021 08:14:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 1/5] configure: Add the possibility to read options from
 meson_options.txt
Date: Fri,  3 Sep 2021 10:13:54 +0200
Message-Id: <20210903081358.956267-2-thuth@redhat.com>
In-Reply-To: <20210903081358.956267-1-thuth@redhat.com>
References: <20210903081358.956267-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To avoid double maintenance between the configure script and
meson_options.txt, add some simple logic in the configure script
to read the options from meson_options.txt.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9a79a004d7..528e9c80c5 100755
--- a/configure
+++ b/configure
@@ -836,6 +836,8 @@ fi
 
 werror=""
 
+meson_options=""
+
 for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
@@ -1581,6 +1583,26 @@ for opt do
   ;;
   --disable-slirp-smbd) slirp_smbd=no
   ;;
+  --enable-*)
+      arg=$(printf %s\\n "$opt" | sed -e "s/--enable-//" -e "s/-/_/g")
+      if ! grep -q "option('$arg', type[ ]*: 'feature'" \
+                $source_path/meson_options.txt; then
+          printf "ERROR: unknown option %s\n" "$opt"
+          printf "Try '%s --help' for more information\n" "$0"
+          exit 1
+      fi
+      meson_options="$meson_options -D$arg=enabled"
+  ;;
+  --disable-*)
+      arg=$(printf %s\\n "$opt" | sed -e "s/--disable-//" -e "s/-/_/g")
+      if ! grep -q "option('$arg', type[ ]*: 'feature'" \
+                $source_path/meson_options.txt; then
+          printf "ERROR: unknown option %s\n" "$opt"
+          printf "Try '%s --help' for more information\n" "$0"
+          exit 1
+      fi
+      meson_options="$meson_options -D$arg=disabled"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -5211,7 +5233,7 @@ if test "$skip_meson" = no; then
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
-	-Dtcg_interpreter=$tcg_interpreter \
+        -Dtcg_interpreter=$tcg_interpreter $meson_options \
         $cross_arg \
         "$PWD" "$source_path"
 
-- 
2.27.0


