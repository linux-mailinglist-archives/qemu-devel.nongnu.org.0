Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7995F276A11
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 09:06:59 +0200 (CEST)
Received: from localhost ([::1]:59588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLLLG-0006sH-Ix
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 03:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1kLLFS-0000xY-9h
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 03:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1kLLFQ-0005Jh-HI
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 03:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600930855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4HfwY0bkFQVLDlWgoz8rpqz2t6xSvRYuOYgLeL6gok=;
 b=N5KI4xSDsZrpl46bRGXEjqlhES3RB5xDwrmUVb9hQ+xjG04YQLab0FG/au7/B1Niv8BOS4
 xlFnhb0f08ergUBlJu52KtSjvYRPLK8rFcv9g/jbzBezpTHETxRcrdStVgt5hdMJgzPgYD
 d9JqyPJneLgbUcgfXNGMuezJXw5deF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-MtHIpekwN0i2VdLVndycMg-1; Thu, 24 Sep 2020 03:00:53 -0400
X-MC-Unique: MtHIpekwN0i2VdLVndycMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2A8E8030A6;
 Thu, 24 Sep 2020 07:00:52 +0000 (UTC)
Received: from pc-72.home.com (unknown [10.40.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FBA773662;
 Thu, 24 Sep 2020 07:00:50 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 6/7] hw/acpi/ich9: Set ACPI PCI hot-plug as default
Date: Thu, 24 Sep 2020 09:00:12 +0200
Message-Id: <20200924070013.165026-7-jusual@redhat.com>
In-Reply-To: <20200924070013.165026-1-jusual@redhat.com>
References: <20200924070013.165026-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/acpi/ich9.c | 2 +-
 hw/i386/pc.c   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 987f23e388..c67c20de4e 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -425,7 +425,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s3 = 0;
     pm->disable_s4 = 0;
     pm->s4_val = 2;
-    pm->use_acpi_hotplug_bridge = false;
+    pm->use_acpi_hotplug_bridge = true;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b55369357e..5de4475570 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -101,6 +101,7 @@ GlobalProperty pc_compat_5_1[] = {};
 const size_t pc_compat_5_1_len = G_N_ELEMENTS(pc_compat_5_1);
 
 GlobalProperty pc_compat_5_0[] = {
+    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
 };
 const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
 
-- 
2.25.4


