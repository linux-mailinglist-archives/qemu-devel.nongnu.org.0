Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698ED3F8CD7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:20:48 +0200 (CEST)
Received: from localhost ([::1]:37484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ3X-0008Lc-CR
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImm-0005SV-Qg
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImk-0008PH-VX
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id f10so2259790wml.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CUaqCgRdZUrBir0XqdrPdZbfnwGdAj64KAvzQjt31Zk=;
 b=con71/czuTJoZYcTzRph79ZKKof/+scTk7hLhq4OOcAjziw/8qStalWqMG3p7brxpP
 uqPE8yvXcs4KfN8pWxI16Fd+9Z8jGq+WzuNgCSCEdNnvYEQlRxu5gsIZh2elOK1Sz26h
 fwdj5c+2q9SgthEE6avuUiTrzpcWb/QmrIrYPg+I+l64+pTUK3K5lr+sCWPxxy/8k9a8
 anVxKfcDWxHeWEo5MZtlzZpDqC1gtm7NpJntaPCoTiTFiILPci6X+EwHDR8DKO28ZVgO
 9hXB9x+zAZRnMrFol5eDLcBep31iVp+kIVei4MEGQfBWQuUdfcf2TGtcdHaJxeI5S1Ib
 Wo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUaqCgRdZUrBir0XqdrPdZbfnwGdAj64KAvzQjt31Zk=;
 b=owZxPd/dnQ4Mw2slkWso8DEENqDNoc5r45+X1eFVpGQB4lGilybRbwBo11y/kkMU/s
 z7sn3A7mYV3xT+z3thawb+wTiXaiq51IWhozrOZGr5EQuluDoHXW4raWPWV0qRW5HHYc
 4tt9StBb2rOnHfAxRIlb6WqN5yKeA65A/gZIU+22BojOcz0s2qnF6vCPH2d0BboFsIJ1
 hFd96THR304LjAtsCOcLzqFGYkuUdae1dFSNQpAOp7616pE79ryxyuog86r34QKjW23Q
 eudcMuhYF6VnoVY424ZIyUGtIAwTZX010XynL6ane/PKzrok8UtjUPePU+jO05CyDWU3
 Khjg==
X-Gm-Message-State: AOAM531ViQ2kbc8pV1FeZLcXjeG7+k3RXpgQCjGS8NIJLMUAEDhDGtxc
 oxcxYes1iRu+HxgjfLXv49WxQEQSEo6XYg==
X-Google-Smtp-Source: ABdhPJxTc5XoXwU2YrIh2G0QxEVkHQ3wSt+L35FuaPhcaUZt2hH5QLwklB35GRNkmBiCwfqJXOcI5Q==
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr4622895wms.58.1629997405610; 
 Thu, 26 Aug 2021 10:03:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/37] softmmu: Use accel_find("xen") instead of xen_available()
Date: Thu, 26 Aug 2021 18:02:45 +0100
Message-Id: <20210826170307.27733-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

The xen_available() function is used only to produce an error
for some Xen-specific command line options in QEMU binaries where
Xen support was not compiled in: it just returns the value of
the CONFIG_XEN define.

Now that accelerators are QOM classes, we can check for
"does this binary have Xen compiled in" with accel_find("xen"),
and drop the xen_available() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210730105947.28215-2-peter.maydell@linaro.org
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
index 5ca11e74694..82d574fe4b2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3448,21 +3448,21 @@ void qemu_init(int argc, char **argv, char **envp)
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


