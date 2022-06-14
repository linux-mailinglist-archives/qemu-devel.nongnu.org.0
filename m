Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AD554AEDB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:54:53 +0200 (CEST)
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o14CC-000896-O1
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13o2-0001Q7-Ve; Tue, 14 Jun 2022 06:29:55 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:58138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nm-0000lJ-GY; Tue, 14 Jun 2022 06:29:54 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 172A42E0F62;
 Tue, 14 Jun 2022 13:29:30 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 NtVmLVszFN-TTJ4qBHS; Tue, 14 Jun 2022 13:29:30 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202570; bh=QbBmnNTbe6iFswnTCsMsaH0sPayNHQ3LBnxNAT+S6qA=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=B9X7090X+vwcxN+2ZvBS+QYkKCSx2REx3PL7EsX98U8fJXRTy+4hlj3YKc56jdbRl
 vZcqccFWU7KPjMePJUAL9K8fYBJke73BoLMKA2rD0ytCCarTHRaAx7+iM/U3r6+PDB
 j2b23cuI0NTFTPwofMjwCWPnnfRkKMjn7LSaC3C8=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TSMmgb3G; Tue, 14 Jun 2022 13:29:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org,
 "Denis V. Lunev" <den@openvz.org>, John Snow <jsnow@redhat.com>
Subject: [PULL 09/10] block: use 'unsigned' for in_flight field on driver state
Date: Tue, 14 Jun 2022 13:29:09 +0300
Message-Id: <20220614102910.1431380-10-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Denis V. Lunev" <den@openvz.org>

This patch makes in_flight field 'unsigned' for BDRVNBDState and
MirrorBlockJob. This matches the definition of this field on BDS
and is generically correct - we should never get negative value here.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: John Snow <jsnow@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/mirror.c | 2 +-
 block/nbd.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index d8ecb9efa2..3c4ab1159d 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -73,7 +73,7 @@ typedef struct MirrorBlockJob {
 
     uint64_t last_pause_ns;
     unsigned long *in_flight_bitmap;
-    int in_flight;
+    unsigned in_flight;
     int64_t bytes_in_flight;
     QTAILQ_HEAD(, MirrorOp) ops_in_flight;
     int ret;
diff --git a/block/nbd.c b/block/nbd.c
index bc8f128087..19e773d602 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -77,7 +77,7 @@ typedef struct BDRVNBDState {
     QemuMutex requests_lock;
     NBDClientState state;
     CoQueue free_sema;
-    int in_flight;
+    unsigned in_flight;
     NBDClientRequest requests[MAX_NBD_REQUESTS];
     QEMUTimer *reconnect_delay_timer;
 
-- 
2.25.1


