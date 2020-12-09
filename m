Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EAD2D41E7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:19:07 +0100 (CET)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyQx-0002EW-Vf
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1kmyPt-0001bl-E9
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:17:57 -0500
Received: from kerio.kamp.de ([195.62.97.192]:45524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1kmyPq-0001gC-CZ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:17:57 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Wed, 9 Dec 2020 13:17:41 +0100
Received: (qmail 25607 invoked from network); 9 Dec 2020 12:17:43 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 9 Dec 2020 12:17:43 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 3483613D863; Wed,  9 Dec 2020 13:17:43 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH] block/nfs: fix int overflow in nfs_client_open_qdict
Date: Wed,  9 Dec 2020 13:17:35 +0100
Message-Id: <20201209121735.16437-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-stable@nongnu.org, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nfs_client_open returns the file size in sectors. This effectively
makes it impossible to open files larger than 1TB.

Fixes: a1a42af422d46812f1f0cebe6b230c20409a3731
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/nfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nfs.c b/block/nfs.c
index 77905f516d..8c1968bb41 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -592,7 +592,7 @@ static int64_t nfs_client_open_qdict(NFSClient *client, QDict *options,
                                      int flags, int open_flags, Error **errp)
 {
     BlockdevOptionsNfs *opts;
-    int ret;
+    int64_t ret;
 
     opts = nfs_options_qdict_to_qapi(options, errp);
     if (opts == NULL) {
-- 
2.17.1



