Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F13BBC8D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:01:09 +0200 (CEST)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0NHg-0004tD-Gb
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <232a4d2c25c3a83e148116a15f992f728c3579e6@lizzy.crudebyte.com>)
 id 1m0NFQ-0003Ha-RJ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:58:50 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:50909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <232a4d2c25c3a83e148116a15f992f728c3579e6@lizzy.crudebyte.com>)
 id 1m0NFO-0007pq-LM
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 07:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=kVr4PFd0/w/uB0VDR3o0xUnWEBVfIo72/5/LCc1R0c4=; b=LiKlm
 SyM5qjyPK52jr9se8yvQjUvnu5ea8mnMTNC3n5sF23qyCZSQFl4X52UWa/hrmzDw1lZMkvy0u4DtT
 ev2w87twbSZ3OEP7pdjKLpUnh0L7k7wmR9b0Vs3y1Z0A5YyEh0l+X1Um/jImt42hNPIZ8LXVQMdA2
 elq/YkQSZHTu8mQAA2iLtFX1BvZwUwY+VAwmsq+cjep8LP/NSVasqrEyTqdSfxYCAJf3fdn4oQHzd
 ZUjwz8bpqHtmWylOvMkStwYherVnvc1EzoR4mp/ngwx56YyEZvKOVAeedCNtrhWUNkLgrFT2VOkrh
 /YfZRye+CnTpUXysrmCTu7as2HIrA==;
Message-Id: <232a4d2c25c3a83e148116a15f992f728c3579e6.1625483630.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1625483630.git.qemu_oss@crudebyte.com>
References: <cover.1625483630.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 05 Jul 2021 13:13:51 +0200
Subject: [PULL 2/8] 9pfs: simplify v9fs_walk()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=232a4d2c25c3a83e148116a15f992f728c3579e6@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one comparison between nwnames and P9_MAXWELEM required.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <E1liKiz-0006BC-Ja@lizzy.crudebyte.com>
---
 hw/9pfs/9p.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 0fa776af09..89aa07db78 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1739,7 +1739,11 @@ static void coroutine_fn v9fs_walk(void *opaque)
 
     trace_v9fs_walk(pdu->tag, pdu->id, fid, newfid, nwnames);
 
-    if (nwnames && nwnames <= P9_MAXWELEM) {
+    if (nwnames > P9_MAXWELEM) {
+        err = -EINVAL;
+        goto out_nofid;
+    }
+    if (nwnames) {
         wnames = g_new0(V9fsString, nwnames);
         qids   = g_new0(V9fsQID, nwnames);
         for (i = 0; i < nwnames; i++) {
@@ -1753,9 +1757,6 @@ static void coroutine_fn v9fs_walk(void *opaque)
             }
             offset += err;
         }
-    } else if (nwnames > P9_MAXWELEM) {
-        err = -EINVAL;
-        goto out_nofid;
     }
     fidp = get_fid(pdu, fid);
     if (fidp == NULL) {
-- 
2.20.1


