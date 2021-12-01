Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA59F464BE2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 11:46:45 +0100 (CET)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msN8O-00035c-Pe
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 05:46:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msN6J-0000rt-Ml
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:44:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msN6H-0002k7-Eh
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:44:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638355472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFGa79gXl0E6PdQEZ4nx5oXU2oJlu5CMXD+mP55FXFw=;
 b=MRKtfiQ6mqubbdLNfDr80tzFAwyuzGf81dMblIqplEM55aVLpa/cRNwwNwkv6l/a6RjkeI
 Eon99wXWruWmIek5Uy5mXzM5VVaepWbx3rL7gMtEXGwdixL0qINYS86SFwrAmzNQOljo6K
 SEPWQ1TsGm/XdM0NLZCgRreBAs+lbus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-2P6JvVjCN7GIw_3jlZX-AQ-1; Wed, 01 Dec 2021 05:44:31 -0500
X-MC-Unique: 2P6JvVjCN7GIw_3jlZX-AQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9AEF1006AA2
 for <qemu-devel@nongnu.org>; Wed,  1 Dec 2021 10:44:30 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04FA860C17;
 Wed,  1 Dec 2021 10:44:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH for-7.0 2/4] tests/qtest: Fence the tests that need
 xlnx-zcu102 with CONFIG_XLNX_ZYNQMP_ARM
Date: Wed,  1 Dec 2021 11:43:45 +0100
Message-Id: <20211201104347.51922-3-thuth@redhat.com>
In-Reply-To: <20211201104347.51922-1-thuth@redhat.com>
References: <20211201104347.51922-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'xlnx-can-test' and the 'fuzz-xlnx-dp-test' need the "xlnx-zcu102"
machine and thus should only be built and run if CONFIG_XLNX_ZYNQMP_ARM
is enabled.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 8591a54439..5260b33dc0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -184,11 +184,10 @@ qtests_aarch64 = \
   (cpu != 'arm' and unpack_edk2_blobs ? ['bios-tables-test'] : []) +                            \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-   'xlnx-can-test',
-   'fuzz-xlnx-dp-test',
    'migration-test']
 
 qtests_s390x = \
-- 
2.27.0


