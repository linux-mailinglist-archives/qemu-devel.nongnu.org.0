Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0539231A5EF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:21:33 +0100 (CET)
Received: from localhost ([::1]:52802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAewU-0000gz-Pg
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAero-0004HM-3C
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerj-0003sV-9s
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmgkwd3GZ3WDtD2SuR6rBfdgEJ8/qhaQNF0kYao3QJ8=;
 b=Efq97of2Bphae94mIZ5cNGhqxAeCZmfLV9tyxF6ErgScWQTus0Ip157Qg0FAuDBbOU6f8I
 jPPDrbR7zOST2sgUlmVYR1BLDcEQb07wJ5i5Qcr84YRMXRo9XyTnf1g1o0VSQcjomBIroE
 mto854yqlAmHDoc5FNf5fGMXFbFwnL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-Bm9Ushb5M8SN25g9QO2S5Q-1; Fri, 12 Feb 2021 15:16:31 -0500
X-MC-Unique: Bm9Ushb5M8SN25g9QO2S5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1943B108BD18;
 Fri, 12 Feb 2021 20:16:30 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A08E06E51F;
 Fri, 12 Feb 2021 20:16:29 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] block/nbd: implement .bdrv_cancel_in_flight
Date: Fri, 12 Feb 2021 14:16:11 -0600
Message-Id: <20210212201619.1388255-7-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Just stop waiting for connection in existing requests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210205163720.887197-3-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index b3cbbeb4b0cb..c26dc5a54f52 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2458,6 +2458,18 @@ static const char *const nbd_strong_runtime_opts[] = {
     NULL
 };

+static void nbd_cancel_in_flight(BlockDriverState *bs)
+{
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+
+    reconnect_delay_timer_del(s);
+
+    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
+        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
+        qemu_co_queue_restart_all(&s->free_sema);
+    }
+}
+
 static BlockDriver bdrv_nbd = {
     .format_name                = "nbd",
     .protocol_name              = "nbd",
@@ -2484,6 +2496,7 @@ static BlockDriver bdrv_nbd = {
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
+    .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
 };

 static BlockDriver bdrv_nbd_tcp = {
@@ -2512,6 +2525,7 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
+    .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
 };

 static BlockDriver bdrv_nbd_unix = {
@@ -2540,6 +2554,7 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
+    .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
 };

 static void bdrv_nbd_init(void)
-- 
2.30.1


