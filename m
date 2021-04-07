Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1313569A3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:29:05 +0200 (CEST)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5Qm-0007Xs-MK
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lU5Ie-0000I5-KL
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lU5Ic-0002e7-W9
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617790838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ObZ2vlQK97CMHKkNw/SiRADijpH8mwk57xEQkdO/b8k=;
 b=FZiUwsV9ZUhy2/Eai4eJNWU+uV+IIcsK8zmNIPxVZK2Gq+TNmS1w2kNj6OE4exd1GzTqY0
 TiRuLFfSncQWLVUiemKj37QCvTXIj1cjWcVKgbsLYhjLb431EbKh0HPcq8cCDdvQ+LVxyY
 rX3v6DKuc83lq/2HaLzDe9nnaDj6sYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-MDtY5fsTNralKfw1RdAHbw-1; Wed, 07 Apr 2021 06:20:34 -0400
X-MC-Unique: MDtY5fsTNralKfw1RdAHbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49DE3CC621;
 Wed,  7 Apr 2021 10:20:33 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-14.ams2.redhat.com
 [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70A4E100F49F;
 Wed,  7 Apr 2021 10:20:32 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com,
 huangy81@chinatelecom.cn
Subject: [PULL 6/6] tests/migration: fix parameter of auto-converge migration
Date: Wed,  7 Apr 2021 11:20:21 +0100
Message-Id: <20210407102021.95225-7-dgilbert@redhat.com>
In-Reply-To: <20210407102021.95225-1-dgilbert@redhat.com>
References: <20210407102021.95225-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

when execute the following test command:
$ ./guestperf-batch.py --auto-converge \
    --auto-converge-step {percent} ...
test aborts and error message be throwed as the following:
"Parameter 'x-cpu-throttle-increment' is unexpected"

The reason is that 'x-cpu-throttle-increment' has been
deprecated and 'cpu-throttle-increment' was introduced
Since v2.7. Use the new parameter instead.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Message-Id: <0195d34a317ce3cc417b3efd275e30cad35a7618.1616513998.git.huangy81@chinatelecom.cn>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/migration/guestperf/engine.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index e399447940..6b49aed579 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -102,7 +102,7 @@ def _migrate_progress(self, vm):
             info.get("downtime", 0),
             info.get("expected-downtime", 0),
             info.get("setup-time", 0),
-            info.get("x-cpu-throttle-percentage", 0),
+            info.get("cpu-throttle-percentage", 0),
         )
 
     def _migrate(self, hardware, scenario, src, dst, connect_uri):
@@ -135,7 +135,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                                      "state": True }
                                ])
             resp = src.command("migrate-set-parameters",
-                               x_cpu_throttle_increment=scenario._auto_converge_step)
+                               cpu_throttle_increment=scenario._auto_converge_step)
 
         if scenario._post_copy:
             resp = src.command("migrate-set-capabilities",
-- 
2.31.1


