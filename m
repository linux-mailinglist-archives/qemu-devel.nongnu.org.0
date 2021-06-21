Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2663AE7B7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:56:21 +0200 (CEST)
Received: from localhost ([::1]:47726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHbI-00062G-QE
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvHFd-0008Sc-5y
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvHFa-0002FF-9v
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624271633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1L85CoB3wjKLuJXGJDskreXoSJA102S4oaPkBn+fYw=;
 b=POqPsFqDjGtnYRU31rRE/NUOsKhPwTswr63ZXP/tE7frMVSbc/KwJbnMhYLNAQAM8rn/Lj
 g5XCFIly+o/XY88So5sd5JPh4/qH8Dgzj0TUkGj+zVeA12KF2P/22RyAQD9Vkh7F+Mwfg8
 lwTfvRHQOazrN0b7z11snp2j6m50XZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-nN6X8NOeMeSqif-dGgeHOg-1; Mon, 21 Jun 2021 06:33:50 -0400
X-MC-Unique: nN6X8NOeMeSqif-dGgeHOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47D75A40DA;
 Mon, 21 Jun 2021 10:33:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-100.ams2.redhat.com
 [10.36.113.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C30D75D703;
 Mon, 21 Jun 2021 10:33:46 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 03/16] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
Date: Mon, 21 Jun 2021 12:33:24 +0200
Message-Id: <20210621103337.36637-4-eesposit@redhat.com>
In-Reply-To: <20210621103337.36637-1-eesposit@redhat.com>
References: <20210621103337.36637-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 python/qemu/machine/qtest.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 33a86a9d69..dc2b5ccfb1 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -112,6 +112,7 @@ class QEMUQtestMachine(QEMUMachine):
     def __init__(self,
                  binary: str,
                  args: Sequence[str] = (),
+                 wrapper: Sequence[str] = (),
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
                  socket_scm_helper: Optional[str] = None,
@@ -121,7 +122,8 @@ def __init__(self,
             name = "qemu-%d" % os.getpid()
         if sock_dir is None:
             sock_dir = base_temp_dir
-        super().__init__(binary, args, name=name, base_temp_dir=base_temp_dir,
+        super().__init__(binary, args, wrapper=wrapper, name=name,
+                         base_temp_dir=base_temp_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir, qmp_timer=qmp_timer)
         self._qtest: Optional[QEMUQtestProtocol] = None
-- 
2.31.1


