Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913DB232780
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 00:18:03 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0uOg-0000Ow-Lp
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 18:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1k0uLV-0003eu-Ot
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 18:14:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34041
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1k0uLS-0001B2-E3
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 18:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596060880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cW1Fv6F+zfd8ts97DlbbgwPQ6AYGjGluPWGyzh4qrh8=;
 b=V7584BNV5ZHaQErY4Pu0opiK/IVxiQCqnb4R6C7Fpz9izO4FeRhSVTnzMVMPWtzMee3r8d
 LdH/4SOlUPnWCSQgZ59LpQ/E8hgI7x06G37KHbi4oKt6To4YzoH8xKxRmkXg2rFLK6kEis
 oM4xZMeJx1a0PCS+GWR1P5GAblt2Bfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-vlZ7nJAQMDaErwEzaI8RoQ-1; Wed, 29 Jul 2020 18:14:38 -0400
X-MC-Unique: vlZ7nJAQMDaErwEzaI8RoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7FF458
 for <qemu-devel@nongnu.org>; Wed, 29 Jul 2020 22:14:37 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-149.rdu2.redhat.com [10.10.116.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4631710013C4;
 Wed, 29 Jul 2020 22:14:32 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id CCC32223D06; Wed, 29 Jul 2020 18:14:31 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] virtiofsd: open /proc/self/fd/ in sandbox=NONE mode
Date: Wed, 29 Jul 2020 18:14:08 -0400
Message-Id: <20200729221410.147556-4-vgoyal@redhat.com>
In-Reply-To: <20200729221410.147556-1-vgoyal@redhat.com>
References: <20200729221410.147556-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 13:17:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, vromanso@redhat.com, dgilbert@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need /proc/self/fd descriptor even in sandbox=NONE mode.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index cd91c4a831..76ef891105 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2969,6 +2969,15 @@ static void setup_capabilities(char *modcaps_in)
     pthread_mutex_unlock(&cap.mutex);
 }
 
+static void setup_none(struct lo_data *lo)
+{
+    lo->proc_self_fd = open("/proc/self/fd", O_PATH);
+    if (lo->proc_self_fd == -1) {
+        fuse_log(FUSE_LOG_ERR, "open(\"/proc/self/fd\", O_PATH): %m\n");
+        exit(1);
+    }
+}
+
 /*
  * Use chroot as a weaker sandbox for environments where the process is
  * launched without CAP_SYS_ADMIN.
@@ -3014,8 +3023,10 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
     if (lo->sandbox == SANDBOX_NAMESPACE) {
         setup_namespaces(lo, se);
         setup_mounts(lo->source);
-    } else {
+    } else if (lo->sandbox == SANDBOX_CHROOT) {
         setup_chroot(lo);
+    } else {
+        setup_none(lo);
     }
 
     setup_seccomp(enable_syslog);
-- 
2.25.4


