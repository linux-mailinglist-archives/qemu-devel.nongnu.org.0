Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B41F3C27B9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:43:16 +0200 (CEST)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tas-00050Y-IL
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1tZy-0003dI-Sx
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:42:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1tZv-0007it-Eg
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625848933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PC83evxd3fEfa38MBWv4oiNO95+X/lY078LH5Ul8fHY=;
 b=cML+s922Tx8jD5OnmLSJt3zOQhzreDXkt6eme7UovvTbf0qvmFubZ4Dg9l7agSOJU9NiVe
 l5AQYcGySbBHwEsSqcNnMJKa6Kjr04h+aeEEH4MXdGQ8DptsxC81XwQ2ql5obloILskCT2
 g/8k8IZn6uKCWJDdeDUQWlZIGy3RAtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-xKBwBnCWO16l7yP8Lsz09g-1; Fri, 09 Jul 2021 12:42:10 -0400
X-MC-Unique: xKBwBnCWO16l7yP8Lsz09g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A557D81C6D8;
 Fri,  9 Jul 2021 16:42:09 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C45E7189C7;
 Fri,  9 Jul 2021 16:42:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block: Add option to use driver whitelist even in tools
Date: Fri,  9 Jul 2021 18:41:41 +0200
Message-Id: <20210709164141.254097-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the block driver whitelists are only applied for the system
emulator. All other binaries still give unrestricted access to all block
drivers. There are use cases where this made sense because the main
concern was avoiding customers running VMs on less optimised block
drivers and getting bad performance. Allowing the same image format e.g.
as a target for 'qemu-img convert' is not a problem then.

However, if the concern is the supportability of the driver in general,
either in full or when used read-write, not applying the list driver
whitelist in tools doesn't help - especially since qemu-nbd and
qemu-storage-daemon now give access to more or less the same operations
in block drivers as running a system emulator.

In order to address this, introduce a new configure option that enforces
the driver whitelist in all binaries.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 configure   | 14 ++++++++++++--
 block.c     |  3 +++
 meson.build |  1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 650d9c0735..d3f2a362d5 100755
--- a/configure
+++ b/configure
@@ -243,6 +243,7 @@ cross_prefix=""
 audio_drv_list=""
 block_drv_rw_whitelist=""
 block_drv_ro_whitelist=""
+block_drv_whitelist_tools="no"
 host_cc="cc"
 audio_win_int=""
 libs_qga=""
@@ -1003,6 +1004,10 @@ for opt do
   ;;
   --block-drv-ro-whitelist=*) block_drv_ro_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
   ;;
+  --enable-block-drv-whitelist-in-tools) block_drv_whitelist_tools="yes"
+  ;;
+  --disable-block-drv-whitelist-in-tools) block_drv_whitelist_tools="no"
+  ;;
   --enable-debug-tcg) debug_tcg="yes"
   ;;
   --disable-debug-tcg) debug_tcg="no"
@@ -1776,10 +1781,12 @@ Advanced options (experts only):
   --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
   --block-drv-rw-whitelist=L
                            set block driver read-write whitelist
-                           (affects only QEMU, not qemu-img)
+                           (by default affects only QEMU, not tools like qemu-img)
   --block-drv-ro-whitelist=L
                            set block driver read-only whitelist
-                           (affects only QEMU, not qemu-img)
+                           (by default affects only QEMU, not tools like qemu-img)
+  --enable-block-drv-whitelist-in-tools
+                           use block whitelist also in tools instead of only QEMU
   --enable-trace-backends=B Set trace backend
                            Available backends: $trace_backend_list
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
@@ -4556,6 +4563,9 @@ if test "$audio_win_int" = "yes" ; then
 fi
 echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
 echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
+if test "$block_drv_whitelist_tools" = "yes" ; then
+  echo "CONFIG_BDRV_WHITELIST_TOOLS=y" >> $config_host_mak
+fi
 if test "$xfs" = "yes" ; then
   echo "CONFIG_XFS=y" >> $config_host_mak
 fi
diff --git a/block.c b/block.c
index be083f389e..e97ce0b1c8 100644
--- a/block.c
+++ b/block.c
@@ -6162,6 +6162,9 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
 
 void bdrv_init(void)
 {
+#ifdef CONFIG_BDRV_WHITELIST_TOOLS
+    use_bdrv_whitelist = 1;
+#endif
     module_call_init(MODULE_INIT_BLOCK);
 }
 
diff --git a/meson.build b/meson.build
index eb362ee5eb..9b41b9e6d5 100644
--- a/meson.build
+++ b/meson.build
@@ -2859,6 +2859,7 @@ summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1
 if have_block
   summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
   summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
+  summary_info += {'Use block whitelist in tools': config_host.has_key('CONFIG_BDRV_WHITELIST_TOOLS')}
   summary_info += {'VirtFS support':    have_virtfs}
   summary_info += {'build virtiofs daemon': have_virtiofsd}
   summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
-- 
2.31.1


