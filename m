Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704F64A6116
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:12:50 +0100 (CET)
Received: from localhost ([::1]:40022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvlx-0004f5-JS
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:12:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuSH-00037S-DW
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:48:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuSE-0004CG-DA
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekORPyJkJdtO8SE42j7QM9SzVpdPjYC/4pjJuwAHo4Y=;
 b=PoM9KYTyYOJmI7KUGFXTI6D9yXYn4xT+MUtPUN1xbaoua2jdkv1mJgNyUbkmxJ5vw9F2pd
 qLRMQSPwft33ty01bsA3/Q7wbkuOWcQHzLfRsaLUUtoih7jazH86uNTgABJW+JWIwMHqaP
 rFkW51w+r8Qaatkx5SsOAgJZ3AA6mCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-XnwRaNRAMtqBBMy2TSqy8A-1; Tue, 01 Feb 2022 09:43:02 -0500
X-MC-Unique: XnwRaNRAMtqBBMy2TSqy8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E39D71091DB3;
 Tue,  1 Feb 2022 14:43:00 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5198970D3E;
 Tue,  1 Feb 2022 14:42:44 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/24] tests/qemu-iotests: Fix 051 for binaries without
 'lsi53c895a'
Date: Tue,  1 Feb 2022 15:42:10 +0100
Message-Id: <20220201144233.617021-2-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The lsi53c895a SCSI adaptor might not be enabled in each and every
x86 QEMU binary, e.g. it's disabled in the RHEL/CentOS build.
Thus let's add a check to the 051 test so that it does not fail if
this device is not available.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211206143404.247032-1-thuth@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/051 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 1d2fa93a11..e9042a6214 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -45,6 +45,10 @@ _supported_proto file
 _unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file
 _require_drivers nbd
 
+if [ "$QEMU_DEFAULT_MACHINE" = "pc" ]; then
+    _require_devices lsi53c895a
+fi
+
 do_run_qemu()
 {
     echo Testing: "$@"
-- 
2.34.1


