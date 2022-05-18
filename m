Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590452B66D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:40:47 +0200 (CEST)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrGAf-0004r9-GE
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nrFtU-0006Q8-Vh
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:23:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nrFtT-0007J2-Gt
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652865778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KA4XDNcMANnu+KcptlpXyyn0DXRCtSr59qSg5uqo7w=;
 b=g4U5TzQitG6RWDXQ2J9qlHBRYRUUI4wLO1eSjLGTadvBS6nu9KsDBIk5hj0Dsgu8urqCAI
 ZYmJhjytx3I9C/QvxGpsvpuSJcfF4BdBh2YQyfqcaEy5Vo8y3pUKQWoneA0AggYURptuHh
 ZlYFaf0tY71y7At5k/D9tSK+VQeaeUw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-lBL9uqt6N7-9lV9WZp9n0w-1; Wed, 18 May 2022 05:22:55 -0400
X-MC-Unique: lBL9uqt6N7-9lV9WZp9n0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67812811E78;
 Wed, 18 May 2022 09:22:55 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D1771121314;
 Wed, 18 May 2022 09:22:47 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, drjones@redhat.com,
 wangyanan55@huawei.com, Jonathan.Cameron@Huawei.com,
 peter.maydell@linaro.org, berrange@redhat.com, thuth@redhat.com,
 eduardo@habkost.net, lvivier@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: [PATCH 3/3] tests/acpi/virt: Update PPTT ACPI table
Date: Wed, 18 May 2022 17:21:41 +0800
Message-Id: <20220518092141.1050852-4-gshan@redhat.com>
In-Reply-To: <20220518092141.1050852-1-gshan@redhat.com>
References: <20220518092141.1050852-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Differences between disassembled ASL files for PPTT:

@@ -13,7 +13,7 @@
 [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
 [004h 0004   4]                 Table Length : 00000060
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : 48
+[009h 0009   1]                     Checksum : 44
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
@@ -24,9 +24,9 @@
 [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
 [025h 0037   1]                       Length : 14
 [026h 0038   2]                     Reserved : 0000
-[028h 0040   4]        Flags (decoded below) : 00000001
+[028h 0040   4]        Flags (decoded below) : 00000003
                             Physical package : 1
-                     ACPI Processor ID valid : 0
+                     ACPI Processor ID valid : 1
                        Processor is a thread : 0
                               Node is a leaf : 0
                     Identical Implementation : 0
@@ -37,9 +37,9 @@
 [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
 [039h 0057   1]                       Length : 14
 [03Ah 0058   2]                     Reserved : 0000
-[03Ch 0060   4]        Flags (decoded below) : 00000000
+[03Ch 0060   4]        Flags (decoded below) : 00000002
                             Physical package : 0
-                     ACPI Processor ID valid : 0
+                     ACPI Processor ID valid : 1
                        Processor is a thread : 0
                               Node is a leaf : 0
                     Identical Implementation : 0

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 tests/data/acpi/virt/PPTT                   | Bin 96 -> 96 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index f56ea63b369a604877374ad696c396e796ab1c83..10b98965dbf831e717cc36509de87dafb244a31e 100644
GIT binary patch
delta 41
icmYdD;0g!`2}xjJU|@2Y$R#Jr3}m4I5unUOTV()zssxb$

delta 41
icmYdD;0g!`2}xjJU|{l?$R#Jr2xOrE5g>1(tug?7<^+)d

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index cb143a55a6..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/PPTT",
-- 
2.23.0


