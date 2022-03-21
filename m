Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC214E322A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:11:07 +0100 (CET)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPIw-0005cR-Ky
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:11:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWPGp-0002KP-UX
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:08:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWPGn-0006PC-Rt
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647896933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Rh2PqKLn1WtX5VPupoQMBse2oAT2O3EOfDswiXPVQY=;
 b=Q27MV8eNCMnZsm9NCcq/msb1Mw058mjjWR2b2JDJqHns7KrUlxG0ezgCEFUapbzRiaBNTS
 tm3nctnEh+uWNCSRXIEZzrYYzkVWJj8LQ704CiGmRHmZgkTdD0zZbk7On3Bgyh5nKxEUTw
 dEVVpzohUqrXZO7xaxlZD3PhcpmlI1g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-2j1UfxlXMpqN_7GhLSjOuA-1; Mon, 21 Mar 2022 17:08:49 -0400
X-MC-Unique: 2j1UfxlXMpqN_7GhLSjOuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CBDA899EC2;
 Mon, 21 Mar 2022 21:08:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37E331121321;
 Mon, 21 Mar 2022 21:08:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] python: temporarily silence pylint duplicate-code
 warnings
Date: Mon, 21 Mar 2022 17:08:40 -0400
Message-Id: <20220321210847.914787-4-jsnow@redhat.com>
In-Reply-To: <20220321210847.914787-1-jsnow@redhat.com>
References: <20220321210847.914787-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next several commits copy some code from qemu.qmp to qemu.aqmp, then
delete qemu.qmp. In the interim, to prevent test failures, the duplicate
code detection needs to be silenced to prevent bisect problems with CI
testing.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 python/setup.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 241f243e8b..cdeced44d2 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -119,6 +119,7 @@ disable=consider-using-f-string,
         too-many-function-args,  # mypy handles this with less false positives.
         too-many-instance-attributes,
         no-member,  # mypy also handles this better.
+        duplicate-code,  # To be removed by the end of this patch series.
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.34.1


