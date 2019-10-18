Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F15DC1B4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 11:49:58 +0200 (CEST)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLOtR-0008Gc-FC
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 05:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iLOre-0006he-HT
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 05:48:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iLOrd-0005ZC-IS
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 05:48:06 -0400
Received: from relay.sw.ru ([185.231.240.75]:42964)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iLOra-0005Wb-Ul; Fri, 18 Oct 2019 05:48:03 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iLOrY-0004Ah-2M; Fri, 18 Oct 2019 12:48:00 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 2/3] docs: define padding for qcow2 header
Date: Fri, 18 Oct 2019 12:47:57 +0300
Message-Id: <20191018094758.7124-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018094758.7124-1-vsementsov@virtuozzo.com>
References: <20191018094758.7124-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, dplotnikov@virtuozzo.com,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Header extensions ends are already defined to be multiply of 8. Let's
gently ask for header length to be a multiply of 8 too, when we have
some additional fields. Requiring this may be considered as an
incompatible change, so the padding is optional. Actually, padding is
allowed before this patch (due to definition of additional fields),
the only actual change is "SHOULD" word.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/interop/qcow2.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index 4709f3bb30..b971e59b1a 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -185,6 +185,11 @@ which is covered by @header_length must be zeroed.
 
         < ... No additional fields in the header currently ... >
 
+Header padding
+        If @header_length is larger than 104, software SHOULD make it a
+        multiply of 8, adding zero-padding after additional fields. Still the
+        padding is optional and may be absent in the image.
+
 Directly after the image header, optional sections called header extensions can
 be stored. Each extension has a structure like the following:
 
-- 
2.21.0


