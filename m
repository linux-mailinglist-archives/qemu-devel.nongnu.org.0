Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FBD2F54DB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:16:35 +0100 (CET)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzoRO-00076Y-2c
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoLa-0001KA-Re
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:10:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoLP-0001iu-P3
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610575822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HvRm14N5gc5L2Vm3/eIwg6y25D08xuhVkD08X5eyYWY=;
 b=J+msSTHspSXmk6Hn5a1qDf8T0lfM0VsnAuLLkxe9xgSLVsyZhojVkS9/jNOoAegBSe80T5
 A4d9wNd9V2pcCEV3J5Ya54y70452V3Jup/c9VmRSzBMhZJtiNaQUW8PXz7QYR84nJXElbJ
 pOyXNyAwgKjVV0RvxUd7HF8XWhn8k7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-Sv0f45JFPx2rWqx5Pg8_DA-1; Wed, 13 Jan 2021 17:10:18 -0500
X-MC-Unique: Sv0f45JFPx2rWqx5Pg8_DA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AD6B192D78B;
 Wed, 13 Jan 2021 22:10:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6F510016F7;
 Wed, 13 Jan 2021 22:10:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] qapi: Introduce QAPI_LIST_APPEND
Date: Wed, 13 Jan 2021 16:10:11 -0600
Message-Id: <20210113221013.390592-4-eblake@redhat.com>
In-Reply-To: <20210113221013.390592-1-eblake@redhat.com>
References: <20210113221013.390592-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Michael Roth <michael.roth@amd.com>, vsementsov@virtuozzo.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to the existing QAPI_LIST_PREPEND, but designed for use where
we want to preserve insertion order.  Callers will be added in
upcoming patches.  Note the difference in signature: PREPEND takes
List*, APPEND takes List**.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qapi/util.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 6178e98e97a5..d7bfb30e25c6 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -37,4 +37,17 @@ int parse_qapi_name(const char *name, bool complete);
     (list) = _tmp; \
 } while (0)

+/*
+ * For any pointer to a GenericList @tail (usually the 'next' member of a
+ * list element), insert @element at the back and update the tail.
+ *
+ * Note that this macro evaluates @element exactly once, so it is safe
+ * to have side-effects with that argument.
+ */
+#define QAPI_LIST_APPEND(tail, element) do { \
+    *(tail) = g_malloc0(sizeof(**(tail))); \
+    (*(tail))->value = (element); \
+    (tail) = &(*(tail))->next; \
+} while (0)
+
 #endif
-- 
2.30.0


