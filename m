Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8522B13B9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:15:44 +0100 (CET)
Received: from localhost ([::1]:52482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNgl-0003IK-ST
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNf0-0001he-Lu
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:13:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNez-000367-6N
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605230032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLVPHOenE2C79HM6uB12I9/8vxblT7z1fzson765B2M=;
 b=V6GUctZF35VP9VnEkvW0YzCWhM0QsS9hjGEXm3IgcL9JT7eKvrNssUG57iZpZwu7UrHao2
 N0UQaKPz1yljKHF+S/SInYL+MSBoOXZLTvz6Hwz6n0RjFRTAsyNpfk+N+CgcgNVv7GOEBs
 /4w6GtgvAYhuJEWk7/ChLnMlP9E8wmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-kq_D6EDJP1CkNTfrzNjRHQ-1; Thu, 12 Nov 2020 20:13:51 -0500
X-MC-Unique: kq_D6EDJP1CkNTfrzNjRHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23A348049D5
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 01:13:50 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E31619C59;
 Fri, 13 Nov 2020 01:13:45 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7 for-5.2?] net: Fix memory leak on error
Date: Thu, 12 Nov 2020 19:13:34 -0600
Message-Id: <20201113011340.463563-2-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If qmp_query_rx_filter() encounters an error on a second iteration, it
leaks the memory from the first.

Fixes: 9083da1d4c
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 net/net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/net.c b/net/net.c
index 794c652282cb..eb65e110871a 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1213,6 +1213,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
         if (nc->info->type != NET_CLIENT_DRIVER_NIC) {
             if (has_name) {
                 error_setg(errp, "net client(%s) isn't a NIC", name);
+                qapi_free_RxFilterInfoList(filter_list);
                 return NULL;
             }
             continue;
@@ -1238,6 +1239,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
         } else if (has_name) {
             error_setg(errp, "net client(%s) doesn't support"
                        " rx-filter querying", name);
+            qapi_free_RxFilterInfoList(filter_list);
             return NULL;
         }

-- 
2.28.0


