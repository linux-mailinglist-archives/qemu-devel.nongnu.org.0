Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0795B2238D2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 11:59:56 +0200 (CEST)
Received: from localhost ([::1]:46892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwN9n-0006uj-1a
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 05:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jwN6L-0002JR-8z
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 05:56:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37157
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jwN6I-0001Bp-61
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 05:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594979777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=JdG/AWd1H31ypbyISfEiGjTX6qaUE0sU1/JhivPHJLw=;
 b=COO4xcdBKx6Gzmyj7AwMDuME2o3VcxCXKSLnF3GXhtvbcL6MzTz2z7uEJ4yT7Ycv3gSKdY
 ex6CWxl/oNN4EUlqWn/cKyOTG/SSAH1EtQZiM909qIWbedpjvxH69xN5SnFw8puFAEevY+
 qZV14vzGOgb/FCxJENQmMw/Cqe/oAaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-VWgO1FTQNqu22CSdaLuCcw-1; Fri, 17 Jul 2020 05:56:12 -0400
X-MC-Unique: VWgO1FTQNqu22CSdaLuCcw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD81A108A;
 Fri, 17 Jul 2020 09:56:09 +0000 (UTC)
Received: from thuth.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A921A5C240;
 Fri, 17 Jul 2020 09:56:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 1/6] qtest: bios-tables-test: fix a memory leak
Date: Fri, 17 Jul 2020 11:56:00 +0200
Message-Id: <20200717095605.27589-2-thuth@redhat.com>
In-Reply-To: <20200717095605.27589-1-thuth@redhat.com>
References: <20200717095605.27589-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/17 03:33:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Qiang <liq3ea@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Qiang <liq3ea@163.com>

Fixes: 5da7c35e25a("bios-tables-test: Add Q35/TPM-TIS test")
Signed-off-by: Li Qiang <liq3ea@163.com>
Message-Id: <20200714153536.66060-1-liq3ea@163.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index c315156858..d49b3988ec 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -924,6 +924,7 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     g_free(variant);
     g_free(tmp_path);
     g_free(tmp_dir_name);
+    g_free(args);
     free_test_data(&data);
 #else
     g_test_skip("TPM disabled");
-- 
2.18.1


