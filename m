Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ADA120556
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 13:19:31 +0100 (CET)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igpLW-00020k-Hh
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 07:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1igpJp-0000Wi-Hb
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:17:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1igpJn-0001rp-TL
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:17:45 -0500
Received: from relay.sw.ru ([185.231.240.75]:33562)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1igpJn-0001r9-M5; Mon, 16 Dec 2019 07:17:43 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1igpJe-00033D-Gr; Mon, 16 Dec 2019 15:17:34 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 2/2] docs: qcow2: introduce compression type feature
Date: Mon, 16 Dec 2019 15:17:33 +0300
Message-Id: <20191216121733.63562-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191216121733.63562-1-vsementsov@virtuozzo.com>
References: <20191216121733.63562-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 armbru@redhat.com, mreitz@redhat.com, dplotnikov@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch add new additional field to qcow2 header: compression_type,
which specifies compression type. If field is absent or zero, default
compression type is set: ZLIB, which corresponds to current behavior.

New compression type (ZSTD) is to be added in further commit.

Suggested-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/interop/qcow2.txt | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index d92c827763..77146b5169 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -109,6 +109,11 @@ the next fields through header_length.
                                 An External Data File Name header extension may
                                 be present if this bit is set.
 
+                    Bit 3:      Compression type bit.  If this bit is set,
+                                non-default compression is used for compressed
+                                clusters. compression_type field must be
+                                present and not zero.
+
                     Bits 3-63:  Reserved (set to 0)
 
          80 -  87:  compatible_features
@@ -188,7 +193,16 @@ present*, if not altered by specific incompatible bit.
 *. Field is not present when header_length is less or equal to field's offset.
 Also, all additional fields are not present for version 2.
 
-        < ... No additional fields in the header currently ... >
+              104:  compression_type
+                    Defines the compression method used for compressed clusters.
+                    A single compression type is applied to all compressed image
+                    clusters.
+                    If incompatible compression type bit is set: the field must
+                    be present and non-zero (which means non-zlib compression type)
+                    If incompatible compression type bit is unset: the field
+                    may not exist or it must be zero (which means zlib).
+                    Available compression type values:
+                        0: zlib <https://www.zlib.net/>
 
 Header padding
 
-- 
2.18.0


