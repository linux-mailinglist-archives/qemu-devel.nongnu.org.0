Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4D30FB20
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:22:10 +0100 (CET)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jGb-0001QW-HL
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIR-0007yO-0L
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIM-0005fU-N1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+dFkQvnpIVQG/XnH90lIcEW7Ht35GJJEArZQe3Yscc=;
 b=ioSbs6pAxK6uxMm1olN68XknsE4TGIxhM/9EnCDf/2iRYgqJxU9qy/kKgRA0Aj9sgNPizY
 EO0aKp4bFekNTeApcrHJ2j39w3JNnzFGOw07TEnDCafMf5ZEXdqth20ATl4MO0VE1nB36y
 1lGFOOvWDCgsZbvRRaaFDYKrPsnVv8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-U_hDiglQP0mhrFvF5uE9mA-1; Thu, 04 Feb 2021 12:19:52 -0500
X-MC-Unique: U_hDiglQP0mhrFvF5uE9mA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D076801981;
 Thu,  4 Feb 2021 17:19:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 198BA60937;
 Thu,  4 Feb 2021 17:19:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/33] migration: remove error reporting from
 qemu_fopen_bdrv() callers
Date: Thu,  4 Feb 2021 17:18:55 +0000
Message-Id: <20210204171907.901471-22-berrange@redhat.com>
In-Reply-To: <20210204171907.901471-1-berrange@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This method cannot fail since it merely allocates a single struct, so
the only possible failure (ENOMEM) will cause an abort() already.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/savevm.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index c18b7e6033..6a7b930b1c 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2861,10 +2861,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
 
     /* save the VM state */
     f = qemu_fopen_bdrv(bs, 1);
-    if (!f) {
-        error_setg(errp, "Could not open VM state file");
-        goto the_end;
-    }
+
     ret = qemu_savevm_state(f, errp);
     vm_state_size = qemu_ftell(f);
     ret2 = qemu_fclose(f);
@@ -3041,10 +3038,6 @@ bool load_snapshot(const char *name, const char *vmstate,
 
     /* restore the VM state */
     f = qemu_fopen_bdrv(bs_vm_state, 0);
-    if (!f) {
-        error_setg(errp, "Could not open VM state file");
-        goto err_drain;
-    }
 
     qemu_system_reset(SHUTDOWN_CAUSE_NONE);
     mis->from_src_file = f;
-- 
2.29.2


