Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0D3DB78A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 13:05:34 +0200 (CEST)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9QKb-00005t-PC
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 07:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF7-0008RD-I4
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF6-0002US-2G
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id z4so10781172wrv.11
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jpp+UbRt9od094/ktfFBQRT7Dj2SocCNez7NCpcCa0Q=;
 b=NddzzQ4pkotlILiqv51ekckBtC6DADYyGr/UVz1rDv+uL2CqNbrfxSL1vzRltlpNi9
 8LO0e6TXuiIK6pzBYYiFPGpAJpnU2ouioRRAFXJCrT4tC3W6vD95YNu18Dt3QTSD9UzZ
 iYb73dkSWZnZqfwsozltHkejvYF7nvQMTIu4Y+juEYQFKhxxz3tKaTAHdCPickFET0F/
 VZYkhJvJVLSciubRfMTSMgUFa9jxtTYkQf1FmjoNTtsu88KZg3fgbt2DIiRCKG2PgCno
 vOFMkBv0zFUiipcsn65qFU4v4kSAAYuT7dIQI2dli5uSgHbzMhO4lgX0NICtq7RSYGsn
 WerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jpp+UbRt9od094/ktfFBQRT7Dj2SocCNez7NCpcCa0Q=;
 b=ryxzuWi6N3dGsvHwkm7JSUP+pxkdh1oeeuN4lQplS8MRql2Ct69StohJ4BUd+CAtUi
 MLGzy3H6CzolEDbdDWjSm5Mv08MKYG9PWSSYbGk1Rm0qu5GuJLWd2qZFkjIgnUGsUGUD
 EdiQFFkMNnU6t58bothvg6kMgNUkShrunlG6lMpaRs7lolDe0zGp1OSVbIbHr7A7RtT4
 HMPel7zbpAM1HyZ51rGyz9836yACFBRGS0kediMWP2n27qIkYs36S+ngFcf+hIrStbG9
 joZsJZ4/e3jZJJRl2QIqe0c1+7CuGqSFuf9Bx4E3YjRXDhxqBFAIRA6RmPYn8YFJ0XeM
 FiUQ==
X-Gm-Message-State: AOAM532Upy2W6bOJ+E9k8lkmd0Z/OQ3AGI6VDW/8pvxqFkPp31ResPsF
 2vd2hD5kDqbtZtaWi2TmaBqzTZv9YIfKig==
X-Google-Smtp-Source: ABdhPJx6324qsOCczaDakPZsE8/eUCUaiVC5uCb5tAHSQ+HbBxq3orXcErTMTqIyoVajRVsfWf4ZHA==
X-Received: by 2002:a05:6000:248:: with SMTP id
 m8mr2423767wrz.145.1627642790913; 
 Fri, 30 Jul 2021 03:59:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p2sm1349697wrr.21.2021.07.30.03.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:59:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 1/8] softmmu: Use accel_find("xen") instead of
 xen_available()
Date: Fri, 30 Jul 2021 11:59:40 +0100
Message-Id: <20210730105947.28215-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730105947.28215-1-peter.maydell@linaro.org>
References: <20210730105947.28215-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The xen_available() function is used only to produce an error
for some Xen-specific command line options in QEMU binaries where
Xen support was not compiled in: it just returns the value of
the CONFIG_XEN define.

Now that accelerators are QOM classes, we can check for
"does this binary have Xen compiled in" with accel_find("xen"),
and drop the xen_available() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/arch_init.h | 1 -
 softmmu/arch_init.c        | 9 ---------
 softmmu/vl.c               | 6 +++---
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index e723c467eb2..7acfc62418f 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -30,7 +30,6 @@ enum {
 extern const uint32_t arch_type;
 
 int kvm_available(void);
-int xen_available(void);
 
 /* default virtio transport per architecture */
 #define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 6ff9f30badd..3f4d7c1b1cd 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -96,12 +96,3 @@ int kvm_available(void)
     return 0;
 #endif
 }
-
-int xen_available(void)
-{
-#ifdef CONFIG_XEN
-    return 1;
-#else
-    return 0;
-#endif
-}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4dee472c794..a32d15b6a1f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3429,21 +3429,21 @@ void qemu_init(int argc, char **argv, char **envp)
                 has_defaults = 0;
                 break;
             case QEMU_OPTION_xen_domid:
-                if (!(xen_available())) {
+                if (!(accel_find("xen"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
                 xen_domid = atoi(optarg);
                 break;
             case QEMU_OPTION_xen_attach:
-                if (!(xen_available())) {
+                if (!(accel_find("xen"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
                 xen_mode = XEN_ATTACH;
                 break;
             case QEMU_OPTION_xen_domid_restrict:
-                if (!(xen_available())) {
+                if (!(accel_find("xen"))) {
                     error_report("Option not supported for this target");
                     exit(1);
                 }
-- 
2.20.1


