Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4CD2B13C2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:18:38 +0100 (CET)
Received: from localhost ([::1]:60348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNjZ-0006bd-VZ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNfc-00032p-Jw
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:14:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNfb-00039O-0l
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605230070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtKceOPcfijKA0lu5EBBrSOzESFqQZvnqvrNydbWnbw=;
 b=ir6wgJ26wDS+XRkC2X0ts6Ba+Ugiiqcwe92bkWSK3Aev4hU28LVL4ruv67yEF0/7PEcejc
 Q7uQNFkcj3P0rU/MjuJjFx5eizWNLLKkJJW8pUypUfEe09aUlJBDLj8b59SqgoEZ3I8vB6
 E5z3Xu3lots5yKgwzX6IOJyhR8aAqwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-ol9ktYG1NI2lKVdIMLsVPA-1; Thu, 12 Nov 2020 20:14:28 -0500
X-MC-Unique: ol9ktYG1NI2lKVdIMLsVPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCDC81074643;
 Fri, 13 Nov 2020 01:14:27 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2ABB19C71;
 Fri, 13 Nov 2020 01:14:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] qapi: Introduce QAPI_LIST_APPEND
Date: Thu, 12 Nov 2020 19:13:38 -0600
Message-Id: <20201113011340.463563-6-eblake@redhat.com>
In-Reply-To: <20201113011340.463563-1-eblake@redhat.com>
References: <20201113011340.463563-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: armbru@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to the existing QAPI_LIST_PREPEND, but designed for use where
we want to preserve insertion order.  Callers will be added in
upcoming patches.  Note the difference in signature: PREPEND takes
List*, APPEND takes List**.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/qapi/util.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 6178e98e97a5..8b4967990c0d 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -37,4 +37,17 @@ int parse_qapi_name(const char *name, bool complete);
     (list) = _tmp; \
 } while (0)

+/*
+ * For any pointer to a GenericList @tail, insert @element at the back and
+ * update the tail.
+ *
+ * Note that this macro evaluates @element exactly once, so it is safe
+ * to have side-effects with that argument.
+ */
+#define QAPI_LIST_APPEND(tail, element) do { \
+    *(tail) = g_malloc0(sizeof(**(tail))); \
+    (*(tail))->value = (element); \
+    (tail) = &(*tail)->next; \
+} while (0)
+
 #endif
-- 
2.28.0


