Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A52C4C0FDA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:07:24 +0100 (CET)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoYM-0001tX-Hq
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:07:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMnsG-0001R9-8g
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:23:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nMnsC-0004al-9r
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645608227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cxnL4SBgi6AqDoZt5Zfx3M7MmF8f22jIPL4CGMXoeQ0=;
 b=Ok1VoeLw4q3zGeo4pitbncIEw1ou+ebQfzzwVLCvDiM/IKSN2T7BaMSJ3dxhGtnFeL/svZ
 A07cdJLItNwg7CG75doUTEvtYpdIpsoJ1PnHvhIPbnth4uQ4kdouW4gmU12vIJKtOPOcyK
 6+xqoy7beRkZxIk5J+27muebZE7UkHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-panNuRbjOK6fjSdm_5CXxA-1; Wed, 23 Feb 2022 04:23:43 -0500
X-MC-Unique: panNuRbjOK6fjSdm_5CXxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B11B21006AA7
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 09:23:42 +0000 (UTC)
Received: from localhost (unknown [10.39.194.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 532618089D;
 Wed, 23 Feb 2022 09:23:41 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH] virtiofsd: Let meson check for statx.stx_mnt_id
Date: Wed, 23 Feb 2022 10:23:40 +0100
Message-Id: <20220223092340.9043-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In virtiofsd, we assume that the presence of the STATX_MNT_ID macro
implies existence of the statx.stx_mnt_id field.  Unfortunately, that is
not necessarily the case: glibc has introduced the macro in its commit
88a2cf6c4bab6e94a65e9c0db8813709372e9180, but the statx.stx_mnt_id field
is still missing from its own headers.

Let meson.build actually chek for both STATX_MNT_ID and
statx.stx_mnt_id, and set CONFIG_STATX_MNT_ID if both are present.
Then, use this config macro in virtiofsd.

Closes: https://gitlab.com/qemu-project/qemu/-/issues/882
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 meson.build                      | 13 +++++++++++++
 tools/virtiofsd/passthrough_ll.c |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4..a5b63e62cd 100644
--- a/meson.build
+++ b/meson.build
@@ -1306,6 +1306,18 @@ statx_test = gnu_source_prefix + '''
 
 has_statx = cc.links(statx_test)
 
+# Check whether statx() provides mount ID information
+
+statx_mnt_id_test = gnu_source_prefix + '''
+  #include <sys/stat.h>
+  int main(void) {
+    struct statx statxbuf;
+    statx(0, "", 0, STATX_BASIC_STATS | STATX_MNT_ID, &statxbuf);
+    return statxbuf.stx_mnt_id;
+  }'''
+
+has_statx_mnt_id = cc.links(statx_mnt_id_test)
+
 have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
   .require(targetos == 'linux',
            error_message: 'vhost_user_blk_server requires linux') \
@@ -1553,6 +1565,7 @@ config_host_data.set('CONFIG_NETTLE', nettle.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
+config_host_data.set('CONFIG_STATX_MNT_ID', has_statx_mnt_id)
 config_host_data.set('CONFIG_ZSTD', zstd.found())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index dfa2fc250d..028dacdd8f 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1039,7 +1039,7 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
 {
     int res;
 
-#if defined(CONFIG_STATX) && defined(STATX_MNT_ID)
+#if defined(CONFIG_STATX) && defined(CONFIG_STATX_MNT_ID)
     if (lo->use_statx) {
         struct statx statxbuf;
 
-- 
2.34.1


