Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D3C2F54D7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:12:59 +0100 (CET)
Received: from localhost ([::1]:34248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzoNu-00031x-Da
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoLY-0001JS-EE
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:10:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoLM-0001h8-Mi
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610575819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djOhkdV+oVa2s2xVky2hNY/ziVIZdJP6V5ewtI2ll30=;
 b=crLW3+s25D08lhkqgiCLlBwoSesjEZP/rBQ9qMBIYbzpV31PhVr+RkNiig3MI/RjR3Lxq5
 ip6/Dge+W0NsXMy+mj2uqLMGS+Hg3bblP3N5N1KuSbIKvQBoUHgJ2VL5fEjyPHvzXfiN7S
 HbMZr3VIGK/vRW29FOWX+EclbbO1jjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-WoFXSgS6NBOBNd6LLm6Z7w-1; Wed, 13 Jan 2021 17:10:17 -0500
X-MC-Unique: WoFXSgS6NBOBNd6LLm6Z7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55C3D8015FC;
 Wed, 13 Jan 2021 22:10:16 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9B1910016F7;
 Wed, 13 Jan 2021 22:10:15 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] net: Clarify early exit condition
Date: Wed, 13 Jan 2021 16:10:09 -0600
Message-Id: <20210113221013.390592-2-eblake@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Jason Wang <jasowang@redhat.com>, vsementsov@virtuozzo.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On first glance, the loop in qmp_query_rx_filter() has early return
paths that could leak any allocation of filter_list from a previous
iteration.  But on closer inspection, it is obvious that all of the
early exits are guarded by has_name, and that the bulk of the loop
body can be executed at most once if the user is filtering by name,
thus, any early exit coincides with an empty list.  Add asserts to
make this obvious.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 net/net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/net.c b/net/net.c
index e1035f21d183..e581c8a26868 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1211,6 +1211,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
         if (nc->info->type != NET_CLIENT_DRIVER_NIC) {
             if (has_name) {
                 error_setg(errp, "net client(%s) isn't a NIC", name);
+                assert(!filter_list);
                 return NULL;
             }
             continue;
@@ -1236,6 +1237,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
         } else if (has_name) {
             error_setg(errp, "net client(%s) doesn't support"
                        " rx-filter querying", name);
+            assert(!filter_list);
             return NULL;
         }

-- 
2.30.0


