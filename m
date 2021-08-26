Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF003F8CE3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:22:42 +0200 (CEST)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ5N-0003oE-Lq
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImn-0005Uh-Sj
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:30 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImm-0008Q8-A6
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:29 -0400
Received: by mail-wr1-x435.google.com with SMTP id b6so6124675wrh.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QYIzSbPGGQ8PqEzqRSOYqRmsLXlRFr8Koh660vhg0c0=;
 b=VjMLMjBSHhSrxhxWVdRzrs+ssaQjVUQHs6c1QXECcxfWt13Z5RiU6stkwmUfisCjov
 KcTDLOJ9lBYrsskA45g/wc60lGuKvCm8Wnz+RfZKrkG1tjMp2TMyqqJiJqJ/hoPQKVpZ
 ArlTqLvIK0pY5bKmIlZPPbpr5UxApwEwpyRrZa0SGlIqCHCEd5iE4eCwYLo0Hp0PzmXC
 RaRry6XlAnUAu/7TMF6zDmzvaC/XbgJi/jcQZU7yeDUH11jw99AVB10piDnchRNGet+f
 VuPq+8BiPpgkKadExcCgtBHY6XaLX9/XKT4PELIKaVZXGLYJ8RDkdOQUQBbyIHVXVy8M
 DA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QYIzSbPGGQ8PqEzqRSOYqRmsLXlRFr8Koh660vhg0c0=;
 b=ileOmpkUsXpsAbt+w4MUrQqma9aIWABwYYJE+TbokYA4ZMxSQ959fh+/quFC0QzZn6
 G7W90211sMx9RkIrTuR9vM0dQ8QFRH06y/3gNLl99/WOv9lcNgnpW1LO8PV7G6Gjmwyl
 SIOvam2C8xzTuyMfJettytvzZFsekityjTPSBm4a/AHIfg3YQ2Fi8HDzCsARkVDOpko8
 1c+QEoJL4N5AgckxxA+mi3IeLTGtOdBgFcwBNJMdqZzVZKKUKe3rp9Eklqr/IBbpIval
 39FcePc5BfmXZ9OmiZRr0Z79Pre7yL74O76xMlDTAdLn9jWIqs2jSVtR8Gb+4jfMSTFC
 qOdw==
X-Gm-Message-State: AOAM5318AIvpYDkNVpPx3dRp9BFF5erQf41851QUSvRBG8AmjVQrr3dS
 /9rm5lh0d4LOOHdBK1855E1nV9UPWwokWA==
X-Google-Smtp-Source: ABdhPJyCnYagAhM2hmDUU5IcUgw1zzQNd+m6zXZLyFQJb6NT8JGds22obey+S9TLHEavyzNBapNIqA==
X-Received: by 2002:adf:ebc8:: with SMTP id v8mr5170906wrn.153.1629997406749; 
 Thu, 26 Aug 2021 10:03:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/37] monitor: Use accel_find("kvm") instead of kvm_available()
Date: Thu, 26 Aug 2021 18:02:46 +0100
Message-Id: <20210826170307.27733-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kvm_available() function reports whether KVM support was
compiled into the QEMU binary; it returns the value of the
CONFIG_KVM define.

The only place in the codebase where we use this function is
in qmp_query_kvm(). Now that accelerators are based on QOM
classes we can instead use accel_find("kvm") and remove the
kvm_available() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210730105947.28215-3-peter.maydell@linaro.org
---
 include/sysemu/arch_init.h | 2 --
 monitor/qmp-cmds.c         | 2 +-
 softmmu/arch_init.c        | 9 ---------
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 7acfc62418f..57caad1c675 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -29,8 +29,6 @@ enum {
 
 extern const uint32_t arch_type;
 
-int kvm_available(void);
-
 /* default virtio transport per architecture */
 #define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
                               QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f7d64a64577..9ddb9352e65 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -58,7 +58,7 @@ KvmInfo *qmp_query_kvm(Error **errp)
     KvmInfo *info = g_malloc0(sizeof(*info));
 
     info->enabled = kvm_enabled();
-    info->present = kvm_available();
+    info->present = accel_find("kvm");
 
     return info;
 }
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 3f4d7c1b1cd..9011af74e4a 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -87,12 +87,3 @@ int graphic_depth = 32;
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
-
-int kvm_available(void)
-{
-#ifdef CONFIG_KVM
-    return 1;
-#else
-    return 0;
-#endif
-}
-- 
2.20.1


