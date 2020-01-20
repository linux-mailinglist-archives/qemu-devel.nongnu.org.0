Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77F143551
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 02:43:36 +0100 (CET)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itiZr-0006yW-2V
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 20:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <52c84e2ce3bcafc2a38eed13b8c8e23bc1a8ecb9@lizzy.crudebyte.com>)
 id 1itiYU-00066s-Kr
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:42:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <52c84e2ce3bcafc2a38eed13b8c8e23bc1a8ecb9@lizzy.crudebyte.com>)
 id 1itiYT-0005X9-DX
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:42:10 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:51609)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <52c84e2ce3bcafc2a38eed13b8c8e23bc1a8ecb9@lizzy.crudebyte.com>)
 id 1itiYT-00053N-74
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:42:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=WTaGxFXa1SCFsUf5hlI8KVFd7uagnyrYBvr3WyqZULo=; b=Mc2tu
 L/5gWnM6RQa/5xNTro2elWT+Ja/m2hAcssLxtsNhybRFnZSLdZ+An/8iqZld5mMMB2IR49HeVlqnJ
 qnYXvGrqeND1CZvCEj891/OLGDYi1u7xsOUMnknZBLD2MVT4zHq0uxfnEzGPmHOkcujji39zu3gtN
 ZgQxRR5ClVG9JVwY7F2gf6pKTi4TvZCkEM8wzELsJQWYI6VH4MY4HS4uYH0a5RNMLeZVy5M9Dylr5
 BSFCBUdgj/F4f5MyWVKpfpVXJ4eYKBe+hG0siVEBrYdRIlzs09BOZa577oqcT0DVjh93Xb9cCt9Y3
 lricHjwf4MeNrW4kZhgVyYChgXA0Q==;
Message-Id: <52c84e2ce3bcafc2a38eed13b8c8e23bc1a8ecb9.1579567019.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1579567019.git.qemu_oss@crudebyte.com>
References: <cover.1579567019.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 20 Jan 2020 23:29:36 +0100
Subject: [PATCH v4 01/11] tests/virtio-9p: add terminating null in
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
 tests/qtest/virtio-9p-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index e7b58e3a0c..06263edb53 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
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


