Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB2725AADF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 14:11:47 +0200 (CEST)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDRc9-0001GA-KH
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 08:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <08de36b1ffff4a102834adedb15ff316d93418f2@lizzy.crudebyte.com>)
 id 1kDRbP-0000Yn-GL
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:10:59 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:35703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <08de36b1ffff4a102834adedb15ff316d93418f2@lizzy.crudebyte.com>)
 id 1kDRbN-0000oM-Jo
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=fSSwOLmtYTd5TDhGKDCGMV9HN1BEsGEhQ5bypOdALM0=; b=ZQfGF
 oSCdSubJjaYUEFoBtWM460geAMwLOpRb5n7d8ChX+Rd2enWMrzX9ltdMk8Qg2eqL9Dp7i+EimIjox
 yr8OOYCRWYzY77j+St35ZcoiqE5AFQgUnx1FEr2SyuIaeBdA83c9/BaysPVLl2H2JFJZ7HoiAYsha
 Ro/dbU3Ttc6hAA1X2k0jfhnKbGx2ORuHw0oT7sfs/4kXmRYRwLjnUFapcC3Evak8cHVPzDlu+AWfi
 MFMHgqFoyUDpWXGtdXyFbuBl7KOHQZB411R5IDpBIEfmkbXppUPy2XIJlD0XCYEiHob7bclizAqY9
 NcmDN602aYTtMMGfCA2JXGrj9q1Tw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 2 Sep 2020 13:22:49 +0200
Subject: [PATCH] 9pfs: log warning if msize <= 8192
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Message-Id: <E1kDR8W-0001s4-Sr@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=08de36b1ffff4a102834adedb15ff316d93418f2@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 07:41:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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

It is essential to choose a reasonable high value for 'msize' to avoid
severe degraded file I/O performance. This parameter has to be chosen
on client/guest side, and a Linux client defaults to an 'msize' of only
8192 if the user did not explicitly specify a value for 'msize'.

Unfortunately many users are not aware that they should specify an
appropriate value for 'msize' to avoid severe performance issues, so
log a performance warning on host side in that case to make it more
clear.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 7bb994bbf2..33e948d636 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1353,6 +1353,14 @@ static void coroutine_fn v9fs_version(void *opaque)
         goto out;
     }
 
+    /* 8192 is the default msize of Linux clients */
+    if (s->msize <= 8192) {
+        warn_report_once(
+            "9p: degraded performance: a reasonable high msize should be "
+            "chosen on client/guest side (chosen msize is <= 8192)."
+        );
+    }
+
 marshal:
     err = pdu_marshal(pdu, offset, "ds", s->msize, &version);
     if (err < 0) {
-- 
2.20.1


