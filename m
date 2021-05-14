Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7393809B4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:36:57 +0200 (CEST)
Received: from localhost ([::1]:57348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhX3o-0008Gi-G6
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjy-0001Cp-JQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjs-0005Gu-9q
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUBqIr3WvhNROSfqC7gDwf0PYwulCayH7dwWB5D5wqw=;
 b=K/D7HctSPk97uQqc3vbvlNwW88bT6JpF0i+/WJuwy6EcUGjdtaDRdnpZkbf3MMIoOhXkBx
 UaDFZ9vyE7h+1yy/R/nuLEhL6s8KKK7RJSkGv4WdlkJj+VqKDmBs3a+CgIDzfXoIQ8fGfv
 KYp9vrZ2Rmu4K2KH4JMO8zg0ywXR+4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-pUHFTsNeNYmDIg_vBsg23w-1; Fri, 14 May 2021 08:16:05 -0400
X-MC-Unique: pUHFTsNeNYmDIg_vBsg23w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4479106BB40;
 Fri, 14 May 2021 12:16:04 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7619C6060F;
 Fri, 14 May 2021 12:16:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/20] tests/qtest/tpm-util.c: Free memory with correct free
 function
Date: Fri, 14 May 2021 14:15:10 +0200
Message-Id: <20210514121518.832729-13-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
References: <20210514121518.832729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

tpm_util_migration_start_qemu() allocates memory with g_strdup_printf()
but frees it with free() rather than g_free(), which provokes Coverity
complaints (CID 1432379, 1432350). Use the correct free function.

Fixes: Coverity CID 1432379, CID 1432350
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210503165525.26221-2-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/tpm-util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
index b70cc32d60..3a40ff3f96 100644
--- a/tests/qtest/tpm-util.c
+++ b/tests/qtest/tpm-util.c
@@ -289,6 +289,6 @@ void tpm_util_migration_start_qemu(QTestState **src_qemu,
 
     *dst_qemu = qtest_init(dst_qemu_args);
 
-    free(src_qemu_args);
-    free(dst_qemu_args);
+    g_free(src_qemu_args);
+    g_free(dst_qemu_args);
 }
-- 
2.27.0


