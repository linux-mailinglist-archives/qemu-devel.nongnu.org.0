Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418B389444
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:59:34 +0200 (CEST)
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPXh-0005Vt-I0
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljP9y-00034J-I3
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljP9v-0006tn-Pt
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621442098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=STXGbIo4CYsigtu77YyYPuvkys8zN3rBCtP/Bf+nCQk=;
 b=ROuM//gTRYsIli3gqQn4WvHuHW+FgiUDcFPU91C/CJ3sCyy5Z33hbhbJrwXV3bf8PHkk6l
 gliGvoLYdhZchk8DQkmEuNFgf4aerh3FwDcZ3yrxd4c5KVoB9prZMBFODD3NKWk+Ei8rSO
 pAcvcKbg0IzXQwsEL7K90Bbd1SCPvYE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-bUwyV03AM4aUYjhEVdNe4g-1; Wed, 19 May 2021 12:34:56 -0400
X-MC-Unique: bUwyV03AM4aUYjhEVdNe4g-1
Received: by mail-wr1-f70.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so7390261wre.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=STXGbIo4CYsigtu77YyYPuvkys8zN3rBCtP/Bf+nCQk=;
 b=lKlnJAD7NiOaQ9l8j3Ip7vAKXk1EWIGbOJ83Zw8CQ6vuNKmQlSanXo4Y7RYapq/Wcy
 Xgc3/LeTEW9WNt/GzRN5SNJzWZyu/5oOgoSnsBSfE3Vtyg/eqn+b4lE5VvXecRNGphn9
 2JpwRdnJRq9ijUVv/YTs2Sm1oe/2Y7frlPmNCTSmiNVqvMXO1br+3QJeXhpEBKVAfVy0
 gvUk9WlxElJ4XuXn2DN1nIeEP5bfXGuPkftH5Ii9jqCqXsSt7sk1LG3LavBQZ9KJ1Jgt
 E/AtZarz8kKTxfRostlamFUbocsjCugBIkJQ3aByOMEqW9yinc+OD2MgfvD+dh79utZZ
 hXSw==
X-Gm-Message-State: AOAM530914c6ClcLj3ceWN0Xfzqp26m/CT0VloVomxFhUlML/6mghvll
 kAv/yK2G2iqq5hoDlWVKiJjeNK/wDF0WIITwPZrZCGp1ElviCSk6T61GO06VMh0pN2K4CPlKZvl
 qBHxqcYbtdQqqx0Y=
X-Received: by 2002:a1c:3cd4:: with SMTP id j203mr11182496wma.25.1621442094917; 
 Wed, 19 May 2021 09:34:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOIGX5IHnm7u4fYmi/Ht/Hnkwz7C+gcRlh5wkbGRuI/3sC+jjmBYmbrx9Ee/FQojT3tnqL9Q==
X-Received: by 2002:a1c:3cd4:: with SMTP id j203mr11182480wma.25.1621442094746; 
 Wed, 19 May 2021 09:34:54 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c7sm17085620wrs.23.2021.05.19.09.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:34:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v6 1/5] hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO ->
 FDC
Date: Wed, 19 May 2021 18:34:44 +0200
Message-Id: <20210519163448.2154339-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519163448.2154339-1-philmd@redhat.com>
References: <20210519163448.2154339-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_superio_realize() calls isa_fdc_init_drives(), which is defined
in hw/block/fdc.c, so ISA_SUPERIO needs to select the FDC symbol.

Add a isa_fdc_init_drives() stub for when FDC is not selected.

Reported-by: John Snow <jsnow@redhat.com>
Suggested-by: Thomas Huth <thuth@redhat.com>
Fixes: c0ff3795143 ("Introduce a CONFIG_ISA_SUPERIO switch for isa-superio.c")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc-isa-stubs.c | 22 ++++++++++++++++++++++
 MAINTAINERS              |  1 +
 hw/block/meson.build     |  5 ++++-
 hw/isa/Kconfig           |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 hw/block/fdc-isa-stubs.c

diff --git a/hw/block/fdc-isa-stubs.c b/hw/block/fdc-isa-stubs.c
new file mode 100644
index 00000000000..60180531e11
--- /dev/null
+++ b/hw/block/fdc-isa-stubs.c
@@ -0,0 +1,22 @@
+/*
+ * QEMU Floppy disk emulator (Intel 82078) stubs
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/block/fdc.h"
+#include "hw/isa/isa.h"
+
+void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds)
+{
+    g_assert_not_reached();
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index eab178aeee5..8fa85e40a52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1659,6 +1659,7 @@ M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/fdc.c
+F: hw/block/fdc-isa-stubs.c
 F: include/hw/block/fdc.h
 F: tests/qtest/fdc-test.c
 T: git https://gitlab.com/jsnow/qemu.git ide
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 8b0de54db1f..bb5b331d86a 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -4,7 +4,8 @@
   'hd-geometry.c'
 ))
 softmmu_ss.add(when: 'CONFIG_ECC', if_true: files('ecc.c'))
-softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'))
+softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'),
+                                       if_false: files('fdc-isa-stubs.c'))
 softmmu_ss.add(when: 'CONFIG_NAND', if_true: files('nand.c'))
 softmmu_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
 softmmu_ss.add(when: 'CONFIG_PFLASH_CFI01', if_true: files('pflash_cfi01.c'))
@@ -18,3 +19,5 @@
 specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
 
 subdir('dataplane')
+
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('fdc-isa-stubs.c'))
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 55e0003ce40..7216f66a54a 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -17,6 +17,7 @@ config ISA_SUPERIO
     bool
     select ISA_BUS
     select PCKBD
+    select FDC
 
 config PC87312
     bool
-- 
2.26.3


