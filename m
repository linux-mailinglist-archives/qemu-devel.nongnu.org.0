Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AE3B411B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:06:38 +0200 (CEST)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwijN-00065Q-FW
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0b-0004dg-IG
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0Y-0007cj-7E
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BlXUmcjDsAcYFfgu4VkmS9NfwmdFGrWL7z5bXZoNVOc=;
 b=YvTKoZFtNmyiw+iYzCyCQYmTBnVtcZixDhM9z3TV3dlgnf5WsY4DydaSdZgWs5LxRWSJm7
 hkTcI8gcebwrs8mCF393q5Yh+GpRUL26AUzC08j/FIp6xU8Ri4zu+IWaIGSi2Ltn4iWYmX
 +hOanHfMRhZR7XdVOh8E37/9G/w8X7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-nus0IZUcPneQyyHZxL-y-w-1; Fri, 25 Jun 2021 05:20:14 -0400
X-MC-Unique: nus0IZUcPneQyyHZxL-y-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A021418A0748
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:20:13 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04A8960CA0;
 Fri, 25 Jun 2021 09:20:12 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 53/53] acpi: AcpiGenericAddress no longer used to map/access
 fields of MMIO, drop packed attribute
Date: Fri, 25 Jun 2021 05:18:18 -0400
Message-Id: <20210625091818.1047980-55-imammedo@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index ee733840aa..c97e8633ad 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -55,7 +55,7 @@ struct AcpiGenericAddress {
     uint8_t access_width;    /* ACPI 3.0: Minimum Access size (ACPI 3.0),
                                 ACPI 2.0: Reserved, Table 5-1 */
     uint64_t address;        /* 64-bit address of struct or register */
-} QEMU_PACKED;
+};
 
 typedef struct AcpiFadtData {
     struct AcpiGenericAddress pm1a_cnt;   /* PM1a_CNT_BLK */
-- 
2.27.0


