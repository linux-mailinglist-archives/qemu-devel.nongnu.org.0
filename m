Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357B25F9CD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:47:51 +0200 (CEST)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFck-0000cN-Ip
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kFFFm-0005Q6-Tx
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:24:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35252
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kFFFk-0001P3-EM
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnwwvfPaikZ28zwBpKXMT23mZgx2KoIxoIkNqTysrJg=;
 b=KNOcIjB7RwNH+pEpK4WkCc6YBoPgCW/1GEJ6iaQfmIqHcflUIdyonMdDg2C7CGhAzXm5/s
 i15AesC462mdaPzUvBpC1zQEH2uZock7PODywNMpNS5mSEk7dQ/CnGZESl4oYXNMSPLIlE
 bEAyB5794N/EQv6hLseyDYmXJSWymZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-frM_yBk7NNyEIpRNJMUrhQ-1; Mon, 07 Sep 2020 07:23:59 -0400
X-MC-Unique: frM_yBk7NNyEIpRNJMUrhQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E29338015B0;
 Mon,  7 Sep 2020 11:23:58 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA1775D9D2;
 Mon,  7 Sep 2020 11:23:57 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/10] x86: ich9: expose "smi_negotiated_features" as a QOM
 property
Date: Mon,  7 Sep 2020 07:23:44 -0400
Message-Id: <20200907112348.530921-7-imammedo@redhat.com>
In-Reply-To: <20200907112348.530921-1-imammedo@redhat.com>
References: <20200907112348.530921-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: boris.ostrovsky@oracle.com, lersek@redhat.com, aaron.young@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expose the "smi_negotiated_features" field of ICH9LPCState as
a QOM property.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 include/hw/i386/ich9.h | 2 ++
 hw/isa/lpc_ich9.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index d1bb3f7bf0..0f43ef2481 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -245,6 +245,8 @@ typedef struct ICH9LPCState {
 #define ICH9_SMB_HST_D1                         0x06
 #define ICH9_SMB_HOST_BLOCK_DB                  0x07
 
+#define ICH9_LPC_SMI_NEGOTIATED_FEAT_PROP "x-smi-negotiated-features"
+
 /* bit positions used in fw_cfg SMI feature negotiation */
 #define ICH9_LPC_SMI_F_BROADCAST_BIT            0
 #define ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT          1
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 19f32bed3e..8124d20338 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -647,6 +647,9 @@ static void ich9_lpc_initfn(Object *obj)
                                   &acpi_enable_cmd, OBJ_PROP_FLAG_READ);
     object_property_add_uint8_ptr(OBJECT(lpc), ACPI_PM_PROP_ACPI_DISABLE_CMD,
                                   &acpi_disable_cmd, OBJ_PROP_FLAG_READ);
+    object_property_add_uint64_ptr(obj, ICH9_LPC_SMI_NEGOTIATED_FEAT_PROP,
+                                   &lpc->smi_negotiated_features,
+                                   OBJ_PROP_FLAG_READ);
 
     ich9_pm_add_properties(obj, &lpc->pm);
 }
-- 
2.27.0


