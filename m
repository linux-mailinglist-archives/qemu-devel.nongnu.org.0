Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3A139E67
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 01:40:56 +0100 (CET)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irAGN-0007ie-Jb
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 19:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <8d86288c6b169461812b2c5838c35df51396d5ff@lizzy.crudebyte.com>)
 id 1irAES-0006mo-84
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:38:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <8d86288c6b169461812b2c5838c35df51396d5ff@lizzy.crudebyte.com>)
 id 1irAEQ-0003lN-WC
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:38:56 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:53853)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <8d86288c6b169461812b2c5838c35df51396d5ff@lizzy.crudebyte.com>)
 id 1irAEQ-0002iH-PL
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=ueZKXtIfpbKoSzdo2zVCHwkMKgcaOQPLVmaUXXmHksI=; b=UQFid
 1OVALJC5mm/sFuVDn3sDHFBZHf3PfpFYZDZLoTeCgM693wS3Q0CWIl4QHt/XEnSgAKLpGnWKdJfcI
 NvTRO27/5b3KoyQAQgYdzA/Z7Rpra+FghakP+bzwWJB+cHoeSS2FfofsIVprHGQwTSpj9B3KTg5Gm
 4GfkM1K/PYTYd9rdnNenSYmOYhLxmJp6feMfHT6LR64tzJqKV8nky6VTM5HeFWx9OPaCB6wKthhiH
 IDw116umci3imzJdFqd9TiSlSQcpEkgtYAWlev3NTzZ6KBvo1FfMg/XGXmsQFk9b5dE2bsQR2hm1B
 dJhaQqo5PCWY1rkuQKaesvL8T0OTQ==;
Message-Id: <8d86288c6b169461812b2c5838c35df51396d5ff.1578957500.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1578957500.git.qemu_oss@crudebyte.com>
References: <cover.1578957500.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 13 Jan 2020 23:20:37 +0100
Subject: [PATCH v3 01/11] tests/virtio-9p: add terminating null in
 v9fs_string_read()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.194.90.13
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

The 9p protocol sends strings in general without null termination
over the wire. However for future use of this functions it is
beneficial for the delivered string to be null terminated though
for being able to use the string with standard C functions which
often rely on strings being null terminated.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 tests/virtio-9p-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
index e7b58e3a0c..06263edb53 100644
--- a/tests/virtio-9p-test.c
+++ b/tests/virtio-9p-test.c
@@ -130,8 +130,9 @@ static void v9fs_string_read(P9Req *req, uint16_t *len, char **string)
         *len = local_len;
     }
     if (string) {
-        *string = g_malloc(local_len);
+        *string = g_malloc(local_len + 1);
         v9fs_memread(req, *string, local_len);
+        (*string)[local_len] = 0;
     } else {
         v9fs_memskip(req, local_len);
     }
-- 
2.20.1


