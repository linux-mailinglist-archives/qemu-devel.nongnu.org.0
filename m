Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446D4D514B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:34:21 +0100 (CET)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNcC-0000ap-CT
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:34:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYj-0000Oe-Su; Thu, 10 Mar 2022 13:30:45 -0500
Received: from [2607:f8b0:4864:20::c29] (port=34663
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYi-0006Tv-98; Thu, 10 Mar 2022 13:30:45 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso7840215ooi.1; 
 Thu, 10 Mar 2022 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7TNNcbiHZAJatj3f+7nXd+QmFjxeAk/3gHOIwo7h7g=;
 b=eBDCTDAUFKg3iOkdhDi39o103IYY4b8xH+cjPRuVh3YRA4KKcNnR5QMeXtEF59CTcR
 cTaq1SsloakQPWIom0KBUPZuY4iQdOWBNMCijCV5JWWPw4O5l210cXGpcUkcizjA5SR0
 KRASAkKdfznyYgXM9Xy+AqtkmMryjIXBIdWZkWdEkvrOwb0g0+Gqr2OpzAjVwEv9ISpV
 JTsa6LH24nHzldaRGbFbhFQNAw/uDEodB1ljt0CIcnr7M9SLu/t33JyadCICyQ6IHwu4
 x9cVMd5r96c3b6YYlXYmHIu0lPTm3knGtz2m+vESXAHrmPqNxrL0l/oE0SyNIPK4Rdqq
 KB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7TNNcbiHZAJatj3f+7nXd+QmFjxeAk/3gHOIwo7h7g=;
 b=1UTgb6y7HLTJxLw2c28flL7tSYAIsdEIVL/v6d7axFq2jGxyC6y533nPWk++3KFs0e
 JlqbTvdEVNC5TuO03sdLOj+MrEJMNIwyb3fGS9BtRZJIaU16bmzhOJtcz9cQIt/fXvy3
 UN8vHIO3FfmTjRFPDlQ3LvMTvgfbxlKeugqXc03tXJsebyO/cUyP7ymMiXjEFzEqs/7n
 qy6XaY6I9trssNFgN7nNB1pxvezHbrgHB1AeGNMmjbRxQ10cYo6RhbNA1y4lb4vm99pe
 vV0ITbbZCmvldi3jYs8S0Rs2ioBN4DY5rlYhJb9UCaAtiZfXY2auVh4JQu6BNO9/WlxH
 U9HQ==
X-Gm-Message-State: AOAM5321d/7LMZK+N6ilaUgeA5leQaB/CK/RaGARd8RpdK8Hpiu8jNHD
 LIpHZ/7zCt9lThyeB28LoZ36YqqpxpE=
X-Google-Smtp-Source: ABdhPJy0xL0BDvX8vgFIn8HF46fCXWVNh8Ex2OtBiVS6k9tkX+6EBjgrO3fmBtgEhE4EgZm0ZTx6uA==
X-Received: by 2002:a05:6870:2486:b0:d4:164a:a230 with SMTP id
 s6-20020a056870248600b000d4164aa230mr9119437oaq.152.1646937042810; 
 Thu, 10 Mar 2022 10:30:42 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:42 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] avocado/ppc_prep_40p.py: check TCG accel in all tests
Date: Thu, 10 Mar 2022 15:30:10 -0300
Message-Id: <20220310183011.110391-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
References: <20220310183011.110391-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, muriloo@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All tests in the file times out when running in an IBM POWER host and
--disable-tcg with an error like the following:

        Command: ./qemu-system-ppc -display none -vga none (...)
-machine 40p (...)
        Output: qemu-system-ppc: Register sync failed... If you're using
kvm-hv.ko, only "-cpu host" is possible
qemu-system-ppc: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument

Since we don't have a way to detect whether the host is running kvm_hv
or kvm_pr, skip all tests if TCG is not available.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/ppc_prep_40p.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/avocado/ppc_prep_40p.py b/tests/avocado/ppc_prep_40p.py
index 4bd956584d..d4f1eb7e1d 100644
--- a/tests/avocado/ppc_prep_40p.py
+++ b/tests/avocado/ppc_prep_40p.py
@@ -28,7 +28,9 @@ def test_factory_firmware_and_netbsd(self):
         :avocado: tags=machine:40p
         :avocado: tags=os:netbsd
         :avocado: tags=slowness:high
+        :avocado: tags=accel:tcg
         """
+        self.require_accelerator("tcg")
         bios_url = ('http://ftpmirror.your.org/pub/misc/'
                     'ftp.software.ibm.com/rs6000/firmware/'
                     '7020-40p/P12H0456.IMG')
@@ -51,7 +53,9 @@ def test_openbios_192m(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:40p
+        :avocado: tags=accel:tcg
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.add_args('-m', '192') # test fw_cfg
 
@@ -65,7 +69,9 @@ def test_openbios_and_netbsd(self):
         :avocado: tags=arch:ppc
         :avocado: tags=machine:40p
         :avocado: tags=os:netbsd
+        :avocado: tags=accel:tcg
         """
+        self.require_accelerator("tcg")
         drive_url = ('https://archive.netbsd.org/pub/NetBSD-archive/'
                      'NetBSD-7.1.2/iso/NetBSD-7.1.2-prep.iso')
         drive_hash = 'ac6fa2707d888b36d6fa64de6e7fe48e'
-- 
2.35.1


