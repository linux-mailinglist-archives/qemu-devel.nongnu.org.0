Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC7829361F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 09:53:43 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUmSk-0000mR-QU
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 03:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUmOJ-00058E-Je
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 03:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUmOE-0001qN-Ee
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 03:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603180140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhw/aT6jybqBjUiRooeK0gA9wDhuy5RFCPIsE7cPM58=;
 b=BjOucWmzK8tZQPwWtUVKpREu+q67KDVHptLMUZSgPAHRIazkArBxibi09Y4e5ZdE+qQcyL
 wjbxweTjrosqGJYdWGVOOE32mA0DzS/9EnOxAwgxR+fNzRg1J7md2pS4Ahf5+8zFfl44R8
 Q7PG7d/scxsKJfo6Bccj8+5sAAf8fc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-7Mal1C3NND697FdVcVwKVw-1; Tue, 20 Oct 2020 03:48:56 -0400
X-MC-Unique: 7Mal1C3NND697FdVcVwKVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07BE0803F5C;
 Tue, 20 Oct 2020 07:48:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E77706EF42;
 Tue, 20 Oct 2020 07:48:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0685C1750A; Tue, 20 Oct 2020 09:48:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/10] acpi: add aml builder stubs
Date: Tue, 20 Oct 2020 09:48:35 +0200
Message-Id: <20201020074844.5304-2-kraxel@redhat.com>
In-Reply-To: <20201020074844.5304-1-kraxel@redhat.com>
References: <20201020074844.5304-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add stubs for aml_interrupt and aml_memory32_fixed,
these will be needed by followup patches,

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/acpi/aml-build-stub.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/acpi/aml-build-stub.c b/hw/acpi/aml-build-stub.c
index 58b2e162277f..8d8ad1a31497 100644
--- a/hw/acpi/aml-build-stub.c
+++ b/hw/acpi/aml-build-stub.c
@@ -57,6 +57,20 @@ Aml *aml_irq_no_flags(uint8_t irq)
     return NULL;
 }
 
+Aml *aml_interrupt(AmlConsumerAndProducer con_and_pro,
+                   AmlLevelAndEdge level_and_edge,
+                   AmlActiveHighAndLow high_and_low, AmlShared shared,
+                   uint32_t *irq_list, uint8_t irq_count)
+{
+    return NULL;
+}
+
+Aml *aml_memory32_fixed(uint32_t addr, uint32_t size,
+                        AmlReadAndWrite read_and_write)
+{
+    return NULL;
+}
+
 Aml *aml_int(const uint64_t val)
 {
     return NULL;
-- 
2.27.0


