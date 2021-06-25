Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8A3B4035
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:21:14 +0200 (CEST)
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwi1R-0004Px-I1
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhys-0001Gx-On
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:18:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhyn-0006OL-Js
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEmWoMCEu2PS5JP9e3w3XvOswVkGdx3Ds5PMkk8SAm8=;
 b=bDd7CTrPC6cWZnPNXlxESAqfe/zbTvXZ+QLDh9OYoBDiW9V6oTGYR2t184phTAFtLhlSON
 pLNzV+ciiesnn+7i8Qhb4F5ufnWVebWOnDjAtXlB/y9S9JDPKPJmEqS0F+U9AVtj6kQDqn
 w+m9MCJcbzOty78PoE2bLLR1a30qry0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-neNq4nj9MxSF0Lul40dN7w-1; Fri, 25 Jun 2021 05:18:26 -0400
X-MC-Unique: neNq4nj9MxSF0Lul40dN7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 846F21018724
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:18:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 926DB60C05;
 Fri, 25 Jun 2021 09:18:24 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/53] tests: acpi: dump table with failed checksum
Date: Fri, 25 Jun 2021 05:17:25 -0400
Message-Id: <20210625091818.1047980-2-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: mst@redhat.com
CC: thuth@redhat.com
CC: lvivier@redhat.com
---
 tests/qtest/acpi-utils.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/acpi-utils.c b/tests/qtest/acpi-utils.c
index d2a202efca..766c48e3a6 100644
--- a/tests/qtest/acpi-utils.c
+++ b/tests/qtest/acpi-utils.c
@@ -98,6 +98,20 @@ void acpi_fetch_table(QTestState *qts, uint8_t **aml, uint32_t *aml_len,
         ACPI_ASSERT_CMP(**aml, sig);
     }
     if (verify_checksum) {
+        if (acpi_calc_checksum(*aml, *aml_len)) {
+            gint fd, ret;
+            char *fname = NULL;
+            GError *error = NULL;
+
+            fprintf(stderr, "Invalid '%.4s'(%d)\n", *aml, *aml_len);
+            fd = g_file_open_tmp("malformed-XXXXXX.dat", &fname, &error);
+            g_assert_no_error(error);
+            fprintf(stderr, "Dumping invalid table into '%s'\n", fname);
+            ret = qemu_write_full(fd, *aml, *aml_len);
+            g_assert(ret == *aml_len);
+            close(fd);
+            g_free(fname);
+        }
         g_assert(!acpi_calc_checksum(*aml, *aml_len));
     }
 }
-- 
2.27.0


