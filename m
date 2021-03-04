Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909EC32D142
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:58:24 +0100 (CET)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlgV-0002V0-IJ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleM-0000mD-Fs
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHleK-0002yb-Ty
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614855368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MRwIZsZIbUldByXDUHnCVbk3rtGrnRAD1x0eYpGKb98=;
 b=RSUpq04nRzQw2AgTZB2lQoaxN+0cSbFuGTfRrC7eGglquFKVsWrreXrnAL4MO+ETZESbRD
 p0fUc6we0YJk010tEIrftlN1vDsqlUIvGAC/X9d5Fnk0xHzVpDD2DizzC9u8Go53jYbp93
 B0I2tGwsdyomXIgz7IWwvnuK+atjNeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-bdonfOHJPEqtc5FERKsYgA-1; Thu, 04 Mar 2021 05:56:04 -0500
X-MC-Unique: bdonfOHJPEqtc5FERKsYgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A67610059BF;
 Thu,  4 Mar 2021 10:56:03 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05D175D720;
 Thu,  4 Mar 2021 10:55:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] acpi: Set proper maximum size for "etc/table-loader"
 blob
Date: Thu,  4 Mar 2021 11:55:50 +0100
Message-Id: <20210304105554.121674-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix and cleanup initializing the maximum size of mutable ACPI blobs.

v1/v2 -> v3:
- 'acpi: Set proper maximum size for "etc/table-loader" blob'
-- Move "etc/table-loader" change to separate patch
-- Extend description
-- Fixup maximum size (now really use 64k)
- Add some patches to cleanup/refactor the code. I avoided using a new
  enum for the different tables for now, using the table names should be
  good enough and is simple.

David Hildenbrand (4):
  acpi: Set proper maximum size for "etc/table-loader" blob
  microvm: Don't open-code "etc/table-loader"
  acpi: Move maximum size logic into acpi_add_rom_blob()
  acpi: Set proper maximum size for "etc/acpi/rsdp" blob

 hw/acpi/utils.c             | 17 +++++++++++++++--
 hw/arm/virt-acpi-build.c    | 12 ++++++------
 hw/i386/acpi-build.c        |  7 +++----
 hw/i386/acpi-microvm.c      | 16 ++++++----------
 include/hw/acpi/aml-build.h |  3 ---
 include/hw/acpi/utils.h     |  3 +--
 6 files changed, 31 insertions(+), 27 deletions(-)

-- 
2.29.2


