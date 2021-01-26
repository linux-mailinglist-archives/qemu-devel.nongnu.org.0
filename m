Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710C6304132
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:00:05 +0100 (CET)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pp6-00051X-4F
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEZ-0001IK-8n
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PES-0006bj-QC
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lY0hdjsjN3fztPAk9OlWziM+bPR/G3gly7Y3/8acPIg=;
 b=PoaPCZM7OBODAbyXToISrzLNqHyWjgCzKbhUl62ZgmWoAmVzkm5mAQqix3fHkgpSpv53LU
 pMVrRCfnaeUtfIKMREoPMWEHbtXfUKPMMWenbrd1Zv+Fu0G/5vY67Y/trj9XeDvDG6tabp
 8zivL2JOkCT+PiIDh9iU4T+0/82wspk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-IyeZHNL_MVCG0mxaujZunQ-1; Tue, 26 Jan 2021 09:22:09 -0500
X-MC-Unique: IyeZHNL_MVCG0mxaujZunQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 694B38144E2;
 Tue, 26 Jan 2021 14:22:08 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AF4B60C62;
 Tue, 26 Jan 2021 14:22:07 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 48/53] simplebench: bench_block_job: add cmd_options argument
Date: Tue, 26 Jan 2021 15:20:11 +0100
Message-Id: <20210126142016.806073-49-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add argument to allow additional block-job options.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-23-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/bench-example.py   |  2 +-
 scripts/simplebench/bench_block_job.py | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/bench-example.py
index d9c7f7bc17..4864435f39 100644
--- a/scripts/simplebench/bench-example.py
+++ b/scripts/simplebench/bench-example.py
@@ -25,7 +25,7 @@ from bench_block_job import bench_block_copy, drv_file, drv_nbd
 
 def bench_func(env, case):
     """ Handle one "cell" of benchmarking table. """
-    return bench_block_copy(env['qemu_binary'], env['cmd'],
+    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
                             case['source'], case['target'])
 
 
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index a0dda1dc4e..7332845c1c 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -78,16 +78,19 @@ def bench_block_job(cmd, cmd_args, qemu_args):
 
 
 # Bench backup or mirror
-def bench_block_copy(qemu_binary, cmd, source, target):
+def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
     """Helper to run bench_block_job() for mirror or backup"""
     assert cmd in ('blockdev-backup', 'blockdev-mirror')
 
     source['node-name'] = 'source'
     target['node-name'] = 'target'
 
-    return bench_block_job(cmd,
-                           {'job-id': 'job0', 'device': 'source',
-                            'target': 'target', 'sync': 'full'},
+    cmd_options['job-id'] = 'job0'
+    cmd_options['device'] = 'source'
+    cmd_options['target'] = 'target'
+    cmd_options['sync'] = 'full'
+
+    return bench_block_job(cmd, cmd_options,
                            [qemu_binary,
                             '-blockdev', json.dumps(source),
                             '-blockdev', json.dumps(target)])
-- 
2.29.2


