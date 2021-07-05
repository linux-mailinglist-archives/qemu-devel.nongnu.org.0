Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1B3BBB24
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:20:35 +0200 (CEST)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LiM-0008L3-PA
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LT9-0004QL-Hj
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LT7-0001uk-QW
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625479489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlwcdX8X5dsd/z20z7tWtn3wTUKnsr62oy9WKZNwWOM=;
 b=FUj9GpyIT2ZutmP4xFeDAXxcxkkuAVhsly030Fj+QoABAPGhL4ufS+BuEp8YNMKcNJ+vdP
 t7cw2px+DIfqTEAsoqjW3gyPYtJax1Qm/P7HynBbFhSOSi4FWv2+FwbhBWx2BHF8TvZrXs
 ikqRfneK6zDG4igsgt0IkfKZKv26i5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-0CNcGVw3OtC8OrBwQV0NIg-1; Mon, 05 Jul 2021 06:04:47 -0400
X-MC-Unique: 0CNcGVw3OtC8OrBwQV0NIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 850861800D41;
 Mon,  5 Jul 2021 10:04:46 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-11.ams2.redhat.com
 [10.36.114.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4170C60C0F;
 Mon,  5 Jul 2021 10:04:44 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 18/19] tests/migration: fix "downtime_limit" type when
 "migrate-set-parameters"
Date: Mon,  5 Jul 2021 11:02:34 +0100
Message-Id: <20210705100235.157093-19-dgilbert@redhat.com>
In-Reply-To: <20210705100235.157093-1-dgilbert@redhat.com>
References: <20210705100235.157093-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

migrate-set-parameters parse "downtime_limit" as integer type when
execute "migrate-set-parameters" before migration, and, the unit
dowtime_limit is milliseconds, fix this two so that test can go
smoothly.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Message-Id: <31d82df24cc0c468dbe4d2d86730158ebf248071.1622729934.git.huangy81@chinatelecom.cn>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/migration/guestperf/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 9e16fa92d2..7c991c4407 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -153,7 +153,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                            max_bandwidth=scenario._bandwidth * 1024 * 1024)
 
         resp = src.command("migrate-set-parameters",
-                           downtime_limit=scenario._downtime / 1024.0)
+                           downtime_limit=scenario._downtime)
 
         if scenario._compression_mt:
             resp = src.command("migrate-set-capabilities",
-- 
2.31.1


