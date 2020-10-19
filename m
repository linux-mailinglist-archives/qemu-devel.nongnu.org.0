Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B80292BA8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 18:41:10 +0200 (CEST)
Received: from localhost ([::1]:48634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUYDd-0005RW-Dp
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 12:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kUY9z-0001oH-E8
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 12:37:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kUY9x-0006FE-QB
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 12:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603125441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0KZpg6Zs44MsxN8be3B2eLRzy7kH87QHxHii2Z6l14=;
 b=h4rcVfWyr8Sr+VO/cVugTMmvDw6mVjhwae+8EV2AdOVvcAFe/6EZfgdUIVTDsnr/dx7jPh
 lKNioo6+QyBtgiW22jQgaic2MfZheqZbG8p5iGU3uTmhJeMJamI3rOMMEDAW1AoD4pSoJc
 UAwfVgp6j2L9P1QSRObzBhA7SHIGuAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-f-fa8lPIORGJO9vTnDgL8w-1; Mon, 19 Oct 2020 12:37:18 -0400
X-MC-Unique: f-fa8lPIORGJO9vTnDgL8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A4941868403;
 Mon, 19 Oct 2020 16:37:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 853875B4AD;
 Mon, 19 Oct 2020 16:37:14 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] libqtest: fix the order of buffered events
Date: Mon, 19 Oct 2020 19:37:00 +0300
Message-Id: <20201019163702.471239-3-mlevitsk@redhat.com>
In-Reply-To: <20201019163702.471239-1-mlevitsk@redhat.com>
References: <20201019163702.471239-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By a mistake I added the pending events in a wrong order.
Fix this by using g_list_append.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 tests/qtest/libqtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 08929f5ff6..bd96cb6fdd 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -621,7 +621,7 @@ QDict *qtest_qmp_receive(QTestState *s)
             return response;
         }
         /* Stash the event for a later consumption */
-        s->pending_events = g_list_prepend(s->pending_events, response);
+        s->pending_events = g_list_append(s->pending_events, response);
     }
 }
 
-- 
2.26.2


