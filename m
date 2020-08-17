Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72970246892
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 16:42:36 +0200 (CEST)
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7gLL-0002cL-Gl
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 10:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1k7gGZ-0003Au-3e
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:37:39 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1k7gGX-00062A-JD
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:37:38 -0400
Received: by mail-wr1-x441.google.com with SMTP id r2so15265574wrs.8
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wCwinYbY8KogL6MVGmLHlxl2ZdviDPrAvyQ0cEAXXVE=;
 b=SnM2WhZCF7UbZWerxNmXCHsmOIUGopXrFz4dEFHx8gOubTmFx/O8Y7ReK0lKwqr2tI
 WGP/09NTZ3qFYWhbCZSlMlBflwb6AlmFiAHCjYYXl6SEpyTJiZgD+YFvi48A7lAYzseY
 0lSBVSInKfN/DWvRhFGnSm4oOH8iim11AOKXSxArAj2SBtLOYQxV2y3vdhMPXiEX4aKx
 xTFhmw6gW9VMZauswrL+YvIE7HzJMqYBHQL7OWhIO8ltPDPjIQ9TI4SG8SN2hJQ1hJOu
 9wS1WpYzb+WbS2fLIPapJBEf/Rr9la7nOtXSOOdNa5hqU2ijfShfqsNpON9nzndQboYf
 0Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wCwinYbY8KogL6MVGmLHlxl2ZdviDPrAvyQ0cEAXXVE=;
 b=d9xwaES8GJd+oN8nfUimhp2/U8U1Lu0Gf9nnvNe5kJ9jxvy7aWoSvNh8qGQ9bHKrF3
 Qiu89MBP8MEDFJ9iI8cfKImDkn8Cl29HTnCBeIFbl0fKU5mR0PJmDu8laSGYRj5Ng7pb
 QZaFoEQN38e9yyngEmgLpRTQ4R4ocnWv5TWme8rjECOdRsKjU8oKO8SMjpTDGKjyW+q2
 t5xar2tLYD3PydNNCkVtZ/XHHQHIM6zZ5nnzgjlEyuSVp21CgkavNfYJm8Xb6uVTEuMk
 41FLIY1MREQy64Em3OY0/GMLwucug3+QdfbThC91XNb8o4JjB72eoaCHu0Zk3wI+Io4Y
 LhOg==
X-Gm-Message-State: AOAM531+1rfzgO0BzRR205+RE8y916iQ71pcAAfKLYkX6/Hus2siVL6f
 E3kImDUwCDHTD7/1iPAVFP4yFOfNcPE=
X-Google-Smtp-Source: ABdhPJxqEK14PqrZNthfoSXC8Awvr4ocMKkHEsmY48ptp27ytKxVNY727/ROYIDvo6INghTh1brLRw==
X-Received: by 2002:a5d:544a:: with SMTP id w10mr16075543wrv.317.1597675056008; 
 Mon, 17 Aug 2020 07:37:36 -0700 (PDT)
Received: from donizetti.redhat.com ([2001:b07:6468:f312:a0d1:fc42:c610:f977])
 by smtp.gmail.com with ESMTPSA id
 i22sm34966603wrb.45.2020.08.17.07.37.35 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:37:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 009/150] tests/docker: add test script for static linux-user
 builds
Date: Mon, 17 Aug 2020 16:35:02 +0200
Message-Id: <20200817143723.343284-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817143723.343284-1-pbonzini@redhat.com>
References: <20200817143723.343284-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/test-static | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100755 tests/docker/test-static

diff --git a/tests/docker/test-static b/tests/docker/test-static
new file mode 100755
index 0000000000..372ef6fac7
--- /dev/null
+++ b/tests/docker/test-static
@@ -0,0 +1,24 @@
+#!/bin/bash -e
+#
+# Compile QEMU user mode emulators as static binaries on Linux.
+#
+# Copyright (c) 2020 Red Hat Inc.
+#
+# Authors:
+#  Paolo Bonzini <pbonzini@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+. common.rc
+
+cd "$BUILD_DIR"
+
+build_qemu \
+    --disable-system \
+    --disable-tools \
+    --disable-guest-agent \
+    --disable-docs \
+    --static
+install_qemu
-- 
2.26.2



