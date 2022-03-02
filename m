Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8144CADFB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:56:46 +0100 (CET)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPU9V-0005uW-5t
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:56:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkP-00019w-Bs
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkK-0000GY-Hj
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Y5T8Fwf9mR7p5wzLcO8Ej6uZejLheoOnrA75Npxe5A=;
 b=hS/IS468OHGrKlgtsvnDS743LSuXFKTwStef+yrWwlmPnQRGf4bPY+cvDdo5DsfiPyUS4u
 0IQdA01TZ4ICTIoISeHDMJbsOhszD7Zy2VbRQ/7tONmPELHM6m9cUgie8Ou+qtI5Tv93XK
 fdDP8z0JwWnwzsdY7xpj+9tgcCGOKRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-vNSbX2hwPou_IwTPN3EPRA-1; Wed, 02 Mar 2022 13:30:34 -0500
X-MC-Unique: vNSbX2hwPou_IwTPN3EPRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B0D11091DAB;
 Wed,  2 Mar 2022 18:30:33 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D07A5105917E;
 Wed,  2 Mar 2022 18:30:31 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 02/18] virtiofsd: Let meson check for statx.stx_mnt_id
Date: Wed,  2 Mar 2022 18:29:20 +0000
Message-Id: <20220302182936.227719-3-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

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
Message-Id: <20220223092340.9043-1-hreitz@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.35.1


