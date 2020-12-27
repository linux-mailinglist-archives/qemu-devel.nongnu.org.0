Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC32E31E0
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 17:44:45 +0100 (CET)
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZ9w-0002xs-IT
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 11:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZ8C-0001OV-35
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:42:57 -0500
Received: from kerio.kamp.de ([195.62.97.192]:33894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZ89-0003wt-Pk
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:42:55 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 17:42:42 +0100
Received: (qmail 22374 invoked from network); 27 Dec 2020 16:42:44 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 27 Dec 2020 16:42:44 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 6772013DD28; Sun, 27 Dec 2020 17:42:44 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH 7/7] block/rbd: change request alignment to 1 byte
Date: Sun, 27 Dec 2020 17:42:36 +0100
Message-Id: <20201227164236.10143-8-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201227164236.10143-1-pl@kamp.de>
References: <20201227164236.10143-1-pl@kamp.de>
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ct@flyingcircus.io, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

since we implement byte interfaces and librbd supports aio on byte granularity we can lift
the 512 byte alignment.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 27b4404adf..8673e8f553 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -223,8 +223,6 @@ done:
 static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVRBDState *s = bs->opaque;
-    /* XXX Does RBD support AIO on less than 512-byte alignment? */
-    bs->bl.request_alignment = 512;
 #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
     bs->bl.pwrite_zeroes_alignment = s->object_size;
 #endif
-- 
2.17.1



