Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FAF123B99
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 01:30:59 +0100 (CET)
Received: from localhost ([::1]:47620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihNEv-0006zk-Tu
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 19:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <00d02f39341a40e0869ba93d0b589d8e9453f73e@lizzy.crudebyte.com>)
 id 1ihNDP-0006YJ-EH
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:29:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <00d02f39341a40e0869ba93d0b589d8e9453f73e@lizzy.crudebyte.com>)
 id 1ihNDO-0005PU-B2
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:29:23 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:46881)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <00d02f39341a40e0869ba93d0b589d8e9453f73e@lizzy.crudebyte.com>)
 id 1ihNDN-0004Rh-Vm
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Subject:Date:Cc:To:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=fkzlb2iLtwyFHmDeqK6Ig0E+GKO7OrbJq5lmpJ7ryYM=; b=RR0L6
 a0Sfk5aQpLdfBVTyDlRDxCX0cRJa6FS6x6cLeCQevu4CfssPTGb5hYxDPHteDlMle8gkkyLLjP3OJ
 KTZ330ZBy6FOxwLeAeAUfIMcRFpMR6XVFZ2OExbHFwkul41AsatuMLR2/qS9dDRN8taJQPmQViK0O
 Fp2Hcn1d2ooa0nsiRDzF1HSPW1KrHGAZeIB+jsS2oxsmYogdAj2RXf0VslqUx2KyqoURojN8yRUci
 szXHEtQlCpZm0zZPaJTElMx5XtIIMmJ6PYvp4RCZ+hn8UItAAfXy1WZALJFwllZpmNTLYdDRNKrwY
 Ibf5H67suKS1aPRofVHC/hnkvCyiA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Date: Mon, 16 Dec 2019 00:17:48 +0100
Subject: [PATCH 1/9] tests/virtio-9p: v9fs_string_read() didn't terminate
 string
Message-Id: <E1ihMue-00076W-9u@lizzy.crudebyte.com>
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

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/virtio-9p-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
index e7b58e3a0c..880b4ff567 100644
--- a/tests/virtio-9p-test.c
+++ b/tests/virtio-9p-test.c
@@ -130,8 +130,9 @@ static void v9fs_string_read(P9Req *req, uint16_t *len, char **string)
         *len = local_len;
     }
     if (string) {
-        *string = g_malloc(local_len);
+        *string = g_malloc(local_len+1);
         v9fs_memread(req, *string, local_len);
+        (*string)[local_len] = 0;
     } else {
         v9fs_memskip(req, local_len);
     }
-- 
2.20.1


