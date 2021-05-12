Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF55837CE5A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:19:03 +0200 (CEST)
Received: from localhost ([::1]:53866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsVi-00079I-Ib
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsSt-0004Pq-AY
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsSo-0007V4-T9
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620839761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkJIAW226VlSgWK9crtJ2cH2+vvCLCs5boE2h/RH1KM=;
 b=GQBupm/M4NaJHyUX4D5ksaEcJJDNwUs2YJrUdCbKlSkCuHiFi/al4Zw68AMRywbc7wT053
 bFWTDhOgLNoABtii1hjpfrVXGUGUxDU7PZssnvyKodtZPksw8wrM/q3adxW0atC5a/uA5I
 GNtWpZooAprXvc4nrJtlBQ9YFeIX3ZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-ZWNvQEw_OJKLP5OEfxgJ0g-1; Wed, 12 May 2021 13:16:00 -0400
X-MC-Unique: ZWNvQEw_OJKLP5OEfxgJ0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5D8A107ACF8;
 Wed, 12 May 2021 17:15:58 +0000 (UTC)
Received: from thuth.com (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C66D161094;
 Wed, 12 May 2021 17:15:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 2/3] pc-bios/s390-ccw/Makefile: Check more compiler flags for
 Clang
Date: Wed, 12 May 2021 19:15:49 +0200
Message-Id: <20210512171550.476130-3-thuth@redhat.com>
In-Reply-To: <20210512171550.476130-1-thuth@redhat.com>
References: <20210512171550.476130-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Older versions of Clang do not like -fno-delete-null-pointer-checks
or -msoft-float. So let's add a proper check for those.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index cee9d2c63b..97008d94c9 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -31,10 +31,11 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
 
 QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
 QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-stringop-overflow)
-QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
+QEMU_CFLAGS += -ffreestanding -fno-common -fPIE
 QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
-QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
-QEMU_CFLAGS += -msoft-float
+QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-fno-delete-null-pointer-checks)
+QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-fno-stack-protector)
+QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-msoft-float)
 QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS),-march=z900,-march=z10)
 QEMU_CFLAGS += -std=gnu99
 LDFLAGS += -Wl,-pie -nostdlib
-- 
2.27.0


