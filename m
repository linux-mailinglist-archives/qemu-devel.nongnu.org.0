Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5131A37A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:24:03 +0100 (CET)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcAk-00080z-Dt
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAc7b-0005xB-CV
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:20:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAc7Y-00020s-Qv
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613150443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0kyGhpR8yB4K4YNl5zqpUon9HXiHudomNtiOKgzoaw=;
 b=eFY95le4TRaASZV2wRPZknujykLYeqgyQJ3vfAhf0TCHff0vRqkIGBhg+pB0EgloIiev79
 GctT5Tlnlg3YnoedQi8wyfTUldXGKaDau8wMRYLV0vchWlo+4Mk0/XwYqihPel/5/Tafut
 phuV8PM42lcMJR08ha1B5+/ZtoYQcXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Kij5I4YxMD-wrJV7O-J8JA-1; Fri, 12 Feb 2021 12:20:42 -0500
X-MC-Unique: Kij5I4YxMD-wrJV7O-J8JA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47DBD192CC40
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 17:20:41 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-163.ams2.redhat.com [10.36.112.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89C9A5DF21;
 Fri, 12 Feb 2021 17:20:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] monitor/qmp: Stop processing requests when shutdown is
 requested
Date: Fri, 12 Feb 2021 18:20:28 +0100
Message-Id: <20210212172028.288825-3-kwolf@redhat.com>
In-Reply-To: <20210212172028.288825-1-kwolf@redhat.com>
References: <20210212172028.288825-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

monitor_qmp_dispatcher_co() used to check whether shutdown is requested
only when it would have to wait for new requests. If there were still
some queued requests, it would try to execute all of them before
shutting down.

This can be surprising when the queued QMP commands take long or hang
because Ctrl-C may not actually exit QEMU as soon as possible.

Change monitor_qmp_dispatcher_co() so that it additionally checks
whether shutdown is request before it gets a new request from the queue.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor/qmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 43880fa623..2326bd7f9b 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -227,6 +227,11 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
          */
         qatomic_mb_set(&qmp_dispatcher_co_busy, false);
 
+        /* On shutdown, don't take any more requests from the queue */
+        if (qmp_dispatcher_co_shutdown) {
+            return;
+        }
+
         while (!(req_obj = monitor_qmp_requests_pop_any_with_lock())) {
             /*
              * No more requests to process.  Wait to be reentered from
-- 
2.29.2


