Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08F73713DF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:55:34 +0200 (CEST)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWEf-0006YU-V0
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4t-0003vg-6S
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4r-0003d2-Gs
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZU6RUrWrKBMiQej9SF7Mt71rREj59rM//14ac3a1uY=;
 b=M+Z9c5Nk8IIcLjWHwpeWeZeDQ1fD5pgpSlGcleoChZfxcGHebDKSsuOSCVAVfOJ84CKmKy
 Dwr9PxSM+zfwoSQUXTwRVNUnEn9fHK8WcjEVdkrkGBeuYs2VLC49N0v2QRnhnJJHd1rina
 bX51OEY0XicNjHQUmUqKjytQVbla62E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-NZXdPhsDPDK_dfes00E2Jg-1; Mon, 03 May 2021 06:45:23 -0400
X-MC-Unique: NZXdPhsDPDK_dfes00E2Jg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8869E800D62;
 Mon,  3 May 2021 10:45:21 +0000 (UTC)
Received: from thuth.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A47E15D9D0;
 Mon,  3 May 2021 10:45:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/10] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
Date: Mon,  3 May 2021 12:44:55 +0200
Message-Id: <20210503104456.1036472-10-thuth@redhat.com>
In-Reply-To: <20210503104456.1036472-1-thuth@redhat.com>
References: <20210503104456.1036472-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Qin Wang <qinwang@rehdat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Some downstreams rename the QEMU binary to "qemu-kvm". This breaks
qtest_get_arch(), which attempts to parse the target architecture from
the QTEST_QEMU_BINARY environment variable.

Print an error instead of returning the architecture "kvm". Things fail
in weird ways when the architecture string is bogus.

Arguably qtests should always be run in a build directory instead of
against an installed QEMU. In any case, printing a clear error when this
happens is helpful.

Since this is an error that is triggered by the user and not a test
failure, use exit(1) instead of abort(). Change the existing abort()
call in qtest_get_arch() to exit(1) too for the same reason and to be
consistent.

Reported-by: Qin Wang <qinwang@rehdat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210412143050.725918-1-stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 71e359efcd..825b13a44c 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -907,7 +907,14 @@ const char *qtest_get_arch(void)
 
     if (!end) {
         fprintf(stderr, "Can't determine architecture from binary name.\n");
-        abort();
+        exit(1);
+    }
+
+    if (!strstr(qemu, "-system-")) {
+        fprintf(stderr, "QTEST_QEMU_BINARY must end with *-system-<arch> "
+                "where 'arch' is the target\narchitecture (x86_64, aarch64, "
+                "etc).\n");
+        exit(1);
     }
 
     return end + 1;
-- 
2.27.0


