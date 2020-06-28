Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E89820C79A
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 13:17:50 +0200 (CEST)
Received: from localhost ([::1]:37676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpVJk-0004Ws-WD
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 07:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV6W-0007f5-5H; Sun, 28 Jun 2020 07:04:08 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV6M-0000Xq-1d; Sun, 28 Jun 2020 07:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=5q86OzsOKt/Py3cpreHKFjhS5m2/WJcDnGCV9QFfQgo=; 
 b=b9wA4h9gBjtQORW4uEodrII6js+NjZbL78LCcbrfZAcuog7Ljg3J161d5HD4ulzYAoGvsi4Xkeqq/z5thQo0Jm3W8RyZH6t1/lCis+41+KqlynTO9pc4sCnDGAJtplIhCoWHkeiMMmb2CmTpRL7xMZBS8oQMAw2+VBW7cHTu0O799BHkP0f5H47qzVauVpcSe34BsLX0Dc1ew6SUhsX/3WMZc9X1j0w05GEh3NBLEKa7hY1sLbAMXHS3fBCMMtzlrMXVhZs6mSf59jGgiAiKGrNxaKCkK9n9J9JOUIQcL3BtpktL2Skds6WRU1PSKt6YtEY3PI4PjSSLIXIir4ioqg==;
Received: from 26.red-79-158-236.dynamicip.rima-tde.net ([79.158.236.26]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jpV5Y-0002gv-Dm; Sun, 28 Jun 2020 13:03:10 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jpV5I-0003A6-EV; Sun, 28 Jun 2020 13:02:52 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 32/34] qcow2: Allow preallocation and backing files if
 extended_l2 is set
Date: Sun, 28 Jun 2020 13:02:41 +0200
Message-Id: <7bc65fa80f741d90be50ab25ede29b8e27aad677.1593342067.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1593342067.git.berto@igalia.com>
References: <cover.1593342067.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/28 07:03:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Derek Su <dereksu@qnap.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Traditional qcow2 images don't allow preallocation if a backing file
is set. This is because once a cluster is allocated there is no way to
tell that its data should be read from the backing file.

Extended L2 entries have individual allocation bits for each
subcluster, and therefore it is perfectly possible to have an
allocated cluster with all its subclusters unallocated.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.c              | 7 ++++---
 tests/qemu-iotests/206.out | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 37bfae823c..1ea8d3b87e 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3451,10 +3451,11 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         qcow2_opts->preallocation = PREALLOC_MODE_OFF;
     }
     if (qcow2_opts->has_backing_file &&
-        qcow2_opts->preallocation != PREALLOC_MODE_OFF)
+        qcow2_opts->preallocation != PREALLOC_MODE_OFF &&
+        !qcow2_opts->extended_l2)
     {
-        error_setg(errp, "Backing file and preallocation cannot be used at "
-                   "the same time");
+        error_setg(errp, "Backing file and preallocation can only be used at "
+                   "the same time if extended_l2 is on");
         ret = -EINVAL;
         goto out;
     }
diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index 363c5abe35..a100849fcb 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -203,7 +203,7 @@ Job failed: Different refcount widths than 16 bits require compatibility level 1
 === Invalid backing file options ===
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"backing-file": "/dev/null", "driver": "qcow2", "file": "node0", "preallocation": "full", "size": 67108864}}}
 {"return": {}}
-Job failed: Backing file and preallocation cannot be used at the same time
+Job failed: Backing file and preallocation can only be used at the same time if extended_l2 is on
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
-- 
2.20.1


