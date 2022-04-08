Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E499A4F95D4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 14:32:24 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncnmq-00048h-2D
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 08:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1ncnj1-0001mS-Ip
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1ncniy-0008Ux-Ck
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649420903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO+6m6+bvL4NnBQUt3xV0JjXFasAc5ztT/ZTtrObPko=;
 b=CfN61sehuIracEiGvYWnUCCwtbpk4dACCVx/duGZwNZjxlicvRWq4+Lj9iCZVh/R11Ug57
 cfDKH8sDDf9EM81HAG42QUNnaocO/Msap+hw4+wJNZs12aQ+7ndRweasqqFE+gd2di4mD5
 aV3KoT3ZdIf/NiUviFFsJVbNPZFFa4I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-R8cS1ghsO_OxQfqbcvkJZg-1; Fri, 08 Apr 2022 08:28:19 -0400
X-MC-Unique: R8cS1ghsO_OxQfqbcvkJZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32CA838149A3;
 Fri,  8 Apr 2022 12:28:19 +0000 (UTC)
Received: from max-t490s.redhat.com (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61CF71402642;
 Fri,  8 Apr 2022 12:28:17 +0000 (UTC)
From: Maxime Coquelin <maxime.coquelin@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 andrew@daynix.com, yuri.benditovich@daynix.com, dgilbert@redhat.com,
 quintela@redhat.com
Subject: [PATCH 1/5] ebpf: pass and check RSS key length to the loader
Date: Fri,  8 Apr 2022 14:28:09 +0200
Message-Id: <20220408122813.1357045-2-maxime.coquelin@redhat.com>
In-Reply-To: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
References: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=maxime.coquelin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: chenbo.xia@intel.com, Maxime Coquelin <maxime.coquelin@redhat.com>,
 dmarchan@redhat.com, ktraynor@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is preliminary rework to support RSS with
Vhost-user backends. The Vhost-user implementation will
allow RSS hash key of 40 bytes or more as allowed by the
Virtio specification, whereas the eBPF-based Vhost-kernel
solution only supports 40 bytes keys.

This patch adds the RSS key length to the loader, and
validate it is 40 bytes before copying it.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
---
 ebpf/ebpf_rss-stub.c |  3 ++-
 ebpf/ebpf_rss.c      | 11 +++++++----
 ebpf/ebpf_rss.h      |  3 ++-
 hw/net/virtio-net.c  |  3 ++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
index e71e229190..ffc5c5574f 100644
--- a/ebpf/ebpf_rss-stub.c
+++ b/ebpf/ebpf_rss-stub.c
@@ -29,7 +29,8 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
 }
 
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
-                      uint16_t *indirections_table, uint8_t *toeplitz_key)
+                      uint16_t *indirections_table, uint8_t *toeplitz_key,
+                      uint8_t key_len)
 {
     return false;
 }
diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 118c68da83..4a63854175 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -110,14 +110,16 @@ static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ctx,
 }
 
 static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
-                                     uint8_t *toeplitz_key)
+                                     uint8_t *toeplitz_key,
+                                     size_t len)
 {
     uint32_t map_key = 0;
 
     /* prepare toeplitz key */
     uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {};
 
-    if (!ebpf_rss_is_loaded(ctx) || toeplitz_key == NULL) {
+    if (!ebpf_rss_is_loaded(ctx) || toeplitz_key == NULL ||
+            len != VIRTIO_NET_RSS_MAX_KEY_SIZE) {
         return false;
     }
     memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_MAX_KEY_SIZE);
@@ -131,7 +133,8 @@ static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
 }
 
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
-                      uint16_t *indirections_table, uint8_t *toeplitz_key)
+                      uint16_t *indirections_table, uint8_t *toeplitz_key,
+                      uint8_t key_len)
 {
     if (!ebpf_rss_is_loaded(ctx) || config == NULL ||
         indirections_table == NULL || toeplitz_key == NULL) {
@@ -147,7 +150,7 @@ bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
         return false;
     }
 
-    if (!ebpf_rss_set_toepliz_key(ctx, toeplitz_key)) {
+    if (!ebpf_rss_set_toepliz_key(ctx, toeplitz_key, key_len)) {
         return false;
     }
 
diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
index bf3f2572c7..db23ccd25f 100644
--- a/ebpf/ebpf_rss.h
+++ b/ebpf/ebpf_rss.h
@@ -37,7 +37,8 @@ bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
 bool ebpf_rss_load(struct EBPFRSSContext *ctx);
 
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
-                      uint16_t *indirections_table, uint8_t *toeplitz_key);
+                      uint16_t *indirections_table, uint8_t *toeplitz_key,
+                      uint8_t key_len);
 
 void ebpf_rss_unload(struct EBPFRSSContext *ctx);
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1067e72b39..73145d6390 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1201,7 +1201,8 @@ static bool virtio_net_attach_epbf_rss(VirtIONet *n)
     rss_data_to_rss_config(&n->rss_data, &config);
 
     if (!ebpf_rss_set_all(&n->ebpf_rss, &config,
-                          n->rss_data.indirections_table, n->rss_data.key)) {
+                          n->rss_data.indirections_table, n->rss_data.key,
+                          VIRTIO_NET_RSS_MAX_KEY_SIZE)) {
         return false;
     }
 
-- 
2.35.1


