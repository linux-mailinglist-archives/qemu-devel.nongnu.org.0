Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7059F41AF7F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:57:05 +0200 (CEST)
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCfQ-0001f5-CU
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa2-0006OV-Qk
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:33 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCZw-0001Kd-Qg
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:29 -0400
Received: by mail-ed1-x536.google.com with SMTP id x7so68154507edd.6
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36xUxYH1Afi8N5W5cIUwxmt2NMki93xyDotZiunEpyA=;
 b=esFs6DiYn/Jn0kSuFabKp2Yor2e1gaNf9HUl4vlcc3+zndN0I4m7pjegLtxzkmKIwz
 X/PUtyVuvS6xCGD1Hs9EOC5nXq4vdX0vID3PC+igD4BQPXUie3pMKEss2iJ2Wydm8/eM
 FRwniKQoy+y8GAenUmvI3fpRsF7ZjB1F9VQPnJC/1QRJxPSPW6GQt8CBph1QYiLqjFew
 iU9FArRfXZP+6wxZHoPZ6sw9ACdQHfXd/Nr/ro0rrMRgGMLCSHLaia8vAZyvQz+1gyDV
 JEeCgqANk0LIRLPPdWoXkX0cg+0j/tNtj2rR/mLG78e9IpfJLbBBhohSIw6YGesvCoZX
 xHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=36xUxYH1Afi8N5W5cIUwxmt2NMki93xyDotZiunEpyA=;
 b=D/40tE6zFdymkGCZvk1HylYmF+Gbec4uytMsxe8ha4Js+vbI204Mqd/NFFMw+ioL4I
 GX6MHHUZfcSoTju2Gy/K/TvaT6nuK2443jwlPzv72qv10G4cEo6fXsEWHfmiQkHS0Bi1
 MgReKq7AYHttdqUS2Ir+gpBky+G2PMlOsfwiFC6oGRG5GAH66XT6kFoC7GboHbdVo70s
 pR8h5CRRe6ClF4/arBAq2hGtEvAytAkfKpUQWlMZ+7LR7OAutDivKA3+zWX4g75aDErF
 dtD5ABomBODRPQJ6VeK1K76DMZ3xFPS0EksBS4r/cdd2s6R0TA1efm1Jo0/H0mrql47v
 FvCw==
X-Gm-Message-State: AOAM533NUcRIMRF5KhJIXxZTUa9rUpnaW7M6YQgVswu/cXsFz2rf/GGR
 6+9S2TYOCerhVUFvO6mvjpfHpWBgIPE=
X-Google-Smtp-Source: ABdhPJyleaWHD5g9BnnhQOVL2SpryqKYaVMsG4KZYvb5Y/c8QcEWt+rFAD77gAUzAC3quziKDiyf1A==
X-Received: by 2002:a50:e0c8:: with SMTP id j8mr7243608edl.283.1632833480453; 
 Tue, 28 Sep 2021 05:51:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] Kconfig: Add CONFIG_SGX support
Date: Tue, 28 Sep 2021 14:50:45 +0200
Message-Id: <20210928125116.183620-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Add new CONFIG_SGX for sgx support in the Qemu, and the Kconfig
default enable sgx in the i386 platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-32-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configs/devices/i386-softmmu/default.mak | 1 +
 hw/i386/Kconfig                          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/configs/devices/i386-softmmu/default.mak b/configs/devices/i386-softmmu/default.mak
index 84d1a2487c..598c6646df 100644
--- a/configs/devices/i386-softmmu/default.mak
+++ b/configs/devices/i386-softmmu/default.mak
@@ -22,6 +22,7 @@
 #CONFIG_TPM_CRB=n
 #CONFIG_TPM_TIS_ISA=n
 #CONFIG_VTD=n
+#CONFIG_SGX=n
 
 # Boards:
 #
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index ddedcef0b2..962d2c981b 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -6,6 +6,10 @@ config SEV
     select X86_FW_OVMF
     depends on KVM
 
+config SGX
+    bool
+    depends on KVM
+
 config PC
     bool
     imply APPLESMC
@@ -21,6 +25,7 @@ config PC
     imply PVPANIC_ISA
     imply QXL
     imply SEV
+    imply SGX
     imply SGA
     imply TEST_DEVICES
     imply TPM_CRB
-- 
2.31.1



