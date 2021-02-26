Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169F32624D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 13:07:55 +0100 (CET)
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFbuT-0001fb-Hm
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 07:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lFbt3-00011d-ID
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 07:06:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lFbt0-0008LH-Ia
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 07:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614341181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5sSUGjJl0N9rSE3mNsymbDryUSITyUiRDPA98/1ZvGo=;
 b=SSxE+zTKuKmm+zFT0BC5CJL6Jvvu+X/xVXIdEZPWToqS3J+NGdHpYcNrvyFkBKfac/myQr
 NR6SPabUMCFwvcuhv2f2LSuuV1ljVKyjNPSKtG65xGT8d/CqwpuTXxtrEV8RxRN5Uxt3FN
 TpdMpHZL0ir/8t5ejomJ/rNdvr96vow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-vrbIAKLDNrGyBGBYoGwk0g-1; Fri, 26 Feb 2021 07:06:17 -0500
X-MC-Unique: vrbIAKLDNrGyBGBYoGwk0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC3C1868404;
 Fri, 26 Feb 2021 12:06:16 +0000 (UTC)
Received: from localhost (unknown [10.36.110.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 667B8E2E2;
 Fri, 26 Feb 2021 12:06:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] net: remove qemu_ether_ntoa()
Date: Fri, 26 Feb 2021 16:06:07 +0400
Message-Id: <20210226120607.675753-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The function is not thread-safe and sets a bad example. It's used in a
single place for tracing, so open-code the format string like other
trace events with MAC addresses.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h |  1 -
 net/announce.c        |  8 +++++++-
 util/cutils.c         | 13 -------------
 net/trace-events      |  2 +-
 4 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 654621444e..209133bfca 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -132,7 +132,6 @@ void qemu_hexdump(FILE *fp, const char *prefix,
  */
 int parse_debug_env(const char *name, int max, int initial);
 
-const char *qemu_ether_ntoa(const MACAddr *mac);
 void page_size_init(void);
 
 /* returns non-zero if dump is in progress, otherwise zero is
diff --git a/net/announce.c b/net/announce.c
index 26f057f5ee..fc0c6baace 100644
--- a/net/announce.c
+++ b/net/announce.c
@@ -146,7 +146,13 @@ static void qemu_announce_self_iter(NICState *nic, void *opaque)
 
     trace_qemu_announce_self_iter(timer->params.has_id ? timer->params.id : "_",
                                   nic->ncs->name,
-                                  qemu_ether_ntoa(&nic->conf->macaddr), skip);
+                                  nic->conf->macaddr.a[0],
+                                  nic->conf->macaddr.a[1],
+                                  nic->conf->macaddr.a[2],
+                                  nic->conf->macaddr.a[3],
+                                  nic->conf->macaddr.a[4],
+                                  nic->conf->macaddr.a[5],
+                                  skip);
 
     if (!skip) {
         len = announce_self_create(buf, nic->conf->macaddr.a);
diff --git a/util/cutils.c b/util/cutils.c
index 70c7d6efbd..b5460a72b4 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -847,19 +847,6 @@ int parse_debug_env(const char *name, int max, int initial)
     return debug;
 }
 
-/*
- * Helper to print ethernet mac address
- */
-const char *qemu_ether_ntoa(const MACAddr *mac)
-{
-    static char ret[18];
-
-    snprintf(ret, sizeof(ret), "%02x:%02x:%02x:%02x:%02x:%02x",
-             mac->a[0], mac->a[1], mac->a[2], mac->a[3], mac->a[4], mac->a[5]);
-
-    return ret;
-}
-
 /*
  * Return human readable string for size @val.
  * @val can be anything that uint64_t allows (no more than "16 EiB").
diff --git a/net/trace-events b/net/trace-events
index bfaff7891d..07d6203602 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -1,7 +1,7 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
 # announce.c
-qemu_announce_self_iter(const char *id, const char *name, const char *mac, int skip) "%s:%s:%s skip: %d"
+qemu_announce_self_iter(const char *id, const char *name, char mac0, char mac1, char mac2, char mac3, char mac4, char mac5, int skip) "%s:%s:%02x:%02x:%02x:%02x:%02x:%02x skip: %d"
 qemu_announce_timer_del(bool free_named, bool free_timer, char *id) "free named: %d free timer: %d id: %s"
 
 # vhost-user.c
-- 
2.29.0


