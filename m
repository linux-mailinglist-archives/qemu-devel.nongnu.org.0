Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80695337E3B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:33:12 +0100 (CET)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKR3X-00054F-J3
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKQxk-0001jY-Ph
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKQxg-00020m-1L
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615490826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ptub5yPMaAvKgdDu/UvtVxoAwkzecy3eN3RPQo/6VOU=;
 b=fYyLF7bjARqMJVGMj6bwOzmX+/e98aksToug4ChQr5pfw2MvKvPuwOVhBe3HYkbirwq48P
 jFsg0kiExgOEeuMCvVS0enFZX3pSVIhBldSHix/CmWK38mcAjzwO9UDvhXQ263T/KgPE6C
 eCMWnt3njlcLA/M3dP7S5YsKQ8D3xWA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-UIfo_STLPOKUFpHokcphWA-1; Thu, 11 Mar 2021 14:27:04 -0500
X-MC-Unique: UIfo_STLPOKUFpHokcphWA-1
Received: by mail-wr1-f71.google.com with SMTP id n16so8913105wro.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ptub5yPMaAvKgdDu/UvtVxoAwkzecy3eN3RPQo/6VOU=;
 b=szetKPaVhy34aF6sKRgqokVviHIVNOcmgH3yHb0Ai+lrA4Ur50Cmz3x8LdNxUnGTx3
 EgDt046i905AgLPJ+E5oCFMcy+98wr0a0r7fSbcelm97FmzuuC7SKo007BZxJc2HkFYL
 LuVYWvA8U7XKkmDVMuml4VdEtA9qR+3Gfgaf0+4l74DRChcNHFbWNJuiyDnkwkPPLqzS
 SBv8SXyx1lsWq/5oHEk6lX19fJWDpN7SSHf4TaNBCkE5NH//1/Gtdcw+Bz37FmOFo8o/
 cNWc/W0yN6OvuFYssJJJY2Wwg5USLx0p7304O8Le1eiKY+261RTnkVa7GKBV80dZf6K/
 SscA==
X-Gm-Message-State: AOAM533VvSsz7MQKmv89e596DXhTRsnhM+ROHpe1VhB979/ZbtF3Rlrm
 sdE43klQdQKDNUNhhhyBEhgXKhyoMRDwZjT77PrURxPp4qzbQZtzXlyrA8zqltvMX2WHovKDltE
 OELQ8goKC0CCZCOjFU9heLDpuoyUmvZQxWPZ5MkBjDPKI+qYLNalUAG/5N11ilwTj
X-Received: by 2002:a5d:4e83:: with SMTP id e3mr10428829wru.82.1615490822588; 
 Thu, 11 Mar 2021 11:27:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4Ke12Hf2QaAL/5Xiky1GBemQdLDZx6Hn0+VPGKW2l3K7b3CnKsOh+pUQsQmriMpKeo7QNNg==
X-Received: by 2002:a5d:4e83:: with SMTP id e3mr10428806wru.82.1615490822327; 
 Thu, 11 Mar 2021 11:27:02 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h22sm5712684wmb.36.2021.03.11.11.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:27:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts/coccinelle: Catch dubious code after
 &error_abort/&error_fatal
Date: Thu, 11 Mar 2021 20:27:00 +0100
Message-Id: <20210311192700.1441263-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Calls passing &error_abort or &error_fatal don't return.
Any code after such use is dubious. Add a coccinelle patch
to detect such pattern.

Inspired-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .../use-after-abort-fatal-errp.cocci          | 33 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 scripts/coccinelle/use-after-abort-fatal-errp.cocci

diff --git a/scripts/coccinelle/use-after-abort-fatal-errp.cocci b/scripts/coccinelle/use-after-abort-fatal-errp.cocci
new file mode 100644
index 00000000000..ead9de5826a
--- /dev/null
+++ b/scripts/coccinelle/use-after-abort-fatal-errp.cocci
@@ -0,0 +1,33 @@
+/* Find dubious code use after error_abort/error_fatal
+ *
+ * Inspired by this patch:
+ * https://www.mail-archive.com/qemu-devel@nongnu.org/msg789501.html
+ *
+ * Copyright (C) 2121 Red Hat, Inc.
+ *
+ * Authors:
+ *  Philippe Mathieu-Daudé
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+@@
+identifier func_with_errp;
+@@
+(
+ if (func_with_errp(..., &error_fatal)) {
+    /* Used for displaying help message */
+    ...
+    exit(...);
+  }
+|
+*if (func_with_errp(..., &error_fatal)) {
+    /* dubious code */
+    ...
+  }
+|
+*if (func_with_errp(..., &error_abort)) {
+    /* dubious code */
+    ...
+  }
+)
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e15dab8cd4..db6596eb06d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2368,6 +2368,7 @@ F: scripts/coccinelle/error_propagate_null.cocci
 F: scripts/coccinelle/remove_local_err.cocci
 F: scripts/coccinelle/use-error_fatal.cocci
 F: scripts/coccinelle/errp-guard.cocci
+F: scripts/coccinelle/use-after-abort-fatal-errp.cocci
 
 GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
-- 
2.26.2


