Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747295A6C9E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 20:56:26 +0200 (CEST)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6PQ-0006M7-OH
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 14:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AA-0007PH-V2
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A5-00056A-UK
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTw0sLE1qwhQLW6a6d5kcgJITU9KZ4MMV0s4K39ejIs=;
 b=NWat+bDvhzrhQTNbY1lMpMeC2VFRv9KxLAqPlgaIqV+PxO0Wo/NsNx/84eCi+hidJ42ehG
 CA94CoLLdylH7RjnLnSKi8d3KGF7S1PaoMJB90RlB4xuvSeZ+ZjkNxEArtMeE8JDIdv6wQ
 66My9wDYQar+KbGfeQyTKV2eySglwCo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-_Ucc-kBDOkGXDH3ZWUyiCw-1; Tue, 30 Aug 2022 14:40:26 -0400
X-MC-Unique: _Ucc-kBDOkGXDH3ZWUyiCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD56B8037AE;
 Tue, 30 Aug 2022 18:40:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 878921410F37;
 Tue, 30 Aug 2022 18:40:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 06/23] tests/qtest: Adapt {m48t59,rtc}-test cases for win32
Date: Tue, 30 Aug 2022 20:39:55 +0200
Message-Id: <20220830184012.77978-7-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

There is no tm_gmtoff member in 'struct tm' on Windows.
Update rtc-test.c and m48t59-test.c accordingly.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-16-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/m48t59-test.c | 2 +-
 tests/qtest/rtc-test.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/m48t59-test.c b/tests/qtest/m48t59-test.c
index b94a1230f7..843d2ced8e 100644
--- a/tests/qtest/m48t59-test.c
+++ b/tests/qtest/m48t59-test.c
@@ -137,7 +137,7 @@ static void cmos_get_date_time(QTestState *s, struct tm *date)
     date->tm_mday = mday;
     date->tm_mon = mon - 1;
     date->tm_year = base_year + year - 1900;
-#ifndef __sun__
+#if !defined(__sun__) && !defined(_WIN32)
     date->tm_gmtoff = 0;
 #endif
 
diff --git a/tests/qtest/rtc-test.c b/tests/qtest/rtc-test.c
index 8126ab1bdb..02ed4e1238 100644
--- a/tests/qtest/rtc-test.c
+++ b/tests/qtest/rtc-test.c
@@ -111,7 +111,7 @@ static void cmos_get_date_time(struct tm *date)
     date->tm_mday = mday;
     date->tm_mon = mon - 1;
     date->tm_year = base_year + year - 1900;
-#ifndef __sun__
+#if !defined(__sun__) && !defined(_WIN32)
     date->tm_gmtoff = 0;
 #endif
 
-- 
2.31.1


