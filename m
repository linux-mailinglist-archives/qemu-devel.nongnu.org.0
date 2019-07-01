Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E5D22A5B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 05:20:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57103 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSYqp-00024o-Dv
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 23:20:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYg7-0002KN-3S
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:09:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSYg6-0001rb-9e
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:09:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hSYg6-0001qf-42
	for qemu-devel@nongnu.org; Sun, 19 May 2019 23:09:30 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1FC33082133
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 03:09:28 +0000 (UTC)
Received: from xz-x1.nay.redhat.com (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8971A100200A;
	Mon, 20 May 2019 03:09:26 +0000 (UTC)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 11:08:38 +0800
Message-Id: <20190520030839.6795-15-peterx@redhat.com>
In-Reply-To: <20190520030839.6795-1-peterx@redhat.com>
References: <20190520030839.6795-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 20 May 2019 03:09:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 14/15] hmp: Expose manual_dirty_log_protect
 via "info kvm"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	peterx@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hmp.c b/hmp.c
index 56a3ed7375..f203a25740 100644
--- a/hmp.c
+++ b/hmp.c
@@ -102,6 +102,8 @@ void hmp_info_kvm(Monitor *mon, const QDict *qdict)
     } else {
         monitor_printf(mon, "not compiled\n");
     }
+    monitor_printf(mon, "kvm manual dirty logging: %s\n",
+                   info->manual_dirty_log_protect ? "enabled" : "disabled");
 
     qapi_free_KvmInfo(info);
 }
-- 
2.17.1


