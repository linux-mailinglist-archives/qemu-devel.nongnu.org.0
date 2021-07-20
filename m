Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D33CFD37
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:16:27 +0200 (CEST)
Received: from localhost ([::1]:58558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rTu-0003b3-3F
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPA-0003ed-Ly
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rP6-00012f-UI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3BInqdRGDcCkm7QcObezeun/40YYQvGoh6akZcqqY0=;
 b=bzlFwGZ/hJfbpLLRye8RL1+e1E9MlWi1A+byeBBRQj2fHbVADlVE33jPBxICl8COIMfoKv
 JSIacNDAlT4c4V+hhZ6gOAtHGJ6zlS6Pt3w+uwBXM7axWGQZm/Y54dfBjj4iMyU+ZGZlzd
 LTpV3t0ex6BySVDwLIVdJ0n/XhN+8WI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-EGZmpjIHNqCYMvhy5VJNKA-1; Tue, 20 Jul 2021 11:11:26 -0400
X-MC-Unique: EGZmpjIHNqCYMvhy5VJNKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0ECF1084207;
 Tue, 20 Jul 2021 15:11:06 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05A4883BF9;
 Tue, 20 Jul 2021 15:11:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/11] block: Add option to use driver whitelist even in tools
Date: Tue, 20 Jul 2021 17:10:46 +0200
Message-Id: <20210720151053.226144-5-kwolf@redhat.com>
In-Reply-To: <20210720151053.226144-1-kwolf@redhat.com>
References: <20210720151053.226144-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
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
Message-Id: <20210709164141.254097-1-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 configure   | 14 ++++++++++++--
 block.c     |  3 +++
 meson.build |  1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 63f38fa94c..232c54dcc1 100755
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
@@ -1016,6 +1017,10 @@ for opt do
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
@@ -1800,10 +1805,12 @@ Advanced options (experts only):
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
@@ -4583,6 +4590,9 @@ if test "$audio_win_int" = "yes" ; then
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
index 6e4d2d8034..2f377098d7 100644
--- a/meson.build
+++ b/meson.build
@@ -2996,6 +2996,7 @@ summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1
 if have_block
   summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
   summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
+  summary_info += {'Use block whitelist in tools': config_host.has_key('CONFIG_BDRV_WHITELIST_TOOLS')}
   summary_info += {'VirtFS support':    have_virtfs}
   summary_info += {'build virtiofs daemon': have_virtiofsd}
   summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
-- 
2.31.1


