Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA63307008
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:48:08 +0100 (CET)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l522B-0000PW-KN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51zQ-0007Rk-S6
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:45:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51zN-00017R-P5
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611819913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rLnyy8P6KrS+Zgrkr+NjcBbmnSBed34XpyvXcctUEg=;
 b=LNDCxEatZv0/7lBA5mO+u73fyQ7vjJkONwvcLwRO0BnPWXEfy2c5u2OczHmQUllYfuqGZq
 +koaeMieE/3xDhgGu0Rq9v5k4zXyUyQPGXALqjiZMhS9i9DeqTSNxRgd3VkQ9G2l6L8+/+
 0su554ZCuo6vXIMLbvgV+GFRlooRphg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-SiJRtuS8MQqlw6TeVGIieQ-1; Thu, 28 Jan 2021 02:45:09 -0500
X-MC-Unique: SiJRtuS8MQqlw6TeVGIieQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E81B1966323;
 Thu, 28 Jan 2021 07:45:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 407FC7771F;
 Thu, 28 Jan 2021 07:45:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C595B113861E; Thu, 28 Jan 2021 08:45:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] net: Clarify early exit condition
Date: Thu, 28 Jan 2021 08:45:02 +0100
Message-Id: <20210128074506.2725379-2-armbru@redhat.com>
In-Reply-To: <20210128074506.2725379-1-armbru@redhat.com>
References: <20210128074506.2725379-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

On first glance, the loop in qmp_query_rx_filter() has early return
paths that could leak any allocation of filter_list from a previous
iteration.  But on closer inspection, it is obvious that all of the
early exits are guarded by has_name, and that the bulk of the loop
body can be executed at most once if the user is filtering by name,
thus, any early exit coincides with an empty list.  Add asserts to
make this obvious.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210113221013.390592-2-eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 net/net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/net.c b/net/net.c
index c1cd9c75f6..2afac24b79 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1227,6 +1227,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
         if (nc->info->type != NET_CLIENT_DRIVER_NIC) {
             if (has_name) {
                 error_setg(errp, "net client(%s) isn't a NIC", name);
+                assert(!filter_list);
                 return NULL;
             }
             continue;
@@ -1252,6 +1253,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
         } else if (has_name) {
             error_setg(errp, "net client(%s) doesn't support"
                        " rx-filter querying", name);
+            assert(!filter_list);
             return NULL;
         }
 
-- 
2.26.2


