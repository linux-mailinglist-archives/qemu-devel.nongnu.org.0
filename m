Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B1255A3A4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:36:05 +0200 (CEST)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4qyC-0000wH-Rw
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrv-0008TS-Ca; Fri, 24 Jun 2022 17:29:35 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:41176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrt-0004Rs-GN; Fri, 24 Jun 2022 17:29:35 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id ACE422E2FB3;
 Sat, 25 Jun 2022 00:29:26 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 iWlKxwzzsW-TQJ8PYif; Sat, 25 Jun 2022 00:29:26 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106166; bh=QTd9v+2pG7+Zhhzlxt/oDeImZYaQ6FYymHbDkKVxtoY=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=bvy3/vtp2vFzBHdGa/2kj+9cd/y685TgFoIhJVwItgyWgovCxgjzW0lTt1Q16QUVv
 Icb98hUMYizoCpTGs43T4tqfRhnot9X901cwvLuV8jwdSSJxSe6a++dZ87eaSr4lqK
 wMzGa97lr/d5/vsA/PU0xTVu0ZOOVdXLWpEf7DRc=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TQMSBIIV; Sat, 25 Jun 2022 00:29:26 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v6 07/15] block: document connection between child roles and
 bs->backing/bs->file
Date: Sat, 25 Jun 2022 00:28:22 +0300
Message-Id: <20220624212830.316919-8-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the informal rules formal. In further commit we'll add
corresponding assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/block/block-common.h | 39 ++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index fdb7306e78..fda67a7c38 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -313,6 +313,45 @@ enum {
  *
  * At least one of DATA, METADATA, FILTERED, or COW must be set for
  * every child.
+ *
+ *
+ * = Connection with bs->children, bs->file and bs->backing fields =
+ *
+ * 1. Filters
+ *
+ * Filter drivers have drv->is_filter = true.
+ *
+ * Filter node has exactly one FILTERED|PRIMARY child, and may have other
+ * children which must not have these bits (one example is the
+ * copy-before-write filter, which also has its target DATA child).
+ *
+ * Filter nodes never have COW children.
+ *
+ * For most filters, the filtered child is linked in bs->file, bs->backing is
+ * NULL.  For some filters (as an exception), it is the other way around; those
+ * drivers will have drv->filtered_child_is_backing set to true (see that
+ * field’s documentation for what drivers this concerns)
+ *
+ * 2. "raw" driver (block/raw-format.c)
+ *
+ * Formally it's not a filter (drv->is_filter = false)
+ *
+ * bs->backing is always NULL
+ *
+ * Only has one child, linked in bs->file. Its role is either FILTERED|PRIMARY
+ * (like filter) or DATA|PRIMARY depending on options.
+ *
+ * 3. Other drivers
+ *
+ * Don't have any FILTERED children.
+ *
+ * May have at most one COW child. In this case it's linked in bs->backing.
+ * Otherwise bs->backing is NULL. COW child is never PRIMARY.
+ *
+ * May have at most one PRIMARY child. In this case it's linked in bs->file.
+ * Otherwise bs->file is NULL.
+ *
+ * May also have some other children that don't have the PRIMARY or COW bit set.
  */
 enum BdrvChildRoleBits {
     /*
-- 
2.25.1


