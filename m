Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1386F5C3E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 18:51:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puFgc-0004jq-U5; Wed, 03 May 2023 12:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puFga-0004jY-3s
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puFgY-00022f-6C
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683132633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xadYtkcnEM+WT5RFWy/7wy8ltsLp6Cp5207ul9kqQiM=;
 b=H/JgBuTQdHu9xaxh5rw6KuAkg0A3+3oWsJ30rfssxFBV8kBXW3qKFfEmCh9HL2VjPvXR1J
 OdFTYdHO7LtMeu2+d7CzBcxZjZTdd7yC88XxS1hULMRJ+FzE2KboeNdTIW+fenKsPSYgH8
 QsDNh90P/AWfk0NGBVPwtC9cPo9V3Ow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-tjiPqPbpNn62fRd_KLGCiQ-1; Wed, 03 May 2023 12:50:29 -0400
X-MC-Unique: tjiPqPbpNn62fRd_KLGCiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 459F3886461;
 Wed,  3 May 2023 16:50:29 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FEF4C15BAD;
 Wed,  3 May 2023 16:50:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@virtuozzo.com,
 nikita.lapshin@virtuozzo.com, qemu-devel@nongnu.org
Subject: [PATCH] iotests/nbd-reconnect-on-open: Fix NBD socket path
Date: Wed,  3 May 2023 18:50:19 +0200
Message-Id: <20230503165019.8867-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Socket paths need to be short to avoid failures. This is why there is a
iotests.sock_dir (defaulting to /tmp) separate from the disk image base
directory.

Make use of it to fix failures in too deeply nested test directories.

Fixes: ab7f7e67a7e7b49964109501dfcde4ec29bae60e
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/tests/nbd-reconnect-on-open     | 3 ++-
 tests/qemu-iotests/tests/nbd-reconnect-on-open.out | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/tests/nbd-reconnect-on-open b/tests/qemu-iotests/tests/nbd-reconnect-on-open
index d0b401b060..3ce52021c3 100755
--- a/tests/qemu-iotests/tests/nbd-reconnect-on-open
+++ b/tests/qemu-iotests/tests/nbd-reconnect-on-open
@@ -26,7 +26,8 @@ from iotests import qemu_img_create, file_path, qemu_io_popen, qemu_nbd, \
 
 iotests.script_initialize(supported_fmts=['qcow2'])
 
-disk, nbd_sock = file_path('disk', 'nbd-sock')
+disk = file_path('disk')
+nbd_sock = file_path('nbd-sock', base_dir=iotests.sock_dir)
 
 
 def create_args(open_timeout):
diff --git a/tests/qemu-iotests/tests/nbd-reconnect-on-open.out b/tests/qemu-iotests/tests/nbd-reconnect-on-open.out
index a35ae30ea4..b3dd90f2a3 100644
--- a/tests/qemu-iotests/tests/nbd-reconnect-on-open.out
+++ b/tests/qemu-iotests/tests/nbd-reconnect-on-open.out
@@ -2,10 +2,10 @@ read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 Check fail to connect with 0 seconds of timeout
-qemu-io: can't open: Failed to connect to 'TEST_DIR/PID-nbd-sock': No such file or directory
+qemu-io: can't open: Failed to connect to 'SOCK_DIR/PID-nbd-sock': No such file or directory
 
 qemu_io finished in 0..0.2 seconds, OK
 Check fail to connect with 1 seconds of timeout
-qemu-io: can't open: Failed to connect to 'TEST_DIR/PID-nbd-sock': No such file or directory
+qemu-io: can't open: Failed to connect to 'SOCK_DIR/PID-nbd-sock': No such file or directory
 
 qemu_io finished in 1..1.2 seconds, OK
-- 
2.40.1


