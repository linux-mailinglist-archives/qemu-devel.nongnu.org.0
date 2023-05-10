Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5116FDDAA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:23:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwipP-000296-0h; Wed, 10 May 2023 08:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipI-00027u-7a
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipC-0007dP-Hc
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XhrI/hBklLNCRzyxYw9XXqOEC8GBhPMNojClKhNsHU=;
 b=cqCC/YPC4KmXZsABSTpZqLuF1gYbyt/bBnUxmh1ht4WQde/LLswdOtCqwG1W+poRU/LXUe
 B2lnMveH4AgVoUHuwcX0UlZ4nmevxqSdCqCXpzaHqvmLtRDHvIJ83nujUyKI39aW/v+pud
 ys8YkTqWYUQhI75JAgf7RovvuU7K/90=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-gNm6pp6tN62q14pQDkUopg-1; Wed, 10 May 2023 08:21:37 -0400
X-MC-Unique: gNm6pp6tN62q14pQDkUopg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86787867956;
 Wed, 10 May 2023 12:21:37 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C756F18EC1;
 Wed, 10 May 2023 12:21:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 01/28] block: add configure options for excluding vmdk,
 vhdx and vpc
Date: Wed, 10 May 2023 14:20:44 +0200
Message-Id: <20230510122111.46566-2-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Let's add --enable / --disable configure options for these formats,
so that those who don't need them may not build them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20230421092758.814122-1-vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 meson_options.txt             |  6 ++++++
 block/meson.build             | 18 +++++++++++++-----
 meson.build                   |  3 +++
 scripts/meson-buildoptions.sh |  9 +++++++++
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index ae2017702a..66ca350029 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -301,6 +301,12 @@ option('qcow1', type: 'feature', value: 'auto',
        description: 'qcow1 image format support')
 option('vdi', type: 'feature', value: 'auto',
        description: 'vdi image format support')
+option('vhdx', type: 'feature', value: 'auto',
+       description: 'vhdx image format support')
+option('vmdk', type: 'feature', value: 'auto',
+       description: 'vmdk image format support')
+option('vpc', type: 'feature', value: 'auto',
+       description: 'vpc image format support')
 option('vvfat', type: 'feature', value: 'auto',
        description: 'vvfat image format support')
 option('qed', type: 'feature', value: 'auto',
diff --git a/block/meson.build b/block/meson.build
index 382bec0e7d..13337bd070 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -38,11 +38,6 @@ block_ss.add(files(
   'snapshot-access.c',
   'throttle-groups.c',
   'throttle.c',
-  'vhdx-endian.c',
-  'vhdx-log.c',
-  'vhdx.c',
-  'vmdk.c',
-  'vpc.c',
   'write-threshold.c',
 ), zstd, zlib, gnutls)
 
@@ -55,6 +50,19 @@ endif
 if get_option('vdi').allowed()
   block_ss.add(files('vdi.c'))
 endif
+if get_option('vhdx').allowed()
+  block_ss.add(files(
+    'vhdx-endian.c',
+    'vhdx-log.c',
+    'vhdx.c'
+  ))
+endif
+if get_option('vmdk').allowed()
+  block_ss.add(files('vmdk.c'))
+endif
+if get_option('vpc').allowed()
+  block_ss.add(files('vpc.c'))
+endif
 if get_option('cloop').allowed()
   block_ss.add(files('cloop.c'))
 endif
diff --git a/meson.build b/meson.build
index 27782f8f52..c56e0fec9e 100644
--- a/meson.build
+++ b/meson.build
@@ -3929,6 +3929,9 @@ if have_block
   summary_info += {'dmg support':       get_option('dmg').allowed()}
   summary_info += {'qcow v1 support':   get_option('qcow1').allowed()}
   summary_info += {'vdi support':       get_option('vdi').allowed()}
+  summary_info += {'vhdx support':      get_option('vhdx').allowed()}
+  summary_info += {'vmdk support':      get_option('vmdk').allowed()}
+  summary_info += {'vpc support':       get_option('vpc').allowed()}
   summary_info += {'vvfat support':     get_option('vvfat').allowed()}
   summary_info += {'qed support':       get_option('qed').allowed()}
   summary_info += {'parallels support': get_option('parallels').allowed()}
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0e888e6ecd..34d82dec53 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -169,6 +169,7 @@ meson_options_help() {
   printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vfio-user-server'
   printf "%s\n" '                  vfio-user server support'
+  printf "%s\n" '  vhdx            vhdx image format support'
   printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
   printf "%s\n" '  vhost-kernel    vhost kernel backend support'
   printf "%s\n" '  vhost-net       vhost-net kernel acceleration support'
@@ -178,10 +179,12 @@ meson_options_help() {
   printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
+  printf "%s\n" '  vmdk            vmdk image format support'
   printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vnc             VNC server'
   printf "%s\n" '  vnc-jpeg        JPEG lossy compression for VNC server'
   printf "%s\n" '  vnc-sasl        SASL authentication for VNC server'
+  printf "%s\n" '  vpc             vpc image format support'
   printf "%s\n" '  vte             vte support for the gtk UI'
   printf "%s\n" '  vvfat           vvfat image format support'
   printf "%s\n" '  whpx            WHPX acceleration support'
@@ -449,6 +452,8 @@ _meson_option_parse() {
     --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vfio-user-server) printf "%s" -Dvfio_user_server=enabled ;;
     --disable-vfio-user-server) printf "%s" -Dvfio_user_server=disabled ;;
+    --enable-vhdx) printf "%s" -Dvhdx=enabled ;;
+    --disable-vhdx) printf "%s" -Dvhdx=disabled ;;
     --enable-vhost-crypto) printf "%s" -Dvhost_crypto=enabled ;;
     --disable-vhost-crypto) printf "%s" -Dvhost_crypto=disabled ;;
     --enable-vhost-kernel) printf "%s" -Dvhost_kernel=enabled ;;
@@ -465,6 +470,8 @@ _meson_option_parse() {
     --disable-virglrenderer) printf "%s" -Dvirglrenderer=disabled ;;
     --enable-virtfs) printf "%s" -Dvirtfs=enabled ;;
     --disable-virtfs) printf "%s" -Dvirtfs=disabled ;;
+    --enable-vmdk) printf "%s" -Dvmdk=enabled ;;
+    --disable-vmdk) printf "%s" -Dvmdk=disabled ;;
     --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
     --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
     --enable-vnc) printf "%s" -Dvnc=enabled ;;
@@ -473,6 +480,8 @@ _meson_option_parse() {
     --disable-vnc-jpeg) printf "%s" -Dvnc_jpeg=disabled ;;
     --enable-vnc-sasl) printf "%s" -Dvnc_sasl=enabled ;;
     --disable-vnc-sasl) printf "%s" -Dvnc_sasl=disabled ;;
+    --enable-vpc) printf "%s" -Dvpc=enabled ;;
+    --disable-vpc) printf "%s" -Dvpc=disabled ;;
     --enable-vte) printf "%s" -Dvte=enabled ;;
     --disable-vte) printf "%s" -Dvte=disabled ;;
     --enable-vvfat) printf "%s" -Dvvfat=enabled ;;
-- 
2.40.1


