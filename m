Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD1DC1C8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 11:51:18 +0200 (CEST)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLOuj-00013o-Os
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 05:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iLOrf-0006iE-4g
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 05:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iLOrd-0005ZV-Tt
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 05:48:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:42976)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iLOra-0005Wc-TH; Fri, 18 Oct 2019 05:48:03 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iLOrY-0004Ah-BZ; Fri, 18 Oct 2019 12:48:00 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 3/3] docs: qcow2: introduce compression type feature
Date: Fri, 18 Oct 2019 12:47:58 +0300
Message-Id: <20191018094758.7124-4-vsementsov@virtuozzo.com>
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

The patch add new additional field to qcow2 header: compression_type,
which specifies compression type. If field is absent or zero, default
compression type is set: ZLIB, which corresponds to current behavior.

New compression type (ZSTD) is to be added in further commit.

Suggested-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/interop/qcow2.txt | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index b971e59b1a..4eabd81363 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -109,6 +109,12 @@ least next five fields, up to the @header_length field.
                                 An External Data File Name header extension may
                                 be present if this bit is set.
 
+                    Bit 3:      Compression type bit.  If this bit is set,
+                                non-default compression is used for compressed
+                                clusters. In this case, @header_length must
+                                be at least 105 and @compression_type field
+                                must be non-zero.
+
                     Bits 3-63:  Reserved (set to 0)
 
          80 -  87:  compatible_features
@@ -183,7 +189,18 @@ It's allowed for the header end to cut some field in the middle (in this case
 the field is considered as absent), but in this case the part of the field
 which is covered by @header_length must be zeroed.
 
-        < ... No additional fields in the header currently ... >
+              104:  compression_type
+                    Defines the compression method used for compressed clusters.
+                    A single compression type is applied to all compressed image
+                    clusters.
+                    If incompatible compression type bit is set: the field must
+                    exist (i.e. @header_length >= 105) and must be non-zero (
+                    which means non-zlib compression type)
+                    If incompatible compression type bit is unset: the field
+                    may not exist (if @header_length < 105) or it must be zero
+                    (which means zlib).
+                    Available compression type values:
+                        0: zlib <https://www.zlib.net/>
 
 Header padding
         If @header_length is larger than 104, software SHOULD make it a
-- 
2.21.0


