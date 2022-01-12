Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9CE48C5D4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:19:55 +0100 (CET)
Received: from localhost ([::1]:53332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eTh-0006Bk-OK
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:19:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dI2-0008Fg-GL
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dHz-0001OA-Rs
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641992623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1eOTAQJ+hwl4jgj0gBddKk/FmMCkYGtorslBx5lLX8M=;
 b=ZykrKfGTCgK68jP2I0bPXM+Bzs3h8ydFUdgrTcBxmS3iGCabwODVycJlsXBKgbsv74qiD5
 mbJGXaOaMGV404NW2L7wqtMHh17jeYvUd8+WntS3sIpgy+t3rU7z6XbnnN3Nb1260lsKl/
 zYt9monUKbOoSsQJZxWa+s8qV4vLr7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313--GyBHGMFOaaxDGjHs5RJRw-1; Wed, 12 Jan 2022 08:03:40 -0500
X-MC-Unique: -GyBHGMFOaaxDGjHs5RJRw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 065B8190B2A0;
 Wed, 12 Jan 2022 13:03:39 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1FD57BB5E;
 Wed, 12 Jan 2022 13:03:37 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
Date: Wed, 12 Jan 2022 08:03:31 -0500
Message-Id: <20220112130332.1648664-4-imammedo@redhat.com>
In-Reply-To: <20220112130332.1648664-1-imammedo@redhat.com>
References: <20220112130332.1648664-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-stable@nongnu.org,
 Marian Postevca <posteuca@mutex.one>,
 "Dmitry V . Orekhov" <dima.orekhov@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
fields in headers of ACPI tables. While it doesn't have impact on
default values since QEMU uses 6 and 8 characters long values
respectively, it broke usecase where IDs are provided on QEMU CLI.
It shouldn't affect guest (but may cause licensing verification
issues in guest OS).
One of the broken usecases is user supplied SLIC table with IDs
shorter than max possible length, where [2] mangles IDs with extra
spaces in RSDT and FADT tables whereas guest OS expects those to
mirror the respective values of the used SLIC table.

Fix it by replacing whitespace padding with '\0' padding in
accordance with [1] and expectations of guest OS

1) ACPI spec, v2.0b
       17.2 AML Grammar Definition
       ...
       //OEM ID of up to 6 characters. If the OEM ID is
       //shorter than 6 characters, it can be terminated
       //with a NULL character.

2)
Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/707
Reported-by: Dmitry V. Orekhov <dima.orekhov@gmail.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-stable@nongnu.org
---
 hw/acpi/aml-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index b3b3310df3..65148d5b9d 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1724,9 +1724,9 @@ void acpi_table_begin(AcpiTable *desc, GArray *array)
     build_append_int_noprefix(array, 0, 4); /* Length */
     build_append_int_noprefix(array, desc->rev, 1); /* Revision */
     build_append_int_noprefix(array, 0, 1); /* Checksum */
-    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
+    build_append_padded_str(array, desc->oem_id, 6, '\0'); /* OEMID */
     /* OEM Table ID */
-    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
+    build_append_padded_str(array, desc->oem_table_id, 8, '\0');
     build_append_int_noprefix(array, 1, 4); /* OEM Revision */
     g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
     build_append_int_noprefix(array, 1, 4); /* Creator Revision */
-- 
2.31.1


