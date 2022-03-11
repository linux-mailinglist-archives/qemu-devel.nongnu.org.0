Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1009F4D5AB2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 06:41:43 +0100 (CET)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSY21-00067s-VP
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 00:41:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nSXzQ-0003Q1-C3
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 00:39:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nSXzO-0003E8-V4
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 00:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646977138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x38tT3OS7485tConwIi3FTjxLWH3w3CR8mL8yUHAG7c=;
 b=Ib8XGHd1kJ5sVFrw0XCCmt1yFQ2jBZ6LP3M5o9EUfL/5HAynODh6zvzZ2tC5x/AzejUe3W
 Ii7LN7JMen1BImnll2IJxR7i/kvitTsQkp0IWXLuiu8GVCYVj67XYYALuop4Q0wXG7NCtq
 JUWJMREdxIyi3Z/k77IYl7hfv9jfYcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-uLabrWARPZyh6XSKqWbuug-1; Fri, 11 Mar 2022 00:38:51 -0500
X-MC-Unique: uLabrWARPZyh6XSKqWbuug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AC6A1091DA0;
 Fri, 11 Mar 2022 05:38:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C507E54555;
 Fri, 11 Mar 2022 05:38:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8CFFC180063C; Fri, 11 Mar 2022 06:37:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] edk2: add microvm build
Date: Fri, 11 Mar 2022 06:37:53 +0100
Message-Id: <20220311053759.875785-6-kraxel@redhat.com>
In-Reply-To: <20220311053759.875785-1-kraxel@redhat.com>
References: <20220311053759.875785-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 roms/Makefile.edk2 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
index 6801ea62e8f1..485f2244b159 100644
--- a/roms/Makefile.edk2
+++ b/roms/Makefile.edk2
@@ -33,6 +33,7 @@ flashdevs := \
 	i386-secure-code \
 	x86_64-code \
 	x86_64-secure-code \
+	x86_64-microvm \
 	\
 	arm-vars \
 	i386-vars
@@ -145,6 +146,16 @@ submodules:
 		-D SMM_REQUIRE
 	cp edk2/Build/Ovmf3264/$(target)_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
 
+../pc-bios/edk2-x86_64-microvm.fd: submodules
+	+./edk2-build.sh \
+		x86_64 \
+		--arch=X64 \
+		--platform=OvmfPkg/Microvm/MicrovmX64.dsc \
+		-D NETWORK_IP6_ENABLE \
+		-D NETWORK_HTTP_BOOT_ENABLE \
+		-D NETWORK_TLS_ENABLE
+	cp edk2/Build/MicrovmX64/$(target)_$(call toolchain,x86_64)/FV/MICROVM.fd $@
+
 ../pc-bios/edk2-arm-vars.fd: ../pc-bios/edk2-arm-code.fd
 	cp edk2/Build/ArmVirtQemu-ARM/$(target)_$(call toolchain,arm)/FV/QEMU_VARS.fd \
 		$@
-- 
2.35.1


