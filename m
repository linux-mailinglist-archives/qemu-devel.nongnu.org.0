Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548951E6663
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 17:41:16 +0200 (CEST)
Received: from localhost ([::1]:36798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeKeh-0001vt-Br
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 11:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jeKbd-0003e2-7k
 for qemu-devel@nongnu.org; Thu, 28 May 2020 11:38:05 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31336
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jeKbc-0003uM-Fp
 for qemu-devel@nongnu.org; Thu, 28 May 2020 11:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590680283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6knHWgY9k0hW6npSPjW6s6NOISm5VV69fKYc5XBJRVM=;
 b=d9BLc9kkwUO7HIjLG4T+I/CpcWwM/17GeQjdenf7cL6hENv314QC8rJ2pnQAGvtoh23HbR
 WvBMLqYAkTwWvC7jSACryZxf4BfwjFJf7GA3q5Wu5oSO88JDvdUtGSfdGF7cRqe4dyshbY
 HSv3jJMCLG1IgfPV8GiNtuWnaJRKndo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-xxIcAfVkPmedibAkLpMyHA-1; Thu, 28 May 2020 11:37:57 -0400
X-MC-Unique: xxIcAfVkPmedibAkLpMyHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3BB4474;
 Thu, 28 May 2020 15:37:52 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-117.ams2.redhat.com
 [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B365810013C0;
 Thu, 28 May 2020 15:37:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 04/12] qmp: Assert that no other monitor is active
Date: Thu, 28 May 2020 17:37:34 +0200
Message-Id: <20200528153742.274164-5-kwolf@redhat.com>
In-Reply-To: <20200528153742.274164-1-kwolf@redhat.com>
References: <20200528153742.274164-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 02:50:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, marcandre.lureau@gmail.com, armbru@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

monitor_qmp_dispatch() is never supposed to be called in the context of
another monitor, so assert that monitor_cur() is NULL instead of saving
and restoring it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor/qmp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 5e9abd4711..a04c512e3a 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -135,16 +135,15 @@ static void monitor_qmp_respond(MonitorQMP *mon, QDict *rsp)
 
 static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
 {
-    Monitor *old_mon;
     QDict *rsp;
     QDict *error;
 
-    old_mon = monitor_cur();
+    assert(monitor_cur() == NULL);
     monitor_set_cur(&mon->common);
 
     rsp = qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon));
 
-    monitor_set_cur(old_mon);
+    monitor_set_cur(NULL);
 
     if (mon->commands == &qmp_cap_negotiation_commands) {
         error = qdict_get_qdict(rsp, "error");
-- 
2.25.4


