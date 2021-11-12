Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1924D44E575
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:15:40 +0100 (CET)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUWx-0004hq-7T
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:15:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlUSe-0005rB-AH
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlUSc-0006Z1-Fv
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636715469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxIyYjuAYLUJ1jbzAfAU8KEUzPjYcRAr/2iYNPcpxS4=;
 b=O4A8TyqraP4KiaQkxDSY2WPPgGDQZ4bDPYmEXDNhzlGQgMs5roHY/W1a6ClIsHLj+oHmLn
 iUy9LzFMEuFfWWM7Fw24S6anW0jotS2EH/nf1e88OaMBW4X7xc+sVGX7bbyvb9e2OWTAil
 7HOHowe8ZOphTI/Z6EKhBeU75ujqX6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-m5ACJgIWMumj5Y-0SqL_4w-1; Fri, 12 Nov 2021 06:11:07 -0500
X-MC-Unique: m5ACJgIWMumj5Y-0SqL_4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E67B887D551;
 Fri, 12 Nov 2021 11:11:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DBB75C1D0;
 Fri, 12 Nov 2021 11:10:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 v3 3/5] bios-tables-test: Allow changes in DSDT ACPI
 tables
Date: Fri, 12 Nov 2021 06:08:55 -0500
Message-Id: <20211112110857.3116853-4-imammedo@redhat.com>
In-Reply-To: <20211112110857.3116853-1-imammedo@redhat.com>
References: <20211112110857.3116853-1-imammedo@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ani@anisinha.ca, mapfelba@redhat.com, jusual@redhat.com, kraxel@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

Prepare for changing the _OSC method in q35 DSDT.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..48e5634d4b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,17 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.nohpet",
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/DSDT.tis.tpm12",
+"tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/q35/DSDT.ivrs",
+"tests/data/acpi/q35/DSDT.xapic",
-- 
2.27.0


