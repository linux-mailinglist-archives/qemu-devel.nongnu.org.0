Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FE050A3DC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:19:50 +0200 (CEST)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYau-0006pY-7W
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXU-0003M4-IF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXP-0005mJ-Jh
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtKbK/vGVVoUuw6SQ9XFFA9R7ww8R8/L0sjErm6vbhU=;
 b=QtJgzHOUxIk+Ct+u0YCj5ZEj9lladYkAvaPTwiWFj/kFRV+9hHbk8tsK+2qSIYo++OQgCK
 DF7il0FEdToju2p6qmODKDkUH8OqcTt0kkkEHYE1yRk5UTEGOLYPDtjaaLyYUN5TWuWesu
 mBcsAoa3J58O9g3fls9/UPUhW6KkvQo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457--ynYkHinOMKqPD6V8kozrA-1; Thu, 21 Apr 2022 11:16:03 -0400
X-MC-Unique: -ynYkHinOMKqPD6V8kozrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDAFB3C1E8E0;
 Thu, 21 Apr 2022 15:16:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D79F40D016A;
 Thu, 21 Apr 2022 15:16:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/17] scripts/bench-block-job: switch to AQMP
Date: Thu, 21 Apr 2022 11:15:45 -0400
Message-Id: <20220421151600.984189-3-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For this commit, we only need to remove accommodations for the
synchronous QMP library.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20220321203315.909411-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/bench_block_job.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index a403c35b08f..af9d1646a46 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -27,7 +27,6 @@
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
-from qemu.qmp import QMPConnectError
 from qemu.aqmp import ConnectError
 
 
@@ -50,7 +49,7 @@ def bench_block_job(cmd, cmd_args, qemu_args):
         vm.launch()
     except OSError as e:
         return {'error': 'popen failed: ' + str(e)}
-    except (QMPConnectError, ConnectError, socket.timeout):
+    except (ConnectError, socket.timeout):
         return {'error': 'qemu failed: ' + str(vm.get_log())}
 
     try:
-- 
2.34.1


