Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA8821085D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 11:39:47 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqZDW-0003lv-A8
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 05:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jqZA5-0007aX-8P
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 05:36:13 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21350
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jqZA1-0006x4-2c
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 05:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593596167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gw+oDzo87kbNE6DVmYaJuRjoOHPOUwbRdvW0IdU8jfs=;
 b=LYVmV+4HfrKFDdWkHcc+nZpk6mrkRdxBBq5IOhrff0bvxkGUc3PAR4cDFQWH25NFDg+V2r
 aMoF2UZFyGu/JIMU6fcOZdMlS0zyGijKoqdZw+sTFNQlm60HtCGQQDeOhFq8C+stfbO3LF
 RYav6R5H25mRFMPgLAzOqZcwZyKCz9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-byIr0lPXOruoAFhYugMkEw-1; Wed, 01 Jul 2020 05:36:00 -0400
X-MC-Unique: byIr0lPXOruoAFhYugMkEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA204800D5C
 for <qemu-devel@nongnu.org>; Wed,  1 Jul 2020 09:35:59 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E7E08ACEA;
 Wed,  1 Jul 2020 09:35:58 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	quintela@redhat.com,
	thuth@redhat.com
Subject: [PATCH] migration: postcopy take proper error return
Date: Wed,  1 Jul 2020 10:35:57 +0100
Message-Id: <20200701093557.130096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 01:05:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

This function returns a boolean success and we're returning -1;
lets just use the 'out' error path.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Fixes: 58b7c17e226 ("Disable mlock around incoming postcopy")
Buglink: https://bugs.launchpad.net/qemu/+bug/1885720
---
 migration/postcopy-ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index a36402722b..bef2a3afed 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -389,7 +389,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
      */
     if (munlockall()) {
         error_report("%s: munlockall: %s", __func__,  strerror(errno));
-        return -1;
+        goto out;
     }
 
     /*
-- 
2.26.2


