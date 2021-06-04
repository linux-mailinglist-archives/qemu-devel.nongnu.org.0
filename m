Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D17839BE92
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:23:02 +0200 (CEST)
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDXB-0006gA-FP
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6896dd161d3257db6b0513842a14f87ca191fdf6@lizzy.crudebyte.com>)
 id 1lpCnc-0007El-UK
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:35:57 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:59311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6896dd161d3257db6b0513842a14f87ca191fdf6@lizzy.crudebyte.com>)
 id 1lpCnb-00037N-FV
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=AvlYVgDbCFL+PEEhnM2x/fDjDGnHpevXDoiTtJfZ0OY=; b=AVrYa
 CYrpDbt+Rv0lwGY5xyQ3zwWGF3KyL0hbSUb/UygKDpX643e5dPZGTUv0yLjXtUJhYOmI+L2ycYZDP
 Q03X/ic+LEiyubsecABdcWW1tEeAiS7VCxUuWwec96XFxXhF3p5l30lhxASUT/o0forWRiAeHaAr8
 aiiiqGkJEccIRP18gLUA14fAsrSUOlyrv5wYuKgV6HCxAG6Jv4Z6s623M4zDvS7KGJEj68Swi83z7
 Rdc88v6Q7ftvzUbCrO8V1Ug98rho/WU6Zumf1G8JK92p+nAgK52rKV6JLI34P0v2OLEwamJUb1rwX
 UHha8q/ZvnTcw7t+E0YEEDgQkFx9w==;
Message-Id: <6896dd161d3257db6b0513842a14f87ca191fdf6.1622821729.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1622821729.git.qemu_oss@crudebyte.com>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 4 Jun 2021 17:32:48 +0200
Subject: [PATCH v2 6/7] 9pfs: drop root_qid
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6896dd161d3257db6b0513842a14f87ca191fdf6@lizzy.crudebyte.com;
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

There is no longer a user of root_qid, so drop it.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 1 -
 hw/9pfs/9p.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 47b000d3a9..7be07f2d68 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1444,7 +1444,6 @@ static void coroutine_fn v9fs_attach(void *opaque)
     }
     err += offset;
 
-    memcpy(&s->root_qid, &qid, sizeof(qid));
     memcpy(&s->root_st, &stbuf, sizeof(stbuf));
     trace_v9fs_attach_return(pdu->tag, pdu->id,
                              qid.type, qid.version, qid.path);
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 6f0b4c78c0..1567b67841 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -355,7 +355,6 @@ struct V9fsState {
     int32_t root_fid;
     Error *migration_blocker;
     V9fsConf fsconf;
-    V9fsQID root_qid;
     struct stat root_st;
     dev_t dev_id;
     struct qht qpd_table;
-- 
2.20.1


