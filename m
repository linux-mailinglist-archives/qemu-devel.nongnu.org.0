Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7F31A60A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:29:37 +0100 (CET)
Received: from localhost ([::1]:48698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAf4K-0002rH-B4
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAero-0004Jx-1B
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerj-0003su-A0
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDMWf/HvEi/wk1Ifayydj4NfnlHyn1DPR3IotdzmBek=;
 b=M1wgAHIPTRDtniOzvHPpC+Pq5jzmFz8oHLfvgjrZBBw4vTUylmil7UmgoLLs2VjmvHNbK2
 l7E9uPp2sDeaK0K3JvVy4q6FJEK+PbznScbBOUVpEGoRtmjLC8QF3kdUXKS8k9sB4q63/H
 YAgPEGcDhktcqUha+ypC/1qt4v5cgyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-bZKiwFUAMh6M1vqdDEGzSw-1; Fri, 12 Feb 2021 15:16:31 -0500
X-MC-Unique: bZKiwFUAMh6M1vqdDEGzSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B141C801977;
 Fri, 12 Feb 2021 20:16:30 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 448F66E528;
 Fri, 12 Feb 2021 20:16:30 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/14] block/raw-format: implement .bdrv_cancel_in_flight
 handler
Date: Fri, 12 Feb 2021 14:16:12 -0600
Message-Id: <20210212201619.1388255-8-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to cancel in-flight requests on mirror nbd target on job
cancel. Still nbd is often used not directly but as raw-format child.
So, add pass-through handler here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210205163720.887197-4-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/raw-format.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 42ec50802bcd..7717578ed6ab 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -575,6 +575,11 @@ static const char *const raw_strong_runtime_opts[] = {
     NULL
 };

+static void raw_cancel_in_flight(BlockDriverState *bs)
+{
+    bdrv_cancel_in_flight(bs->file->bs);
+}
+
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
@@ -608,6 +613,7 @@ BlockDriver bdrv_raw = {
     .bdrv_has_zero_init   = &raw_has_zero_init,
     .strong_runtime_opts  = raw_strong_runtime_opts,
     .mutable_opts         = mutable_opts,
+    .bdrv_cancel_in_flight = raw_cancel_in_flight,
 };

 static void bdrv_raw_init(void)
-- 
2.30.1


