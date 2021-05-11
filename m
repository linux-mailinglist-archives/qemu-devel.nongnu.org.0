Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4337AC01
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:33:53 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVKS-0003Dj-L0
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgVIv-000285-AL
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgVIq-0002fG-5i
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620750730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OI8C4F44mdqR45dClMu3SVv0srsHjCDQ6EpXfzfmACw=;
 b=ShRrEQTYvpRwrHijHDtN+CtQ+WnS2LiE9XaBfHTqbx4jEUF+3rHySvoQG6FeVGiqnQ3Jqt
 EMzqX9A5l3Hlq3C1Tgp9XvvQ0TOlOX9gJqcaEG2tx2dOGqSPzB+/e6j6P20MZKdqUURmjw
 kBORB5gtNME5uqoQIbU5uWCA5t4JQNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-pWSP0XL1Mu6bG9nTBvQIVw-1; Tue, 11 May 2021 12:32:08 -0400
X-MC-Unique: pWSP0XL1Mu6bG9nTBvQIVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 584651926DB5;
 Tue, 11 May 2021 16:32:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-102.ams2.redhat.com [10.36.114.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E913E61094;
 Tue, 11 May 2021 16:32:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] hmp: Fix loadvm to resume the VM on success instead of failure
Date: Tue, 11 May 2021 18:31:51 +0200
Message-Id: <20210511163151.45167-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, dgilbert@redhat.com, yama@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit f61fe11aa6f broke hmp_loadvm() by adding an incorrect negation
when converting from 0/-errno return values to a bool value. The result
is that loadvm resumes the VM now if it failed and keeps it stopped if
it failed. Fix it to restore the old behaviour and do it the other way
around.

Fixes: f61fe11aa6f7f8f0ffe4ddaa56a8108f3ab57854
Cc: qemu-stable@nongnu.org
Reported-by: Yanhui Ma <yama@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0ad5b77477..cc15d9b6ee 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1133,7 +1133,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict)
 
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    if (!load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
+    if (load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
         vm_start();
     }
     hmp_handle_error(mon, err);
-- 
2.30.2


