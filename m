Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF555A383
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:33:03 +0200 (CEST)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4qv9-0003W7-4r
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrt-0008Rq-Jt; Fri, 24 Jun 2022 17:29:33 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:44386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrp-0004Py-Na; Fri, 24 Jun 2022 17:29:32 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id DD5F72E1FC1;
 Sat, 25 Jun 2022 00:29:19 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 qhZ1u3EnLr-TJJWMNKb; Sat, 25 Jun 2022 00:29:19 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106159; bh=rfPvxe0gtN70k8fClxm+exj+t0N3i1QAWisJ3IC7lw0=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=B+zzQA79a6YU8pdpcNXIJfXBV389vhr/Al52qOBFS3SfXAnWALWQ2JOOuDO/261lZ
 pQ6WcjSdSpCjIyp19b8CRs0j9S91XD1Zv0ts8Q+v41uq4jqR3nYwVd1O0kGRL6FEaE
 lOLI5wpbmfbCZSnwK7njA1Y0ORt3snaNnRWetQSM=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TJMSgvkf; Sat, 25 Jun 2022 00:29:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, John Snow <jsnow@redhat.com>
Subject: [PATCH v6 01/15] block: BlockDriver: add .filtered_child_is_backing
 field
Date: Sat, 25 Jun 2022 00:28:16 +0300
Message-Id: <20220624212830.316919-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
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

Unfortunately not all filters use .file child as filtered child. Two
exclusions are mirror_top and commit_top. Happily they both are private
filters. Bad thing is that this inconsistency is observable through qmp
commands query-block / query-named-block-nodes. So, could we just
change mirror_top and commit_top to use file child as all other filter
driver is an open question. Probably, we could do that with some kind
of deprecation period, but how to warn users during it?

For now, let's just add a field so we can distinguish them in generic
code, it will be used in further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/commit.c                   |  1 +
 block/mirror.c                   |  1 +
 include/block/block_int-common.h | 13 +++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/block/commit.c b/block/commit.c
index 851d1c557a..7722a392af 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -238,6 +238,7 @@ static BlockDriver bdrv_commit_top = {
     .bdrv_child_perm            = bdrv_commit_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 void commit_start(const char *job_id, BlockDriverState *bs,
diff --git a/block/mirror.c b/block/mirror.c
index d8ecb9efa2..824b273fc7 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1578,6 +1578,7 @@ static BlockDriver bdrv_mirror_top = {
     .bdrv_child_perm            = bdrv_mirror_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 static BlockJob *mirror_start_job(
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..9d91ccbcbf 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -119,6 +119,19 @@ struct BlockDriver {
      * (And this filtered child must then be bs->file or bs->backing.)
      */
     bool is_filter;
+    /*
+     * Only make sense for filter drivers, for others must be false.
+     * If true, filtered child is bs->backing. Otherwise it's bs->file.
+     * Only two internal filters use bs->backing as filtered child and has this
+     * field set to true: mirror_top and commit_top.
+     *
+     * Never create any more such filters!
+     *
+     * TODO: imagine how to deprecate this behavior and make all filters work
+     * similarly using bs->file as filtered child.
+     */
+    bool filtered_child_is_backing;
+
     /*
      * Set to true if the BlockDriver is a format driver.  Format nodes
      * generally do not expect their children to be other format nodes
-- 
2.25.1


