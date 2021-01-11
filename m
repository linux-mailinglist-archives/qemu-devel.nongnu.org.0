Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F42F1663
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:52:26 +0100 (CET)
Received: from localhost ([::1]:42036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxcP-0002uE-Or
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxU9-0002fY-Ar
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxU3-00081s-Pe
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610372626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsDIt2sQ1wdB7WsIaI7KbhF+D9wriEacOBHbOPGjtXM=;
 b=dq8CzmirZLwyR38Zm6BX5lbpLASR0TxuBCRPbMLOHJ98LNrDUS0rMmFgeIL6PvkR2Gi9Dc
 Md7TJ1SJmfLUyZW92eE8sDLIVr/lx6u53u8Z6pF7QQhnM0Wx6/m5SkqGQ9fqrqcjqU3aPQ
 NiTtadBbwDCGsTPbyltzb9wY7kMbVeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-wetBv4WON4-5o-xNdOTuHg-1; Mon, 11 Jan 2021 08:43:44 -0500
X-MC-Unique: wetBv4WON4-5o-xNdOTuHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26F62835DEF;
 Mon, 11 Jan 2021 13:43:43 +0000 (UTC)
Received: from thuth.com (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C9A417C5F;
 Mon, 11 Jan 2021 13:43:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/15] qtest/libqtest: fix heap-buffer-overflow in
 qtest_cb_for_every_machine()
Date: Mon, 11 Jan 2021 14:43:15 +0100
Message-Id: <20210111134328.157775-3-thuth@redhat.com>
In-Reply-To: <20210111134328.157775-1-thuth@redhat.com>
References: <20210111134328.157775-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Warner Losh <imp@freebsd.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

When the length of mname is less than 5, memcpy("xenfv", mname, 5) will cause
heap buffer overflow. Therefore, use strncmp to avoid this problem.

The asan showed stack:

ERROR: AddressSanitizer: heap-buffer-overflow on address 0x60200000f2f4 at
pc 0x7f65d8cc2225 bp 0x7ffe93cc5a60 sp 0x7ffe93cc5208 READ of size 5 at
0x60200000f2f4 thread T0
    #0 0x7f65d8cc2224 in memcmp (/lib64/libasan.so.5+0xdf224)
    #1 0x5632c20be95b in qtest_cb_for_every_machine tests/qtest/libqtest.c:1282
    #2 0x5632c20b7995 in main tests/qtest/test-hmp.c:160
    #3 0x7f65d88fed42 in __libc_start_main (/lib64/libc.so.6+0x26d42)
    #4 0x5632c20b72cd in _start (build/tests/qtest/test-hmp+0x542cd)

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20210106050625.518041-1-ganqixin@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 8e93b0a707..5249a628cc 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1279,7 +1279,7 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
         g_assert(qstr);
         mname = qstring_get_str(qstr);
         /* Ignore machines that cannot be used for qtests */
-        if (!memcmp("xenfv", mname, 5) || g_str_equal("xenpv", mname)) {
+        if (!strncmp("xenfv", mname, 5) || g_str_equal("xenpv", mname)) {
             continue;
         }
         if (!skip_old_versioned || !qtest_is_old_versioned_machine(mname)) {
-- 
2.27.0


