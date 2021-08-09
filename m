Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F33E41F9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:03:09 +0200 (CEST)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1Bc-0004AC-Gm
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1A4-0001C8-PC
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1A2-0001T9-CK
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628499688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJxVTqUYFCSpM3FbDc4m/eLTs4volXQcEmvIxCpnbs4=;
 b=XJBTCVIS2whZDNRVQ1Vd4G3YJHoyc8qD7Vs0vjIZPVSgH+JeaEy2/elM4B1cizLvkJE9rJ
 5d+x0BXiHDR9Wu9HzvAjF9gOb65BFyPTougIsE35XV8+yJHwH8Dj+vFW/4VDGuPfPnoBFX
 j4w3LL7FgM/dLGnJ0T7ya5pLbocxVnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-HMye3twRN8aCy2SWGcrszA-1; Mon, 09 Aug 2021 05:01:27 -0400
X-MC-Unique: HMye3twRN8aCy2SWGcrszA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DFE01084F5B;
 Mon,  9 Aug 2021 09:01:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C26BD60C25;
 Mon,  9 Aug 2021 09:01:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 03/16] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
Date: Mon,  9 Aug 2021 11:01:01 +0200
Message-Id: <20210809090114.64834-4-eesposit@redhat.com>
In-Reply-To: <20210809090114.64834-1-eesposit@redhat.com>
References: <20210809090114.64834-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Acked-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/qtest.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 592be263e0..395cc8fbfe 100644
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
@@ -123,7 +124,8 @@ def __init__(self,
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


