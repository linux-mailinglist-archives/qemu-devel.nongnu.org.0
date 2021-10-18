Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE443261F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:11:07 +0200 (CEST)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcX6I-0005Oq-8b
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ari@tuxera.com>)
 id 1mcX41-00043y-F4; Mon, 18 Oct 2021 14:08:45 -0400
Received: from mgw-02.mpynet.fi ([82.197.21.91]:38888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ari@tuxera.com>)
 id 1mcX3u-0005pn-Ga; Mon, 18 Oct 2021 14:08:44 -0400
Received: from pps.filterd (mgw-02.mpynet.fi [127.0.0.1])
 by mgw-02.mpynet.fi (8.16.0.43/8.16.0.43) with SMTP id 19IHjen0001386;
 Mon, 18 Oct 2021 21:08:32 +0300
Received: from ex13.tuxera.com (ex13.tuxera.com [178.16.184.72])
 by mgw-02.mpynet.fi with ESMTP id 3bs3raree2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 21:08:32 +0300
Received: from giga-user.srv.tuxera.com (194.100.106.190) by
 tuxera-exch.ad.tuxera.com (10.20.48.11) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 18 Oct 2021 21:08:31 +0300
From: Ari Sundholm <ari@tuxera.com>
To: <qemu-block@nongnu.org>
Subject: [PATCH] block/file-posix: Fix return value translation for AIO
 discards.
Date: Mon, 18 Oct 2021 21:07:53 +0300
Message-ID: <20211018180753.2436008-1-ari@tuxera.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [194.100.106.190]
X-ClientProxiedBy: tuxera-exch.ad.tuxera.com (10.20.48.11) To
 tuxera-exch.ad.tuxera.com (10.20.48.11)
X-Proofpoint-GUID: g4Ak1jaYrJe5IjUurh_nLfv4b-fvw8Gc
X-Proofpoint-ORIG-GUID: g4Ak1jaYrJe5IjUurh_nLfv4b-fvw8Gc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-18_07:2021-10-18,
 2021-10-18 signatures=0
X-Proofpoint-Spam-Details: rule=mpy_notspam policy=mpy score=0 spamscore=0
 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110180101
Received-SPF: pass client-ip=82.197.21.91; envelope-from=ari@tuxera.com;
 helo=mgw-02.mpynet.fi
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Emil Karlson <jkarlson@tuxera.com>, Hanna Reitz <hreitz@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Ari Sundholm <ari@tuxera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AIO discards regressed as a result of the following commit:
	0dfc7af2 block/file-posix: Optimize for macOS

When trying to run blkdiscard within a Linux guest, the request would
fail, with some errors in dmesg:

---- [ snip ] ----
[    4.010070] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[    4.011061] sd 2:0:0:0: [sda] tag#0 Sense Key : Aborted Command
[current]
[    4.011061] sd 2:0:0:0: [sda] tag#0 Add. Sense: I/O process
terminated
[    4.011061] sd 2:0:0:0: [sda] tag#0 CDB: Unmap/Read sub-channel 42
00 00 00 00 00 00 00 18 00
[    4.011061] blk_update_request: I/O error, dev sda, sector 0
---- [ snip ] ----

This turns out to be a result of a flaw in changes to the error value
translation logic in handle_aiocb_discard(). The default return value
may be left untranslated in some configurations, and the wrong variable
is used in one translation.

Fix both issues.

Signed-off-by: Ari Sundholm <ari@tuxera.com>
Signed-off-by: Emil Karlson <jkarlson@tuxera.com>
---
 block/file-posix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 53be0bdc1b..6def2a4cba 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1807,7 +1807,7 @@ static int handle_aiocb_copy_range(void *opaque)
 static int handle_aiocb_discard(void *opaque)
 {
     RawPosixAIOData *aiocb = opaque;
-    int ret = -EOPNOTSUPP;
+    int ret = -ENOTSUP;
     BDRVRawState *s = aiocb->bs->opaque;
 
     if (!s->has_discard) {
@@ -1829,7 +1829,7 @@ static int handle_aiocb_discard(void *opaque)
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
         ret = do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
                            aiocb->aio_offset, aiocb->aio_nbytes);
-        ret = translate_err(-errno);
+        ret = translate_err(ret);
 #elif defined(__APPLE__) && (__MACH__)
         fpunchhole_t fpunchhole;
         fpunchhole.fp_flags = 0;
-- 
2.31.1


