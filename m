Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E38548C5E4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:23:30 +0100 (CET)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eXB-0003Qh-Cn
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dI2-0008Fm-MO
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dI0-0001OM-Vx
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641992624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zSiXapAqIdY4thXAw1MqT6PqhdbOn+ZzyLzXQxtp4fI=;
 b=PbCKk1F69dhMoxmZ14YyG+HbeLRdkQ5PM5ieWZ2hjiok0tH+nXbEQFgqGUQJg5lMgKKMQF
 bCnxHSBlnFraxo3Vup8rhFaALspwcz/cZkG8Fe3FKTsi9e5WP/IFowytIy0IGr7Rz6FJmZ
 ZPESCrNukbWVwXd/0In0aZPXuwgmePA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-rMd2Ae98NOSyFXRb-kZIPQ-1; Wed, 12 Jan 2022 08:03:35 -0500
X-MC-Unique: rMd2Ae98NOSyFXRb-kZIPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE678190B2A0;
 Wed, 12 Jan 2022 13:03:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2CA27B6F8;
 Wed, 12 Jan 2022 13:03:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] acpi: fix short OEM [Table] ID padding
Date: Wed, 12 Jan 2022 08:03:28 -0500
Message-Id: <20220112130332.1648664-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, Marian Postevca <posteuca@mutex.one>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 6.0 the commit:
  602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
regressed values of OEM [Table] ID fields in ACPI tables
by padding them with whitespace is a value is shorter then
max possible. That depending on vendor broke OEM [Table] ID patching
with SLIC table values and as result licensing of Windows guests.

First reported here https://gitlab.com/qemu-project/qemu/-/issues/707

CC: Marian Postevca <posteuca@mutex.one>
CC: Michael S. Tsirkin <mst@redhat.com>
CC: Ani Sinha <ani@anisinha.ca>

Igor Mammedov (4):
  tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for test_oem_fields()
    test
  tests: acpi: whitelist nvdimm's SSDT and FACP.slic expected blobs
  acpi: fix OEM ID/OEM Table ID padding
  tests: acpi: update expected blobs

 hw/acpi/aml-build.c              |   4 ++--
 tests/data/acpi/pc/SSDT.dimmpxm  | Bin 734 -> 734 bytes
 tests/data/acpi/q35/FACP.slic    | Bin 244 -> 244 bytes
 tests/data/acpi/q35/SSDT.dimmpxm | Bin 734 -> 734 bytes
 tests/data/acpi/virt/SSDT.memhp  | Bin 736 -> 736 bytes
 tests/qtest/bios-tables-test.c   |  15 ++++++---------
 6 files changed, 8 insertions(+), 11 deletions(-)

-- 
2.31.1


