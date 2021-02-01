Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4C30A6A6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:36:00 +0100 (CET)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XUt-0003JZ-Su
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOf-0006gx-B0
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:33 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOd-0008OX-QU
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:33 -0500
Received: by mail-wr1-x433.google.com with SMTP id v15so16203055wrx.4
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TsrsxDQVz5tygrPJnMSHXRKo3FHIhV5VlahOLojrTSs=;
 b=tdY/GT4s+Svs7EsgQ8L7VZEN1EU3auIv2pg9z7H40kDst9zeyUzRC0p5gOsl8bvrpe
 YEfky/hcCoc8afoXnaLPVYRZxcU/v8rs/k6MaSMzq+ctcEKeAEQchfrjelV4MrfHwi0D
 eC1Rwq0VU0EF2HasdLW5V7eFRpwPFIhTKRmnxU3el+nAOKtdZ98sCrKCVIybhaq+xOC2
 W1yQWSaG7E6lhP016iJy6W+p1SEDmo8wCHivGUSQQBQIjoJ5GdDEc2vIbE170r2MxnPF
 gPKC/tKyGsVI8pq30CfaNfuu6QhMNJ6IKY0QfXPEW0jFuOpChYSTPDJDreWcOvCxTkpk
 arbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TsrsxDQVz5tygrPJnMSHXRKo3FHIhV5VlahOLojrTSs=;
 b=bVi3QpoFHQNT6hFVRB+Bon6FQ82AHqkmpZh9AhhusDcQSDBBOFkBMbB+Yyfk1NAabE
 n7Z/mhXLE/t4Zu4ESMUcb1Xjk6bhLQqAfOewZRwYzL9pdhFJxW7/SQsj03lPLzWbFT2A
 r2xkthCQUiVswyf4kXqDyPS62yreMTcEI22KAMMuEsfCGOTTCeRx6gl3vP96qKSxxZaK
 bkbr/7KbWziWI4iphjX5XG/k+ZGh2aUAbAlUOEYUsekZbJkDJw+rRfyfJ04Dk2JyWas8
 8kUdB99446RonpFPKOqoSub2HWvAB3i7U0ZfTPMTuuG/g97Ow4IqhUL72/uXC+2xoODd
 xjNw==
X-Gm-Message-State: AOAM530LFIoEUeRJ8IDQlY2dk84lH97sR2ov/d7UWM6tBV7+mel5RL7f
 pS/15J9QPYrI2eOkxJSAm9U=
X-Google-Smtp-Source: ABdhPJyJ59H9X2zflNDtn/k6K0IuGMyavaSeLpb40ogb98MM80P8GyEJQcxbrbHoCIm5tQ98H9B8gw==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr17953783wrd.296.1612178970576; 
 Mon, 01 Feb 2021 03:29:30 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id o124sm21363300wmb.5.2021.02.01.03.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] hw/i386/xen: Introduce XEN_FV Kconfig
Date: Mon,  1 Feb 2021 12:29:02 +0100
Message-Id: <20210201112905.545144-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce XEN_FV to differency the machine from the accelerator.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/Kconfig         | 2 ++
 hw/i386/xen/Kconfig     | 5 +++++
 hw/i386/xen/meson.build | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 hw/i386/xen/Kconfig

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877f..b4c8aa5c242 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -1,3 +1,5 @@
+source xen/Kconfig
+
 config SEV
     bool
     depends on KVM
diff --git a/hw/i386/xen/Kconfig b/hw/i386/xen/Kconfig
new file mode 100644
index 00000000000..ad9d774b9ea
--- /dev/null
+++ b/hw/i386/xen/Kconfig
@@ -0,0 +1,5 @@
+config XEN_FV
+    bool
+    default y if XEN
+    depends on XEN
+    select I440FX
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index 2fcc46e6ca1..37716b42673 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,4 +1,4 @@
-i386_ss.add(when: 'CONFIG_XEN', if_true: files(
+i386_ss.add(when: 'CONFIG_XEN_FV', if_true: files(
   'xen-hvm.c',
   'xen_apic.c',
   'xen_platform.c',
-- 
2.26.2


