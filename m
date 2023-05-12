Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2567700BF4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:35:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmz-0003Jh-JO; Fri, 12 May 2023 11:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmw-0003IC-Op
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUms-000607-4V
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315735514so326652955e9.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905669; x=1686497669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TwjdV0u7g7SQc0AXDs6qHHfGv0SY+yIqn/gwE95FkUs=;
 b=OZte7KFPN8AM2OsbImCZjVxCd8WI5nuvf3OGQXpgkykpMQnoMEbTNjRiTwWsigt1DJ
 usPrmHufP4wMTdZj03zVESbq8/oiSsnyt6k9r9NA1g1Mjt6WLnwQZFLbEF99GswBBDnM
 T8bZBjRbBrMhJG6abGO1gwbuoEh/1X2k/AUm/wkdUkrBWLsmrudtCpESDqdRGlM39TOm
 9mAs1wqiyvTtQjXP5wYQ24mPIIOlPWyETk5fPzhInVTDO77JOl3nsiSsxoTxPx/qjvf3
 fvpINskbSzMyW/dTTdI5W4TFUGcP1l1IQsnAZeyRhIfWsQACtmN+tg2ImK1LZL+rXgKB
 otTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905669; x=1686497669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TwjdV0u7g7SQc0AXDs6qHHfGv0SY+yIqn/gwE95FkUs=;
 b=WuvsrkL3WbGOblpnmAFUg3CKWHslB1EItvmtnZhwgKlzaaay3BwM8LIhOtf7MIFTG4
 IhB7bmxSSc35MEJQBDwTqPKR2goSVy4uMCnD9Yc0SuFl8zKkyaxWdteUpcFBfn5aWP4x
 NhD1ADLyrUtuhqQVjMrX78HCzkLZLYjg1g8V/Xc7vDeznPeQDl4+m8zqumRwEr7bXRpm
 b/1FxZctK5b7SkZLsQJfWZdvY3a0W4NO+ojb3J3JiNQLfCqXDgO7X8W0oS/ft+wTgcAM
 qEMi5DbiWiwVEDTSRjjf3X8YmiECO6ktsPghxqTEQ8J5jovhbPAtXaHYOohQ3goZFfTD
 biyA==
X-Gm-Message-State: AC+VfDyUccRsSvIiNkmYqhk5/EfRlx2cNKPapUN+etz49kFs31EmxhUr
 424ZNUniYLbErTahn2uXUP4HdqKk81zVaaHQ/sU=
X-Google-Smtp-Source: ACHHUZ4H4VA5Q/sRdnpNxSyejtzINoUzg0cpWBEADFPWThyjL/W25vC1ZZ3n9w8QubEVMhschHhWwQ==
X-Received: by 2002:adf:dfc7:0:b0:307:c0c4:1094 with SMTP id
 q7-20020adfdfc7000000b00307c0c41094mr6145760wrn.34.1683905669313; 
 Fri, 12 May 2023 08:34:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] docs: Remove unused weirdly-named cross-reference targets
Date: Fri, 12 May 2023 16:34:18 +0100
Message-Id: <20230512153423.3704893-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In the doc sources, we have a few cross-reference targets with odd
names "pcsys_005fxyz".  These are the legacy of the semi-automated
conversion of the old info docs to rST (the '005f' is because ASCII
0x5f is '_' and the old info link names had underscores in them).

Remove the targets which nothing links to, and rename the two targets
which are used to something a bit more descriptive.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230421163642.1151904-1-peter.maydell@linaro.org
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 docs/system/devices/igb.rst     | 2 +-
 docs/system/devices/ivshmem.rst | 2 --
 docs/system/devices/net.rst     | 2 +-
 docs/system/devices/usb.rst     | 2 --
 docs/system/keys.rst            | 2 +-
 docs/system/linuxboot.rst       | 2 +-
 docs/system/target-i386.rst     | 4 ----
 7 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
index 70edadd5743..0bcdd857473 100644
--- a/docs/system/devices/igb.rst
+++ b/docs/system/devices/igb.rst
@@ -29,7 +29,7 @@ Using igb
 =========
 
 Using igb should be nothing different from using another network device. See
-:ref:`pcsys_005fnetwork` in general.
+:ref:`Network_emulation` in general.
 
 However, you may also need to perform additional steps to activate SR-IOV
 feature on your guest. For Linux, refer to [4]_.
diff --git a/docs/system/devices/ivshmem.rst b/docs/system/devices/ivshmem.rst
index b03a48afa3a..e7aaf34c200 100644
--- a/docs/system/devices/ivshmem.rst
+++ b/docs/system/devices/ivshmem.rst
@@ -1,5 +1,3 @@
-.. _pcsys_005fivshmem:
-
 Inter-VM Shared Memory device
 -----------------------------
 
diff --git a/docs/system/devices/net.rst b/docs/system/devices/net.rst
index 4b2640c448e..2ab516d4b09 100644
--- a/docs/system/devices/net.rst
+++ b/docs/system/devices/net.rst
@@ -1,4 +1,4 @@
-.. _pcsys_005fnetwork:
+.. _Network_Emulation:
 
 Network emulation
 -----------------
diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 37cb9b33aea..74166810731 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -1,5 +1,3 @@
-.. _pcsys_005fusb:
-
 USB emulation
 -------------
 
diff --git a/docs/system/keys.rst b/docs/system/keys.rst
index e596ae6c4e7..0fc17b994d3 100644
--- a/docs/system/keys.rst
+++ b/docs/system/keys.rst
@@ -1,4 +1,4 @@
-.. _pcsys_005fkeys:
+.. _GUI_keys:
 
 Keys in the graphical frontends
 -------------------------------
diff --git a/docs/system/linuxboot.rst b/docs/system/linuxboot.rst
index 228650abc5e..5db2e560dc5 100644
--- a/docs/system/linuxboot.rst
+++ b/docs/system/linuxboot.rst
@@ -27,4 +27,4 @@ virtual serial port and the QEMU monitor to the console with the
                     -append "root=/dev/hda console=ttyS0" -nographic
 
 Use Ctrl-a c to switch between the serial console and the monitor (see
-:ref:`pcsys_005fkeys`).
+:ref:`GUI_keys`).
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 77c2f3b9799..1b8a1f248ab 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -3,8 +3,6 @@
 x86 System emulator
 -------------------
 
-.. _pcsys_005fdevices:
-
 Board-specific documentation
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -32,8 +30,6 @@ Architectural features
    i386/sgx
    i386/amd-memory-encryption
 
-.. _pcsys_005freq:
-
 OS requirements
 ~~~~~~~~~~~~~~~
 
-- 
2.34.1


